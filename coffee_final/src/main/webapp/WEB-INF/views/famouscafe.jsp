<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<%@ include file="/resources/include/header.jsp" %>

<html>
<head>
<title>카페 맛집</title>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
	<link href="resources/js/bootstrap.min.js" />
		
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
	<link href="./resources/css/CoffeeInformation.css?ver=2" rel="stylesheet"
		type="text/css" media="all">
	<script src="./resources/js/jquery-3.2.1.min.js"></script>


	<script><!-- 깃플 -->
		window.GitpleConfig = { appCode: 'p71YO5nI11i0E2xIxRHiKTb0LeXek2' };
		!function(){function e(){function e(){
			var e=t.contentDocument,a=e.createElement("script");a.type="text/javascript",
			a.async=!0,a.src=window[n]&&window[n].url?window[n].url+
				"/inapp-web/gitple-loader.js":"https://app.gitple.io/inapp-web/gitple-loader.js",a.charset="UTF-8",
				e.head&&e.head.appendChild(a)}var t=document.getElementById(a);t||((t=document.createElement("iframe")).
				id=a,t.style.display="none",t.style.width="0",t.style.height="0",t.addEventListener?t.addEventListener("load",e,!1):
				t.attachEvent?t.attachEvent("onload",e):t.onload=e,document.body.appendChild(t))}var t=window,n="GitpleConfig",
				a="gitple-loader-frame";if(!window.Gitple){document;var i=function(){i.ex&&i.ex(arguments)};i.q=[],i.ex=function(e)
				{i.processApi?i.processApi.apply(void 0,e):i.q&&i.q.push(e)},window.Gitple=i,t.attachEvent?t.attachEvent("onload",e):
				t.addEventListener("load",e,!1)}}();
		Gitple('boot');
	</script>	


	<script type="text/javascript">
		$(document).ready(function() {
			$('.selected').mouseenter(function() {
				$(this).css("background", "#dcd881");
			});
			$('.selected').mouseleave(function() {
				$(this).css("background", "#eeecc1");
			});
		});
	</script>

</head>


<body>

	<hr>
	<div  class="container" >
															
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width:100%;height:350px;"></div>
		
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e48f380f055e6491e26e499c918454"></script>		
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new daum.maps.LatLng(37.675796, 127.0552803), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		// (지도를 표시할 div와  지도 옵션으로) 지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption); 		
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.575796, 127.0552803); 
		
		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		function panTo() {

			$(document)
					.ready(
							function() {
								$('body')
										.mousedown(
												function(e) {
													var id = e.target.getAttribute('id');
													if (id == 'coffeegarden') {

														// 이동할 위도 경도 위치를 생성합니다
														var moveLatLon = new daum.maps.LatLng(
																37.6757159,
																127.0573423);

													}
													if (id == 'see_through') {
														// 이동할 위도 경도 위치를 생성합니다
														var moveLatLon = new daum.maps.LatLng(
																37.5359823,
																126.9884486);
													}
													if (id == 'tomorrow_coffee') {
														// 이동할 위도 경도 위치를 생성합니다
														var moveLatLon = new daum.maps.LatLng(
																37.5797916,
																127.0046009);
													}
													if (id == 'hagocoffee') {
														// 이동할 위도 경도 위치를 생성합니다
														var moveLatLon = new daum.maps.LatLng(
																37.4281068,
																127.2608905);
													}
													if (id == 'shellys') {
														// 이동할 위도 경도 위치를 생성합니다
														var moveLatLon = new daum.maps.LatLng(
																37.8402179,
																128.8764943);
													}
													if (id == 'gabaesikwang') {
														// 이동할 위도 경도 위치를 생성합니다
														var moveLatLon = new daum.maps.LatLng(
																36.6219055,
																127.4505841﻿);
													}
													if (id == 'wind_of_hill') {
														// 이동할 위도 경도 위치를 생성합니다
														var moveLatLon = new daum.maps.LatLng(
																34.5950324,
																127.7556281);
													}
													if (id == 'coffeekingkong') {
														// 이동할 위도 경도 위치를 생성합니다
														var moveLatLon = new daum.maps.LatLng(
																35.1625999,
																128.9855216);
													}
													if (id == 'redbrown') {
														// 이동할 위도 경도 위치를 생성합니다
														var moveLatLon = new daum.maps.LatLng(
																33.235694,
																126.3634263);
													}													

													// 지도 중심을 부드럽게 이동시킵니다 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
													map.panTo(moveLatLon);
																	
													var markerPosition2 = moveLatLon;

													// 마커를 생성합니다
													var marker2 = new daum.maps.Marker(
															{
																position : markerPosition2
															});
													// 마커가 지도 위에 표시되도록 설정합니다
													marker2.setMap(map);
												});
												
							});
		}		
		</script>
		
		
		<br> <br>
		<div>
			<div class="localcoffee">
				<!-- <h3>지역별 카페 맛집</h3><br><br> -->
					<a>
						<span onclick="panTo()" id="coffeegarden">
							커피정원 (서울시 노원구 상계동 1116-39)
							- 수락산에 위치한 카페로 야외테라스에 아담한 정원이 예쁘게 꾸며져 있는 카페
						</span>
					</a>
					<img src="resources/images/Coffeegarden.jpg" width="350" height=auto class="cafe">
			</div><br>
					
			<div class="localcoffee">
					<a>
						<span onclick="panTo()" id="see_through">
							씨스루 (서울시 용산구 이태원2동 403-3번지 1층)
							- 독특한 소품과 어둑한 카페조명이 어우러진 전시관 느낌의 카페
						</span>
					</a>
					<img src="resources/images/See-through.jpg" width="350" height=auto class="cafe">
			</div><br>
					
			<div class="localcoffee">
					<a>
						<span onclick="panTo()" id="tomorrow_coffee">
							내일의커피 (서울시 종로구 동숭동 187-7)
							- 마로니에 공원에 위치한 아프리카 난민의 자립을 돕는 사회적 기업 카페
						</span>
					</a>
					<img src="resources/images/Tomorrow_coffee.jpg" class="cafe">
			</div><br>
					
			<div class="localcoffee">
					<a>
						<span onclick="panTo()" id="hagocoffee">
							하고커피 (경기도 광주시 송정동 407-65)
							- 주택가에 위치한 카페로 작은 식물원에 온 듯한 느낌을 주는 카페
						</span>
					</a>
					<img src="resources/images/Hagocoffee.jpg" class="cafe">
			</div><br>
					
			<div class="localcoffee">
					<a>
						<span onclick="panTo()" id="shellys">
							쉘리스(강원도 강릉시 사천면 사천진리 266-31)
							- 바닷가에 위치한 카페로 나무테이블과 엔틱한 조명 등 클래식한 분위기가 느껴지는 카페
						</span>
					</a>
					<img src="resources/images/Shellys.jpg" class="cafe">
			</div><br>
					 
			<div class="localcoffee">
					<a>
						<span onclick="panTo()" id="gabaesikwang">
							가배시광 (충청북도 청주시 서원구 개신동 301번지)
							- 전통미와 현대적 감각의 조화가 어우러져 있어 편안함과 모던함을 느낄 수 있는 카페
						</span>
					</a>
					<img src="resources/images/Gabaesikwang.jpg" class="cafe">
			</div><br>
					
			<div class="localcoffee">
					<a>
						<span onclick="panTo()" id="wind_of_hill">
							언덕에바람 (전라남도 여수시 돌산읍 금성리 855-9)
							- 일출명소 항일암을 볼 수 있는 자연경관의 운치를 느낄 수 있는 카페
						</span>
					</a>
					 <img src="resources/images/Wind_of_hill.jpg" class="cafe">
			</div><br>
					 
			<div class="localcoffee">		
					<a>
						<span onclick="panTo()" id="coffeekingkong">
							커피킹콩 (부산 사상구 괘법동545-18 우주빌딩3층)
							- 입구의 빨간레드카펫과 은은한 조명 등 고급풍을 느낄 수 있는 카페
						</span>
					</a>
					<img src="resources/images/Coffeekingkong.jpg" class="cafe">
			</div><br>
					
			<div class="localcoffee">		
					<a>
						<span onclick="panTo()" id="redbrown">
							레드브라운(제주도 서귀포시 안덕면 대평리 844-19)
							- 대평리 바닷가에 있는 카페로 노을지는 바다풍경의 아름다움을 느낄 수 있는 카페
						</span>
					</a>
					<img src="resources/images/Redbrown.jpg" class="cafe">
			</div><br>
				
			<div class="explanation">
				전국 각지의 유명한 맛집으로 서울 3곳, 부산, 경기도, 강원도, 충청도, 전라도, 제주도에 있다.
			</div>	
					  
		</div>
			
		<br>

		<hr>
		</div>

</body>
</html>
<%@ include file="/resources/include/footer.jsp" %>