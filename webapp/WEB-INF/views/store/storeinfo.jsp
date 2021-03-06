<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 상세정보 페이지</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- CSS -->
<link href="${pageContext.request.contextPath}/assets/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/store/storeinfo.css" rel="stylesheet" type="text/css">

<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 이미지 슬라이드 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- fontawesome cdn -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

<!-- SEWWT ALERT -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

	<!-- 메인 컨텐츠 구역 -->

	<div id="store-main-content" class="container">
		<!-- SUB TITLE -->
		<div class="container sub-container">
			<div class="subtitle clearfix">
				<div class="context1 font-size-24">매장 정보</div>
				<div class="context2 clearfix">
					<ul>
						<li><a href="#">매장</a></li>
						<li class="last-li"><a href="#">매장 상세정보</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- // SUB TITLE -->
		<!-- 매장 정보 상단 이미지슬라이드, 매장 상세정보 -->
		<div id="store-info-top-content">
			<!-- 이미지 슬라이드 -->

			<!-- carousel를 구성할 영역 설정 -->
			<div id="img_slide" class="store-main-sub-content">
				<!-- carousel를 사용하기 위해서는 class에 carousel와 slide 설정한다. -->
				<!-- carousel는 특이하게 id를 설정해야 한다.-->
				<div id="carousel-store-img-generic" class="carousel slide">
					<!-- carousel의 지시자 -->
					<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
					<ol class="carousel-indicators">
						<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
						<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
						<!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
						<!-- <li data-target="#carousel-store-img-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-store-img-generic" data-slide-to="1"></li> -->
					</ol>
					<!-- 실제 이미지 아이템 -->
					<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
					<div id="img-slide-list" class="carousel-inner" role="listbox">
						<!-- 이미지의 개수만큼 item을 만든다. 중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
						<c:forEach items="${storeInfo.storeimgList}" var="imgVo" varStatus="status">
						   <div class="item">
						      <img src="${pageContext.request.contextPath}/upload/store/${imgVo.storePathImage}" class="store_img">
						   </div>
						</c:forEach>
					</div>
					<!-- 왼쪽 화살표 버튼 -->
					<!-- href는 carousel의 id를 가르킨다. -->
					<a class="left carousel-control" href="#carousel-store-img-generic" role="button" data-slide="prev"> <!-- 왼쪽 화살표 --> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					</a>
					<!-- 오른쪽 화살표 버튼 -->
					<!-- href는 carousel의 id를 가르킨다. -->
					<a class="right carousel-control" href="#carousel-store-img-generic" role="button" data-slide="next"> <!-- 오른쪽 화살표 --> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					</a>
				</div>
			</div>

			<div id="store-details" class="store-main-sub-content">

				<table class="store-details-info">

					<colgroup>
						<col width="12%">
						<col width="88%">
					</colgroup>
					<tr>
						<td class="top-td" colspan="2">${storeInfo.storeInfo.storeName}</td>
					</tr>
					<tr class="icons-row">
						<td class="icons-span"><i class="fas fa-info-circle"></i></td>
						<c:if test="${storeInfo.storeInfo.storeDesc != null}">
							<td>${storeInfo.storeInfo.storeDesc}</td>
						</c:if>
						<c:if test="${storeInfo.storeInfo.storeDesc == null }">
							<td>매장 소개글 입력란 입니다.</td>
						</c:if>
					</tr>

					<tr class="icons-row">
						<td class="icons-span"><i class="fas fa-phone-square"></i></td>
						<c:if test="${storeInfo.storeInfo.storePhoneNo != null}">
							<td>매장 전화번호 : ${storeInfo.storeInfo.storePhoneNo}</td>
						</c:if>
						<c:if test="${storeInfo.storeInfo.storePhoneNo == null}">
							<td>매장 전화번호 입력란 입니다.</td>
						</c:if>
					</tr>

					<tr class="icons-row">
						<td rowspan="2" class="icons-span"><i class="fas fa-compass"></i></td>
						<c:if test="${storeInfo.storeInfo.storeAddressRoad != null}">
							<td>매장 주소 : ${storeInfo.storeInfo.storeAddressRoad}</td>
						</c:if>
						<c:if test="${storeInfo.storeInfo.storeAddressRoad == null}">
							<td>매장 주소 입력란 입니다.</td>
						</c:if>
					</tr>
					<tr>
						<c:if test="${storeInfo.storeInfo.storeAddressDetail != null}">
							<td>상세 주소 : ${storeInfo.storeInfo.storeAddressDetail}</td>
						</c:if>
						<c:if test="${storeInfo.storeInfo.storeAddressDetail == null}">
							<td>매장 상세주소 입력란 입니다.</td>
						</c:if>
					</tr>

					<tr class="icons-row">
						<td rowspan="2" class="icons-span"><i class="fas fa-wallet"></i></td>
						<c:if test="${storeInfo.storeInfo.storeChargeWeek != null}">
							<td>주중 요금 : ${storeInfo.storeInfo.storeChargeWeek}</td>
						</c:if>
						<c:if test="${storeInfo.storeInfo.storeChargeWeek == null}">
							<td>주중 매장 이용요금 입력란 입니다.</td>
						</c:if>
					</tr>
					<tr>
						<c:if test="${storeInfo.storeInfo.storeChargeWeekend != null}">
							<td>주말 요금 : ${storeInfo.storeInfo.storeChargeWeekend}</td>
						</c:if>
						<c:if test="${storeInfo.storeInfo.storeChargeWeekend == null}">
							<td>주말 매장 이용요금 입력란 입니다.</td>
						</c:if>
					</tr>
					<tr class="icons-row">
						<td class="icons-span"><i class="far fa-star"></i></td>
						<td>4.66/5</td>
					</tr>

				</table>

			</div>
			<!-- 매장 이름, 평점 -->
			
		</div>

		<!-- 리뷰 게시구역 -->
		
		<!-- 예약 사전설정 구역(날짜,시간) -->
		<div id="on-the-board-include">

			<div id="store-reservation-set-section">
				<div class="wrap">
					<button type="button" title="이전 날짜 보기" class="btn-pre">
						<i class="fas fa-chevron-left"></i>
					</button>
					<div class="date-list">
						<!-- 년도, 월 표시 -->
						<div class="year-area">
							<div class="year" style="left: 30px; opacity: 1; z-index: 1;">2021.10</div>
						</div>
						<div class="date-area" id="formDeList">

							<button class="datebar_btn" type="button" data-date="2021/10/20">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">20<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">수</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/21">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">21<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">목</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/22">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">22<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">금</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/23">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">23<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">토</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/24">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">24<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">일</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/25">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">25<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">월</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/26">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">26<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">화</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/27">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">27<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">수</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/28">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">28<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">목</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/29">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">29<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">금</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/30">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">30<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">토</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/10/31">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">31<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">일</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/11/01">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">1<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">월</span>

							</button>

							<button class="datebar_btn" type="button" data-date="2021/11/02">
								<!-- month="" -->

								<span class="ir">2021년 10월</span> <em style="pointer-events: none;">2<span style="pointer-events: none;" class="ir">일</span>
								</em> <span class="day-kr" style="pointer-events: none; display: inline-block">화</span>

							</button>

						</div>
					</div>

					<button type="button" title="다음 날짜 보기" class="btn-next">
						<i class="fas fa-chevron-right"></i>
					</button>

					<!-- 달력 보기 -->
					<div class="bg-line">
						<input type="hidden" id="datepicker" value=""> <input type="hidden" id="date_selected">
						<button type="button" id="calendar" onclick="$('#datepicker').datepicker('show')" class="btn-calendar-large" title="달력보기">달력보기</button>
					</div>
				</div>
			</div>

			<div class="quick-reserve-area">

				<!-- 예약 인원 선택 -->
				<div class="select_rev_info_area">
					<ul class="nav nav-tabs nav-justified" role="tablist" id="how_to_choice_people">
						<!-- <li role="presentation"><a href="#choice_by_count" aria-controls="choice_by_count" role="tab" data-toggle="tab">직접 입력</a></li> -->
						<li role="presentation" class="active"><a href="#choice_by_grouplist" aria-controls="choice_by_grouplist" role="tab" data-toggle="tab">인원 선택</a></li>
					</ul>

					<div class="tab-content">
						<label>그룹 선택</label>
						
						<div role="tabpanel" class="tab-pane active" id="choice_by_grouplist">
							<div>
								<!-- 그룹 리스트 나열해 주기-->
								<ul id="grouplist">
									<!-- 매칭이 완료된 그룹 리스트 -->
									<!-- 내역이 없을 시 리스트 존재x 텍스트 띄워주기 -->
									<c:forEach items="${userDataInfoMap.userHostMatchingList}" var="matchingVo" varStatus="status">
										<li role="presentation" class="selgroup" data-no="${matchingVo.matchingNo}"><a href="#chosen_group" aria-controls="chosen_group"
											role="tab" data-toggle="tab"> <span class="groupUser">그룹${status.index + 1} : ${matchingVo.matchingTitle}</span>
										</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane" id="chosen_group">

							<!-- 그룹리스트중 하나 선택 시 그룹원들의 리스트가 matching_group_info에 나열 -->
							<ul id="matching_group_info"></ul>
							
						</div>
					</div>

					<!-- 예약 가능 시간대 표기 and 선택 -->
					<div id="time_table_wrap">
						<label>시간 선택</label>
						<ul id="time_table" data-date=""></ul>
					</div>

				</div>

			</div>

			<div class="reservation">
				<button id="rev_btn" class="reservation_btn btn-red">예약하기</button>
			</div>

		</div>


		<!-- 매장 내 보유게임 리스트, 검색 구역 -->
		<!-- 매장 내 보유게임 리스트, 검색 구역 -->
		<hr>
		<div id="main" class="gameList">
			<h3>매장 보유 게임목록</h3>
			<ul class="bbsList04" id="gameList">
				<c:forEach items="${storeInfo.ownedGameList}" var="gameVo" varStatus="status">
					<li>
						<div class="thum">
							<a href="${pageContext.request.contextPath}/game/gameDetails?no=${gameVo.gameNo}"><img
								src="${pageContext.request.contextPath}/assets/upload/${gameVo.gameThumbImg }" alt="${gameVo.gameNameKo}"></a>
						</div>
						<div class="desc">
							<p class="title">
								<a href="${pageContext.request.contextPath}/game/gameDetails?no=${gameVo.gameNo}">${gameVo.gameNameKo}</a>
							</p>
							<table>
								<tbody>
									<tr>
										<th>게임인원</th>
										<td>${gameVo.gamePeople}</td>
									</tr>
									<tr>
										<th>게임연령</th>
										<td>${gameVo.gameAge}</td>
									</tr>
									<tr>
										<th>게임시간</th>
										<td>${gameVo.gameTime}</td>
									</tr>
									<tr>
										<th>게임난이도</th>
										<td>${gameVo.gameDifficulty}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>

	</div>

	<!-- FOOTER -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- // FOOTER -->

	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">예약 입력정보</h4>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td colspan="2" class="modal_storeName"></td>
						</tr>
						<tr>
							<td class="modal_revDate"></td>
							<td class="modal_chargeTotal"></td>
						</tr>
						<tr>
							<td class="modal_revTime"></td>
							<td class="modal_chargePeople"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" id="btn-last-rev" class="btn btn-primary">예약하기</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- Datepicker -->
	<script type="text/javascript">
		
		$(window).on('load', function() {
	      var active = $('#img-slide-list').children().first();
	        active.addClass('active');
	   });
	
		$.datepicker.setDefaults({ 
	        dateFormat: 'yy/mm/dd',
	        prevText: '이전 달',
	        nextText: '다음 달',
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	        showMonthAfterYear: true,
	        yearSuffix: '년'
	    });
		var revtimeArray = ["09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"];
        $(function () {
            
        	var selectedDate;
        	
        	$("#datepicker").datepicker({
            	onSelect:function(date){
            		
            		var storeNo = ${storeNo};
            		console.log(storeNo);
            		
            		var timetable = document.querySelector("#time_table");
            		
            		storeReservationDate = date;
            		console.log(storeReservationDate);
            		var storeRevTimeVo = {storeReservationDate : storeReservationDate, storeNo : storeNo};
					
            		console.log(revtimeArray);
            		
            		timetable.setAttribute("data-date", storeReservationDate);
					
            		$.ajax({
        		        cache : false,
        		        url : "${pageContext.request.contextPath}/store/getStoreRevTime",
        		        type : 'POST',
        		        data : storeRevTimeVo,
        		        
        		        success : function(reservationableTimeList) {
        		        	
        		        	for(var i = 0; i < reservationableTimeList.length; i++){
        		        		console.log(reservationableTimeList[i]);
        		        	};
        		        	
        		        	checkTimetable(reservationableTimeList, revtimeArray);
        		        	
        		        }, // success
        				
        		        error : function(XHR, status, error) {
        					
        		        	console.error(status + " : " + error);
							
        		        	}
        		    }); // $.ajax */
            		
            	}
        	
            });
        	
        });
        
        //예약 타임테이블 버튼을 활성화 하는 함수
        function checkTimetable (reservationableTimeList, revtimeArray){
			        	
        	 var listEl = document.getElementById('time_table'),
        		 fragment = document.createDocumentFragment(),
        		 listStr = '';
        	
        	removeAllChildNods(listEl);
        	
        	for(var i=0; i < revtimeArray.length; i++){
        		
				var itemEl = compareDate(reservationableTimeList[i], revtimeArray[i]);
        		
        		fragment.appendChild(itemEl);
				
        	}
        	
        	listEl.appendChild(fragment);
        	
        }
       
        //예약시간 데이터 비교 후 선택 버튼 생성
       	function compareDate (reservationableTime, revtimeArray){
			
        	console.log('compareDate : ' + reservationableTime);
        	console.log('compareDate : ' + revtimeArray);
        	
        	var el = document.createElement('li');
        	
        	if(revtimeArray === reservationableTime){
        		var itemStr = '<input type="checkbox" id="chb_'+revtimeArray+'" class="btn_active" name="btn_active" value="'+ revtimeArray +'"><label for="chb_'+revtimeArray+'">'+ revtimeArray + ":00" +'</label>';
        	}else{
        		var itemStr = '<label class="">'+ revtimeArray +":00"+'</label>';
        	}
			
    	    el.innerHTML = itemStr;
    	    //el.className = 'time_btn';
    	    return el;
        	
        }
        
		
		
        //예약파트
        $(function(){
        	
			//시간 클릭 시 class값 변경
        	$('#time_table').on('click','input[type="checkbox"]', function(){
        		
          		
          		console.log("클릭");
          		
          		if($(this).is(':checked')){
          			$(this).attr('class', 'btn_active_click');
          			console.log("체크");
          		}else{
          			$(this).attr('class', 'btn_active');
          			console.log("체크해제");
          			$(this).removeAttr('checked');
          		}
          		
          	});
        	
        	//예약버튼 클릭 시 예약에 필요한 데이터 컨트롤러로 넘기기
        	$('#rev_btn').on('click',function(){
				
				var chdval = new Array();
				var groupNo;
				var seldate;
				var storeName = '${storeInfo.storeInfo.storeName}';
				var revType;
				
				$('input').each(function(){
					
          			if($(this).is(':checked')){
          				var checked = ($(this).val());
          				chdval.push(checked);
          				
          			}
					
          		});
				
				groupNo = $('li[class="selgroup active"]').data("no");
				
				if(groupNo != null){
					revType="group"
				}else{
					revType="choice"
				}
				
				seldate = $('#time_table').data("date");
				
				console.log(chdval);
				console.log("selected_groupNo : " + groupNo);
				
				var revinfo = {
						checkedTime : chdval,
						matchingNo : groupNo,
						selectedDate : seldate,
						storeName : storeName,
						revType : revType
				};
				
				console.log(revinfo);
				
				$.ajax({
    		        cache : false,
    		        url : "${pageContext.request.contextPath}/reservation/reservationinfo/"+${storeNo},
    		        type : 'POST',
    		        data : revinfo,
    		        
    		        success : function(reservationInfo) {
    		            // ajax 랜더링 for문
    		            console.log("예약정보_도착");
						console.log(reservationInfo);
						
						
						if(reservationInfo.reservationType == "group"){
							
							console.log("그룹예약");
							$('.modal_storeName').text("매장 이름 : " + storeName);
							$('.modal_chargeTotal').text("총 금액 : " + reservationInfo.reservationChargeTotal);
							$('.modal_chargePeople').text("예약 인원 : " + reservationInfo.reservationChargePeople + "명");
							$('.modal_revDate').text("예약일 : " + seldate);
							$('.modal_revTime').text("예약 시간 : " + chdval[0] + ":00 / " + chdval[chdval.length-1] + ":00");
							
							
						}else if(reservationInfo.reservationType == "personal"){
							console.log("개인예약");
							
							
						}
						
						$('#myModal').modal('show');
						
				
						
    		        }, // success
    				
    		        error : function(XHR, status, error) {
    					
    		        	console.error(status + " : " + error);
    		        	
    		        	}
    		        
    		    }); // $.ajax */
				
        	})
        	
        })
		 	
    
        
        
        
		//예약하기 버튼 클릭
		$('#btn-last-rev').on('click',function(){
			console.log("클릭");
			
			var revInfoVo = {};
			
			//스토어번호
			revInfoVo.storeNo = ${storeNo}
			
			//날짜
		    var seldate = $('#time_table').data("date");
		    revInfoVo.seldate = seldate;
			
			//시간들
			var chdTimeArray = new Array();
			$('input').each(function(){
          			if($(this).is(':checked')){
          				var checked = ($(this).val());
          				chdTimeArray.push(checked);
          			}
          	});
			
			revInfoVo.chdTimeArray = chdTimeArray;
			
			
			//매칭번호
			var groupNo = $('li[class="selgroup active"]').data("no");
			revInfoVo.groupNo = groupNo;
			
			//타입 "group"
			var revType = "group";
			revInfoVo.revType = revType;
			
			
			console.log(revInfoVo);
			
			$.ajax({
		        url : "${pageContext.request.contextPath}/reservation/reservationinsert",
		        type : 'POST',
		        data : revInfoVo,
		        
		        success : function(count) {
		        	
		        	 if(count == 1){
 		            	swal({
 		            		title: '예약 성공',
 		            		icon: 'success',
 		            		closeOnClickOutside: false,
 		            		
 		            		buttons: {
 		            			cancle: {
 		            				text: '메인으로',
 		            				value: false,
 		            				className: 'btn btn-primary'
 		            			},
 		            			confirm: {
 		            				text: '예약내역',
 		            				value: true,
 		            				className: 'btn btn-info'
 		            			}
 		            		}
 		            	}).then((result) => {
 		            		if(result === true) {
 		            			location.href='${pageContext.request.contextPath}/mypage/history';
 		            		} else {
 		            			location.href='${pageContext.request.contextPath}/main';
 		            		}
 		            	});
 		            } else{
 		            	window.alert("실패");
 		            }
		        	
		        }, // success
		        error : function(XHR, status, error) {
		        	console.error(status + " : " + error);
		        }
		    }); // $.ajax */
			
		})    
    </script>

	<!-- 이미지 출력 -->
	<script>
        $(function () {
            // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
            $('#carousel-example-generic').carousel({
                // 슬리아딩 자동 순환 지연 시간
                // false면 자동 순환하지 않는다.
                interval: 5000,
                // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
                pause: "hover",
                // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
                wrap: true,
                // 키보드 이벤트 설정 여부(?)
                keyboard: true
            })
        })
    </script>
	<!-- /이미지 출력 -->

	<!-- 페이징 -->
	<script type="text/javascript">
        var totalData = 1000;    // 총 데이터 수 --> 실제로는 DB에서 가져온다.
        var dataPerPage = 4;    // 한 페이지에 나타낼 데이터 수
        var pageCount = 5;        // 한 화면에 나타낼 페이지 수
        function paging(totalData, dataPerPage, pageCount, currentPage) {
            // console.log("currentPage : " + currentPage);
            var totalPage = Math.ceil(totalData / dataPerPage);    // 총 페이지 수
            var pageGroup = Math.ceil(currentPage / pageCount);    // 페이지 그룹
            // console.log("pageGroup : " + pageGroup);
            var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
            if (last > totalPage)
                last = totalPage;
            var first = last - (pageCount - 1);    // 화면에 보여질 첫번째 페이지 번호
            var next = last + 1;
            var prev = first - 1;
            // console.log("last : " + last);
            // console.log("first : " + first);
            // console.log("next : " + next);
            // console.log("prev : " + prev);
            var $pingingView = $("#pages");
            var html = "";
            if (prev > 0)
                html += "<a href=# id='prev'><i class='fas fa-angle-left'></i></a> ";
            for (var i = first; i <= last; i++) {
                html += "<a href='#' id=" + i + ">" + i + "</a> ";
            }
            if (last < totalPage)
                html += "<a href=# id='next'><i class='fas fa-angle-right'></i></a>";
            $("#pages").html(html);    // 페이지 목록 생성
            $("#pages a").css("color", "#ff1f67");
            $("#pages a#" + currentPage).css({
                "background-color": "#ff1f67",
                "text-decoration": "none",
                "color": "white",
                "font-weight": "bold"
            });    // 현재 페이지 표시
            $("#pages a").click(function () {
                var $item = $(this);
                var $id = $item.attr("id");
                var selectedPage = $item.text();
                if ($id == "next") selectedPage = next;
                if ($id == "prev") selectedPage = prev;
                paging(totalData, dataPerPage, pageCount, selectedPage);
            });
        }
        $("document").ready(function () {
            paging(totalData, dataPerPage, pageCount, 1);
        });
        
        
        <!-- 그룹목록 클릭 시 그룹원정보 리스트로 나열하기 -->
        $('#grouplist').on('click', '.selgroup', function(){
    		// event.preventDefault(); --> form일때만 사용 가능
    		
    		// hidden no값 입력하기 == html 태그에 데이터 숨기기(click에 해당하는 태그)
    		// data 값 설정 소문자로, guestNo == 오류
    		var no = $(this).data("no");
    		console.log(no);
    		
    		 $.ajax({
    		        cache : false,
    		        url : "${pageContext.request.contextPath}/store/grouplist",
    		        type : 'POST',
    		        data : {matchingno : no},
    		        
    		        success : function(grouplistinfo) {
    		            // ajax 랜더링 for문
    		        	//#matching_group_info 뒤에 그룹원 정보 리스트 출력하는 함수
    		        	displaygrouplist(grouplistinfo);
    		        	console.log(grouplistinfo);
    		        	
    		        }, // success 
    				
    		        error : function(XHR, status, error) {
    					
    		        	console.error(status + " : " + error);
    		        	}
    		    }); // $.ajax */
    		    
    		
    		
        });
        
        function displaygrouplist(grouplistinfo){
        	
        	var listEl = document.getElementById('matching_group_info'),
        	fragment = document.createDocumentFragment(),
        	listStr = '';
        	
        	// 검색 결과 목록에 추가된 항목들을 제거합니다
    	    removeAllChildNods(listEl);
        	
        	for(var i =0; i<grouplistinfo.length; i++){
        		
        		var itemEl = getListItem(i,grouplistinfo[i]);
        		
        		fragment.appendChild(itemEl);
        		
        	};
        	
        	//그룹원 항목을 Element에 추가
        	listEl.appendChild(fragment);
        	
        };
        
    	// 그룹원 항목을 Element로 반환하는 함수
    	function getListItem(index, grouplistinfo) {
    		var gender;
    		
    		if(grouplistinfo.userGender == "male"){
    			gender = "남";
    		}else{
    			gender = "여";
    		}
    		
    	    var el = document.createElement('li'),
    	    itemStr = '<label class="groupwon">'+ "그룹원: " + grouplistinfo.userNickname + " " + gender + " " + grouplistinfo.userAge + '</label>';
    	    el.innerHTML = itemStr;
    	    el.className = 'item';
    	    return el;
    	};
        
    	// 그룹원 목록의 자식 Element를 제거하는 함수
    	function removeAllChildNods(el) {
    	    while (el.hasChildNodes()) {
    	        el.removeChild (el.lastChild);
    	    };
    	};
			
     	function clicktimetable(value){
    		
    		console.log(value);
    		
    	}
     	
     	$('.datebar_btn').on('click', function(){

    			var storeReservationDate = $(this).data("date");
    			console.log(storeReservationDate);

	       		var storeNo = ${storeNo};
	       		console.log(storeNo);
	       		
	       		var timetable = document.querySelector("#time_table");
	       		
	       		var storeRevTimeVo = {storeReservationDate : storeReservationDate, storeNo : storeNo};
				
	       		console.log(revtimeArray);
	       		
	       		timetable.setAttribute("data-date", storeReservationDate);
				
	       		$.ajax({
	   		        cache : false,
	   		        url : "${pageContext.request.contextPath}/store/getStoreRevTime",
	   		        type : 'POST',
	   		        data : storeRevTimeVo,
	   		        
	   		        success : function(reservationableTimeList) {
	   		        	
	   		        	for(var i = 0; i < reservationableTimeList.length; i++){
	   		        		console.log(reservationableTimeList[i]);
	   		        	};
	   		        	
	   		        	checkTimetable(reservationableTimeList, revtimeArray);
	   		        	
	   		        }, // success
	   				
	   		        error : function(XHR, status, error) {
	   					
	   		        	console.error(status + " : " + error);
						
	   		        	}
	   		    }); // $.ajax */
	       		
     		});
    	
    </script>

</body>
</html>