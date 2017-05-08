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
		<fieldset>
		<form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
			<legend>Upload Photo(s)</legend>
			<span class="top-go clearfix"><a href="#topGo"
				title="Click To Go Top" class="btn btn-blue btn-xs pull-right"><i
					class="fa fa-chevron-up"></i></a></span><br>
			<div class="form-group">
				<label class="col-sm-4 col-xs-12 control-label" for="upload_image">Upload
					Image :<span class="required">*</span>
				</label>
				<div class="col-sm-6 col-xs-10">
					<input type="file" required="required" name="file"
						class="filestyle" data-buttonName="btn-primary">
				</div>

			</div>
			<div class="clearfix"></div>

									<div class="text-center btn-groups bottom">
										<input type="submit" id="submit" value="Add Tour"
											class="save_data_btn btn btn-primary">

									</div>
			</form>

		</fieldset>

	</div>

	<jsp:include page="/PUBLIC/userfooter.jsp"></jsp:include>
</div>
<jsp:include page="/PUBLIC/userscript.jsp"></jsp:include>