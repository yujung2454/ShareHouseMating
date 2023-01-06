<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#goodtd {
	text-align: left;
}
</style>
<title>배소은을 신고하는 리스트</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
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
							<div class="user_profil_img">
								<a href="/mypage/info"><img class="user_uimg"
									src="${user.user_Img}"></a>
							</div>
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
				<li class="active"><a href="/admin/report_list">신고리스트</a></li>
				<li><a href="/admin/ad_query_list">문의리스트</a></li>
				<li><a href="/admin/allboardview">모든 게시물 보기</a></li>
				<li><a href="/popup">메인 팝업 관리</a></li>
			</ul>
		</nav>
	</aside>
<main>

	<div id="title">
		<h1>신고 리스트</h1>
	</div>
	<div align="center">
		<select id="select" name="select" onchange="change()">
			<option value="all">전체보기</option>
			<option value="commview">커뮤니티</option>
			<option value="boardview">매물</option>
			<option value="commentview">댓글</option>
		</select>
	</div>

	<form method="post" action="/admin/report_list">
		<div id="write" align="center">
			<input type="submit" class="report_list" id="del" value="삭제">
		</div>
		<table border="1"
			style="margin-left: auto; margin-right: auto; text-align: center;">
			<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
				<col style="width: 10%;" />
				<col style="width: 15%;" />
				<col style="width: 15%" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
				<col style="width: 30%;" />

			</colgroup>
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" id="cbx_chkAll" />전체 선택</th>
					<th scope="col">신고자</th>
					<th scope="col">신고받은 자</th>
					<th scope="col">카테고리</th>
					<th scope="col">회원상태</th>
					<th scope="col">관리</th>
				</tr>

			</thead>
			<tbody id="tbody">
				<c:if test="${count == 0}">
					<tr>
						<td colspan="5" id="none_post">접수된 신고가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${count != 0}">
					<c:forEach items="${rp}" var="rprp">
						<tr class="board">
							<c:if test="${rprp.board_no != ''}">
								<td><input type="checkbox" name="report_no"
									value="${rprp.report_no}"></td>
								<td>${rprp.reporter}</td>
								<td>${rprp.reported_id}</td>
								<td>${rprp.category}</td>
								<td>${status}</td>
								<td colspan="2"><button type="button" class="updateuser"
										itemid="${rprp.reported_id}">활동정지</button>
									<button type="button" class="deleteuser"
										itemid="${rprp.reported_id}">강제탈퇴</button></td>
							</c:if>
						</tr>
						<tr class="board">
							<c:if test="${rprp.board_no != ''}">
								<td colspan="6" id="goodtd">신고 내용 : ${rprp.report_con}</td>
							</c:if>
						</tr>


						<tr class="comm">
							<c:if test="${rprp.comm_no != ''}">
								<td><input type="checkbox" name="report_no"
									value="${rprp.report_no}"></td>
								<td>${rprp.reporter}</td>
								<td>${rprp.reported_id}</td>
								<td>${rprp.category}</td>
								<td>${status}</td>
								<td colspan="2"><button type="button" class="updateuser"
										itemid="${rprp.reported_id}">활동정지</button>
									<button type="button" class="deleteuser"
										itemid="${rprp.reported_id}">강제탈퇴</button></td>
							</c:if>
						</tr>
						<tr class="comm">
							<c:if test="${rprp.comm_no != ''}">
								<td colspan="6" id="goodtd">신고 내용 : ${rprp.report_con}</td>
							</c:if>
						</tr>


						<tr class="comment">
							<c:if test="${rprp.comment_no != ''}">
								<td><input type="checkbox" name="report_no"
									value="${rprp.report_no}"></td>
								<td>${rprp.reporter}</td>
								<td>${rprp.reported_id}</td>
								<td>${rprp.category}</td>
								<td>${status}</td>
								<td colspan="2"><button type="button" class="updateuser"
										itemid="${rprp.reported_id}">활동정지</button>
									<button type="button" class="deleteuser"
										itemid="${rprp.reported_id}">강제탈퇴</button></td>
							</c:if>
						</tr>
						<tr class="comment">
							<c:if test="${rprp.comment_no != ''}">
								<td colspan="6" id="goodtd">신고 내용 : ${rprp.report_con}</td>
							</c:if>
						</tr>

					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div id="paging" align="center">
			<c:if test="${begin > pageNum}">
				<a href="report_list?p=${begin-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end="${end}" var='i'>
				<a href="report_list?p=${i}" class="page">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages}">
				<a href="report_list?p=${end+1}">[다음]</a>
			</c:if>
		</div>
		<input type="hidden" value="${rprp.reported_id}" name="reported_id" />
	</form>
</main>

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
		//체크박스
		$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if ($("#cbx_chkAll").is(":checked"))
					$("input[name=report_no]").prop("checked", true);
				else
					$("input[name=report_no]").prop("checked", false);
			});

			$("input[name=report_no]").click(function() {
				var total = $("input[name=report_no]").length;
				var checked = $("input[name=report_no]:checked").length;

				if (total != checked)
					$("#cbx_chkAll").prop("checked", false);
				else
					$("#cbx_chkAll").prop("checked", true);
			});
		});

		// 옵션		
		function change() {
			$("#select").change(function() {
				var select = $("#select option:selected").val();
				if (select == "commview") {
					$('.board').hide();
					$('.comment').hide();
					$('.comm').show();
				} else if (select == "boardview") {
					$('.comm').hide();
					$('.comment').hide();
					$('.board').show();
				} else if (select == "commentview") {
					$('.board').hide();
					$('.comm').hide();
					$('.comment').show();
				} else {
					$('.comm').show();
					$('.board').show();
					$('.comment').show();
				}
			})
		}

		// 탈퇴, 중지
		$(function() {
			$(".deleteuser").click(function() {
				let reported_id = $(this).attr("itemid");

				if (!confirm("정말로 탈퇴 시키겠습니까?")) {
					return false;
				} else {
					$.ajax({
						url : "/tae/delete",
						data : "reported_id=" + reported_id,
						method : 'post'
					}).done(function(data) {
						alert("회원을 탈퇴시켰습니다.");
						window.location.href = "/admin/report_list";
					})
				}//if
			})//click
			$(".updateuser").click(function() {
				let reported_id = $(this).attr("itemid");

				if (!confirm("정말로 중지 시키겠습니까?")) {
					return false;
				} else {
					$.ajax({
						url : "/tae/update",
						data : "reported_id=" + reported_id,
						method : 'post'
					}).done(function(data) {
						alert("회원을 활동 중지시켰습니다.");

						window.location.href = "/admin/report_list";
					})
				}//if
			})//click
		})//ready
	</script>
</body>
</html>