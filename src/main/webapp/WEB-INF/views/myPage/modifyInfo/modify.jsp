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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root }images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${root }index">Home <i class="ion-ios-arrow-forward"></i></a>
          	<a href="${root }myPage/myPage">myPage <i class="ion-ios-arrow-forward"></i></a>
          	</span></p>
            <h1 class="mb-3 bread">개인 정보</h1>
          </div>
        </div>
      </div>
    </section>
    
    
    <section class="py-5 my-5">
		<div class="container">
			<h1 class="mb-5">나의 정보</h1>
			<div class="bg-white shadow rounded-lg d-block d-sm-flex">
				<div class="profile-tab-nav border-right">
					<div class="p-4">
						<div class="img-circle text-center mb-3">
							<img src="${root }images/alpaca.png" alt="Image" class="shadow">
						</div>
					</div>
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
							<i class="fa fa-home text-center mr-1"></i> 
							계정정보
						</a>
						<a class="nav-link" id="license-tab" data-toggle="pill" href="#license" role="tab" aria-controls="license" aria-selected="false">
							<i class="fa fa-key text-center mr-1"></i> 
							면허증
						</a>
						
						<a class="nav-link" id="creditCard-tab" data-toggle="pill" href="#creditCard" role="tab" aria-controls="creditCard" aria-selected="false">
							<i class="fa fa-tv text-center mr-1"></i> 
							결제카드
						</a>
							
					</div>
				</div>
				<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
						<h3 class="mb-4">개인정보 설정</h3>
						<form:form action="${root }myPage/modifyInfo/modify_pro" method="post" modelAttribute="modifyUserBean">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
									  	<form:label path="id">아이디</form:label>
									  	<form:input path="id" readonly="true" class="form-control" />
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									  	<form:label path="pw">새로운 비밀번호</form:label>
									  	<form:password path="pw" class="form-control"/>
									  	<form:errors path="pw" style='color:red'/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									  	<form:label path="pw2">새로운 비밀번호 확인</form:label>
									  	<form:password path="pw2" class="form-control"/>
									  	<form:errors path="pw2" style='color:red'/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									  	<form:label path="name">이름</form:label>
									  	<form:input path="name" readonly="true" class="form-control"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									  	<form:label path="birth">생년월일</form:label>
									  	<form:input path="birth" readonly="true" class="form-control"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									  	<form:label path="email">이메일</form:label>
									  	<form:input path="email" class="form-control"/>
									  	<form:errors path="email" style='color:red'/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									  	<form:label path="phone">휴대전화 번호</form:label>
									  	<form:input path="phone" class="form-control"/>
									  	<form:errors path="phone" style='color:red'/>
									  	
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
									  	<form:label path="address">주소</form:label>
									  	<form:input path="address" class="form-control"/>
									</div>
								</div>
							</div>
							<div class="row">
								<button type="submit" class="btn btn-primary center">수정하기</button>
							</div>
						</form:form>
					</div>
					
					
					<div class="tab-pane fade" id="license" role="tabpanel" aria-labelledby="license-tab">
						<h3 class="mb-4">면허증 정보</h3>
						<div class="row">
							<div class="col-6">
								<div class="form-group">
									<label for="license_num">면허번호</label>
									<input type="text" id="license_num" value="${modifyUserBean.license_num }" class="form-control" readonly>
								</div> 
							</div>
							<div class="col-6">
								<div class="form-group">
								  	<label for="license_type">면허 종류</label>
								  	<input type="text" id="license_type" value="${modifyUserBean.license_type }" class="form-control" readonly>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<div class="form-group">
								  	<label for="license_start">발급일</label>
								  	<input type="text" id="license_start" value="${modifyUserBean.license_start }" class="form-control" readonly>
								</div>
							</div>
							<div class="col-6">
								<div class="form-group">
								  	<label for="license_end">갱신기간 만료일</label>
								  	<input type="text" id="license_end" value="${modifyUserBean.license_end }" class="form-control" readonly>
								</div>
							</div>
						</div>
					</div>
					
					
					<div class="tab-pane fade" id="creditCard" role="tabpanel" aria-labelledby="creditCard-tab">
						<h3 class="mb-4">결제카드 목록</h3>
							<c:forEach var='obj' items="${cardList }">
								<label>${obj.card_name}</label><span>&nbsp&nbsp</span><label>${obj.card_num}</label><br/>
							</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
    
    
    
    
    
    
    
    
    

	<%-- <section class="py-5 my-5">
		<div class="container">
			<form:form action="${root }myPage/modifyInfo/modify_pro" method="post" modelAttribute="modifyUserBean">
				<div class="bg-white shadow rounded-lg d-block d-sm-flex">
					<div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
						<h3 class="mb-4">나의 정보 수정</h3>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
								  	<form:label path="id">아이디</form:label>
								  	<form:input path="id" readonly="true" class="form-control" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<form:label path="pw">새로운 비밀번호</form:label>
								  	<form:password path="pw" class="form-control"/>
								  	<form:errors path="pw" style='color:red'/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<form:label path="pw2">새로운 비밀번호 확인</form:label>
								  	<form:password path="pw2" class="form-control"/>
								  	<form:errors path="pw2" style='color:red'/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<form:label path="name">이름</form:label>
								  	<form:input path="name" readonly="true" class="form-control"/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<form:label path="birth">생년월일</form:label>
								  	<form:input path="birth" readonly="true" class="form-control"/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<form:label path="email">이메일</form:label>
								  	<form:input path="email" class="form-control"/>
								  	<form:errors path="email" style='color:red'/>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
								  	<form:label path="phone">휴대전화 번호</form:label>
								  	<form:input path="phone" class="form-control"/>
								  	<form:errors path="phone" style='color:red'/>
								  	
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
								  	<form:label path="address">주소</form:label>
								  	<form:input path="address" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="row">
							<button type="submit" class="btn btn-primary center">수정하기</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</section> --%>

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