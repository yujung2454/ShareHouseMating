<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 홈페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin_nav.css" />
</head>
<body>
<header>
		<div id="uppernav">
			<div id="main">
				<span id="home_img" class="to_main"><a href="/"><img
						src="/images/home.png"></a></span> <span id="home" class="to_main"><a
					href="/">우리집</a></span>
			</div>
			<ul class="upper_frame">
				<li class="upper_menu"><a href="/introduce/introduce">쉐어하우스란?</a></li>
				<li class="upper_menu" onclick="s_location()"
					style="cursor: pointer">방 찾기</li>
				<li class="upper_menu"><a
					href="/registration/registration_first">매물 등록</a></li>
				<li class="upper_menu"><a href="/community/community_list">커뮤니티</a></li>
				<li class="upper_menu"><a href="/query_list">문의</a></li>
			</ul>
			<div id="p_info">
				<span id="login"> <c:if test="${user == null}">
						<a href="/login">로그인</a>
					</c:if> <c:if test="${user != null}">
						<c:if test="${user.user_Img == null}">
							<a href="/mypage/info"><img src="/images/profil.png"></a>
						</c:if>
						<c:if test="${user.user_Img != null}">
							<a href="/mypage/info"><img src="${user.user_Img}"></a>
						</c:if>
						<a href="/logout" class="logout">로그아웃</a>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							<a href="/admin/admin_main">관리자페이지</a>
						</sec:authorize>
					</c:if>
				</span>
			</div>
		</div>
</header>


	
		<aside>
			<nav>
				<ul>
					<li><a href="/admin/admin_notice">공지사항 관리</a></li>
					<li><a href="/admin/user_manage">회원관리</a></li>
					<li><a href="/admin/report_list">신고리스트</a></li>
					<li><a href="/admin/ad_query_list">문의리스트</a></li>
					<li><a href="/admin/allboardview">모든 게시물 보기</a></li>
					<li><a href="/popup">메인 팝업 관리</a></li>
				</ul>				
			</nav>
		</aside>
		<main>
		
		전체 방문자 수: ${sessionScope.totalCount}

		오늘의 방문자 수: ${sessionScope.todayCount}
		</main>







	<footer>
</footer>
</body>
</html>