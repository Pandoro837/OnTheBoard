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
<link href="${pageContext.request.contextPath }/assets/css/main/custom.css" rel="stylesheet" type="text/css">

<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/assets/bootstrap/bootstrap.js"></script>
<!-- 타이틀 -->
<title>On The Board: Main</title>

</head>
<body>

	<!-- header -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>

	<!-- 컨테이너 - 메인 -->

	<div class="container">
		<div class="jumbotron" id="slogan">
			<div class="container"></div>
		</div>
	</div>

	<div class="container">
		<div class="jumbotron" id="jumbotron1">
			<div class="container">
				<h1>On The Board</h1>
				<p>온 더 보드는 보드판 위에선 모두가 평등하다는 뜻으로, 이용자 누구나 쉽고 빠르게 보드겜을 즐길 수 있게 이어주는 멀티 플랫폼입니다.</p>

				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" href="#collapse1"><h3>WHY BOARDGAME?</h3></a>
							</h4>
						</div>
						<div id="collapse1" class="panel-collapse collapse">
							<div class="panel-body">영국의 마켓 리서치 전문업체 360 Research Report에 등재된 보고서에 따르면 코로나19의 장기화로 글로벌 보드게임시장의 수요 증대와 시장 성장이 관측되고 있습니다. (출처:
								“2020-2025 Global Card and Board Games Market Report – Production and Consumption Professional Analysis (Impact of COVID-19)”, 360 Research
								Report) 독일에서만 평균 연간 성장률 10%였던 산업 매출이 21%로 크게 증가하였으며 (출처: “https://www.abckr.net/news/articleView.html?idxno=47529”, 뉴스엔뷰) 유럽 전역에 가파른 성장세가 나타나고
								있습니다. TRPG, TCG와 같은 마이너 장르를 주류로 형성되었던 국내 보드게임시장 또한 점점 영역을 넓혀, 비게이머들을 대상으로 한 일반 여가문화로 자리잡고 있습니다. 도심지에서는 카페 형식의 보드게임카페를 쉽게 접할 수 있으며 수도권에만 20여개가
								넘는 대형 프렌차이즈 업체들이 자리잡고 있습니다. 보드게임 하나 당 평균 2만원대의 저렴한 구매 비용과 전 연령 이용이 가능한 낮은 진입 장벽이 특징이며 사업자등록시 ‘자유업’으로 분류되고있어 목적에 맞게 다양한 형태의 서비스를 제공 할 수 있습니다. 온
								더 보드는 기존 보드게임카페 사업주 뿐만 아니라 지역 상권의 일반카페 사업주들에게도 큰 부가가치 창출 기회를 제공합니다.</div>

						</div>
					</div>
				</div>

				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" href="#collapse2"><h3>BENEFITS</h3></a>
							</h4>
						</div>
						<div id="collapse2" class="panel-collapse collapse">
							<div class="panel-body">On The Board는 기존에 없던 멀티소셜플랫폼으로 사용자 모두에게 보드게임이용에 필요한 편의성을 제공합니다. 게이머들은 “매칭”기능을 통하여 함께 게임을 즐길 사용자 모집 할 수 있고, “매장”
								기능을 통하여 사이트에 등록된 업체들을 한 눈에 비교하며 “예약”을 통하여 원하는 시간에 손쉽게 예약 할 수 있습니다. 사업주들은 업체 등록만으로 가게 홍보효과를 기대 할 수 있으며 “관리” 기능을 통하여 한 눈에 매출 및 이용 동향을 파악 할 수
								있습니다. 온 더 보드는 신규 유저를 지속적으로 유입, 유지하여 기존 보드게임카페 사업주들에게는 더욱더 많은 고객관리 기회를 제공해주며, 지역 카페 사업주들에게는 부가 수익 창출 기회를 제공합니다. 보드게임에 관한 전문 지식이 없어도 사이트를 이용하면 손
								쉽게 양질의 서비스를 제공 할 수 있습니다. 온 더 보드는 국내 보드게임문화 발전에 기여하여 궁극적으로 지역 상권과 지역 커뮤니티 활성화와 같은 공익가치실현에 목적을 두고 있습니다.</div>

						</div>
					</div>
				</div>


				<p>
					<a class="btn btn-danger pull-right " href="${pageContext.request.contextPath }/user/loginForm" role="button">시작하기</a>
				</p>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="jumbotron" id="jumbotron2">
			<div class="container">
				<h1>Stores</h1>
				<p>온 더 보드에서는 전국 200여개의 보드게임전문점에 대한 정보와 내 주변에서 가볍게 즐길 수 있는 카페 정보를 제공합니다.
				<br>온 더 보드를 통해 쉽게 찾고 쉽게 예약하세요!</p>

				<!-- Carousel container -->
				<div id="my-pics" class="carousel slide" data-ride="carousel" style="width: 800px; margin: auto;">

					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#my-pics" data-slide-to="0" class="active"></li>
						<li data-target="#my-pics" data-slide-to="1"></li>
						<li data-target="#my-pics" data-slide-to="2"></li>
						<li data-target="#my-pics" data-slide-to="3"></li>
						<li data-target="#my-pics" data-slide-to="4"></li>
					</ol>

					<!-- Content -->
					<div class="carousel-inner" role="listbox">

						<!-- Slide 1 -->
						<div class="item active">
							<img src="${pageContext.request.contextPath}/assets/images/main/boardGame1.jpg">
						</div>

						<!-- Slide 2 -->
						<div class="item">
							<img src="${pageContext.request.contextPath}/assets/images/main/boardGame2.jpg">
						</div>

						<!-- Slide 3 -->
						<div class="item">
							<img src="${pageContext.request.contextPath}/assets/images/main/boardGame3.jpg">
						</div>

						<!-- Slide 4 -->
						<div class="item">
							<img src="${pageContext.request.contextPath}/assets/images/main/boardGame4.jpg">
						</div>

						<!-- Slide 5 -->
						<div class="item">
							<img src="${pageContext.request.contextPath}/assets/images/main/boardGame5.jpg">
						</div>


					</div>

					<!-- Previous/Next controls -->
					<a class="left carousel-control" href="#my-pics" role="button" data-slide="prev"> <span class="icon-prev" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#my-pics" role="button" data-slide="next"> <span class="icon-next" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>

				</div>



				<p>
					<a class="btn btn-danger pull-right " href="${pageContext.request.contextPath }/store/storelist" role="button">매장둘러보기</a>
				</p>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="jumbotron" id="jumbotron3">
			<div class="container">
				<div id="matchingInfo">
					<h1>Matching</h1>
					<p>함께 할 친구가 없나요? 간단한 회원가입을 통해 다른 사용자들을 만나보세요!</p>
				</div>
				<p>
					<a class="btn btn-danger pull-right " href="${pageContext.request.contextPath }/matching/main" role="button">매칭하러가기</a>
				</p>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="jumbotron" id="jumbotron4">
			<div class="container">
				<h1>Game Guide</h1>
				<p>설명서만으로는 플레이하기 어려운 보드게임들이 너무나 많습니다. 모르는 게임은 직원을 불러 설명을 들어야 하고, 설령 설명이 매끄럽지 않아도 다시 물어보기가 불편합니다. 온 더 보드에서는 게임검색부터 게임 가이드 영상까지 제공합니다. 
				온 더 보드에서 새로운 게임에 쉽게 도전해 보세요!</p>

				<!-- Carousel container -->
				<div id="games" class="carousel slide" data-ride="carousel" style="width: 800px; margin: auto;">

					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#games" data-slide-to="0" class="active"></li>
						<li data-target="#games" data-slide-to="1"></li>
						<li data-target="#games" data-slide-to="2"></li>
						<li data-target="#games" data-slide-to="3"></li>
						<li data-target="#games" data-slide-to="4"></li>
					</ol>

					<!-- Content -->
					<div class="carousel-inner" role="listbox">

						<!-- Slide 1 -->
						<div class="item active">
							<img src="${pageContext.request.contextPath}/assets/upload/thum/30.png">
						</div>

						<!-- Slide 2 -->
						<div class="item">
							<img src="${pageContext.request.contextPath}/assets/upload/thum/26.png">
						</div>

						<!-- Slide 3 -->
						<div class="item">
							<img src="${pageContext.request.contextPath}/assets/upload/thum/22.png">
						</div>

						<!-- Slide 4 -->
						<div class="item">
							<img src="${pageContext.request.contextPath}/assets/upload/thum/1.png">
						</div>

						<!-- Slide 5 -->
						<div class="item">
							<img src="${pageContext.request.contextPath}/assets/upload/thum/2.png">
						</div>


					</div>

					<!-- Previous/Next controls -->
					<a class="left carousel-control" href="#games" role="button" data-slide="prev"> <span class="icon-prev" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#games" role="button" data-slide="next"> <span class="icon-next" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>

				</div>


				<p>
					<a class="btn btn-danger pull-right " href="${pageContext.request.contextPath }/game/list" role="button">게임보기</a>
				</p>
			</div>
		</div>
	</div>








	<!-- 푸터 -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

</body>
</html>