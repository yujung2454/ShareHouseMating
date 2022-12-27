<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link href="/css/uppernav.css" rel="stylesheet">
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
			<li class="upper_menu"><a href="/registration/registration_first">매물 등록</a></li>
			<li class="upper_menu"><a href="/community/community_list">커뮤니티</a></li>
			<li class="upper_menu">문의</li>
		</ul>
		<div id="p_info">
			<span id="notification"><img src="/images/notification.png"></span>
			<span id="login">
				<c:if test="${user.user_img} == null">
					<a href="/mypage/info"><img src="/images/profil.png"></a>
				</c:if>
				<c:if test="${user.user_img} != null">
					<a href="/mypage/info"><img src="${user.user_img}"></a>
				</c:if>
			</span>
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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

</body>
</html>