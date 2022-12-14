<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>매물찾기</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/map.css" rel="stylesheet">
</head>
<body>
<div class="fixed">
<div id="uppernav">
		<div id="main">
			<span id="home_img" class="to_main" ><a href="/"><img src="/images/home.png"></a></span>
			<span id="home" class="to_main"><a href="/">우리집</a></span>
		</div>
		<ul class="upper_frame">
			<li class="upper_menu"><a href="/introduce/introduce">쉐어하우스란?</a></li>
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
<div id="map"></div>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lq4lt4kzb4"></script>
<script src="/javascript/searchmap.js"></script>

</body>
</html>