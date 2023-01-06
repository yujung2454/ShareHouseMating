<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<link rel="stylesheet" type="text/css" href="/css/list.css" />
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
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
	<div id="center">
		<!-- 게시글 리스트 테이블 -->
		<div id="title">
			<a href="/community/community_list" class="community_list">커뮤니티</a> <br>
			<hr>


			<div class="table_view">
				<div class="subject">제목 : ${dto.comm_title}</div>
				<div class="content_info">

					<div class="writer">작성자 : ${dto.id}</div>&nbsp; &nbsp; &nbsp;
					<div class="date">
						작성일 :
						<fmt:formatDate value="${dto.comm_date }" dateStyle="short" />
					</div>&nbsp; &nbsp; &nbsp;
					<div class="view_count">조회수 : ${dto.comm_v_cnt}</div>


				</div>
				<div class="show_content">${dto.comm_con}</div>
			</div>
		</div>
		<div class="btn">
			<c:if test="${ user.id == dto.id }">
				<button type="button" class="update">
					<a href="/community/community_update/${dto.comm_no}">글 수정 </a>
				</button>
				<button type="button" class="delete">
					<a id="${dto.comm_no}" href="#">글 삭제</a>
				</button>
			</c:if>
			<button type="button" class="redirect"
				onclick="location.href='/community/community_list'">목록으로</button>
		</div>
		<form>
			<div class="report">
				<input type="hidden" name="comm_no" value="${dto.comm_no}">
				<button class="report-comm" type="button">
					<img src="/images/report.png">신고
				</button>
			</div>
		</form>

		<div>
			<hr class="hr_community">
			<div id="comment">
				<hr class="hr_comment">
				<c:forEach items="${commentList}" var="comm_comment">
					<div>${comm_comment.id}
						/
						<fmt:formatDate value="${comm_comment.comment_date }"
							dateStyle="short" />
						<div class="report">
							<input type="hidden" name="comment_no"
								value="${comment_no.comment_no}">
							<button class="report-comment" type="button">
								<img src="/images/report.png">신고
							</button>
						</div>
					</div>
					<div>${comm_comment.comment_con}
						<c:if test="${comm_comment.id == user.id }">
							<button class="dbtn" id="${comm_comment.comment_no}">
								<img src="/images/del_btn.png">
							</button>
						</c:if>
						<form></form>
					</div>
					<hr>
				</c:forEach>
			</div>
			<input name="content" id="content" placeholder="댓글을 남겨보세요">
			<button id="add">등록</button>
		</div>

	</div>

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
		$(function() {
			$("a[id]").click(function() {
				let comm_no = $(this).attr("id");
				$.ajax({
					url : "/community/delete",
					data : "comm_no=" + comm_no,
					method : "delete"
				}).done(function() {
					location.href = "/community/community_list";
				})
				return false;
			})//click

			$("#add").click(function() {
				let id = "${user.id}"; // 세션에 저장된 id값
				let comment_con = $("#content").val();
				let comm_no = ${dto.comm_no};
				$.ajax({
					url : "/comment/insert",
					data : "comm_no=" + comm_no	+ "&id=" + id + "&comment_con="	+ comment_con,
					method : "get",
					dataType : "json"
				}).done(function(resp) {
						let commentlist = "";
						resp.forEach(function(comm_comment,	index) {
							commentlist += "<div>"+ comm_comment.id	+ " / "	+ new Date(comm_comment.comment_date).toLocaleDateString()
							+ "</div><div>"	+ comm_comment.comment_con;
								if (id == comm_comment.id) {
									commentlist += '<button class="dbtn" id="'+comm_comment.comment_no+'">삭제</button>';
								}
								commentlist += "</div><hr>";
								});

								$("#comment").html(commentlist);
								$("#content").val("");
								location.reload();
							});

			})//click
			$("#comment").on("click", ".dbtn", function() {
				let comment_no = $(this).attr("id");
				$.ajax({
					url : "/comment/delete/" + comment_no,
					method : "get"
				}).done(function() {
					location.reload();
				});

			})//click
		})//ready

		$('.report-comm')
				.on(
						'click',
						function() {
							var url = "/report_maemul/${dto.comm_no}";
							var name = "CalPopup";
							var option = "width = 600, height = 600, left = 100, top = 50, location=no";
							window.open(url, name, option)
						});

		$('.report-comment')
				.on(
						'click',
						function() {
							var url = "/report_maemul/${commentdto.comment_no}";
							var name = "CalPopup";
							var option = "width = 600, height = 600, left = 100, top = 50, location=no";
							window.open(url, name, option)
						});
	</script>
</body>
</html>