<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>온 더 보드: 회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/user/signup_form.css">

</head>
<body>
	<!-- header -->
	<div id="header">
		<a href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/assets/images/logo.png" id="logo"></a>
	</div>


	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">

			<form id="signupForm" method="post" action="${pageContext.request.contextPath}/user/signup">

				<!-- ID -->
				<div>
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id"> <input type="text" name="userId" id="id" class="int" maxlength="20">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- PW1 -->
				<div>
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input type="password" name="userPassword" id="pswd1" class="int" maxlength="20">
					<span id="alertTxt">사용불가</span>
					<img src="${pageContext.request.contextPath}/assets/images/icons/m_icon_pass.png" id="pswd1_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- PW2 -->
				<div>
					<h3 class="join_title">
						<label for="pswd2">비밀번호 재확인</label>
					</h3>
					<span class="box int_pass_check"> <input type="password" id="pswd2" class="int" maxlength="20">
					<img src="${pageContext.request.contextPath}/assets/images/icons/m_icon_check_disable.png" id="pswd2_img1" class="pswdImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- NAME -->
				<div>
					<h3 class="join_title">
						<label for="name">이름</label>
					</h3>
					<span class="box int_name"> <input type="text" name="userName" id="name" class="int" maxlength="20">
					</span> <span class="error_next_box"></span>
				</div>

				<!--NICKNAME-->

				<div>
					<h3 class="join_title">
						<label for="name">닉네임</label>
					</h3>
					<span class="box int_nickname"> <input type="text" name="userNickname" id="nickname" class="int" maxlength="20">
					</span> <span class="error_next_box"></span>
				</div>


				<!-- BIRTH -->
				<div>
					<h3 class="join_title">
						<label for="yy">생년월일</label>
					</h3>

					<div id="bir_wrap">
						<!-- BIRTH_YY -->
						<div id="bir_yy">
							<span class="box"> <input type="text" name="userBirthDate" id="yy" class="int" maxlength="8" placeholder="생년월일( 8자리'yyyymmdd' )">
							</span>
						</div>

					</div>
					<span class="error_next_box"></span>
				</div>

				<!-- GENDER -->
				<div>
					<h3 class="join_title">
						<label for="gender">성별</label>
					</h3>
					<span class="box gender_code"> <select id="gender" name="userGender" class="sel">
							<option>성별</option>
							<option value="male">남자</option>
							<option value="female">여자</option>
					</select>
					</span> <span class="error_next_box">필수 정보입니다.</span>
				</div>

				<!-- EMAIL -->
				<div>
					<h3 class="join_title">
						<label for="email">이메일</label>
					</h3>
					<span class="box int_email"> <input type="text" name="userEmail" id="email" class="int" maxlength="100">
					</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
				</div>

				<!-- MOBILE -->
				<div>
					<h3 class="join_title">
						<label for="phoneNo">휴대전화</label>
					</h3>
					<span class="box int_mobile"> <input type="tel" id="mobile" name="userPhoneNo" class="int" maxlength="16" placeholder="전화번호 입력">
					</span> <span class="error_next_box"></span>
				</div>

				<!--ADDRESS-->
				<div>
					<h3 class="join_title">
						<label for="address">주소<span class="optional">(선택)</span></label>
					</h3>
					<span class="box int_address"> <input type="text" id="address" class="int" placeholder="주소 입력">
					</span>
				</div>

				<!-- GRADE -->

				<div>
					<input type="hidden" id="grade" name="userGrade" value="1">
				</div>

				<!-- JOIN BTN-->
				<div class="btn_area">
					<button type="submit" id="btnJoin">
						<span>회원가입</span>
					</button>
				</div>

			</form>

		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->

</body>

<script src="${pageContext.request.contextPath}/assets/js/signUp.js">

</script>



</html>