<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}/"/>
<!DOCTYPE html>
<html lang="en">
   <head>
    <title>Carbook - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
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
  </head>
  <body>
  
  <c:import url="/WEB-INF/views/include/top_menu.jsp" />
  
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root }images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${root }main">Home <i class="ion-ios-arrow-forward"></i></a></span></p>
            <h1 class="mb-3 bread">마이 페이지</h1>
          </div>
        </div>
      </div>
    </section>

<!-- 마이 페이지 메뉴 부분 -->
<section class="ftco-section bg-light">
    	<div class="container">
    		<div class="row">

    			<!--  예약 정보   -->
    			<div class="col-md-4">
    				<div class="car-wrap rounded ftco-animate">
    					<div class="img rounded d-flex align-items-end" style="background-image: url(${root }images/MyPageSample.jpg);"></div>
    					<div class="text">
    						<h2 class="mb-0"><a href="${root }myPage/myReserve?id=${loginUserBean.id}" >예약정보 및 결제내역</a></h2>
    						<span class="cat">회원님의 현재 예약 정보와 결제 내역을 확인합니다</span>
    						<div class="d-flex mb-3">
    						    <hr />
    						</div>
    					</div>
    				</div>
    			</div>
    			<!--  예약 정보  -->
    		

    			<!-- 회원 VIP 등급 & 쿠폰 -->
    			<div class="col-md-4"> 
    				<div class="car-wrap rounded ftco-animate">
    					<div class="img rounded d-flex align-items-end" style="background-image: url(${root }images/MyPageSample.jpg);"></div>
    					<div class="text">
    						<h2 class="mb-0"><a href="${root }myPage/myVip_coupon?id=${loginUserBean.id}" > VIP 등급 & 쿠폰</a></h2>
    						<span class="cat">회원님의 마이리지 등급과 쿠폰을 확인합니다</span>
    						<div class="d-flex mb-3">
    						    <hr />
    						</div>
    					</div>
    				</div>
    			</div>    			
    			<!-- 회원 VIP 등급 & 쿠폰 -->
    			
    			
    			
    			<!-- ======================== 이우철 ============================ -->
    			
    			<!-- 개인정보 수정 -->
    			<div class="col-md-4">
    				<div class="car-wrap rounded ftco-animate">
    					<div class="img rounded d-flex align-items-end" style="background-image: url(${root }images/MyPageSample.jpg);">
    					</div>
    					<div class="text">
    						<h2 class="mb-0"><a href="${root }myPage/modifyInfo/modify">개인정보 수정</a></h2>
    						<div class="d-flex mb-3">
    						    <span class="cat">개인정보 수정, 면허증 정보, 결제카드 정보</span>
    						</div>
    					</div>
    				</div>
    			</div>
    			<!-- 개인정보 수정 -->
    			
    			
    			<!-- 면허증 및 결제수단 -->
    			<div class="col-md-4">
    				<div class="car-wrap rounded ftco-animate">
    					<div class="img rounded d-flex align-items-end" style="background-image: url(${root }images/MyPageSample.jpg);">
    					</div>
    					<div class="text">
    						<h2 class="mb-0"><a href="${root }myPage/register/license">면허증 등록</a></h2>
    						<div class="d-flex mb-3">
    						    <span class="cat">회원님의 면허증을 등록합니다.</span>
    						</div>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4">
    				<div class="car-wrap rounded ftco-animate">
    					<div class="img rounded d-flex align-items-end" style="background-image: url(${root }images/MyPageSample.jpg);">
    					</div>
    					<div class="text">
    						<h2 class="mb-0"><a href="${root }myPage/register/card">결제수단 등록</a></h2>
    						<div class="d-flex mb-3">
    						    <span class="cat">회원님의 결제카드를 등록합니다.</span>
    						</div>
    					</div>
    				</div>
    			</div>
    			<!-- 면허증 및 결제수단 -->
    			<!-- ======================== 이우철 ============================ -->
    		</div>
    	</div>
    </section>




  
  <!-- footer_info -->  
  <c:import url="/WEB-INF/views/include/footer_info.jsp" />

  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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