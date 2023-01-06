<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style>
</style>
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
	</header>
	<aside>
		<nav>
			<ul>
				<li><a href="/admin/admin_notice">공지사항 관리</a></li>
				<li class="active"><a href="/admin/user_manage">회원관리</a></li>
				<li><a href="/admin/report_list">신고리스트</a></li>
				<li><a href="/admin/ad_query_list">문의리스트</a></li>
				<li><a href="/admin/allboardview">모든 게시물 보기</a></li>
				<li><a href="/popup">메인 팝업 관리</a></li>
			</ul>
		</nav>
	</aside>
	<main>


		<div id="search">
			<form action="/admin/user_manage_search">
				<input type="text" name="search" size="20" maxlength="225"
					placeholder="ID를 입력해주세요." class="ID">
				<button type='submit' value="검색" class="search"></button>
			</form>
		</div>
		<div class="btn_list">
			<input type="button" name="release" class="btn" id="release"
				value="정지 해제" /> <input type="button" name="stopUser" class="btn"
				id="stopUser" value="활동 정지" /> <input type="button" name="delCheck"
				class="btn" id="delCheck" value="삭제" />
		</div>
		<form id="form" method="post" action="/admin/user_manage">


			<div id="board">
				<table border="1">
					<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
					<colgroup>
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />

					</colgroup>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" id="cbx_chkAll" />전체
								선택</th>
							<th scope="col" style="padding-left: 1%;">ID</th>
							<th scope="col" style="padding-left: 1%;">이름</th>
							<th scope="col" style="padding-left: 1%;">Email</th>
							<th scope="col" style="padding-left: 1%;">전화번호</th>
							<th scope="col" style="padding-left: 1%;">성별</th>
							<th scope="col" style="padding-left: 1%;">주소</th>
							<th scope="col" style="padding-left: 1%;">상세주소</th>
							<th scope="col">활동상태</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:if test="${count == 0}">
							<tr>
								<td colspan="5" id="none_post">회원이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${count != 0}">
							<c:forEach items="${uList}" var="user">
								<tr>
									<c:if test="${user.status == 'ROLE_ADMIN' }">
										<td></td>
									</c:if>
									<c:if test="${user.status != 'ROLE_ADMIN' }">
										<td><input type="checkbox" name="user_select"
											value="${user.id }" /></td>
									</c:if>
									<td>${user.id}</td>
									<td>${user.name}</td>
									<td>${user.email}</td>
									<td>${user.tel}</td>
									<td>${user.gender}</td>
									<td>${user.user_add}</td>
									<td>${user.user_add2}</td>
									<td>${user.status}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
				<div id="paging" align="center">
					<c:if test="${begin > pageNum}">
						<a href="user_manage?p=${begin-1}">[이전]</a>
					</c:if>
					<c:forEach begin="${begin}" end="${end}" var='i'>
						<a href="user_manage?p=${i}" class="page">${i}</a>
					</c:forEach>
					<c:if test="${end < totalPages}">
						<a href="user_manage?p=${end+1}">[다음]</a>
					</c:if>
				</div>
			</div>

		</form>

	</main>
	<footer> </footer>



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
		$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if ($("#cbx_chkAll").is(":checked"))
					$("input[name=user_select]").prop("checked", true);
				else
					$("input[name=user_select]").prop("checked", false);
			});

			$("input[name=user_select]").click(function() {
				var total = $("input[name=user_select]").length;
				var checked = $("input[name=user_select]:checked").length;

				if (total != checked)
					$("#cbx_chkAll").prop("checked", false);
				else
					$("#cbx_chkAll").prop("checked", true);
			});
		});

		document.getElementById('stopUser').onclick = function() {
			document.getElementById('form').action = "/admin/stopUser";
			document.getElementById('form').submit();
			return false;

		};

		document.getElementById('release').onclick = function() {
			document.getElementById('form').action = "/admin/release";
			document.getElementById('form').submit();
			return false;
		};

		document.getElementById('delCheck').onclick = function() {
			document.getElementById('form').action = "/admin/delCheck";
			document.getElementById('form').submit();
			return false;

		};
	</script>
</body>
</html>