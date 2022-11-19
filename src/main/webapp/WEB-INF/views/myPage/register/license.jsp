<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
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
<link rel="stylesheet" href="${root }css/alphacar.css">

</head>
<body>
	

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root }images/car-8.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="${root }index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>MyPage <i class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">면허증 정보</h1>
				</div>
			</div>
		</div>
	</section>

		
	
	<section class="py-5 my-5">
		<div class="container">
			<form:form action="${root }myPage/register/license_pro" method="post" modelAttribute="registerLicenseBean">
				<div class="bg-white shadow rounded-lg d-block d-sm-flex">
					<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
						<h3 class="mb-4">면허증 정보를 입력해주세요.</h3>
						<div class="row">
							<div class="col-12">
								<div class="form-group">
									<form:label path="license_num">면허번호</form:label>
									<form:input path="license_num" class="form-control"/>
									<form:errors path="license_num" style='color:red'/>
								</div> 
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<div class="form-group">
								  	<form:label path="license_start">발급일</form:label>
								  	<form:input path="license_start" class="form-control"/>
								  	<form:errors path="license_start" style='color:red'/>
								</div>
							</div>
							<div class="col-6">
								<div class="form-group">
								  	<form:label path="license_end">갱신기간 만료일</form:label>
								  	<form:input path="license_end" class="form-control"/>
								  	<form:errors path="license_end" style='color:red'/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<div class="form-group">
								  	<form:label path="license_type">면허 종류</form:label>
								  	<form:select path="license_type" class="form-control">
										<option disabled selected>선택하세요</option>
									  	<form:option value="1종보통"></form:option>
										<form:option value="2종보통"></form:option>
									</form:select>
									<form:errors path="license_type" style='color:red'/>
								</div>
							</div>
						</div>
						
						<div>
							<button type="submit" class="btn btn-primary center">등록완료</button>
						</div>
					</div>
				</div>
			</form:form>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${root }js/google-map.js"></script>
	<script src="${root }js/main.js"></script>

</body>
</html>