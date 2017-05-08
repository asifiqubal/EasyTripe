<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/PUBLIC/userlink.jsp"></jsp:include>
<jsp:include page="/PUBLIC/userheder.jsp"></jsp:include>
<lable type="hidden" id="name">${username}</lable>
<script type="text/javascript">
	$(document).ready(function() {
		var name=$("#name").text();
		$('#setname').text(name);
		console.log(name);
		$('#sidebar').click(function() {
			if ($("#clops").hasClass("sidebar-collapsed")) {
				$("#clops").removeClass("sidebar-collapsed");
			} else
				$("#clops").addClass("sidebar-collapsed");
		});
		$('#li1').click(function() {
			if ($(this).hasClass("opened")) {
				$(this).removeClass("opened");
				$("#ul1").removeClass("visible");
			} else{
				$(this).addClass("opened");
				$("#ul1").addClass("visible");
				$("#li2").removeClass("opened");
				$("#ul2").removeClass("visible");}
		});
		$('#li2').click(function() {
			if ($(this).hasClass("opened")) {
				$(this).removeClass("opened");
				$("#ul2").removeClass("visible");
			} else{
				$(this).addClass("opened");
				$("#ul2").addClass("visible");
				$("#li1").removeClass("opened");
				$("#ul1").removeClass("visible");}
		});
	});
</script>
<div class="page-container" id="clops">
	<jsp:include page="/PUBLIC/adminsidebar.jsp"></jsp:include>
	<div class="main-content spacer">
	
	<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="">

					<jsp:include page="/PUBLIC/ts.jsp"></jsp:include>

					<div class="col-md-12 col-sm-8 panel panel-default panel-table">
						<div class="panel-heading">
						<div class="form-horizontal" style="margin-top: 15px;">
						<div class="col-sm-4 col-xs-12 control-label">
						<label>Search Tour: </label>
						</div>
						<div class="col-sm-6 col-xs-10">
						<input type="text" placeholder="Search Tour with any colum" name="search_field" id="search_field" class="form-control">
						</div>
						</div>
							<div class="row">
								<div class="col col-xs-12">
									<h3 class="panel-title">Tour List</h3>
								</div>

							</div>
						</div>
						<div class="">
							<table
								class="table table-striped table-bordered table-list livesearch">
								<thead>
									<tr>
										<th>Tour ID</th>
										<th>Tour Name</th>
										<th>Tour Date</th>
										<th>Visiting Cities</th>
										<th>Total booked</th>
										<th>Tour Duration</th>
										<th colspan="2">Option</th>
									</tr>
								</thead>
								<tbody id="myTable">
									<c:forEach var="tl" items="${tourlist}">
										<tr>
										<td>${tl.tourid}</td>
											<td><a href="/easytrip/bookingdetails?tourid=${tl.tourid}">${tl.tourname}</a></td>
											
											<td>${tl.tourdate}</td>
											<td>${tl.visitingcities}</td>
											<td>${tl.totalbooked}</td>
											<td>${tl.totalday} Day(s),  ${tl.totalnight} Night(s)</td>
											<td><a href="/easytrip/edittour?tourid=${tl.tourid}">Edit</a></td>
											<td><a href="/easytrip/canceltour?tourid=${tl.tourid}"  onclick="return confirm('Are you sure you want to delete this item?');">Cancel</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
						<div class="panel-footer">
							<div class="row">


								<div class="col col-xs-8">
									<ul class="pagination hidden-xs pull-right" id="myPager">
									</ul>
									<ul class="pagination visible-xs pull-right">
										<li><a href="#">«</a></li>
										<li><a href="#">»</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$('#search_field').on(
							'keyup',
							function() {
								var value = $(this).val();
								var patt = new RegExp(value, "i");

								$('#myTable').find('tr').each(
										function() {
											if (!($(this).find('td').text()
													.search(patt) >= 0)) {
												$(this).not('.myHead').hide();
											}
											if (($(this).find('td').text()
													.search(patt) >= 0)) {
												$(this).show();
											}
										});

							});
				</script>
				<script id="jsbin-javascript">
					$.fn.pageMe = function(opts) {
						var $this = this, defaults = {
							perPage : 10,
							showPrevNext : false,
							hidePageNumbers : false
						}, settings = $.extend(defaults, opts);

						var listElement = $this;
						var perPage = settings.perPage;
						var children = listElement.children();
						var pager = $('.pager');

						if (typeof settings.childSelector != "undefined") {
							children = listElement.find(settings.childSelector);
						}

						if (typeof settings.pagerSelector != "undefined") {
							pager = $(settings.pagerSelector);
						}

						var numItems = children.size();
						var numPages = Math.ceil(numItems / perPage);

						pager.data("curr", 0);

						if (settings.showPrevNext) {
							$('<li><a href="#" class="prev_link">«</a></li>')
									.appendTo(pager);
						}

						var curr = 0;
						while (numPages > curr
								&& (settings.hidePageNumbers == false)) {
							$(
									'<li><a href="#" class="page_link">'
											+ (curr + 1) + '</a></li>')
									.appendTo(pager);
							curr++;
						}

						if (settings.showPrevNext) {
							$('<li><a href="#" class="next_link">»</a></li>')
									.appendTo(pager);
						}

						pager.find('.page_link:first').addClass('active');
						pager.find('.prev_link').hide();
						if (numPages <= 1) {
							pager.find('.next_link').hide();
						}
						pager.children().eq(1).addClass("active");

						children.hide();
						children.slice(0, perPage).show();

						pager.find('li .page_link').click(function() {
							var clickedPage = $(this).html().valueOf() - 1;
							goTo(clickedPage, perPage);
							return false;
						});
						pager.find('li .prev_link').click(function() {
							previous();
							return false;
						});
						pager.find('li .next_link').click(function() {
							next();
							return false;
						});

						function previous() {
							var goToPage = parseInt(pager.data("curr")) - 1;
							goTo(goToPage);
						}

						function next() {
							goToPage = parseInt(pager.data("curr")) + 1;
							goTo(goToPage);
						}

						function goTo(page) {
							var startAt = page * perPage, endOn = startAt
									+ perPage;

							children.css('display', 'none').slice(startAt,
									endOn).show();

							if (page >= 1) {
								pager.find('.prev_link').show();
							} else {
								pager.find('.prev_link').hide();
							}

							if (page < (numPages - 1)) {
								pager.find('.next_link').show();
							} else {
								pager.find('.next_link').hide();
							}

							pager.data("curr", page);
							pager.children().removeClass("active");
							pager.children().eq(page + 1).addClass("active");

						}
					};

					$(document).ready(function() {

						$('#myTable').pageMe({
							pagerSelector : '#myPager',
							showPrevNext : true,
							hidePageNumbers : false,
							perPage : 10
						});

					});
				</script>
			</div>

		</div>
	
	</div>

	<jsp:include page="/PUBLIC/userfooter.jsp"></jsp:include>
</div>
<jsp:include page="/PUBLIC/userscript.jsp"></jsp:include>