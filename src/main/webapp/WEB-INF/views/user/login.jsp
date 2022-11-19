<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<c:set var='root' value="${pageContext.request.contextPath}/"/>
<!DOCTYPE html>
<html lang="en">
<head>


<!-- 카카오 로그인  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!-- 네이버 로그인  -->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>


<!-- google api 라이브러리 삽입   -->
<meta name="google-signin-client_id"
	content="837951257172-piva4bubaps9tt8nin3vva1qhg4b4mmd.apps.googleusercontent.com">
<!-- 이곳에 발급받은 구글 클라이언트 ID 삽입  -->
<script src="https://apis.google.com/js/platform.js" async defer></script>


<!-- google api  -->
<meta name="google-signin-client_id"
	content="837951257172-piva4bubaps9tt8nin3vva1qhg4b4mmd.apps.googleusercontent.com">
<!-- 구글 클라이언트 ID -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.03.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="./style.css" />


<!-- 네이버 라이브러리  -->
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>




<!-- bootstrap 부분 -->
<title>ALPHACAR LOGIN</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</head>


<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

  

	<!-- login view 구현부  -->

 <div class="container" style="margin-top:100px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
				<div align="center">
					<h1>LOGIN</h1>
					<div class="card-body">

						<c:if test="${fail==true}">
							<div class="alert alert-danger">
								<h4>로그인 실패</h4>
								<p>아이디 비밀번호를 확인해주세요</p>
							</div>
						</c:if>

						<form:form action="${root }user/login_pro" method="post"
							modelAttribute="tempLoginUserBean">
							<div class="form-group" align="left">
								<form:label path="id">ID</form:label>
								<form:input path="id" class="form-control"  placeholder="ID" />
								<form:errors path="id" style='color:red' />
							</div>
							<div class="form-group" align="left">
								<form:label path="pw">Password</form:label>
								<form:input path="pw" type="password" class="form-control" placeholder="Password" />
									<form:errors path="pw" style='color:red' />
								</div>
								<div class="form-group">
								<p class="text-center">
									By signing up you accept our <a href="#">Terms Of Use</a>
								</p>
							</div>


							<div class="col-md-12 text-center ">
								<form:button class=" btn btn-block mybtn btn-primary tx-tfm">Login</form:button>
							</div>


							<div class="col-md-12 ">
								<div class="login-or">
									<hr class="hr-or">

								</div>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>


	<!-- 카카오 스크립트  -->


	<div class="button-login" align="center">
		<a id="kakao-login-btn"> <img
			src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
			width="277px" height="50px" />
		</a>
	</div>
	<br>


	<script type='text/javascript'>
Kakao.init('71ccb29f290d5c21248d234a374b8619');


$("#kakao-login-btn").on("click", function(){
    //1. 로그인 시도
    Kakao.Auth.login({
        success: function(authObj) {
         
          //2. 로그인 성공시, API 호출
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
              console.log(res);
              var id = res.id;
			  scope : 'account_email';
			alert('로그인성공');
              location.href="http://localhost:9627/alphacar/index";
		

              
        }
          })
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
}) //


</script>





<!-- 네이버 스크립트 -->
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div align="center" id="naverIdLogin"></div>
 

<!-- 네이버아이디로로그인 초기화 Script -->
<script type="text/javascript">
     var naverLogin = new naver.LoginWithNaverId({
       clientId: '7F9_oyWP30jLjC3Ry0AA',
       callbackUrl: 'http://localhost:9627/ALPHACAR/index',
       isPopup: false /* 팝업을 통한 연동처리 여부 */,
       loginButton: { color: 'green', type: 3, height: 60 } /* 로그인 버튼의 타입을 지정 */,
     });

     /* 설정정보를 초기화하고 연동을 준비 */
     naverLogin.init();
   </script>


	<!-- 구글 로그인 기능 및 버튼디자인 시작  -->
	<br>
	<br>
	<br>
	<br>

	<script>

//처음 실행하는 함수
function init() {
	gapi.load('auth2', function() {
		gapi.auth2.init();
		options = new gapi.auth2.SigninOptionsBuilder();
		options.setPrompt('select_account');
        // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
        // 인스턴스의 함수 호출 - element에 로그인 기능 추가
        // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
	})
}

function onSignIn(googleUser) {
	var access_token = googleUser.getAuthResponse().access_token
	$.ajax({
    	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
		url: 'https://people.googleapis.com/v1/people/me'
        // key에 자신의 API 키를 넣습니다.
		, data: {personFields:'birthdays', key:'AIzaSyABIZ_oQDMM3lv-cw7DQlsw9Q84cgS8KRs', 'access_token': access_token}
		, method:'GET'
	})
	.done(function(e){
        //프로필을 가져온다.
		var profile = googleUser.getBasicProfile();
		console.log(profile)
	})
	.fail(function(e){
		console.log(e);
	})
}
function onSignInFailure(t){		
	console.log(t);
}
</script>
	<div align="center" id="my-signin2"></div>
	<script>
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 420,
        'height': 50,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  </script>

	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>

	<br>
	<br>


	<!--   하단 메뉴 고정바  -->
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


	<script src="${root }js/main.js"></script>

</body>
</html> 