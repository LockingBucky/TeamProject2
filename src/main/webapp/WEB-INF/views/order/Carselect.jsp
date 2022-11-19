<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" href="${root }css/style.css?after">

<!-- 지도 -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=kmhgl22rj8&submodules=geocoder"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- CSS 로드 -->
<link rel="stylesheet" th:href="${root }css/bootstrap.min.css"
	href="${root }css/bootstrap.css" />

<!-- bootsrap DatePicker CSS -->
<link rel="stylesheet" th:href="${root }css/bootstrap-datepicker3.css"
	href="${root }css/bootstrap-datepicker3.css">
<!-- 스크립트 로드 -->
<script type="text/javascript" src="${root }js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.bundle.min.js"></script>
<!-- bootsrap DatePicker Script -->
<script src="${root }js/bootstrap-datepicker.js"></script>
<script src="${root }js/bootstrap-datepicker.kr.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />


	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${root }images/car-8.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home <i
								class="ion-ios-arrow-forward"></i></a></span> <span>Cars <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">Choose Your Car</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section contact-section bg-light">
		<div class="container">

			<div class="row d-flex mb-5 contact-info">
				<div class="col-md-4">
					<div class="row mb-5">
						<div class="col-md-12">
							<div class="border w-100 p-4 rounded mb-2 d-flex">
								<div class="icon mr-3">
									<span class="icon-map-o"></span>
								</div>
								<p>
									<span>주소:</span> ${UserInfo.address}
								</p>
							</div>
						</div>
						<div class="col-md-12">
							<div class="border w-100 p-4 rounded mb-2 d-flex">
								<div class="icon mr-3">
									<span class="icon-mobile-phone"></span>
								</div>
								<p>
									<span>핸드폰 번호:</span> ${UserInfo.phone}
								</p>
							</div>
						</div>

						<div class="col-md-12">
							<div class="border w-100 p-4 rounded mb-2 d-flex">
								<div class="icon mr-3">
									<span class="icon-envelope-o"></span>
								</div>
								<p>
									<span>이메일:</span>${UserInfo.email}
								</p>
							</div>
						</div>

						<%-- <div class="container"> 이거는 이제 다시가기버튼만들려햇는데 좀 애매함.
						<div class="row">
						<div class="col-md-12 ftco-animate">
						<table class="table">				
						<tr class="d-flex">
						<td class="price p-4 rounded d-flex border">
						        	<p class="btn-custom"><a href="#">뒤로가기</a></p>
						        	<div class="price-rate">
							        	<h5>
							        		<span>${carInfo.price}</span>원
							        		<span>/1일 기준</span>
							        	</h5>
							        	<span class="subheading">뒤로가기</span>
						        	</div>
						        </td>
						</tr>
						
							</table>
						</div>
						</div>
						</div>
 --%>


					</div>
				</div>





				<div class="col-md-8 block-9 mb-md-5">
					<form:form
						action="${root }order/payment"
						method="Post" modelAttribute="select_RentBean"
						class="request-form ftco-animate bg-primary">
						<h2>예약 정보</h2>
						<div class="form-group">
							<div class="text">
								<input name="address" id="address" type="hidden"
									value="${select_RentBean.pickup_zone}"> <input
									id="submit" type="button" value="픽업위치 확인 " onclick="clickme()"
									class="btn-secondary ftco-animate">
									
									<input name="address2" id="address2" type="hidden"
									value="${select_RentBean.return_zone}"> <input
									id="submit2" type="button" value="반납위치 확인 " onclick="clickme()"
									class="btn-secondary ftco-animate">
							</div>
							<form:label path="pickup_zone" class="label">픽업 위치 </form:label>
							<form:input path="pickup_zone" class="form-control" id="address"
								readonly="true" />
						</div>

						<div class="form-group">

							<form:label path="return_zone" class="label">반납 위치</form:label>
							<form:input path="return_zone" class="form-control" id="address2"
								readonly="true" />
						</div>

						<div class="d-flex">
							<div class="form-group mr-2">
								<form:label path="startDate" class="label">픽업 날짜</form:label>
								<form:input type="date" class="form-control" path="startDate"
									readonly="true" placeholder="Date" />
							</div>

							<div class="form-group ml-2">
								<form:label path="endDate" class="label">반납 날짜</form:label>
								<form:input type="date" class="form-control" path="endDate"
									readonly="true" placeholder="Date" />

							</div>
						</div>

						<div class="form-group">
							<form:label path="time_pick" class="label">픽업시간</form:label>
							<form:input path="time_pick" class="form-control" readonly="true" />
						</div>


						<div class="form-group">
							<form:label path="car_name" class="label">차량선택</form:label>
							<form:input path="car_name" class="form-control"
								value="${carInfo.car_name }" readonly="true" />
							<form:hidden path="car_seq" />
						</div>

						<div class="form-group">
							<form:label path="price" class="label">차량 1일 기준 비용</form:label>
							<form:input path="price" class="form-control"
								value="${carInfo.price }" readonly="true" />
						</div>

						<div class="form-group">
							<input type="submit" value="결제하기"
								class="btn btn-secondary py-2 ml-1">
						</div>
						<div class="form-group">
							<input type="button" value="뒤로가기" onclick="history.back();"
								class="btn btn-secondary py-2 ml-1" />
						</div>

					</form:form>

				</div>
			</div>
			<div id="map" class="bg_white ftco-animate"></div>
			
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
	<script
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=kmhgl22rj8"></script>
	<script src="${root }js/naver-map.js"></script>
	<script src="${root }js/main.js"></script>

	<script>
		function clickme() {
			window.scroll({
				top : 1300,
				left : 0,
				behavior : 'smooth'
			});

		}
	</script>

	<script>
	selectMapList();

	//검색한 주소의 정보를 insertAddress 함수로 넘겨준다.
	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        query: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	        if (response.v2.meta.totalCount === 0) {
	            return alert('올바른 주소를 입력해주세요.');
	        }
	        var htmlAddresses = [],
	            item = response.v2.addresses[0],
	            point = new naver.maps.Point(item.x, item.y);
	        if (item.roadAddress) {
	            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
	        }
	        if (item.jibunAddress) {
	            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
	        }
	        if (item.englishAddress) {
	            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
	        }

	        insertAddress(item.roadAddress, item.x, item.y);
	        
	    });
	}

	// 주소 검색의 이벤트
	$('#address').on('keydown', function(e) {
	    var keyCode = e.which;
	    if (keyCode === 13) { // Enter Key
	        searchAddressToCoordinate($('#address').val());
	    }
	});
	$('#submit').on('click', function(e) {
	    e.preventDefault();
	    searchAddressToCoordinate($('#address').val());
	});
	
	$('#address2').on('keydown', function(e) {
		var keyCode = e.which;

		if (keyCode === 13) { // Enter Key
			searchAddressToCoordinate($('#address2').val());
		}
	});

	$('#submit2').on('click', function(e) {
		e.preventDefault();

		searchAddressToCoordinate($('#address2').val());
	});
	
	
	naver.maps.Event.once(map, 'init_stylemap', initGeocoder);


	    
	//검색정보를 테이블로 작성해주고, 지도에 마커를 찍어준다.
	function insertAddress(address, latitude, longitude) {
		var mapList = "";
		mapList += "<tr>"
		mapList += "	<td>" + address + "</td>"
		mapList += "	<td>" + latitude + "</td>"
		mapList += "	<td>" + longitude + "</td>"
		mapList += "</tr>"

		$('#mapList').append(mapList);	

	    
	    const locations = [
            { place:address, latitude, longitude },
            { place:address, latitude, longitude },
        ];

        for (var i = 0; i < locations.length; i++) {
                var marker = new naver.maps.Marker({
                    map: map,
                    title: locations[i].place,
                    position: new naver.maps.LatLng(locations[i].lat, locations[i].lng),
                });
            }
        
        var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(longitude, latitude),
		    zoom: 14
		});
	    var marker = new naver.maps.Marker({
	        map: map,
	        position: new naver.maps.LatLng(longitude, latitude),
	    });
	}

	//지도를 그려주는 함수
	function selectMapList() {
		
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(37.3595704, 127.105399),
		    zoom: 10
		});
	}


	// 지도를 이동하게 해주는 함수
	function moveMap(len, lat) {
		var mapOptions = {
			    center: new naver.maps.LatLng(len, lat),
			    zoom: 15,
			    mapTypeControl: true
			};
	    var map = new naver.maps.Map('map', mapOptions);
	    var marker = new naver.maps.Marker({
	        position: new naver.maps.LatLng(len, lat),
	        map: map
	    });
	}
	</script>


</body>
</html>