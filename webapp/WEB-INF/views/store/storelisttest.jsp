<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장리스트 테스트 페이지</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap.css">

<!-- KaKaoMap_CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/store/kakaomap/map.css"
	type="text/css"
>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css"
	type="text/css"
>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/store/store_tab_content.css" type="text/css"
>

<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap.js"></script>

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c694e05d69f948b3793c67975a2ef4a5&libraries=services"
></script>

</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

	<!-- 매장 리스트 메인 -->
	<div id="Store_main">
		<!-- SUB TITLE -->
		<div class="container sub-container">
			<div class="subtitle clearfix">
				<div class="context1 font-size-24">매장 정보</div>
				<div class="context2 clearfix">
					<ul>
						<li><a href="#">매장</a></li>
						<li class="last-li"><a href="#">매장 목록</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- // SUB TITLE -->
		<div id="Store_main_content" class="container">

			<!-- 지역, 게임, 키워드 검색 -->
			<c:import url="/WEB-INF/views/store/tab_content.jsp"></c:import>

			<!-- 지도 -->
			<div class="map_wrap">
				<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchStore(); return false;">
								키워드 : <input name="keyword" type="text" value="" id="keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>

		</div>

	</div>

	<!-- FOOTER -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- // FOOTER -->

</body>

<!-- 카카오 지도 키워드 검색 -->
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 12
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	//마커를 표시할 위치와 storeName 객체 배열입니다.
	var i = -1;
	var positions = [];
		
	<c:forEach var="storeList" items="${searchList}">
		
		i += 1;
			
		positions[i] = {storeName : "${storeList.storeName}", latlng :  new kakao.maps.LatLng(${storeList.storeLat},${storeList.storeLng})};
				
	</c:forEach>

	//마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		
	for (var i = 0; i < positions.length; i++) {
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions[i].latlng, // 마커를 표시할 위치
		});
				
		// 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].storeName // 인포윈도우에 표시할 내용
	    });
		
		//마커 mouseover, mouseout 이벤트
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	
	}
	
	//키워드 검색요청 함수
	function searchStore(){
		
		var keyword = document.getElementById('keyword').value;
				
		if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
						
	}
	
</script>

</html>