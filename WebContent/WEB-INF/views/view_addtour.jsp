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
		<div class="container-fluid inner">
			<div class="row">
				<!-- Inner Content Start -->
				<div class="col-md-12">
					<div class="drawer-overlay">

						<div class="module" id="topGo">
							<h1>Add Tour packages</h1>

							<div class="clearfix"></div>

							<div id="actionMessage"></div>
							<script>
								$(function() {
									$("#tourdate").datepicker({
										changeMonth : true,
										changeYear : true,
										dateFormat : "dd/mm/yy",
										maxDate : "+2M",
										minDate : "+0",
										showAnim : "slideDown"
									});
								});
							</script>


							<form method="POST" name="addtour" id="addtour" class="form-horizontal" >
								<div id="touraddFormDiv">

									<div class="column-count">

										<fieldset>
											<legend>Tour Information</legend>
											<span class="top-go clearfix"><a href="#topGo"
												title="Click To Go Top"
												class="btn btn-blue btn-xs pull-right"><i
													class="fa fa-chevron-up"></i></a></span><br>
											<div class="form-group">
												<label class="col-sm-4 col-xs-12 control-label" for="title">Tour
													Name : <span class="required">*</span>
												</label>
												<div class="col-sm-6 col-xs-10">
													<input type="text" name="tourname" id="tourname"
														placeholder="Enter name" class="form-control" value=""
														required="required">
												</div>

											</div>
											<div class="form-group">
												<label class="col-sm-4 col-xs-12 control-label"
													for="last_name">Tour date :<span class="required">*</span></label>
												<div class="col-sm-6 col-xs-10">

													<input type="text" name="tourdate" id="tourdate"
														placeholder="Enter Tour date" class="form-control"
														required="required" value="">

												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 col-xs-12 control-label"
													for="totalday">Total Day :<span class="required">*</span>
												</label>
												<div class="col-sm-6 col-xs-10">
													<input type="number" min="1" max="15" name="totalday"
														id="totalday" placeholder="Enter Total day"
														class="form-control" required="required" value="">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 col-xs-12 control-label"
													for="totalnight">Total Night :<span
													class="required">*</span></label>
												<div class="col-sm-6 col-xs-10">
													<input type="number" min="0" max="15" name="totalnight"
														id="totalnight" placeholder="Enter Total Night"
														class="form-control" required="required" value="">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-4 col-xs-12 control-label"
													for="startcity">Start City : <span class="required">*</span>
												</label>
												<div class="col-sm-6 col-xs-10">
													<input type="text" name="startcity" id="startcity"
														placeholder="Enter Startcity" class="form-control"
														value="" required="required">
												</div>

											</div>
											<div class="form-group">
												<label class="col-sm-4 col-xs-12 control-label"
													for="startcity">End City : <span class="required">*</span>
												</label>
												<div class="col-sm-6 col-xs-10">
													<input type="text" name="endcity" id="endcity"
														placeholder="Enter Endcity" class="form-control" value=""
														required="required">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-4 col-xs-12 control-label"
													for="startcity">Visiting City : <span
													class="required">*</span>
												</label>
												<div class="col-sm-6 col-xs-10">
													<input type="text" name="visitingcities"
														id="visitingcities"
														placeholder="Enter visiting cities with (,)"
														class="form-control" value="" required="required">
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 col-xs-12 control-label"
													for="startcity">Tour Division : <span
													class="required">*</span>
												</label>
												<div class="col-sm-6 col-xs-10">
													<select name="tourdivision" id="tourdivision"
														required="required" class="form-control">
														<option value="">Select A Division</option>
														<option value="Dhaka">Dhaka</option>
														<option value="Chittagong">Chittagong</option>
														<option value="Sylhet">Sylhet</option>
														<option value="Khulna">Khulna</option>
														<option value="Barisal">Barisal</option>
														<option value="Rajshahi">Rajshahi</option>
														<option value="Rongpur">Rongpur</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-4 col-xs-12 control-label"
													for="tourdetails">Place Details :<span
													class="required">*</span></label>
												<div class="col-sm-6 col-xs-10">
													<textarea row="2" cols="50" name="placedetails"
														id="placedetails" placeholder="Enter Place Details"
														class="form-control" required="required"></textarea>
												</div>
											</div>


										</fieldset>
										<fieldset>

											<legend>Cost Information</legend>
											<span class="top-go clearfix"><a href="#topGo"
												title="Click To Go Top"
												class="btn btn-blue btn-xs pull-right"><i
													class="fa fa-chevron-up"></i></a></span><br>
											<div class="col-md-6 col-sm-6">
												<div class="form-group">
													<label class="col-sm-4 col-xs-12 control-label"
														for="costperperson">Cost Per Person:<span
														class="required">*</span></label>
													<div class="col-sm-6 col-xs-10">
														<input type="number" name="costperperson"
															required="required" id="costperperson"
															class="form-control" size="35"
															placeholder="Enter Cost Per Person" value="">
													</div>
												</div>
											</div>
											<div class="col-md-6 col-sm-6">
												<div class="form-group">
													<label class="col-sm-4 col-xs-12 control-label"
														for="costperchildren">Cost Per Child :<span
														class="required">*</span></label>
													<div class="col-sm-6 col-xs-10">
														<input type="number" name="costperchildren"
															required="required" id="costperchildren"
															class="form-control" size="35"
															placeholder="Enter Cost Per Child" value="">

													</div>

												</div>
											</div>
										</fieldset>

										<fieldset>

											<legend>Tour Service</legend>
											<span class="top-go clearfix"><a href="#topGo"
												title="Click To Go Top"
												class="btn btn-blue btn-xs pull-right"><i
													class="fa fa-chevron-up"></i></a></span><br>
											<div class="col-md-6 col-sm-6">
												<div class="form-group">
													<label class="col-sm-4 col-xs-12 control-label"
														for="breakfast">Breakfast :<span class="required">*</span></label>
													<div class="col-sm-6 col-xs-10">
														<select name="breakfast" id="breakfast"
															required="required" class="form-control">

															<option value="Available" selected>Available</option>
															<option value="Not-Available">Not Available</option>
														</select>

													</div>

												</div>

												<div class="form-group">
													<label class="col-sm-4 col-xs-12 control-label" for="lunch">Lunch
														:<span class="required">*</span>
													</label>
													<div class="col-sm-6 col-xs-10">
														<select name="lunch" id="lunch" required="required"
															class="form-control">

															<option value="Available" selected>Available</option>
															<option value="Not-Available">Not Available</option>
														</select>

													</div>

												</div>

												<div class="form-group">
													<label class="col-sm-4 col-xs-12 control-label"
														for="dinner">Dinner :<span class="required">*</span></label>
													<div class="col-sm-6 col-xs-10">
														<select name="dinner" id="dinner" required="required"
															class="form-control">

															<option value="Available" selected>Available</option>
															<option value="Not-Available">Not Available</option>
														</select>

													</div>

												</div>
											</div>


											<div class="col-md-6 col-sm-6">
												<div class="form-group">
													<label class="col-sm-4 col-xs-12 control-label"
														for="pickup">Pick-Up :<span class="required">*</span></label>
													<div class="col-sm-6 col-xs-10">
														<select name="pickup" id="pickup" required="required"
															class="form-control">

															<option value="Available" selected>Available</option>
															<option value="Not-Available">Not Available</option>
														</select>

													</div>

												</div>

												<div class="form-group">
													<label class="col-sm-4 col-xs-12 control-label"
														for="dropoff">Drop-Off :<span class="required">*</span>
													</label>
													<div class="col-sm-6 col-xs-10">
														<select name="dropoff" id="dropoff" required="required"
															class="form-control">

															<option value="Available" selected>Available</option>
															<option value="Not-Available">Not Available</option>
														</select>

													</div>

												</div>

												<div class="form-group">
													<label class="col-sm-4 col-xs-12 control-label" for="guide">Guide
														:<span class="required">*</span>
													</label>
													<div class="col-sm-6 col-xs-10">
														<select name="guide" id="guide" required="required"
															class="form-control">
															<option value="Available" selected>Available</option>
															<option value="Not-Available">Not Available</option>
														</select>

													</div>

												</div>
											</div>
										</fieldset>
										

									</div>


									<div class="clearfix"></div>

									<div class="text-center btn-groups bottom">
										<input type="submit" id="submit" value="Next"
											class="save_data_btn btn btn-primary">

									</div>
								</div>
							</form>
						</div>

					</div>
				</div>
				<!-- Inner Content End -->
			</div>
		</div>
	</div>

	<jsp:include page="/PUBLIC/userfooter.jsp"></jsp:include>
</div>
<jsp:include page="/PUBLIC/userscript.jsp"></jsp:include>