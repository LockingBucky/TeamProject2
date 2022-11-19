<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
    <link rel="stylesheet" href="${root }css/alphacar.css">
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>


<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root }images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${root }index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Services <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">글읽기</h1>
          </div>
        </div>
      </div>
    </section>	

<div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
				<div class="card-body">
					<form:form action="${root }review/modify_pro" method="post" modelAttribute="modifyReviewBean" enctype="multipart/form-data">
						<form:hidden path="review_seq"/>
						<%-- <input type="hidden" name ="page" value = "${page }" /> --%>
						
						<div class="form-group">
							<form:label path="review_writer_idx">작성자</form:label>
							<form:input path="review_writer_idx" class="form-control" readonly = "true"/>
						</div>
						
						
						<div class="form-group">
							<form:label path="review_date">작성날짜</form:label>
							<form:input path="review_date" class="form-control" readonly = "true"/>
						</div>
						
						<div class="form-group">
							<form:label path="review_subject">제목</form:label>
							<form:input path="review_subject" class="form-control"/>
							<form:errors path="review_subject" style = 'color:red'/>
						</div>
						
						<div class="form-group">
							<form:label path="review_text">내용</form:label>
							<form:textarea path="review_text" class="form-control" rows= "10" style="resize:none"/>
							<form:errors path="review_text" style = 'color:red'/>
						</div>
						
						<div class="form-group">
							<label for="board_file">첨부 이미지</label>
							<c:if test = '${modifyReviewBean.review_file != null }'>
							<img src="${root }upload/${modifyReviewBean.review_file }" width="100%"/>	
								<form:hidden path="review_file"/>
							
							</c:if>
							<form:input type="file" path="upload_file" class="form-control" accept="image/*"/>					
						</div>
						
						<div class="form-group">
							<div class="text-right">
								<form:button class="btn btn-primary">수정완료</form:button>
								<a href="${root }review/read?review_seq=${modifyReviewBean.review_seq }" class="btn btn-info">취소</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>



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

