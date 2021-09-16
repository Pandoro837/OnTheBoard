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

<title>글읽기</title>
</head>

<body>

	<!-- HEADER -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- // HEADER -->

	<!-- CONTENT -->
	<div id="content" class="container">
		<!-- SUB TITLE -->
		<div class="container sub-container">

			<div class="subtitle">
				<h3>매칭게시판</h3>
				<div class="context">글읽기</div>
			</div>

		</div>
		<!-- // SUB TITLE -->
		<div id="content-title">
			[ 할리갈리 ] 셋이서 하실분 구함
			<br>
			할갈man (29/남)
			<br>
			<div class="clearfix">
				<div class="c-t-float-l">2021. 11. 11. &nbsp; 조회수 999,999</div>
				<div class="c-t-float-r">
					<a href="#">[URL복사]</a>
				</div>
			</div>
		</div>
		<hr>

		<div class="row">
			<div id="game-img-info" class="col-md-3 text-center">
				<img src="${pageContext.request.contextPath}/assets/images/matching/할리갈리.jpg" alt="게임값" width="100%">
				<br><br>
				<a href="#">할리갈리</a>
			</div>
			<div class="col-md-3 border-right">
				<table id=table-game-info>
					<colgroup>
						<col width="60px">
						<col width="200px">
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
						<th>인원<br>(5)
						</th>
						<td>참가자 프로필 리스트<br>(닉네임/나이/성별)<br> (닉네임/나이/성별)<br> (닉네임/나이/성별)<br> (닉네임/나이/성별)<br></td>
					</tr>
				</table>
			</div>

			<div id="content-content" class="col-md-6">내용 출력 입니다.</div>
		</div>
		<div id="read-btn" class="row">
			<!-- <div class="col-md-1"></div> -->
			<div class="col-md-3 text-center">
				<button class="btn-red">참가신청</button>
				<button class="btn-gray">참가취소</button>
			</div>
			<div class="col-md-4 text-right">
				<button class="btn-red">매칭완료</button>
				<button class="btn-blue">예약하기</button>
			</div>
			<div class="col-md-5 text-right">
				<a href="${pageContext.request.contextPath}/matching/list"><button class="btn-gray">목록</button></a> <a href="${pageContext.request.contextPath}/matching/modifyForm"><button class="btn-blue">수정</button></a>
				<button class="btn-gray">삭제</button>
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

		<div id="content-comment-write">
			<div class="content-comment-write-1">
				<strong>할갈man</strong>
			</div>
			<textarea name="comment" id="content-comment-write-text" placeholder="댓글을 남겨주세요."></textarea>
			<div class="content-comment-write-2">
				<span class="cursor-pointer">등록</span>
			</div>
		</div>
	</div>
	<!-- // CONTENT -->

	<!-- FOOTER -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- // FOOTER -->

</body>

</html>