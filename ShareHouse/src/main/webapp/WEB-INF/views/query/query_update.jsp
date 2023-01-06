<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/query.css" />
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
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
				<span id="notification"><img src="/images/notification.png"></span>
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
			<a href="/query_list" class="query_list">문의리스트</a> <br>
			<h2>글 수정</h2>
			<hr>
		</div>
		<form method="post" id="update" action="/query_update">
			<input type="hidden" name="_method" value="put">
			<div class="update_table">

				<div class="subject">
					제목 : <input name="query_title" value="${dto.query_title}" size="50"
						maxlength="100" required="required" /> <input type="hidden"
						name="query_no" value="${dto.query_no}" />
				</div>


				<div class="user">
					작성자 : ${user.user_Img} ${user.id} <input type="hidden" name="id"
						value="${user.id}" readonly> <select name="category"
						id="sign1">
						<option value="매물 관련">매물 관련</option>
						<option value="계약 관련">계약 관련</option>
						<option value="커뮤니티 관련">커뮤니티 관련</option>
						<option value="기타">기타</option>
					</select>
				</div>


				<div class="content">
					<textarea name="query" id="content" style="width: 100%"
						required="required"> ${dto.query} </textarea>
				</div>

			</div>
			<div id="button" align="center">
				<button type="submit" id="save" class="save" value="완료">완료</button>
				<button type="button" class="cancel" value="취소"
					onclick="location.href='/query_list'">취소</button>
			</div>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<nav>
<div class="quick">
	<div class="quick_shape">
		<a href="/detailsearch">
			<img src="/images/search.png" title="검색">
		</a>
	</div>
	<div class="quick_shape">
		<a href="/mypage/wishlist">
			<img src="/images/like.png" title="찜">
		</a>
	</div>
</div>
	</nav>
</body>
<footer></footer>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- <script src="/javascript/offeringlist"></script> -->
<script async
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&libraries=places">
	
</script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script>
	let oEditors = []

	smartEditor = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content",
			sSkinURI : "/smarteditor/SmartEditor2Skin.html",
			fOnAppLoad : function() {
				oEditors.getById["content"].exec("PASTE_HTML",
						[ '${dto.query}' ]);
			},
			fCreator : "createSEditor2"
		})
	}

	$(document).ready(function() {
		smartEditor()

		$("#save").click(function() {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#update").submit();
		});

	})

	function s_location() {
		navigator.geolocation.getCurrentPosition(function(pos) {
			var latitude = pos.coords.latitude;
			var longitude = pos.coords.longitude;

			location.href = "/search/searchlist?latitude=" + latitude
					+ "&longitude=" + longitude;
		})
	}
</script>
</html>