<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보확인</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<link href="/css/mypage.css" rel="stylesheet">
<link href="/css/userinfo.css" rel="stylesheet">
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
			<span id="login">
				<c:if test="${user == null}">
					<a href="/login">로그인</a>
				</c:if>
				<c:if test="${user != null}">
					<c:if test="${user.user_Img == null}">
						<a href="/mypage/info"><img src="/images/profil.png"></a>
					</c:if>
					<c:if test="${user.user_Img != null}">
						<div class="user_profil_img">
							<a href="/mypage/info"><img class="user_uimg" src="${user.user_Img}"></a>
						</div>
					</c:if>
					<a href="/logout" class="logout">로그아웃</a>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						  <a href="/admin/admin_notice">관리자페이지</a>
					</sec:authorize>
				</c:if>
			</span>
		</div>
	</div>
</div>
<nav class="mypagelist">
	<ul>
		<li class="mypage_sidebar"><a href="/mypage/info">회원정보</a><br></li>
		<li class="mypage_sidebar"><a href="javascript:passwordQuestion()">개인 정보 수정</a><br></li>
		<li id="board" class="mypage_sidebar" style="cursor:pointer">내 게시글 보기<br></li>
		<li class="mypage_sidebar under"><a href="/mypage/myPage_community">- 매물/게시글 목록</a><br></li>
		<li class="mypage_sidebar under"><a href="/mypage/application">- 입주 신청 목록</a><br></li>
		<li class="mypage_sidebar under"><a href="/mypage/mywish">- 내 입주 신청 목록</a><br></li>
		<li class="mypage_sidebar"><a href="/mypage/wishlist">찜 내역</a><br></li>
		<li class="mypage_sidebar"><a href="/mypage/query_history">문의 내역</a></li>
	</ul>
</nav>
<div class="mypage_title">
	<h3>개인정보확인</h3>
</div>
<div class="user_info">
	<div class="uimg">
		<c:if test="${user.user_Img != null }">
			<img id="uimg" src="${user.user_Img }">
		</c:if>
		<c:if test="${user.user_Img == null }">
			<img id="uimg" src="/images/profil.png">
		</c:if>
	</div>
	<div class="uframe">
		<div class="uframe2">
			&nbsp; 이름 :&nbsp;
		</div>
		<div id="uname">
			${user.name }
		</div>
	</div>
	<div class="uframe">
		<div class="uframe2">
			&nbsp; 이메일 :&nbsp;
		</div>
		<div id="uemail">
			${user.email }
		</div>
	</div>
	<div class="uframe">
		<div class="uframe2">
			&nbsp; 전화번호 :&nbsp;
		</div>
		<div id="utel">
			${user.tel } 
		</div>
	</div>
	<div class="uframe">
		<div class="uframe2">
			&nbsp; 주소 :&nbsp;
		</div>
		<div id="uadd">
			${user.user_add }
		</div>
		<div class="uframe2">
			&nbsp; 상세주소 :&nbsp;
		</div>
		<div id="uadd">
		${user.user_add2 }
		</div>
	</div>
	<button class="modify" onclick="passwordQuestion()">수정</button>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
function s_location(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	
	location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
	})
}

function passwordQuestion(){
	var result = confirm("개인정보를 수정하시겠습니까?")
	if(result){
		location.href="/mypage/modify1";
	} else {
		return false;
	}
}

$(function(){
	$("#board").on("click",function(){
		if(!$(this).hasClass("on")){
			$(this).addClass("on")
			$(this).css({"margin":"40px 0 20px 0"})
			$(".under").css({"display":"inline-block"})
		} else {
			$(this).removeClass("on")
			$(".under").css({"display":"none"})
			$(this).css({"margin":"40px 0 40px 0"})
		}
	})
})
</script>
</html>