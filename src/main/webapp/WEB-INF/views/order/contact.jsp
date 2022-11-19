<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath}/" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Carbook - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=kmhgl22rj8=/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
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
<link rel="stylesheet" href="${root }css/style.css?after?after">

<!--달력 테스트  -->
<!-- CSS 로드 -->
<link rel="stylesheet" th:href="${root }css/bootstrap.min.css"
	href="${root }css/bootstrap.css" />

<!-- bootsrap DatePicker CSS -->
<link rel="stylesheet" href="${root }css/bootstrap-datepicker3.css"
	href="${root }css/bootstrap-datepicker3.css">
<!-- 스크립트 로드 -->
<script type="text/javascript" src="${root }js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.bundle.min.js"></script>
<!-- bootsrap DatePicker Script -->
<script src="${root }js/bootstrap-datepicker.js"></script>
<script src="${root }js/bootstrap-datepicker.kr.min.js"></script>

<!-- 지도 -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=kmhgl22rj8&submodules=geocoder"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 체크박스 하는 칸 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    
    //검색하고 나서 결과를 보여줄때 검색 조건을 그대로 노출
    //if("${serviceType}" == "sports"){ //serviceType 이 sport 일 경우 셋팅
    if("sports" == "sports"){
    
        //라디오 버튼 값으로 선택
        $('input:radio[name="serviceType"][value="sports"]').prop('checked', true);
        //셀렉트 박스 값으로 선택
        $("select[name='sportsMainCategory']").val("2").attr("selected", "selected");
        //공연/전시 카테고리 hide
        $( "#viewConcertCategory" ).hide();
        //스포츠 카테고리 show
        $( "#viewSportCategory" ).show();
        //스포츠 일때 담당MD 비활성화
        $( "#mdName" ).prop( "disabled", true );
        //담당MD 입력값 초기화;
        $( "#mdName" ).val("");
    }
    
    //라디오 버튼 변경시 이벤트
    $("input[name='serviceType']:radio").change(function () {
            //라디오 버튼 값을 가져온다.
            var serviceType = this.value;
                            
            if(serviceType == "sports"){//스포츠인 경우
                //스포츠 일때 공연/전시 카테고리 hide
                $( "#viewConcertCategory" ).hide();
                //스포츠 일때 스포츠 카테고리 show
                $( "#viewSportCategory" ).show();
                //스포츠 일때 담당MD 비활성화
                $( "#mdName" ).prop( "disabled", true );
                $( "#mdName" ).val("");
            }else if(serviceType == "concert"){//공연/전시인 경우
                //공연/전시 일때 공연/전시 카테고리 show
                $( "#viewConcertCategory" ).show();
                //공연/전시 일때 스포츠 카테고리 show
                $( "#viewSportCategory" ).hide();
                //공연/전시 일때 담당 MD 활성화
                $( "#mdName" ).prop( "disabled", false );
            }
                            
        });
});
</script>
<!-- null값 체크 -->
	<script src="//code.jquery.com/jquery-1.11.2.min.js">
</script>

</head>

<body>

	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${root }images/bg_2.jpg'); "
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="${root }index">초기화면<i
								class="ion-ios-arrow-forward"></i></a></span> <span>결제 페이지 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">예약 페이지</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section contact-section">
		<div class="container">
			<div class="row d-flex mb-5 contact-info">
				<div class="col-md-4">
					<div class="row mb-5">
						<div class="col-md-12">
							<div class="border w-100 p-4 rounded mb-2 d-flex ftco-animate">
								<div class="icon mr-3">
									<span class="icon-map-o"></span>
								</div>
								<p>
									<span>주소:</span> ${UserInfo.address}

								</p>
							</div>
						</div>
						<div class="col-md-12">
							<div class="border w-100 p-4 rounded mb-2 d-flex ftco-animate">
								<div class="icon mr-3">
									<span class="icon-mobile-phone"></span>
								</div>
								<p>
									<span>핸드폰 번호:</span> ${UserInfo.phone}
								</p>
							</div>
						</div>
						<div class="col-md-12">
							<div class="border w-100 p-4 rounded mb-2 d-flex ftco-animate">
								<div class="icon mr-3">
									<span class="icon-envelope-o"></span>
								</div>
								<p>
									<span>이메일:</span> ${UserInfo.email}
								</p>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-8 block-9 mb-md-5">
					<form:form action="${root }order/CarSelect_list"
						modelAttribute="select_RentBean" method="POST"
						class="request-form ftco-animate bg-primary" name="contactForm">
						<h2>예약</h2>
						<div class="form-group">
							<div class="text">
								<input name="address" id="address" type="hidden"> <input
									id="submit" type="button" value="픽업위치 확인 "
									class="btn-secondary ftco-animate layer" onclick="clickme()">
							</div>
							<form:label path="pickup_zone" class="label">픽업 위치</form:label>
							<form:select path="pickup_zone" size="1" class="form-control" onChange="pickupZone(this)" name="pickCategorySD">
								<option disabled selected>지역을 선택해 주세요.! 🍊</option>	
								<form:option value="서울 성동구 왕십리로 225"></form:option>
								<form:option value="서울 성동구 마장로 137"></form:option>
								<form:option value="서울 중구 정동길 5"></form:option>
								<form:option value="서울 중랑구 망우로71길 44"></form:option>
								<form:option value="서울 종로구 대학로10길 15-15"></form:option>
								<form:option value="서울 마포구 양화로3길 15"></form:option>
								<form:option value="서울 마포구 성암로 255"></form:option>
								<form:option value="서울 마포구 포은로6길 25"></form:option>
								<form:option value="서울 강남구 도산대로49길 17"></form:option>
								<form:option value="서울 강남구 선릉로 842"></form:option>
								<form:option value="서울 서초구 서초대로71길 10"></form:option>
							</form:select>
						</div>
						
						<div class="form-group">
							<div class="text">
								<input name="address2" id="address2" type="hidden"> <input
									id="submit2" type="button" value="반납위치 확인 "
									onChange="returnZone(this)"
									class="btn-secondary ftco-animate layer_2" onclick="clickme()">
							</div>
							<form:label path="return_zone" class="label">반납 위치</form:label>
							<form:select path="return_zone" size="1" class="form-control"
								onChange="returnZone(this)">
								<option disabled selected value="3">반납지역을 선택해 주세요.! 🍊</option>
								<form:option value="서울 성동구 왕십리로 225"></form:option>
								<form:option value="서울 성동구 마장로 137"></form:option>
								<form:option value="서울 중구 정동길 5"></form:option>
								<form:option value="서울 중랑구 망우로71길 44"></form:option>
								<form:option value="서울 종로구 대학로10길 15-15"></form:option>
								<form:option value="서울 마포구 양화로3길 15"></form:option>
								<form:option value="서울 마포구 성암로 255"></form:option>
								<form:option value="서울 마포구 포은로6길 25"></form:option>
								<form:option value="서울 강남구 도산대로49길 17"></form:option>
								<form:option value="서울 강남구 선릉로 842"></form:option>
								<form:option value="서울 서초구 서초대로71길 10"></form:option>
							</form:select>
						</div>

						<div class="d-flex">
							<div class="form-group mr-2">
								<form:label path="startDate" class="label" target="visitDate">픽업 날짜</form:label>
								<form:input type="date" class="form-control" path="startDate"
									id="startD" />

							</div>

							<div class="form-group ml-2">
								<form:label path="endDate" class="label">반납 날짜</form:label>
								<form:input type="date" class="form-control" path="endDate"
									id="endD" />
							</div>
						</div>

						<div class="form-group">
							<form:label path="time_pick" class="label">픽업시간</form:label>
							<form:input path="time_pick" class="form-control"
								placeholder="Time" />
						</div>

						<div class="form-group">
							<input type="submit" value="차량선택"
								class="btn btn-secondary py-3 px-4">
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
	<script src="${root }js/naver-map.js"></script>
	<script src="${root }js/main.js"></script>

	<%--달력 --%>
	document.getElementById('startDate').valueAsDate = new Date();

	<script type="text/javascript">
		window.onload = function() {
			today = new Date();
			console.log("today.toISOString() >>>" + today.toISOString());
			today = today.toISOString().slice(0, 10);
			console.log("today >>>> " + today);
			bir = document.getElementById("startD");
			bir.value = today;
		}
	</script>

	<script>
		document.getElementById('startD').min = new Date().toISOString()
				.substring(0, 10);
		document.getElementById('endD').min = new Date().toISOString()
				.substring(0, 10);
	</script>

	<script>
		function clickme() {
			window.scroll({
				top : 1150,
				left : 0,
				behavior : 'smooth'
			});

		}
	</script>

	<script>
		var map = new naver.maps.Map("map", {
			center : new naver.maps.LatLng(37.552758094502494,
					126.98732600494576),
			zoom : 15,
			mapTypeControl : true
		});

		var infoWindow = new naver.maps.InfoWindow({
			anchorSkew : true
		});

		map.setCursor('pointer');

		function searchCoordinateToAddress(latlng) {

			infoWindow.close();

			naver.maps.Service
					.reverseGeocode(
							{
								coords : latlng,
								orders : [ naver.maps.Service.OrderType.ADDR,
										naver.maps.Service.OrderType.ROAD_ADDR ]
										.join(',')
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									return alert('Something Wrong!');
								}

								var items = response.v2.results, address = '', htmlAddresses = [];

								for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
									item = items[i];
									address = makeAddress(item) || '';
									addrType = item.name === 'roadaddr' ? '[도로명 주소]'
											: '[지번 주소]';

									htmlAddresses.push((i + 1) + '. '
											+ addrType + ' ' + address);
								}

								infoWindow
										.setContent([
												'<div style="padding:10px;min-width:200px;line-height:150%;">',
												'<h4 style="margin-top:5px;">검색 좌표</h4><br />',
												htmlAddresses.join('<br />'),
												'</div>' ].join('\n'));

								infoWindow.open(map, latlng);
							});
		}

		function searchAddressToCoordinate(address) {
			naver.maps.Service
					.geocode(
							{
								query : address
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									return alert('Something Wrong!');
								}

								if (response.v2.meta.totalCount === 0) {
									return alert('totalCount'
											+ response.v2.meta.totalCount);
								}

								var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(
										item.x, item.y);

								if (item.roadAddress) {
									htmlAddresses.push('[도로명 주소] '
											+ item.roadAddress);
								}

								if (item.jibunAddress) {
									htmlAddresses.push('[지번 주소] '
											+ item.jibunAddress);
								}

								if (item.englishAddress) {
									htmlAddresses.push('[영문명 주소] '
											+ item.englishAddress);
								}

								infoWindow
										.setContent([
												'<div style="padding:10px;min-width:200px;line-height:150%;">',
												'<h4 style="margin-top:5px;">검색 주소 : '
														+ address
														+ '</h4><br />',
												htmlAddresses.join('<br />'),
												'</div>' ].join('\n'));

								map.setCenter(point);
								infoWindow.open(map, point);
							});
		}
		//추가부분

		//여기까지

		function initGeocoder() {
			map.addListener('click', function(e) {
				searchCoordinateToAddress(e.coord);
			});

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
		}

		function makeAddress(item) {
			if (!item) {
				return;
			}

			var name = item.name, region = item.region, land = item.land, isRoadAddress = name === 'roadaddr';

			var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

			if (hasArea(region.area1)) {
				sido = region.area1.name;
			}

			if (hasArea(region.area2)) {
				sigugun = region.area2.name;
			}

			if (hasArea(region.area3)) {
				dongmyun = region.area3.name;
			}

			if (hasArea(region.area4)) {
				ri = region.area4.name;
			}

			if (land) {
				if (hasData(land.number1)) {
					if (hasData(land.type) && land.type === '2') {
						rest += '산';
					}

					rest += land.number1;

					if (hasData(land.number2)) {
						rest += ('-' + land.number2);
					}
				}

				if (isRoadAddress === true) {
					if (checkLastString(dongmyun, '면')) {
						ri = land.name;
					} else {
						dongmyun = land.name;
						ri = '';
					}

					if (hasAddition(land.addition0)) {
						rest += ' ' + land.addition0.value;
					}
				}
			}

			return [ sido, sigugun, dongmyun, ri, rest ].join(' ');
		}

		function hasArea(area) {
			return !!(area && area.name && area.name !== '');
		}

		function hasData(data) {
			return !!(data && data !== '');
		}

		function checkLastString(word, lastString) {
			return new RegExp(lastString + '$').test(word);
		}

		function hasAddition(addition) {
			return !!(addition && addition.value);
		}

		naver.maps.onJSContentLoaded = initGeocoder;
	</script>
	<!-- 여기까지 달력 -->
	<script type="text/javascript">
		const label = document.querySelector('.label');
		const options = document.querySelectorAll('.optionItem');
		const handleSelect = function(item) {
			label.innerHTML = item.textContent;
			label.parentNode.classList.remove('active');
		}
		options.forEach(function(option) {
			option.addEventListener('click', function() {
				handleSelect(option)
			})
		})

		label.addEventListener('click', function() {
			if (label.parentNode.classList.contains('active')) {
				label.parentNode.classList.remove('active');
			} else {
				label.parentNode.classList.add('active');
			}
		});
	</script>



</body>
</html>