<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value="${pageContext.request.contextPath}/" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Carbook - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="${root }css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${root }css/animate.css">

<link rel="stylesheet" href="${root }css/owl.carousel.min.css">
<link rel="stylesheet" href="${root }css/owl.theme.default.min.css">
<link rel="stylesheet" href="${root }css/magnific-popup.css">

<link rel="stylesheet" href="${root }css/aos.css">

<link rel="stylesheet" href="${root }css/ionicons.min.css">

<link rel="stylesheet" href="${root }css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${root }css/jquery.timepicker.css">


<link rel="stylesheet" href="${root }css/flaticon.css">
<link rel="stylesheet" href="${root }css/icomoon.css">
<link rel="stylesheet" href="${root }css/style.css">

<!--달력 테스트  -->
<!-- CSS 로드 -->
<link rel="stylesheet" href="${root }css/bootstrap.min.css"
	href="${root }css/bootstrap.css" />

<!-- bootsrap DatePicker CSS -->
<link rel="stylesheet" href="${root }css/bootstrap-datepicker3.css"
	href="${root }css/bootstrap-datepicker3.css">
<!-- 스크립트 로드 -->
<script type="text/javascript" src="${root }js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.bundle.min.js"></script>
<!-- bootsrap DatePicker Script -->
<script src="${root }js/bootstrap-datepicker.js"></script>
<script src="${root }js/bootstrap-datepicker.kr.min.js"></script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${root }images/car-8.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Cars <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">Choose Your Car</h1>
				</div>
			</div>
		</div>
	</section>


	<section class="ftco-section bg-light">

		<div class="col-md-12 heading-section text-center ftco-animate mb-5">
			<span class="subheading">What we offer</span>
			<h2 class="mb-2">Feeatured Vehicles</h2>
		</div>
		<div class="container">
			<div class="row">
				<c:forEach var='obj' items="${CarNames }">
					<div class="col-md-4">
						<div class="car-wrap rounded ftco-animate">
							<div class="img rounded d-flex align-items-end"
								style="background-image: url(${root }images/${obj.car_img1});">
							</div>
							<div class="text">
								<h2 class="mb-0">
									<a href="${root }car-single">${obj.car_name}</a>
								</h2>
								<div class="d-flex mb-3">
									<span class="cat">${obj.car_brand}</span>
									<p class="price ml-auto">
										${obj.price}<span>원 /day</span>
									</p>
								</div>
								<p class="d-flex mb-0 d-block">
									<form:form action="${root }order/Carselect?car_seq=${obj.car_seq }"
										modelAttribute="select_RentBean" method="Post" class="btn btn-primary py-2 mr-1">
							     <form:hidden path="pickup_zone"/>
							     <form:hidden path="return_zone"/>
							     <form:hidden path="time_pick"/>
							     <form:hidden path="startDate"/>
							     <form:hidden path="endDate"/> 
											<input type="submit" value="Select Car" class="btn btn-primary">
									</form:form>
									<form:form action="${root }order/car-single?car_seq=${obj.car_seq }"
										modelAttribute="select_RentBean" method="Post" class="btn btn-primary py-2 mr-1">
							     <form:hidden path="pickup_zone"/>
							     <form:hidden path="return_zone"/>
							     <form:hidden path="time_pick"/>
							     <form:hidden path="startDate"/>
							     <form:hidden path="endDate"/>
									<input type="submit" value="   Details  " class="btn btn-primary"/>
									</form:form>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

		</div>

	</section>




	<c:import url="/WEB-INF/views/include/footer_info.jsp" />






	<script src="${root }js/jquery.min.js"></script>
	<script src="${root }js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${root }js/popper.min.js"></script>
	<script src="${root }js/bootstrap.min.js"></script>
	<script src="${root }js/jquery.easing.1.3.js"></script>
	<script src="${root }js/jquery.waypoints.min.js"></script>
	<script src="${root }js/jquery.stellar.min.js"></script>
	<script src="${root }js/owl.carousel.min.js"></script>
	<script src="${root }js/jquery.magnific-popup.min.js"></script>
	<script src="${root }js/aos.js"></script>
	<script src="${root }js/jquery.animateNumber.min.js"></script>
	<script src="${root }js/bootstrap-datepicker.js"></script>
	<script src="${root }js/jquery.timepicker.min.js"></script>
	<script src="${root }js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${root }js/google-map.js"></script>
	<script src="${root }js/main.js"></script>

</body>
</html>