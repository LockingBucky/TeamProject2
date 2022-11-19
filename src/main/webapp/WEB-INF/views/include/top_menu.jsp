<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/> 


<!--     <div align="right"> -->
<%--     <button type="button" class="btn btn-default"  onclick="location.href='${root }user/join'">JOIN</button> --%>
    
<%--     <button type="button" class="btn btn-default" onclick="location.href='${root }user/login'">LOGIN</button>   --%>
<!--      </div> -->


 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="${root }index">Alpha<span>Car</span></a>
	      <button class="navbar-toggler" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="${root }index" class="nav-link">시작페이지</a></li>
	          <%-- <li class="nav-item"><a href="${root }about" class="nav-link">About</a></li> --%>
	          <li class="nav-item"><a href="${root }blog" class="nav-link">블로그</a></li>	    
	          <li class="nav-item"><a href="${root }review/services" class="nav-link">고객센터</a></li>
	          <li class="nav-item"><a href="${root }order/contact" class="nav-link">예약하기</a></li>
	          
	        </ul>	    
	        <ul class="navbar-nav ml-auto">
			<c:choose>
				<c:when test="${loginUserBean.userLogin == true }">
					<!-- 로그인 시 -->
					<li class="nav-item">
						<li class="nav-item"><a href="${root }myPage/myPage" class="nav-link">마이페이지</a></li>
					</li>
					<li class="nav-item">
						<a href="${root }user/logout" class="nav-link">로그아웃</a>
					</li>
				</c:when>
				
				<c:otherwise>
					<!-- 로그아웃 시 -->
					<li class="nav-item">
						<a href="${root }user/login" class="nav-link">로그인</a>
					</li>
					
					<li class="nav-item">
						<a href="${root }user/join" class="nav-link">회원가입</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>  
	      </div>
<!-- 	        <div align="right"> -->
	
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${loginUserBean.userLogin == true }"> --%>
<%-- 				<form:button path="btn btn-default"  onclick="location.href='${root }myPage/modify'">정보수정</form:button> --%>
<%-- 	    		<form:button path="btn btn-default" onclick="location.href='${root }user/logout'">로그아웃</form:button>       		 --%>
<%--      		</c:when> --%>
<%-- 				<c:otherwise> --%>
<%--     			<form:button path="btn btn-default" onclick="location.href='${root }user/login'">로그인</form:button>       --%>
<%--     			<form:button path="btn btn-default"  onclick="location.href='${root }user/join'">회원가입</form:button> --%>
<%--      			</c:otherwise> --%>
<%-- 			</c:choose> --%>
<!--      		</div> -->
	        
	    </div>
	  </nav>
    <!-- END nav -->

