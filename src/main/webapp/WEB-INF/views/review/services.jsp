<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>

<!DOCTYPE html>
<jsp lang="en">
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
    <link rel="stylesheet" href="${root }css/alphacar.css">
  </head>
  <body>
    
	  <c:import url="/WEB-INF/views/include/top_menu.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${root }images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="${root }index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Services <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">고객센터</h1>
          </div>
        </div>
      </div>
    </section>	
    			
    <section class="py-5 my-5">
		<div class="container">
<%-- 			<form:form action="${root}review/write" method="get"
				modelAttribute="modifyUserBean"> --%>
				<div class="bg-white shadow rounded-lg d-block d-sm-flex"
					style="width: 120%; height: 120%;">
					<div class="profile-tab-nav border-right">
						<div class="p-4">
							<div class="img-circle text-center mb-3">
								<img src="${root }images/alpaca.png" alt="Image" class="shadow">
							</div>
							<h4 class="text-center">내이름 알파카</h4>
						</div>
						<div class="nav flex-column nav-pills" id="v-pills-tab"
							role="tablist" aria-orientation="vertical">
							<a class="nav-link active" id="service-tab" data-toggle="pill"
								href="#service" role="tab" aria-controls="service"
								aria-selected="true"> <i class="fa fa-home text-center mr-1"></i>
								공지사항
							</a> <a class="nav-link" id="qusetion-tab" data-toggle="pill"
								href="#question" role="tab" aria-controls="question"
								aria-selected="false"> <i class="fa fa-key text-center mr-1"></i>
								문의사항
							</a>
						</div>
					</div>
					<!-- 게시글 리스트 -->
					<div class="container" style="margin-top: 40px">
						<h4 class="card-title">카드 타이틀</h4>
						<table class="table table-hover" id='board_list' role="tabpanel"
							aria-labelledby="service-tab">
							<thead>
								<tr>
									<th class="text-center d-none d-md-table-cell">글번호</th>
									<th class="w-50">제목</th>
									<th class="text-center d-none d-md-table-cell">작성자</th>
									<th class="text-center d-none d-md-table-cell">작성날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var='obj' items="${reviewList }">
									<tr>
										<td class="text-center d-none d-md-table-cell">${obj.review_seq }</td>
										<td><a href='${root }review/read?review_seq=${obj.review_seq }'>${obj.review_subject }</a></td>
										<td class="text-center d-none d-md-table-cell">${obj.review_writer_idx }</td>
										<td class="text-center d-none d-md-table-cell">${obj.review_date }</td>	
									</tr>
								</c:forEach>

							</tbody>
						</table>

						<div class="d-none d-md-block">
				<ul class="pagination justify-content-center">
				    <!-- 이전페이지가 1이하면 비활성화 -->
					<c:choose>
						<c:when test="${pageBean.prevPage <= 0 }">
						
						<li class="page-item disabled">
							<a href="#" class="page-link">이전</a>
						</li>
						</c:when>
						
						<c:otherwise>
						<li class="page-item">
							<a href="${root }review/services?page=${pageBean.prevPage}" class="page-link">이전</a>
						</li>
						</c:otherwise>
					</c:choose>
					
					
					
					<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
					<!-- 현재페이지면 active(부트스트랩) 적용-->
					<c:choose>
						<c:when test="${idx == pageBean.currentPage }">
						<li class="page-item active">
							<a href="${root }review/services?page=${idx}" class="page-link">${idx }</a>
						</li>
						</c:when>
						<c:otherwise>
						<li class="page-item">
							<a href="${root }review/services?page=${idx}" class="page-link">${idx }</a>
						</li>
						</c:otherwise>
					</c:choose>	
					</c:forEach>
					
					
					
					<!-- Max값이 전체페이지보다 크거나 같으면 비활성화 	disabled(부트스트랩) -->	
					<c:choose>
					<c:when test="${pageBean.max >= pageBean.pageCnt }">
					<li class="page-item disabled">
						<a href="#" class="page-link">다음</a>
					</li>
					</c:when>
					<c:otherwise>
					<li class="page-item">
						<a href="${root }board/main?board_info_idx=${board_info_idx}&page=${pageBean.nextPage}" class="page-link">다음</a>
					</li>
					</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
			
			<div class="text-right">
				<a href="${root }board/write?board_info_idx=${board_info_idx}" class="btn btn-primary">글쓰기</a>
			</div>
		
			</div>
	</section>	

    <c:import url="/WEB-INF/views/include/footer_info.jsp"/> 
    
  

 

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