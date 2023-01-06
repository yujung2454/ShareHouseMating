<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<style>
</style>
<link rel="stylesheet" type="text/css" href="/css/query.css" />
</head>
<body>
	<div class="fixed">
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
								<a href="/mypage/info"><img class="user_uimg"
									src="${user.user_Img}"></a>
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

	<div id="center">
		<!-- 게시글 리스트 테이블 -->
		<div id="title">
			<a href="/query/query_list" class="query_list">문의하기</a> <br>
			<hr>


			<div class="table_view">
				<div class="subject">제목 : ${dto.query_title}</div>

				<div class="content_info">

					<div class="writer">작성자 : ${dto.id}</div>&nbsp; &nbsp; &nbsp;
					<div class="date">
						작성일 :
						<fmt:formatDate value="${dto.query_date }" dateStyle="short" /> &nbsp; &nbsp; &nbsp;
					</div>
					<div class="category">카테고리 : ${dto.category}</div> &nbsp; &nbsp; &nbsp;


				</div>
				<div class="show_content">${dto.query}</div>
			</div>
		</div>
		<hr>
		<div class="answer">
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<%-- 	<c:if test="${dto.answer == null}"> --%>
					<div class="answer_submit">
						<form method="post" action="/insert/answer/${dto.query_no}">
							<input name="answer" id="answer" class="answer_input"
								value="${dto.answer }">
							<button type="submit" class="submit">답변 등록</button>
						</form>
					</div>
				<%-- </c:if> --%>
			</sec:authorize>
			<%-- <div class="answer_content">${dto.answer}</div>
			<!-- 문의 답변 내용 -->
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<c:if test="${dto.answer != null}">
					<div class="answer_update">
						<a href="/admin/ad_query_update/${dto.query_no}">수정하기</a>
					</div>
				</c:if>
			</sec:authorize>
		</div> --%>
		<br>
		<div class="btn">
			<c:if test="${ user.id == dto.id }">
				<button type="button" class="update">
					<a href="/query_update/${dto.query_no}">글 수정 </a>
				</button>
				<button type="button" class="delete">
					<a id="${dto.query_no}" href="#">글 삭제</a>
				</button>
			</c:if>
			<button type="button" class="redirect"
				onclick="location.href='/query_list'">목록으로</button>
		</div>
	</div>

	<nav>
		<div class="quick">
			<div class="quick_shape">
				<a href="/search/searchlist"> <img src="/images/search.png"
					title="검색">
				</a>
			</div>
			<div class="quick_shape">
				<a href=""> <img src="images/like.png" title="찜">
				</a>
			</div>
		</div>
	</nav>

	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script async
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&libraries=places">
		
	</script>
	<script>
		$(function() {
			$("a[id]").click(function() {
				let query_no = $(this).attr("id");
				$.ajax({
					url : "/delete",
					data : "query_no=" + query_no,
					method : "delete"
				}).done(function() {
					location.href = "/query_list";
				})
				return false;
			})//click

		})//ready

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