<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<!-- 메타 태그 -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- css  -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/common.css" rel="stylesheet" type="text/css">

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.12.4.js"></script>

<!-- 타이틀 -->
<title>Insert title here</title>


<style>
div .main-img {
	text-align: center;
}
</style>


</head>
<body>

	<!-- header -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

	<!-- 컨테이너 - 메인 -->
	<div id="main" class="container">


		<div class="main-img">
				
			<br>
		
			<img src="${pageContext.request.contextPath}/assets/images/boardgamemain.png" height="250px">
			
			<br><br>
			
			<h3>사업자 회원으로 변경되었습니다.</h3>
			<a href="${pageContext.request.contextPath}/admin/storeInfo">매장관리 페이지로 가기</a>
			
			<br><br><br><br>
			
		</div>


	</div>

	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

</body>
</html>