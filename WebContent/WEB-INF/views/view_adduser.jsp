<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/PUBLIC/top.jsp"></jsp:include>
<div id="top-bar">
	<div class="container">
		<a href="#" class="menu button"><i class="fa fa-navicon"></i></a>
		<ul class="nav">
			<li class="active"><a><span>Welcome Easy Trip</span></a></li>
			<li><a href="${link1}"><span>${value1}</span></a></li>
			<li><a href="${link2}"><span>${value2}</span></a></li>
		</ul>
	</div>
</div>
<jsp:include page="/PUBLIC/header.jsp"></jsp:include>

<div class="container">
	<!-- Inner Layout Start -->
	<div class="container-fluid inner">
		<div class="row">
			<!-- Inner Content Start -->
			<div class="col-md-12">
				<div class="drawer-overlay">

					<div class="module" id="topGo">
						<h1>Registered User Sign Up</h1>

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
										<legend>Member Information</legend>
										<span class="top-go clearfix"><a href="#topGo"
											title="Click To Go Top"
											class="btn btn-blue btn-xs pull-right"><i
												class="fa fa-chevron-up"></i></a></span><br>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label" for="title">Name
												: <span class="required">*</span>
											</label>
											<div class="col-sm-6 col-xs-10">
												<input type="text" name="name" id="name"
													placeholder="Enter name" class="form-control"
													title="Enter name" value="" required="required">
											</div>

										</div>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label" for="email">Email
												:<span class="required">*</span>
											</label>
											<div class="col-sm-6 col-xs-10">
												<input type="email" name="email" id="email"
													placeholder="Enter Email" class="form-control"
													title="Enter Email" required="required" value="">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label"
												for="last_name">Phone :<span class="required">*</span></label>
											<div class="col-sm-6 col-xs-10">
												<input type="text" name="phone" id="last_name"
													placeholder="Enter phone" class="form-control"
													title="Enter phone" required="required" value="">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label"
												for="last_name">Daye Of Birth :<span
												class="required">*</span></label>
											<div class="col-sm-6 col-xs-10">

												<input type="text" name="dob" id="date"
													placeholder="Enter dob" class="form-control"
													title="Enter dob" required="required" value="">

											</div>
										</div>

										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label"
												for="last_name">Address :<span class="required">*</span></label>
											<div class="col-sm-6 col-xs-10">
												<textarea row="2" cols="50" name="address" id="last_name"
													placeholder="Enter Address" class="form-control"
													required="required"></textarea>
											</div>
										</div>


									</fieldset>
									<fieldset>

										<legend>Login Information</legend>
										<span class="top-go clearfix"><a href="#topGo"
											title="Click To Go Top"
											class="btn btn-blue btn-xs pull-right"><i
												class="fa fa-chevron-up"></i></a></span><br>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label"
												for="username">Username:<span class="required">*</span></label>
											<div class="col-sm-6 col-xs-10">
												<input type="text" name="username" required="required"
													id="username" class="form-control"
													title="Type your Username Address correct. This will consider as your login ID"
													size="35" placeholder="Enter Username" value="">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label"
												for="password">Password :<span class="required">*</span></label>
											<div class="col-sm-6 col-xs-10">
												<input type="password" name="password" required="required"
													id="password" class="form-control" title="Enter Password"
													size="35" placeholder="Enter Password" value="">

											</div>

										</div>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label"
												for="confirm_password">Confirm Password :<span
												class="required">*</span></label>
											<div class="col-sm-6 col-xs-10">
												<input type="password" name="confirm_password"
													required="required" id="confirm_password"
													class="form-control" title="" size="35"
													placeholder="Enter Confirm Password" value="">
												<script type="text/javascript">
													$(function() {
														$("#submit")
																.click(
																		function() {
																			var password = $(
																					"#password")
																					.val();
																			var confirmPassword = $(
																					"#confirm_password")
																					.val();
																			if (password != confirmPassword) {
																				alert("Passwords do not match.");
																				return false;
																			}
																			return true;
																		});
													});
												</script>

											</div>
										</div>
									</fieldset>

								</div>


								<div class="clearfix"></div>

								<div class="text-center btn-groups bottom">
									<input type="submit" id="submit" value="Registar"
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
	<!-- Inner Layout End -->
</div>

<jsp:include page="/PUBLIC/footer.jsp"></jsp:include>