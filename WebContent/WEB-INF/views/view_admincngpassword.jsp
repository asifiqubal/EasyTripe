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
	<div class="row">
			<!-- Inner Content Start -->
			<div class="col-md-12">
				<div class="drawer-overlay">

					<div class="module" id="topGo">
						<h1>Change Password</h1>

						<div class="clearfix"></div>

						<div id="actionMessage"></div>						
						<form method="POST" name="formMembers" id="formMembers"
							class="form-horizontal">
							<div id="memberFormDiv">

								<div class="column-count">
									<fieldset>

										<legend>Password Info</legend>
										<div class="input-errors" >
										<div class="input-errors">${errorMessage}</div>
									</div>
									<div class="" >
										<div class="success">${sm}</div>
									</div>
										<br>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label"
												for="Oldpass">Old Password:<span class="required">*</span></label>
											<div class="col-sm-6 col-xs-10">
												<input type="password" name="oldpassword" required="required"
													id="username" class="form-control"
													size="35" placeholder="Enter old password" value="">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label"
												for="password">New Password :<span class="required">*</span></label>
											<div class="col-sm-6 col-xs-10">
												<input type="password" name="password" required="required"
													id="password" class="form-control" title="Enter Password"
													size="35" placeholder="Enter Password" value="">

											</div>

										</div>
										<div class="form-group">
											<label class="col-sm-4 col-xs-12 control-label"
												for="confirm_password">Confirm New Password :<span
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
									<input type="submit" id="submit" value="Save"
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

	<jsp:include page="/PUBLIC/userfooter.jsp"></jsp:include>
</div>
<jsp:include page="/PUBLIC/userscript.jsp"></jsp:include>