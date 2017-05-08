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

		<!-- Inner Content Start -->

		<div class="resp-tab-content resp-tab-content-active">
			<div class="block block-popular">
			<figure>
				<div class="row">
					<div class="col-md-2">
						<div class="thumb">
							<img alt="" src="PUBLIC/asif.jpg">
						</div>
					</div>
					<div class="col-md-6">
						<h4>Name: Iqubal, Asif</h4>
						<h5>ID: 13-24665-2</h5>
						<h5>Email: asif_iqubal@outlook.com</h5>
						<h5>Department : FACULTY OF SCIENCE & INFORMATION TECHNOLOGY</h5>
						<h5>Program : Bachelor of Science in Software Engineering</h5>
					</div>
				</div>
				</figure>
				<figure>
				<div class="row">
					<div class="col-md-2">
						<div class="thumb">
							<img alt="" src="PUBLIC/tanvir.jpg">
						</div>
					</div>
					<div class="col-md-6">
						<h4>Name: Raihan,Tanvir</h4>
						<h5>ID: 12-22269-3</h5>
						<h5>Email: tanvirsojol@gmail.com</h5>
						<h5>Department : FACULTY OF SCIENCE & INFORMATION TECHNOLOGY</h5>
						<h5>Program : Bachelor of Science in Software Engineering</h5>
					</div>
				</div>
				</figure>
				<figure>
				<div class="row">
					<div class="col-md-2">
						<div class="thumb">
							<img alt="" src="PUBLIC/loki.jpg">
						</div>
					</div>
					<div class="col-md-6">
						<h4>Name: Sarkar, Punam chandra </h4>
						<h5>ID: 12-22191-3</h5>
						<h5>Email: sarkarpunam93@gmail.com</h5>
						<h5>Department : FACULTY OF SCIENCE & INFORMATION TECHNOLOGY</h5>
						<h5>Program : Bachelor of Science in Software Engineering</h5>
					</div>
				</div>
				</figure>
				<figure>
				<div class="row">
					<div class="col-md-2">
						<div class="thumb">
							<img alt="" src="PUBLIC/farhan.jpg">
						</div>
					</div>
					<div class="col-md-6">
						<h4>Name: zaman-farhad-uz-</h4>
						<h5>ID: 12-22165-3</h5>
						<h5>Email: farhad.zaman94@gmail.com</h5>
						<h5>Department : FACULTY OF SCIENCE & INFORMATION TECHNOLOGY</h5>
						<h5>Program : Bachelor of Science in Software Engineering</h5>
					</div>
				</div>
				</figure>
			</div>
		</div>

		<!-- Inner Content End -->

	</div>
	<!-- Inner Layout End -->
</div>

<jsp:include page="/PUBLIC/footer.jsp"></jsp:include>