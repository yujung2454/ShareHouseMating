<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항</title>
<link rel="stylesheet" type="text/css" href="/css/admin_nav.css" />
<link rel="stylesheet" type="text/css" href="/css/admin_user.css" />
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
	</header>
	<aside>
		<nav>
			<ul>
				<li class="active"><a href="/admin/admin_notice">공지사항 관리</a></li>
				<li><a href="/admin/user_manage">회원관리</a></li>
				<li><a href="/admin/report_list">신고리스트</a></li>
				<li><a href="/admin/ad_query_list">문의리스트</a></li>
				<li><a href="/admin/allboardview">모든 게시물 보기</a></li>
				<li><a href="/popup">메인 팝업 관리</a></li>
			</ul>
		</nav>
	</aside>
	<main>

		<table class="table_list" border="1">
			<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
				<col style="width: 10%;" />
				<col style="width: 40%" />
				<col style="width: 20%;" />
				<col style="width: 20%;" />
				<col style="width: 10%;" />
			</colgroup>
			<thead>
				<tr style="font-size: 1.3rem;">
					<th scope="col" style="padding-left: 1%;">번호</th>
					<th scope="col" style="padding-left: 1%;">제목</th>
					<th scope="col" style="padding-left: 1%;">작성자</th>
					<th scope="col" style="padding-left: 1%;">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${count == 0}">
					<tr>
						<td colspan="5" id="none_post">게시판에 저장된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${count != 0}">
					<c:forEach items="${nList}" var="comm">
						<tr class="notice">
							<td><a href="/community/community_view/${comm.comm_no}">${comm.comm_no}</a></td>
							<td><a href="/community/community_view/${comm.comm_no}">${comm.comm_title}</a></td>
							<td>${comm.id}</td>
							<td><fmt:formatDate value="${comm.comm_date}"
									dateStyle="short" /></td>
							<td>${comm.comm_v_cnt}</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>
	</main>
	<footer></footer>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script async
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&libraries=places">
	</script>
	<script>

		function s_location() {
			navigator.geolocation.getCurrentPosition(function(pos) {
				var latitude = pos.coords.latitude;
				var longitude = pos.coords.longitude;

				location.href = "/search/searchlist?latitude=" + latitude
						+ "&longitude=" + longitude;
			})
		}
	</script>
</body>
</html>