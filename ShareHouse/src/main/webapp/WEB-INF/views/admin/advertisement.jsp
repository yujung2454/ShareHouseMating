<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리집</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<style>
.ad_administration{
	border: solid;
}
</style>
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
		<li class="upper_menu" onclick="s_location()" style="cursor:pointer">방 찾기</li>
		<li class="upper_menu"><a href="/registration/registration_first">매물 등록</a></li>
		<li class="upper_menu"><a href="/community/community_list">커뮤니티</a></li>
		<li class="upper_menu"><a href="/query_list">문의</a></li>
	</ul>
	<div id="p_info">
		<span id="notification"><img src="/images/notification.png"></span>
		<span id="login">
			<c:if test="${user == null}">
				<a href="/login">로그인</a>
			</c:if>
			<c:if test="${user != null}">
				<c:if test="${user.user_Img == null}">
					<a href="/mypage/info"><img src="/images/profil.png"></a>
				</c:if>
				<c:if test="${user.user_Img != null}">
					<a href="/mypage/info"><img src="${user.user_img}"></a>
				</c:if>
				<a href="/logout" class="logout">로그아웃</a>
			</c:if>
		</span>
	</div>
</div>
</div>
<!-- 광고팝업 관리자 툴 -->
<div class="ad_administration">
	
</div>

</body>
</html>