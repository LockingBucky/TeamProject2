<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- 슬라이드 쇼 css -->

</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${root }images/Volvo_C40Recharge_InPic1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="${root }index">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Car details <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">Car Details</h1>
				</div>
			</div>
		</div>
	</section>

	

	<section class="ftco-section ftco-car-details">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="car-details">
						<div class="img rounded ftco-animate align-items-end"
							style="background-image: url(${root }images/Volvo_C40Recharge_OutPic1.jpg);"></div>
						<div class="text text-center">
							<span class="subheading">Volvo</span>
							<h2>볼보 C40 recharge (white)</h2>
						</div>
					</div>
				</div>
			</div>



			<div class="row">
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="flaticon-dashboard"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										최대 거리 <span>356km</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="flaticon-pistons"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										최대 출력 <span>300kw</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="flaticon-car-seat"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										좌석 갯수 <span>5인승</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="flaticon-backpack"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										보관공간 <span>6캐리어</span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md d-flex align-self-stretch ftco-animate">
					<div class="media block-6 services">
						<div class="media-body py-md-4">
							<div class="d-flex mb-3 align-items-center">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="flaticon-diesel"></span>
								</div>
								<div class="text">
									<h3 class="heading mb-0 pl-3">
										배터리 <span>리튬 이온 </span>
									</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 pills">
					<div class="bd-example bd-example-tabs">
						<div class="d-flex justify-content-center">
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">

								<li class="nav-item"><a class="nav-link active"
									id="pills-description-tab" data-toggle="pill"
									href="#pills-description" role="tab"
									aria-controls="pills-description" aria-expanded="true">Features</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="pills-manufacturer-tab" data-toggle="pill"
									href="#pills-manufacturer" role="tab"
									aria-controls="pills-manufacturer" aria-expanded="true">Description</a>
								</li>
							</ul>
						</div>

						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-description"
								role="tabpanel" aria-labelledby="pills-description-tab">
								<div class="row">
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Airconditions</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Child
												Seat</li>
											<li class="check"><span class="ion-ios-checkmark"></span>GPS</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Luggage</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Music</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Seat
												Belt</li>
											<li class="remove"><span class="ion-ios-close"></span>Sleeping
												Bed</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Water</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Bluetooth</li>
											<li class="remove"><span class="ion-ios-close"></span>Onboard
												computer</li>
										</ul>
									</div>
									<div class="col-md-4">
										<ul class="features">
											<li class="check"><span class="ion-ios-checkmark"></span>Audio
												input</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Long
												Term Trips</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Car
												Kit</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Remote
												central locking</li>
											<li class="check"><span class="ion-ios-checkmark"></span>Climate
												control</li>
										</ul>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="pills-manufacturer"
								role="tabpanel" aria-labelledby="pills-manufacturer-tab">
								<p>전면부 및 전면 도어 등 일부 부품은 볼보 XC40와 공유하며 사실상 XC40 리차지의 쿠페형 SUV 버전이다. 플랫폼은 XC40 및 다수의 지리자동차 차량에 탑재되는 볼보 CMA 플랫폼이 적용된다. 파워트레인으로 408PS의 출력을 내는 2개의 영구 자석 동기식 전기 모터가 탑재되며, 이와 함께 78.0kWh의 리튬 이온 배터리가 탑재된다. 차량의 전장은 4,431mm, 전폭은 1,863mm, 전고는 1,582mm, 휠베이스는 2,702mm이다. 1회 충전 시 420km 정도를 주행할 수 있다.</p>

							</div>

						</div>
					</div>
				</div>
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