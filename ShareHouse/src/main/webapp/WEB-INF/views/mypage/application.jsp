<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입주신청목록</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<link href="/css/mypage.css" rel="stylesheet">
<link href="/css/userinfo.css" rel="stylesheet">
<link href="/css/application.css" rel="stylesheet">
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
<div class="quick">
	<div class="quick_shape">
		<a href="/search/searchlist">
			<img src="/images/search.png" title="검색">
		</a>
	</div>
	<div class="quick_shape">
		<a href="/wishlist">
			<img src="/images/like.png" title="찜">
		</a>
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
<h1>입주신청목록</h1>
<p>입주신청자명단</p>
</div>
<table class="table_list">
<tr>
<td>입주신청자</td>
<td>핸드폰</td>
<td>이메일</td>
<td>매물 제목</td>
<td>신청한 룸</td>
<td>입주승인/거절</td>
</tr>
<c:forEach items="${cList}" var="app">

<tr>
<td>${app.aid} (${app.name})</td>
<td>${app.tel}</td>
<td>${app.email}</td>
<td>${app.title}</td>
<td>${app.room_name}


</td>
<td>
<form method="post" id="form" action="/mypage/application">
<input type='hidden' value='${app.board_no}' name='board_no'>
<input type='hidden' value='${app.myno}' name='myno'>

<input type='hidden' value='${app.room_name}' name='room_name'>
<button type="submit" class="apply" onclick="ok()">승인</button>
<button type="button" class="delete" onclick="no(${app.myno})">거절</button>
</form>
</td>
</tr>

</c:forEach>
</table>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
function s_location(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	
	location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
	})
}

function ok() {
	alert('신청자의 입주를 승인하셨습니다.');
}

function no(myno) {
	alert('신청자의 입주를 거절하셨습니다.');
	location.href = "/mypage/application/cancel?myno="+myno;
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

</body>
</html>