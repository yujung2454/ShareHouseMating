<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta id="_csrf" name="_csrf" content="{{_csrf.token}}"/>
<meta id="_csrf_header" name="_csrf_header" content="{{_csrf.headerName}}"/>
<meta charset="UTF-8">
<title>메인화면</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/searchcontent.css" rel="stylesheet">
</head>
<body>
<div class="fixed">
<div id="uppernav">
		<div id="main">
			<span id="home_img" class="to_main" ><a href="/"><img src="/images/home.png"></a></span>
			<span id="home" class="to_main"><a href="/">우리집</a></span>
		</div>
		<ul class="upper_frame">
			<li class="upper_menu">쉐어하우스란?</li>
			<li class="upper_menu"><a href="/search/searchlist">방 찾기</a></li>
			<li class="upper_menu">매물 등록</li>
			<li class="upper_menu"><a href="/community/community_list">커뮤니티</a></li>
			<li class="upper_menu">문의</li>
		</ul>
		<div id="p_info">
			<span id="notification"><img src="/images/notification.png"></span>
			<span id="login"><a href="/login/login">로그인</a></span>
		</div>
	</div>
	<br><br><br><br><br><br>
<form id="search_btn" action="/search/searchlist">
	<div id="search" >
		<ul>
			<li><img src="/images/search.png"></li>
			<li><input name="search" placeholder="지역명 또는 역이름" size="50"></li>
			<li>
				<button id="search_btn" name="search_btn" type="submit">검색</button>
			</li>
			<li>
				<a href="/search/detailsearch"><img src="/images/detailsearch.png" alt="상세검색"></a>
			</li>
		</ul>
	</div>
</form>
</div>
<br>
<hr>
<form id="detail_search">
<div id="select_boxes">
<select id="search_region" class="search_menu">
	<option>지역</option>
	<option value="01">서울특별시</option>
	<option value="02">경기도</option>
	<option value="03">인천광역시</option>
	<option value="04">대전광역시</option>
	<option value="05">충청남도</option>
	<option value="06">충청북도</option>
	<option value="07">광주광역시</option>
	<option value="08">전라남도</option>
	<option value="09">전라북도</option>
	<option value="10">대구광역시</option>
	<option value="11">경상북도</option>
	<option value="12">부산광역시</option>
	<option value="13">울산광역시</option>
	<option value="14">경상남도</option>
	<option value="15">강원도</option>
	<option value="16">제주특별자치도</option>
</select>
<select id="search_house" class="search_menu">
	<option>주거형태</option>
	<option value="apt">아파트</option>
	<option value="chouse">주택</option>
	<option value="one">원룸</option>
	<option value="two">투룸</option>
	<option value="office">오피스텔</option>
</select>
<select id="search_contract" class="search_menu">
	<option>계약기간</option>
	<option value="1">1개월</option>
	<option value="3">3개월</option>
	<option value="6">6개월</option>
	<option value="12">1년</option>
	<option value="24">2년</option>
</select>
<select id="search_count" class="search_menu">
	<option>인원</option>
	<option value="1">1명</option>
	<option value="2">2명</option>
	<option value="3">3명</option>
	<option value="4">4명</option>
	<option value="5">5명</option>
	<option value="6">6명</option>
</select>
<select id="search_pay" class="search_menu">
	<option>월세</option>
	<option value="30">30만원이하</option>
	<option value="60">30~60만원</option>
	<option value="100">60~100만원</option>
	<option value="101">100만원이상</option>
</select>
<label>
<input id="gender" name="gender" type="checkbox" value="m">
남성</label>
<label>
<input id="gender" name="gender" type="checkbox" value="f">
여성</label> <!-- 남성 여성 다 클릭하면 모든 값 허용  a값? -->
</div>
<hr>
<div class="select_frame">
<div class="scroll_frame">
<dl class="detail_con">
	<dd class="content_frame">
		<div class="region_content">
			지역을 선택해주세요
		</div>
	</dd>
</dl>
</div>
<div class="scroll_frame">
<dl class="detail_con">
	<dd class="content_frame">
		<div class="region_content2">
			시/구를 선택해주세요
		</div>
	</dd>
</dl>
</div>
<div id="selected_loc">
</div>
<div class="roomtoilet">
	<span>방 수</span><br>
	<input id="room_cnt"><br>
	<span>화장실 수</span><br>	
	<input id="Broom_cnt">	
	<input type="submit" value="적용">
</div>
</div>
</form>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/javascript/selectchange.js"></script>
</html>