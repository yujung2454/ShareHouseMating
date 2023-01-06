<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 리스트</title>
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
				<li><a href="/admin/admin_notice">공지사항 관리</a></li>
				<li><a href="/admin/user_manage">회원관리</a></li>
				<li><a href="/admin/report_list">신고리스트</a></li>
				<li class="active"><a href="/admin/ad_query_list">문의리스트</a></li>
				<li><a href="/admin/allboardview">모든 게시물 보기</a></li>
				<li><a href="/popup">메인 팝업 관리</a></li>
			</ul>
		</nav>
	</aside>
<main>
<div id="center">
<!-- 게시글 리스트 테이블 -->
		<form method="post" action="/admin/ad_query_list">
	<div id = "board">
		<table border="3">
		<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
						<col style="width:10%;" />
						<col style="width:15%" />
						<col style="width:15%;" />
						<col style="width:45%;" />
						<col style="width:15%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" id="cbx_chkAll"/>전체 선택</th>
							<th scope="col">아이디</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">처리현황</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${count == 0}">
							<tr>
								<td colspan="5" id="none_post">문의 페이지에 저장된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${count != 0}">
							<c:forEach items="${qList}" var="query">
							<tr>
								<td>
								<input type="checkbox" name="query_no" value="${query.query_no}">
								<td>${user.user_img} ${query.id}</td>
								<td>${query.category}</td>
								<td><a href="/query_view/${query.query_no}">${query.query_title}</a></td>
								<td>${query.query_state}</td>
							</tr>
							
							</c:forEach>
						</c:if>
						
					</tbody>
		</table>

		<div id="paging" align="center">
			<c:if test="${begin > pageNum}">
				<a href="query_list?p=${begin-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end = "${end}" var='i'>
				<a href="query_list?p=${i}" class="page">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages}">
				<a href="query_list?p=${end+1}">[다음]</a>
			</c:if>
		</div>
	</div>
		
		<div id="write" style="width:60%; text-align:right; margin:auto;">
			<input type = "submit" class="query_write" id="del" value= " 삭제">
		</div>
	</form>
</div>
</main>
<div>
<!-- 오른쪽 네비게이션 바 검색, 찜, 채팅 링크  -->
</div>

<footer>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// 체크박스
$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=query_no]").prop("checked", true);
				else $("input[name=query_no]").prop("checked", false);
			});
			
			$("input[name=query_no]").click(function() {
				var total = $("input[name=query_no]").length;
				var checked = $("input[name=query_no]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});
		
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