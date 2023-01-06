	<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 게시물 보기</title>
<style>
table {
	width: 600px;
	height: 30%;
	text-align: center;
	margin: auto;
}
</style>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<link href="/css/mypage.css" rel="stylesheet">
<link href="/css/userinfo.css" rel="stylesheet">
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
							  <a href="/admin/admin_notice">관리자페이지</a>
						</sec:authorize>
					</c:if>
				</span>
			</div>
		</div>
	</header>
	
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
	<input type="hidden" name="id" value="${user.id }">
	<h1 style="margin-left:350px;">내 게시물 보기</h1>
	<div>
		<select id="select" name="select" onchange="change()" style="margin-left:3e50px; margin-bottom:10px; width:100px; height:30px">
			<option value="all">전체보기</option>
			<option value="commview">커뮤니티</option>
			<option value="boardview">매물</option>
			<option value="commentview">댓글</option>
		</select>
	</div>
	<div id="view">
		<table border="1" class="table_community">
			<tr bgcolor="#aaaaaa">
				<th colspan='4' style="text-align:center; font-size:20px;">커뮤니티</th>
			</tr>
			<tr bgcolor="#dcdcdc">
				<td width="150px">번호</td>
				<td width="150px">아이디</td>
				<td width="150px">제목</td>
				<td width="150px">조회수</td>
			</tr>
			<c:forEach items="${mList}" var="comm">
				<tr class="commline">
					<td><a href="/community/community_view/${comm.comm_no}">${comm.comm_no}</a></td>
					<td>${user.id}</td>
					<td><a href="/community/community_view/${comm.comm_no}">${comm.comm_title}</a></td>
					<td>${comm.comm_v_cnt}</td>
				</tr>
			</c:forEach>
		</table>
		<table border="1">
			<tr bgcolor="#aaaaaa">
				<th colspan='4' style="text-align:center; font-size:20px;">매물</th>
			</tr>
			<tr bgcolor="#dcdcdc">
				<td width="150px">번호</td>
				<td width="150px">아이디</td>
				<td width="150px">제목</td>
				<td width="150px">조회수</td>
			</tr>
			<c:forEach items="${oList}" var="offering">
				<tr class="boardline">
					<td><a href="/offer/detail_info/${offering.board_no}">${offering.board_no}</a></td>
					<td>${offering.id}</td>
					<td><a href="/offer/detail_info/${offering.board_no}">${offering.title}</a></td>
					<td>${offering.v_cnt}</td>
				</tr>
			</c:forEach>
		</table>
		<table border="1">
			<tr bgcolor="#aaaaaa">
				<th colspan='4' style="text-align:center; font-size:20px;">댓글</th>
			</tr>
			<tr bgcolor="#dcdcdc">
				<td width="150px">번호</td>
				<td width="150px">아이디</td>
				<td width="150px">제목</td>
				<td width="150px">날짜</td>
			</tr>
			<c:forEach items="${cList}" var="board">
				<tr class="comment">
					<td><a href="/community/community_view/${board.comm_no}">${board.comment_no}</a></td>
					<td>${board.id}</td>
					<td><a href="/community/community_view/${board.comm_no}">${board.comment_con}</a></td>
					<td><fmt:formatDate value="${board.comment_date}"
							pattern="mm/dd" /></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="paging" class="paging" align="center">
		<c:if test="${begin > pageNum}">
			<a href="myPage_community?p=${begin-1}">[이전]</a>
		</c:if>
		<c:forEach begin="${begin}" end="${end}" var='i'>
			<a href="myPage_community?p=${i}" class="page">${i}</a>
		</c:forEach>
		<c:if test="${end < totalPages}">
			<a href="myPage_community?p=${end+1}">[다음]</a>
		</c:if>
	</div>

	<footer> </footer>

	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

	<script>
	function s_location(){
		navigator.geolocation.getCurrentPosition(function(pos) {
		    var latitude = pos.coords.latitude;
		    var longitude = pos.coords.longitude;
		
		location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
		})
	}

		function change() {
			$("#select").change(function() {
				var select = $("#select option:selected").val();
				if (select == "commview") {
					$('.boardline').hide();
					$('.commline').show();
					$('.comment').hide();
					console.log('aaa');

				} else if (select == "boardview") {
					$('.commline').hide();
					$('.boardline').show();
					$('.comment').hide();
				} else if (select == "commentview") {
					$('.commline').hide();
					$('.boardline').hide();
					$('.comment').show();

				} else {
					$('.commline').show();
					$('.boardline').show();
					$('.comment').show();
				}
			})
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
