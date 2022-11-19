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

	<style>
			#img_center {display: block; margin: 15px auto; }
	</style>
		 
  </head>
  <body>
    
    	  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
    
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url(${root }images/bg_3.jpg);" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${root }main">Home <i class="ion-ios-arrow-forward"></i></a></span> </p>
            <h1 class="mb-3 bread">예약 정보 및 결제 내역</h1>
          </div>
        </div>
      </div>
    </section>
    
    
    <!-- 예약 정보 및 결제 내역 -->
    <section class="ftco-section contact-section">
      <div class="container">
        <div> 
		   <img id="img_center" src="${root }images/${myReserve.car_img1 }"  />
        </div>
		<div class="row">		        
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">			    
				<thead>
					<tr>
						<th colspan="3" style="background-color: #FFFFFF; text-align: center;"><b>예약정보 및 결제내역</b></th>						
					</tr>
				</thead>
				<tbody>
					<!-- <tr>
						<td style="width: 20%;"><b>예약 번호</b></td>
						<td colspan="2">A448492</td>
					</tr>-->
					<tr>
						<td style="width: 20%;"><b>대여 기간</b></td>
						<td colspan="2"><input type="text" value="${myReserve.startdate} " disabled="disabled" style="width:800px; height:30px; font-size:20px; border:0 solid black; text-align:center;"/></td>
					</tr>
					<tr>
						<td style="width: 20%;"><b>반납 기간</b></td>
						<td colspan="2"><input type="text" value="${myReserve.enddate} " disabled="disabled" style="width:800px; height:30px; font-size:20px; border:0 solid black; text-align:center;"/> </td>
					</tr>
					<tr>
						<td style="width: 20%;"><b>전기 차량 정보</b></td>
						<td colspan="2"><input type="text" value="${myReserve.car_brand}  ${myReserve.car_name} " disabled="disabled" style="width:800px; height:30px; font-size:20px; border:0 solid black; text-align:center;"/></td>
					</tr>
					<tr>
						<td style="width: 20%;"><b>픽업 장소</b></td>
						<td colspan="2"><input type="text" value="${myReserve.pickup_zone} " disabled="disabled" style="width:800px; height:30px; font-size:20px; border:0 solid black; text-align:center;"/></td>
					</tr>
					<tr>
						<td style="width: 20%;"><b>반납 장소</b></td>
						<td colspan="2"><input type="text" value="${myReserve.return_zone} " disabled="disabled" style="width:800px; height:30px; font-size:20px; border:0 solid black; text-align:center;"/></td>
					</tr>
					<tr>
						<td style="width: 20%;"><b>결제 총 금액</b></td>
						<td colspan="2"><input type="text" value="${myReserve.price} 원" disabled="disabled" style="width:800px; height:30px; font-size:20px; border:0 solid black; text-align:center;"/></td>
					</tr>						
				</tbody>
			</table>
			<a href="${root }myPage/myReserve?id=${loginUserBean.id}" class="btn btn-primary">예약정보 목록</a>			
			<a onclick="return confirm('예약 약관 절차에 따라 취소요금이 전액 청구 되며, 이미 사용된 쿠폰은 정책에 따라 재사용이 불가능 합니다. 정말로 취소하시겠습니까?')" href="${root }myPage/delete?rent_seq=${myReserve.rent_seq}" class="btn btn-secondary">예약 취소</a>  
      </div>    
	</div>
	  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	  <script src="js/bootstrap.js"></script>
    </section>
    
	<!-- 예약 정보 및 결제 내역 -->
    
    
	
    <c:import url="/WEB-INF/views/include/footer_info.jsp"/> 

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