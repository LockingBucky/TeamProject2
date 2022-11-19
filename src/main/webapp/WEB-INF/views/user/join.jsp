<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath}/"/> 
<!DOCTYPE html>
<html>
<head>

<script>
   function checkUserIdExist() {
      // 변수선언 : 사용자가 입력한 아이디 가져오기
      var id=$('#id').val()
      // 아이디가 입력되지 않았을 경우
      if(id.length == 0) {
         alert('아이디를 입력하세요.')
         return
      }
   
      // 통신
      $.ajax({
         // 요청 주소
         url : '${root}user/checkUserIdExist/' + id,
         // 요청 타입
         type : 'get',
         // 응답 결과
         datatype : 'text',
         // 성공 시 호출할 함수
         success : function(result) {
            if(result.trim() == 'true') {
               alert('사용할 수 있는 아이디입니다.')
               $("#userIdExist").val('true')
            }else if(result.trim() == 'false') {
               alert('사용할 수 없는 아이디입니다.')
               $("#userIdExist").val('false')
            }         
         }//success
      }) //ajax
   }//checkUserIdExist
   
   // 사용자 아이디란에 클릭만하면 무조건 false
   function resetUserIdExist() {
      $('#userIdExist').val('false')
   }

</script>


<!--  우편번호 api 11월 5일 희원추가 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<!-- Bootstrap CDN -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ALPHACAR JOIN </title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${root }css/modal.css">


 

</head>


<body>

<c:import url="/WEB-INF/views/include/top_menu.jsp"/>

<!--  우편번호 api 11월 5일 희원추가 -->

<script>
const postcode = new daum.Postcode({
    oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if(data.userSelectedType === 'R'){
            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraAddr !== ''){
                extraAddr = ' (' + extraAddr + ')';
            }
            // 조합된 참고항목을 해당 필드에 넣는다.
            // document.getElementById("extraAddr").value = extraAddr;

        } else {
            // document.getElementById("extraAddr").value = '';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
         
        document.getElementById("address").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("detailAddress").focus();
    }
});

// 버튼이 클릭되었을 때 오픈 팝업은 이와 같이 적용하면 됩니다.
const openDaumPostcodePopup = function() {
    postcode.open();
}

</script>

 



<form:form action="${root }user/join_pro" method="post" modelAttribute="joinUserBean">
   <div class="container" style="margin-top: 100px">
      <div class="row">
         <div class="col-sm-3"></div>
         <div class="col-sm-6">
            <div align="center">
               <h1>JOIN US</h1>
            </div>
            <div class="card-body">
               
                  <!-- 유효성 검사여부 보내기 -->
                  <div class="form-group">
                     <form:label path="id">아이디</form:label>
                     <div class="input-group">
                        <form:input path="id" class="form-control"
                           onkeypress="resetUserIdExist()" />
                        <div class="input-group-append">
                           <button type="button" class="btn btn-primary"
                              onclick="checkUserIdExist()">중복확인</button>
                        </div>
                     </div>
                     <form:errors path="id" style='color:red' />
                  </div>
                  <form:hidden path="userIdExist" />
                  <div class="form-group">
                     <form:label path="name">이름</form:label>
                     <form:input path="name" class="form-control" />
                     <form:errors path="name" style='color:red' />
                  </div>
                  
                  <div class="form-group">
                     <form:label path="birth">생일</form:label>
                     <form:input path="birth" class="form-control" />
                     <form:errors path="birth" style='color:red' />
                  </div>
                  
                  <div class="form-group">
                     <form:label path="pw">비밀번호</form:label>
                     <form:password path="pw" class="form-control" />
                     <form:errors path="pw" style='color:red' />
                  </div>
                  <div class="form-group">
                     <form:label path="pw2">비밀번호 확인</form:label>
                     <form:password path="pw2" class="form-control" />
                     <form:errors path="pw2" style='color:red' />
                  </div>
                  <div class="form-group">
                     <form:label path="phone">핸드폰 번호</form:label>
                     <form:input path="phone" class="form-control" />
                     <form:errors path="phone" style='color:red' />
                  </div>

                  <div class="form-group">
                     <form:label path="email">이메일</form:label>
                     <form:input path="email" class="form-control" />
                     <form:errors path="email" style='color:red' />
                  </div>

                  <div class="form-group">
                     <form:label path="address">주소</form:label>
                     <div class="input-group">
                        <form:input path="address" class="form-control"
                           onclick="openDaumPostcodePopup()" />
                        <form:errors path="address" style='color:red' />
                        <div class="input-group-append"></div>
                     </div>
                  </div>
                  <div class="form-group">
                     <form:label path="detailAddress">상세주소</form:label> 
                     <form:input path="detailAddress" class="form-control" />
                  </div>

                
            

<%-- 
   <div align="center">
      <input type="checkbox" id="modal"> <label for="modal" id="add-info">운전면허 정보입력</label>
      <div>
         <div>
         <h3 align="left">면허정보</h3> <p>
         <p style="text-align:left;">
         <FONT SIZE="2">운전가능여부 확인을 위해 본인의 운전면허증이 필요해요!</FONT>
          
          
      <div style="border:1px dotted; border-radius: 5px; padding: 10px; width:460px; height:75px;">
            <div class="col-12">
               <div class="form-group" align="left">
                  <form:label path="license_type">면허종류</form:label> <br> 
                  <input type="radio" id="first" name="box1" value="first"><label for="first">2종 보통</label>
                  <input type="radio" id="second" name="box1" value="second"> <label for="second">1종 보통</label>
                  <input type="radio" id="third" name="box1" value="third"> <label for="third">1종 대형</label>
               </div>
            </div>
            </div>



      <div style="border: 1px dotted; border-radius: 5px; padding: 10px; width: 460px; height: 100px; margin:10px">
                  <div class="col-12">
                     <div class="form-group" align="left">
                        <form:label path="license_num">면허번호</form:label> 
                        <form:input path="license_num" type="number" class="form-control"  placeholder="" />
                           </div>
                        </div>
                     </div>
                

        <div style="border: 1px dotted; border-radius: 5px; padding: 10px; width: 460px; height: 100px; margin:10px">
                  <div class="col-12">
                     <div class="form-group" align="left">
                        <form:label path="birth">주민등록번호</form:label> 
                        <form:input path="birth" class="form-control"  placeholder="" />
                           </div>
                        </div>
                     </div>



                
            <div>
               <div class="row" id="card_info">
                  <div class="col-6">
                     <div class="form-group" align="left">
                        <form:label path="license_end">갱신 만료일</form:label>
                        <div class="row">
                           <form:input path="license_end" type="date" id="date" class="form-control"
                                placeholder="YYYY-MM-DD" />
                        </div>
                     </div>
                  </div>
                  <div class="col-6">
                     <div class="form-group" align="left">
                        <form:label path="license_start">면허 발급일</form:label> 
                        <form:input path="license_start" type="date" id="date"
                           class="form-control"  placeholder="YYYY-MM-DD"/>
                     </div>
                  </div>
               </div>
               
               <button type="submit" class="btn btn-primary center">등록완료</button>
            </div>
         </div>
         <label for="modal"></label>
   </div>

   <br>
   <br>
      </div> --%>
   
            </div>
         </div>
      </div>
   </div>
      
        
<!--          <div class="custom-control custom-checkbox">
      <input type="checkbox" class="custom-control-input" id="aggrement"  required> 
      <label class="custom-control-label" for="aggrement">개인정보수집 및 이용에 동의합니다.</label>
   </div> -->
     



<br>
<br>
      <div class="mb-4" align="center">
      <div class="col-3">
         <button class="btn btn-primary btn-lg btn-block" type="submit">JOIN IN</button>
      </div>
      
   </div>
   </form:form>

<br>
<br>
<br>
<br>
<br>
<br>
<hr class="mb-4">
<br>
<br>
<br>
<br>

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
   <script src="${root }js/main.js"></script>

 
 
  
</body>
</html>







