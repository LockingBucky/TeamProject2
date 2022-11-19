<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
    
  	<c:import url="/WEB-INF/views/include/top_menu.jsp"/>
  	  
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root }images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${root }main">Home <i class="ion-ios-arrow-forward"></i></a></span></p>
            <h1 class="mb-3 bread">예약정보 및 결제내역</h1>
          </div>
        </div>
      </div>
    </section>
  <c:choose>
  <c:when test="${myPage != null}">
  <section class="ftco-section bg-light">
    	<div class="container">
    	
    		<div class="row">
    		    		
    		  <!-- 예약완료 -->
    		  <c:forEach var="obj" items="${myPage }">
    	
    			<div class="col-md-4">
    				<div class="car-wrap rounded ftco-animate">
    					<div class="img rounded d-flex align-items-end" style="background-image: url(${root }images/complete_for_reserve.png);">
    					</div>
    					<div class="text">
    						<h2 class="mb-0">이용할 날짜</h2>
    						<h4 class="mb-0">${obj.startdate}</h4>
    						<div class="d-flex mb-3">
	    						<span class="cat">${obj.car_name }</span>
	    						<p class="price ml-auto"> ${obj.price}<span>원 </span></p>
    						</div>
    						<p class="d-flex mb-0 d-block"><a href="${root }myPage/myPayment_history?rent_seq=${obj.rent_seq}" class="btn btn-secondary py-2 ml-1">Details</a></p>
    					</div>
    				</div>
    			</div>
    			
    		  </c:forEach>	
    		  
    		  	  
    		</div>
    	</div>
    	
    </section>
    </c:when>
    <c:when test="${myPage = null}">
     <section class="ftco-section bg-light">
    	<div class="container">
    	
    		<div class="row">
    			<div class="col-md-4">
    				<div class="car-wrap rounded ftco-animate">
    					<div class="img rounded d-flex align-items-end" style="background-image: url(${root }images/complete_for_reserve.png);">
    					</div>
    					<div class="text">
    						<h2 class="mb-0">이용할 날짜</h2>
    						<h4 class="mb-0"></h4>
    						<div class="d-flex mb-3">
	    						<span class="cat"></span>
	    						<p class="price ml-auto"><span>원 </span></p>
    						</div>
    						<p class="d-flex mb-0 d-block"><a href="${root }myPage/myPayment_history" class="btn btn-secondary py-2 ml-1">Details</a></p>
    					</div>
    				</div>
    			</div>
    		</div>
    		
    	</div>    	
    </section>
    </c:when>	   	
	</c:choose>

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