<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/PUBLIC/userlink.jsp"></jsp:include>
<jsp:include page="/PUBLIC/userheder.jsp"></jsp:include>
<lable type="hidden" id="name">${username}</lable>
<script type="text/javascript">
	$(document).ready(function() {
		var name = $("#name").text();
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
			} else {
				$(this).addClass("opened");
				$("#ul1").addClass("visible");
				$("#li2").removeClass("opened");
				$("#ul2").removeClass("visible");
			}
		});
		$('#li2').click(function() {
			if ($(this).hasClass("opened")) {
				$(this).removeClass("opened");
				$("#ul2").removeClass("visible");
			} else {
				$(this).addClass("opened");
				$("#ul2").addClass("visible");
				$("#li1").removeClass("opened");
				$("#ul1").removeClass("visible");
			}
		});
	});
</script>
<div class="page-container" id="clops">
	<jsp:include page="/PUBLIC/adminsidebar.jsp"></jsp:include>
	<div class="main-content spacer">
		<div class="col-md-12">
			<div class="drawer-overlay">

				<div class="module" id="topGo">
					<h1>User Profile Details</h1>

					<div class="clearfix"></div>

					<div id="actionMessage"></div>
					<script>
						$(function() {
							$("#date").datepicker({
								changeMonth : true,
								changeYear : true,
								dateFormat : "dd/mm/yy",
								yearRange : "-70:-15",
								showAnim : "slideDown"
							});
						});
					</script>


					<form method="POST" name="formMembers" id="formMembers"
						class="form-horizontal">
						<div id="memberFormDiv">

							<div class="column-count">

								<fieldset>
									<legend>User Information</legend>
									<br>
									<div class="form-group">
										<label class="col-sm-4 col-xs-12 control-label" for="title">Name
											: </label>
										<div class="col-sm-6 col-xs-10">
											<label>${ud.name}</label>
										</div>

									</div>
									<div class="form-group">
										<label class="col-sm-4 col-xs-12 control-label" for="email">Email
											: </label>
										<div class="col-sm-6 col-xs-10">
											<label>${ud.email}</label>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 col-xs-12 control-label"
											for="last_name">Phone :<span class="required">*</span></label>
										<div class="col-sm-6 col-xs-10">
											<input type="text" name="phone" id="last_name"
												placeholder="Enter phone" class="form-control"
												title="Enter phone" required="required" value="${ud.phone}">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 col-xs-12 control-label"
											for="last_name">Daye Of Birth :<span class="required">*</span></label>
										<div class="col-sm-6 col-xs-10">

											<input type="text" name="dob" id="date"
												placeholder="Enter dob" class="form-control"
												title="Enter dob" required="required" value="${ud.dob}">

										</div>
									</div>

									<div class="form-group">
										<label class="col-sm-4 col-xs-12 control-label"
											for="last_name">Address :<span class="required">*</span></label>
										<div class="col-sm-6 col-xs-10">
											<textarea row="2" cols="50" name="address" id="last_name"
												placeholder="Enter Address" class="form-control"
												required="required">${ud.address}</textarea>
										</div>
									</div>


								</fieldset>

							</div>


							<div class="clearfix"></div>

							<div class="text-center btn-groups bottom">
								<input type="submit" id="submit" value="Save"
									class="save_data_btn btn btn-primary">

							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="/PUBLIC/userfooter.jsp"></jsp:include>
</div>
<jsp:include page="/PUBLIC/userscript.jsp"></jsp:include>