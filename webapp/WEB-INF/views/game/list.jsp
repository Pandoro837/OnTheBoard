<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>On the Board:팀프로젝트 3조</title>

<!-- css  -->
<link href="${pageContext.request.contextPath }/assets/bootstrap/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/css/game/gamelayout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/assets/css/game/gamestyle.css" rel="stylesheet">


<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.12.4.js"></script>

</head>

<body>
	
	<!-- Header -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- /#Header -->
	
	<!--wrap-->
	<div class="wrap">
		<!-- .sub-container -->
		<div class="sub-container">
		<!--.subtitle -->
         <div class="subtitle clearfix">
			<div class="context1 font-size-24">게임목록</div>
			<div class="context2 clearfix">
				<ul>
					<li><a href="${pageContext.request.contextPath}/main">메인</a></li>
					<li class="last-li"><a href="${pageContext.request.contextPath}/game/list">게임목록</a></li>
				</ul>
			</div>
		</div>
         <!-- /.subtitle -->
         <div>
         <!--#searchForm-->
         <p class="context">아래 메뉴에서 원하는 조건을 선택하면, 만족하는 보드게임을 찾으실 수 있습니다.</p>
         <div class="bbssvc">
			<a href="${pageContext.request.contextPath}/game/gameRegister"><button class="btn-blue">게임등록</button></a>
         </div>
			<form name="searchForm" id="searchForm" method="POST" action>
				<input type="hidden" name="pagenum" id="pagenum" value="1"> <input type="hidden"
					name="view_type" id="view_type" value="bg"
				>
				<!--.sortSelect-->
				<div class="sortSelect">
					<h3 onclick="$(this).next('ul').toggle();">검색조건을 선택하세요</h3>
					<ul id="searchTab">

						<li>
							<dl>
								<dt onclick="searchTab_event(this);" class>대상연령</dt>
								<dd>
									<ul id="search_item0">
										<li><input type="checkbox" id="check_all_item0" onclick="all_click(this);"> <label
											onclick="$(this).prev().trigger('click');"
										>전체</label></li>
										<li class="show" item_num="0"><input type="checkbox" id="search_checkbox_0"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">만 4세 이상</label></li>
										<li class="show" item_num="1"><input type="checkbox" id="search_checkbox_1"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">만 7세 이상</label></li>
										<li class="show" item_num="2"><input type="checkbox" id="search_checkbox_1"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">만 10세 이상</label></li>
										<li class="show" item_num="3"><input type="checkbox" id="search_checkbox_1"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">만 12세 이상</label></li>
										<li class="show" item_num="4"><input type="checkbox" id="search_checkbox_1"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">만 14세 이상</label></li>
									</ul>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt onclick="searchTab_event(this);" class>게임인원</dt>
								<dd>
									<ul id="search_item1">
										<li><input type="checkbox" id="check_all_item0" onclick="all_click(this);"> <label
											onclick="$(this).prev().trigger('click');"
										>전체</label></li>
										<li class="show" item_num="0"><input type="checkbox" id="search_checkbox_1"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">2명</label></li>
										<li class="show" item_num="1"><input type="checkbox" id="search_checkbox_1"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">3명</label></li>
										<li class="show" item_num="2"><input type="checkbox" id="search_checkbox_1"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">4명</label></li>
										<li class="show" item_num="3"><input type="checkbox" id="search_checkbox_1"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">5명</label></li>
										<li class="show" item_num="4"><input type="checkbox" id="search_checkbox_1"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">6명 이상</label></li>
									</ul>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt onclick="searchTab_event(this);" class>게임시간</dt>
								<dd>
									<ul id="search_item2">
										<li><input type="checkbox" id="check_all_item2" onclick="all_click(this);"> <label
											onclick="$(this).prev().trigger('click');"
										>전체</label></li>
										<li class="show" item_num="0"><input type="checkbox" id="search_checkbox_2"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">15분 이상</label></li>
										<li class="show" item_num="1"><input type="checkbox" id="search_checkbox_2"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">30분 이상</label></li>
										<li class="show" item_num="2"><input type="checkbox" id="search_checkbox_2"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">45분 이상</label></li>
										<li class="show" item_num="3"><input type="checkbox" id="search_checkbox_2"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">60분 이상</label></li>
										<li class="show" item_num="4"><input type="checkbox" id="search_checkbox_2"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">120분 이상</label></li>
									</ul>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt onclick="searchTab_event(this);" class>게임테마</dt>
								<dd>
									<ul id="search_item3">
										<li><input type="checkbox" id="check_all_item2" onclick="all_click(this);"> <label
											onclick="$(this).prev().trigger('click');"
										>전체</label></li>
										<li class="show" item_num="0"><input type="checkbox" id="search_checkbox_3"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">파티 게임</label></li>
										<li class="show" item_num="1"><input type="checkbox" id="search_checkbox_3"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">전략 게임</label></li>
										<li class="show" item_num="2"><input type="checkbox" id="search_checkbox_3"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">추상 게임</label></li>
										<li class="show" item_num="3"><input type="checkbox" id="search_checkbox_3"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">테마 게임</label></li>
										<li class="show" item_num="4"><input type="checkbox" id="search_checkbox_3"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">워게임</label></li>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt onclick="searchTab_event(this);" class>게임난이도</dt>
								<dd>
									<ul id="search_item4">
										<li><input type="checkbox" id="check_all_item4" onclick="all_click(this);"> <label
											onclick="$(this).prev().trigger('click');"
										>전체</label></li>
										<li class="show" item_num="0"><input type="checkbox" id="search_checkbox_4"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">초급</label></li>
										<li class="show" item_num="1"><input type="checkbox" id="search_checkbox_4"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">중급</label></li>
										<li class="show" item_num="2"><input type="checkbox" id="search_checkbox_4"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">상급</label></li>
										<li class="show" item_num="3"><input type="checkbox" id="search_checkbox_4"
											name="search_checkbox0[]" value=""
										> <label onclick="$(this).prev().trigger('click');">최상급</label></li>
								</dd>
							</dl>
						</li>
					</ul>
					<div class="notice">
						<!-- .listType -->
						<ul class="listType">
							<li class="sortB">
								<select title="정렬기준" name="search_sort" class="formSelect">
										<option value="" selected="selected">정렬기준<img src="${pageContext.request.contextPath}/assets/images/icons/tab_menu_arrow.gif"></option>
										<option value="name_asc">오름차순</option>
										<option value="name_desc">내림차순</option>
								</select>
							</li>
							<li class="search">
								<input type="text" id="ipt-keyword" value="" placeholder="게임 검색">
							</li>
						</ul>
						<!-- /.listType -->
					</div>
				</div>
				<!--/.sortSelect-->

			</form>
			<!--/#searchForm-->
         </div>

      </div>
		<!--#main-->
		<div id="main" class="gameList">
			
			<!--#gameList-->
			<ul class="bbsList04" id="gameList">
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="${pageContext.request.contextPath}/game/gameDetails">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
				<li>
					<div class="thum">
						<a href="${pageContext.request.contextPath}/game/gameDetails"><img src="http://gdimg.gmarket.co.kr/804891547/still/600?ver=1524112393" alt=></a>
					</div>
					<div class="desc">
						<p class="title">
							<a href="">보난자</a>
						</p>
						<table>
							<tbody>
								<tr>
									<th>게임인원</th>
									<td>3~5인</td>
								</tr>
								<tr>
									<th>게임연령</th>
									<td>만 10세 이상</td>
								</tr>
								<tr>
									<th>게임시간</th>
									<td>45분</td>
								</tr>
								<tr>
									<th>게임난이도</th>
									<td>초급</td>
								</tr>
							</tbody>
						</table>
					</div>
				</li>
			</ul>
			<!--#gameList-->
			<!--.paging-->
			<div id="paging">
				<div class="paging text-center">
					<ul>
					<li>«</li>
					<li class="li-pd">‹</li>
					<li>1</li>
					<li>2</li>
					<li>3</li>
					<li>4</li>
					<li>5</li>
					<li>6</li>
					<li>7</li>
					<li class="li-pd">›</li>
					<li>»</li>
				</ul>
				</div>
			</div>
			<!--/.paging-->
		</div>
		<!--/#container-->
		
		<!-- Footer -->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- /#Footer -->

	</div>
	<!--/#wrap-->
</body>
</html>
