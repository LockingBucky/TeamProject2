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
            <h1 class="mb-3 bread">회원 VIP 등급 & 쿠폰</h1>
          </div>
        </div>
      </div>
    </section>
    
    <!-- 로그인후 보여질 페이지 -->
 
    	
   	 	<section class="ftco-section" style="padding-bottom: 0; margin:0; ">
	      <div class="container" >
	        <div class="row d-flex justify-content-center">
	          <div class="col-md-12 text-center d-flex ftco-animate">
	          	<div class="blog-entry justify-content-end mb-md-5">
	              <div class="text px-md-5 pt-4">
	              	<div class="meta mb-3"><h3>회원님의 쿠폰 현황</h3></div>
	                <h1 class="heading mt-2"></h1>
           
	                
	                <p><a href="${root}myPage/myPage" class="btn btn-primary"><span class="icon-long-arrow-left"></span> 뒤로가기</a></p>
              
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>         
	    </section>
	   
	    
		    <hr /> <!-- 경계선 -->
		    
	    <section class="ftco-section" style="padding-top: 0;"> <!--class="ftco-section bg-light "-->
	    	<div class="container">
	    		<div class="row">
    		
    			<c:choose>
    			
   	 				<c:when test="${loginUserBean.userLogin == true}">
   	 					<c:forEach var="obj" items="${myCoupon }">	     
			    		<div class="container mt-5">
			              <div class="row d-flex justify-content-center">
			                  <div class="col-md-5">
			                  <div class="card">
			                   <div class="text-right p-2"> <img src="${root }images/coupon_logo.png" width="120"> </div>
			                   <div class="text-center"> <small class="text-uppercase flat">${obj.coupon_name }</small> </div>
			                   <div class="d-flex justify-content-center px-2">
			                     <div class="d-flex flex-row">
			                        <h1 class="mt-0 off">${obj.coupon_price }원 할인 </h1>
			                    </div>
			                   </div>
			                  <div class="line">
			                    <hr>
			                  </div>
			                <div class="text-center mb-5"> <span class="text-uppercase">${obj.open_start_date } 부터 ${obj.open_end_date } 까지</span> </div>
			                <div class="text-right p-1"> <small>*T&C APPLY</small> <a onclick="return confirm('지금 바로 예약창으로 이동하시겠습니까?')" href="${root }order/contact" class="btn btn-secondary">예약 하러 가기</a></div>
			                
			                </div>
			               </div>   
			              </div>
			            </div>
			            </c:forEach>
			        </c:when>
			        <c:otherwise> 
		                <section class="ftco-section" style="margin: auto; ">
			                <div class="container"  >
						        <div class="row d-flex justify-content-center" >
						          <div class="col-md-12 text-center d-flex ftco-animate"> 
						          	<div class="blog-entry justify-content-end mb-md-5">
						              <div class="text px-md-5 pt-4">
						              	<div class="meta mb-3"><h3></h3></div>
						                </div>
						            </div>
						          </div>
						        </div>
		     				 </div>
		                </section>
	                </c:otherwise>  
	                 
            	</c:choose>

	    		</div>
	    	</div>
	    </section>
   
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