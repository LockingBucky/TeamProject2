<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<link rel="stylesheet" href="${root }css/order.css">
<link rel="stylesheet" href="${root }css/checkbox_modal.css">

<script>
function getPrice(event) {
	
	var price = ${total}
	if(event.target.value != 0){
		price = ${total } - ${couponPrice}
		$("#price").text(price)	
		$("#checkCoupon").val('true')

	}
	else {
		$("#price").text(price)
		$("#checkCoupon").val('false')
	}
		
}

</script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	 <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root }images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Pricing <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">Pricing</h1>
          </div>
        </div>
      </div>
    </section>
	
	
	<section class="ftco-section contact-section bg-light">
		<div class="container">
			<div class="col-md-8 block-9 mb-md-5">
			
			
		<form:form action = "${root }order/payment_success?total=${total }&couponPrice=${couponPrice }" method="Post" modelAttribute="select_RentBean" class="request-form ftco-animate bg-primary">

					<%-- <form:label path="" >총 금액</form:label> --%>
					<h2>총 금액
					<br />
					<form:label path="price" id = "price" readonly="true">${total }</form:label>
					</h2>
		   <h2>쿠폰<br/>
				<label for="">${ couponName}</label> 
				</h2>
				<br />
				<input type='radio' name='coupon' id ='useCoupon' value='${ couponPrice}'  onclick='getPrice(event)'/>사용 
				<br />
				<input type='radio' name='coupon' id ='unuseCoupon'value='0' onclick='getPrice(event)'/>사용 안함

				<h2>결제수단</h2> 
				
				<div class="accordion" id="accordionExample">
				  <div class="card">
				    <div class="card-header" id="headingOne">
				      <h2 class="mb-0">
				        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				          카드 간편 결제
				        </button>
				      </h2>
				    </div>
					
				    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
				      <div class="card-body">
				      <%-- <c:choose>
						<c:when test="${empty cardNum }">
				        카드가 없어요 --%>
						<%-- </c:when> --%>
						
						<%-- <c:otherwise> --%>
						<img src="${root }images/card_image.png" alt="" class="img-fluid">
			<%-- 			</c:otherwise>		      
				      </c:choose> --%>
				         
				      </div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="card-header" id="headingTwo">
				      <h2 class="mb-0">
				        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
				          일반결제
				        </button>
				      </h2>
				    </div>
				    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
				      <div class="card-body">
				        일반결제
				      </div>
				    </div>
				  </div>
				  <div class="card">
				    <div class="card-header" id="headingThree">
				      <h2 class="mb-0">
				        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				          현장결제
				        </button>
				      </h2>
				    </div>
				    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
				      <div class="card-body">
				        현장에 있는 키오스크에서 결제 후 이용가능합니다.
				      </div>
				    </div>
				  </div>
				</div>
				
				
				<p/>
				<p/>
				<br>
				
			
				
			
				<form:hidden path="price" value="${total }" />
				<form:hidden path="checkCoupon"/>
				<form:hidden path="pickup_zone" value="${select_RentBean.pickup_zone }" />
				<form:hidden path="return_zone" value="${select_RentBean.return_zone }" />
				<form:hidden path="car_seq" value="${select_RentBean.car_seq }" />
				<form:hidden path="id" value="${select_RentBean.id }" />
				<form:hidden path="startDate" value="${select_RentBean.startDate }" />
				<form:hidden path="endDate" value="${select_RentBean.endDate }" />
				<form:hidden path="time_pick" value="${select_RentBean.time_pick }" />
				<input type="hidden" value="" name="deleveryTip" id="delevery_tip"> 
				<div class="form-group">
					<div class="text-right">
						<button type="submit" class="btn btn-primary">결제하기</button>
					</div>
				</div>
		</form:form>

			
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
	<script src="${root }js/main.js"></script>
	<script src="${root }js/payment.js"></script>

	
</body>
</html>