<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/PUBLIC/userlink.jsp"></jsp:include>
<jsp:include page="/PUBLIC/userheder.jsp"></jsp:include>
<lable type="hidden" id="name">${username}</lable>
<lable type="hidden" id="hs">${ud.status}</lable>
<script type="text/javascript">
	$(document).ready(function() {
		var name = $("#name").text();
		var select=$("#hs").text();
		$('#setname').text(name);
		$("#status").val(select);
		console.log(select);
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
				<div class="col-md-12">
					<div class="column-count">
						<form action="" method="post" class="form-horizontal">
						<input type="hidden" value="${ud.userid}" name="userid">
							<fieldset>
							
								<legend style=" background-color: #0088DD;color: white;">Member Information</legend>
								<br>
								
								<div class="form-group">
									<label class="col-sm-4 col-xs-12 control-label" for="name">
										Name :<span class="required">*</span>
									</label>
									<div class="col-sm-6 col-xs-10">
										<input type="text" name="name" id="name"
											placeholder="Enter  Name" class="form-control"
											title="Enter Name" required="required" value="${ud.name}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-xs-12 control-label" for="email">
										E-mail :<span class="required">*</span>
									</label>
									<div class="col-sm-6 col-xs-10">
										<input type="email" name="email" id="email"
											placeholder="Enter  Email" class="form-control"
											title="Enter Email" required="required" value="${ud.email}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-xs-12 control-label" for="phone">
										Phone :<span class="required">*</span>
									</label>
									<div class="col-sm-6 col-xs-10">
										<input type="text" name="phone" id="phone"
											placeholder="Enter  Phone Number" class="form-control"
											title="Enter Phone Number" required="required" value="${ud.phone}">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-xs-12 control-label" for="address">
										Address : </label>
									<div class="col-sm-6 col-xs-10">
										<textarea row="2" cols="50" name="address" id="address"
											placeholder="Enter  Address" class="form-control"
											title="Enter Address">${ud.address}</textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-xs-12 control-label" for="dob">
										Date Of Birth :<span class="required">*</span>
									</label>
									<div class="col-sm-6 col-xs-10">
										<input type="text" name="dob" id="dob"
											placeholder="Enter  Your Date Birth (dd/mm/yyyy)" class="form-control"
											title="Enter Your Date Birth (dd/mm/yyyy)" value="${ud.dob}"
											required="required">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-xs-12 control-label" for="dob">
										Status :<span class="required">*</span>
									</label>
									<div class="col-sm-6 col-xs-10">
										<select name="status" id="status" class="form-control"
											title="Select a Status" required="required"><option
												value="">-- Select Status --</option>
											<option value="active">Active</option>
											<option value="block">Block</option></select>
									</div>
								</div>

								<div class="text-center btn-groups bottom">
								<input type="submit" class="save_data_btn btn btn-primary"
									value="Save">
							</div>
							</fieldset>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/PUBLIC/userfooter.jsp"></jsp:include>
</div>
<jsp:include page="/PUBLIC/userscript.jsp"></jsp:include>