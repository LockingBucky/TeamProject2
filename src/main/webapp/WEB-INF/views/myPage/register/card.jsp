<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>creditCard</title>
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
					<h1 class="mb-3 bread">결제카드 등록</h1>
				</div>
			</div>
		</div>
	</section>
	
	

	<section class="py-5 my-5">
		<div class="container">
			<div class="bg-white shadow rounded-lg d-block d-sm-flex">
				<!-- 결제카드 등록 -->
				<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
					<form:form action="${root }myPage/register/register_card" method="post" modelAttribute="registerCardBean">
						<div class="row">
							<div class="col-2">
								<div class="form-group">
								  	<form:label path="card_name">은행</form:label>
							  		<form:select path="card_name" class="form-control">
										<option disabled selected>선택</option>
									  	<form:option value="국민"></form:option>
										<form:option value="하나"></form:option>
										<form:option value="우리"></form:option>
										<form:option value="농협"></form:option>
										<form:option value="현대"></form:option>
										<form:option value="삼성"></form:option>
									</form:select>
								</div>
							</div>
							<div class="col-6">
								<div class="form-group">
								  	<label>카드번호</label>
							  		<form:input path="card_num" class="form-control" maxlength='19' placeholder="카드번호 입력 (예: 1234-1234-1234-1234)"/>
							  		<form:errors path="card_num" style='color:red'/>
								</div>
							</div>
							<div class="col-4">
								<div class="form-group">
								  	<label>비밀번호</label>
								  	<form:password path="card_pw" class="form-control" maxlength='4' placeholder="****"/>
								  	<form:errors path="card_pw" style='color:red'/>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<div class="form-group">
								  	<label>유효기간</label>
								  	<div class="row">
								  		<div class="col-4">
									  		<form:input path="card_month" class="form-control" maxlength='2' placeholder="MM"/>
									  		<form:errors path="card_month" style='color:red'/>
								  		</div>
									  	<span style="color: #999999; font-size:1.5em;">/</span>
								  		<div class="col-4">
									  		<form:input path="card_year" class="form-control" maxlength='2' placeholder="YY"/>
									  		<form:errors path="card_year" style='color:red'/>
										</div>
									</div>				
								</div>
							</div>
							<div class="col-6">
								<div class="form-group">
								  	<label>CVC번호</label>
								  	<form:input path="business_num" class="form-control" maxlength='3' placeholder="카드 뒷면 CVC 끝번호 세 자리 입력"/>
								  	<form:errors path="business_num" style='color:red'/>
								</div>
							</div>
						</div>
						<form:hidden path="id" class="form-control"/>
						<div class="click">
							<button type="submit" class="btn btn-primary center">등록하기</button>
						</div>
					</form:form>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${root }js/google-map.js"></script>
	<script src="${root }js/main.js"></script>

</body>
</html>