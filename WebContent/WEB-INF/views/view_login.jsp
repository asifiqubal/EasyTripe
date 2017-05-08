<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<jsp:include page="/PUBLIC/linklogin.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<body class="page-body" data-url="http://neon.dev">
	<div class="header"></div>
	<div class="page-container">

		<div class="main-content login-container">
			<div class="container">
				<div class="col-md-6 col-md-offset-3">
					<div class="login-header">
						<a href="/easytrip/home" title="" target="_blank"><img
							alt="Image" src="PUBLIC/data/adminFiles/headerImages/tour-logo-backend.png"
							class="center-block" height="70" /></a>

						<h3 class="login-info">Please sign in to get access</h3>
					</div>
					<div class="login-box">
						<div class="row">
							<div class="col-md-10 col-md-offset-1">


								<form method="POST" role="form">
									<input type="hidden" name="security"
										value="d38edc061c566ad44a35fb6168ebdcce-892b21241fefd41de237c993364b9c70">
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text" name="username" placeholder="Username;"
												class="form-control" value="">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-key"></i></span>
											<input type="password" name="password"
												placeholder="Password;" class="form-control" value="">
										</div>
									</div>

									<div class="input-errors"
										name="uploadInfoBlock[security_captcha]_err">
										<div class="input-errors">${errorMessage}</div>
									</div>

									<input type="submit" name="login" value="LOGIN"
										class="btn btn-blue btn-block" />
								</form>
								<a href="/easytrip/adduser"><button id="btn"
										class="btn btn-block btn-success"
										style="font-family: &amp; quot; robotoregular &amp;quot;; padding: 12px; margin-bottom: 30px; font-size: 15px; border-radius: 2px;">New
										User Sing up Here</button></a>

							</div>
						</div>
					</div>

					<p class="login-footer">
						Powered By : <a href="#" target="_blank">Aiub SP-2</a> Version
						:1.00.00<br> Copyright &copy; 2017-&#50;&#48;&#49;&#55; All
						Rights Reserved
					</p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function qToolTipFunctions() {
			$(document)
					.tooltip(
							{
								items : "input[title],textarea[title],div[title],td[title],span[title],img[title],a[title],li[title]",
								//show: { effect: "slide" },
								tooltipClass : "jui-tooltip",
								content : function() {
									var element = $(this);
									if (element.is("[title]")
											&& !element.hasClass('noTitle')) {
										return element.attr("title");
									}
								},
								track : true
							});
		}
		$(document).ready(function() {
			//kendo.culture("<?php echo str_ireplace('_', '-', $locale); ?>");
			qToolTipFunctions();
		});
	//-->
	</script>
	<jsp:include page="/PUBLIC/script.jsp"></jsp:include>
</body>
</html>