<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/bootstrap.css">

<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/matching/matching.css" type="text/css">

<title>MATCHING</title>
</head>

<body>

	<!-- HEADER -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- // HEADER -->

	<!-- CONTENT -->
	<div id="content" class="container">
		<!-- SUB TITLE -->
		<div class="container sub-container">
			<div class="subtitle clearfix">
				<div class="context1 font-size-24">매칭게시판</div>
				<div class="context2 clearfix">
					<ul>
						<li><a href="#">매칭게시판</a></li>
						<li class="last-li"><a href="#">매칭글</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- // SUB TITLE -->
		<div id="content-title">
			[ 할리갈리 ] ${readInfo.matchingVo.matchingTitle}
			<br>
			${readInfo.writerInfo.userNickname} (${readInfo.writerInfo.userAge}
			<c:choose>
				<c:when test="${readInfo.writerInfo.userGender eq 'male'}">/ 남)</c:when>
				<c:otherwise>/ 여)</c:otherwise>
			</c:choose>
			<br>
			<div class="clearfix">
				<div class="c-t-float-l">${readInfo.matchingVo.matchingRegDate}&nbsp;조회수 ${readInfo.matchingVo.matchingHits}</div>
				<div class="c-t-float-r">
					<span>[URL복사]</span>
				</div>
			</div>
		</div>
		<hr>

		<div class="row">
			<div id="game-img-info" class="col-md-3 text-center">
				<img src="${pageContext.request.contextPath}/assets/images/matching/할리갈리.jpg" alt="게임값" width="100%">
				<br>
				<br>
				<a href="#">할리갈리</a>
			</div>
			<div class="col-md-3 border-right">
				<table id=table-game-info>
					<colgroup>
						<col width="100px">
						<col width="230px">
					</colgroup>
					<tr>
						<th>장르</th>
						<td>가족</td>
					</tr>
					<tr>
						<th>날짜</th>
						<td>2021. 11. 11.</td>
					</tr>
					<tr>
						<th>시간</th>
						<td>15:00</td>
					</tr>
					<tr>
						<th>지역</th>
						<td>서울 강남구</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>남</td>
					</tr>
					<tr>
						<th>나이</th>
						<td>20대, 30대</td>
					</tr>
					<tr class="border-none">
						<th>인원<br>(<span id="joinMatchingMember">${readInfo.matchingVo.matchingMember}</span>/${readInfo.matchingVo.matchingPeople})
						</th>
						<td><c:forEach items="${readInfo.matchingMemberInfoList}" var="userVo" varStatus="status">
						${userVo.userNickname} / ${userVo.userAge}<c:choose>
									<c:when test="${userVo.userGender eq 'male'}">/ 남</c:when>
									<c:otherwise>/ 여</c:otherwise>
								</c:choose>
								<c:if test="${readInfo.writerInfo.userNo eq userVo.userNo}">
									<img id="img-crown" src="${pageContext.request.contextPath}/assets/images/matching/read-crown.png">
								</c:if>
								<br>
							</c:forEach><span id="addMatchingMember"></span></td>
					</tr>
				</table>
			</div>

			<div id="content-content" class="col-md-6">${readInfo.matchingVo.matchingContent}</div>
		</div>
		<div id="read-btn" class="row">
			<div class="col-md-3 text-center">
				<c:if test="${readInfo.writerInfo.userNo ne authUser.userNo && not empty authUser}">
					<button id="btn-joinMatching" class="btn-red" data-user_no="${authUser.userNo}" data-matching_no="${readInfo.matchingVo.matchingNo}">참가신청</button>
					<button class="btn-white">참가취소</button>
				</c:if>
			</div>
			<div class="col-md-4 text-right">
				<button class="btn-red">매칭완료</button>
				<a href="${pageContext.request.contextPath}/store/storelist"><button class="btn-blue">예약하기</button></a>
			</div>
			<div class="col-md-5 text-right">
				<a href="${pageContext.request.contextPath}/matching/list"><button class="btn-white">목록</button></a> <a href="${pageContext.request.contextPath}/matching/modifyForm"><button class="btn-blue">수정</button></a>
				<button class="btn-white">삭제</button>
			</div>
		</div>

		<hr>

		<div>댓글</div>
		<br>

		<div id="content-comment" class="row">
			<div class="col-md-1 content-comment-img">
				<img src="${pageContext.request.contextPath}/assets/images/matching/bonobono.png" alt="" width="45%">
			</div>
			<div class="col-md-11 content-comment-1">
				<div class="clearfix">
					<div class="comment">
						<strong>[ 할갈woman ]</strong>
						<br>
						시간조정 가능할까요
					</div>
				</div>
				<div class="comment-button">
					<button class="btn btn-xs">수정</button>
					<button class="btn btn-xs">삭제</button>
				</div>
				<div class="content-comment-2">
					2021. 11. 11. 12:12 &nbsp;&nbsp; <span class="cursor-pointer">답글쓰기</span>
				</div>
			</div>
		</div>

		<div id="content-comment-answer" class="row">
			<div class="col-md-1"></div>
			<div class="col-md-1 content-comment-img">
				<img src="${pageContext.request.contextPath}/assets/images/matching/bonobono.png" alt="" width="45%">
			</div>
			<div class="col-md-10 content-comment-1">
				<div class="clearfix">
					<div class="comment">
						<strong>[ 할갈man <span>작성자</span> ]
						</strong>
						<br>
						<strong>할갈woman</strong> 가능합니다^^
					</div>
				</div>
				<div class="comment-button">
					<button class="btn btn-xs">수정</button>
					<button class="btn btn-xs">삭제</button>
				</div>
				<div class="content-comment-2">
					2021. 11. 11. 12:22 &nbsp;&nbsp; <span class="cursor-pointer">답글쓰기</span>
				</div>
			</div>
		</div>

		<div id="content-comment-answer" class="row">
			<div class="col-md-1"></div>
			<div class="col-md-1 content-comment-img">
				<img src="${pageContext.request.contextPath}/assets/images/matching/bonobono.png" alt="" width="45%">
			</div>
			<div class="col-md-10 content-comment-1">
				<div class="clearfix">
					<div class="comment">
						<strong>[ 할갈woman ]</strong>
						<br>
						<strong>할갈man</strong> 16 ㄱㄱ
					</div>
				</div>
				<div class="comment-button">
					<button class="btn btn-xs">수정</button>
					<button class="btn btn-xs">삭제</button>
				</div>
				<div class="content-comment-2">
					2021. 11. 11. 12:27 &nbsp;&nbsp; <span class="cursor-pointer">답글쓰기</span>
				</div>
			</div>
		</div>

		<br>
		<br>

		<c:if test="${authUser != null}">
			<div id="content-comment-write">
				<div class="content-comment-write-1">
					<strong>${authUser.userNickname}</strong>
				</div>
				<textarea name="comment" id="content-comment-write-text" placeholder="댓글을 남겨주세요."></textarea>
				<div class="content-comment-write-2">
					<span class="cursor-pointer">등록</span>
				</div>
			</div>
		</c:if>
	</div>
	<!-- // CONTENT -->

	<!-- FOOTER -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- // FOOTER -->

</body>

<script>

$('#btn-joinMatching').on('click', function(){
	
	var userNo = $(this).data("user_no");
	var matchingNo = $(this).data("matching_no");
	
	console.log(userNo);
	console.log(matchingNo);
	
	var matchingGroupVo = {
			userNo: userNo,
			matchingNo: matchingNo
	};
	
	console.log(matchingGroupVo);
	
	$.ajax({
		url: '${pageContext.request.contextPath}/matching/joinMatching',
		type: 'post',
		data: matchingGroupVo,
		success: function(joinMatchingInfo){
			console.log(joinMatchingInfo.userInfo);
			render(joinMatchingInfo.userInfo);
			
			console.log(joinMatchingInfo.matchingMember);
			$('#joinMatchingMember').text(joinMatchingInfo.matchingMember);
		},
		error: function(XHR, status, error) {
			console.log(status + ' : ' + error);
		}
		
	});
	
});

function render(userInfo) {
	if (userInfo.userGender === 'male') {
		var userGender = '남';
	} else {
		var userGender = '여';
	}
	var str = userInfo.userNickname + ' / ' + userInfo.userAge + ' / ' + userGender + '<br>';
	
	$('#addMatchingMember').append(str);
}

</script>

</html>