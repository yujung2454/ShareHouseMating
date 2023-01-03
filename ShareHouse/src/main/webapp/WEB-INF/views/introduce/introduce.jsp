<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>쉐어하우스란?</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
</head>
<body>
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
				</c:if>
			</span>
		</div>
	</div>
<h1 style="margin-left:200px;">쉐어하우스란?</h1>
<form>
<div style="text-align:center;">
<img src="https://50plus.or.kr/upload/im/2020/07/316fc829-17be-4d65-b498-9630199d9c3a.png"><br>
거침없이 치솟는 집값, 부담이 되는 보증금, 늘어나는 1인 가구<br>
여러분들을 위해 만들었습니다.
</div>
<div style="text-align:left; margin-left:230px; margin-top:20px;">
<pre style="font-size:17px"><b>
쉐어하우스는 쉽게 말해 집을 공유하는 것입니다.
쉐어하우스는 하나의 집을 두 명 이상의 남들끼리 같이 모여서 살기를 약속하고,
각자의 방은 독립공간으로 사용하고 그 나머지 공간들은 함께 공유하기로 약속한 집입니다.
</b></pre>
</div>
</form>
</body>
</html>