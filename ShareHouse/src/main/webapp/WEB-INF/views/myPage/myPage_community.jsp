<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="/css/quick.css" rel="stylesheet">
</head>
<body>
<header>
<div id="uppernav">
		<div id="main">
			<span id="home_img" class="to_main" ><a href="/"><img src="/images/home.png"></a></span>
			<span id="home" class="to_main"><a href="/">우리집</a></span>
		</div>
		<ul class="upper_frame">
			<li class="upper_menu"><a href="/introduce/introduce">쉐어하우스란?</a></li>
			<li class="upper_menu" onclick="s_location()" style="cursor:pointer">방 찾기</li>
			<li class="upper_menu"><a href="/registration/registration_first">매물 등록</a></li>
			<li class="upper_menu"><a href="/community/community_list">커뮤니티</a></li>
			<li class="upper_menu"><a href="/query_list">문의</a></li>
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
					<a href="/logout" class="logout">로그아웃</a>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<a href="/admin/admin_main">관리자페이지</a>
					</sec:authorize>
				</c:if>
			</span>
		</div>
	</div>
</header>
<input type="hidden" name = "id" value="${user.id }">
	<h1>내 게시물 보기</h1>
	<div>
		<select id="select" name="select" onchange="change()">
			<option value="all">전체보기</option>
			<option value="commview">커뮤니티</option>
			<option value="boardview">매물</option>
			<option value="commentview">댓글</option>
		</select>
	</div>
	<div id="view">
		<table border="1" class="table_community">
			<tr>
				<td colspan='4'>커뮤니티</td>
			</tr>
			<tr>
				<th width="150px"><input type="checkbox" id="cbx_chkAll"/>전체 선택</th>
				<th width="150px">아이디</th>
				<th width="150px">제목</th>
				<th width="150px">조회수</th>
			</tr>
			<c:forEach items="${mList}" var="comm">
				<tr class="commline">
					<td><input type="checkbox" name="user_select" /></td>
					<td>${user.id}</td>
					<td><a href="community_view/${comm.comm_no}">${comm.comm_title}</a></td>
					<td>${comm.comm_v_cnt}</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan='4'>매물</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="user_select" value ="${user.id }" /></td>
				<td width="150px">아이디</td>
				<td width="150px">제목</td>
				<td width="150px">조회수</td>
			</tr>
			<c:forEach items="${oList}" var="offering">
				<tr class="boardline">
					<td><a href=" ${offering.board_no}">${offering.board_no}</a></td>
					<td>${offering.id}</td>
					<td><a href=" ${offering.board_no}">${offering.title}</a></td>
					<td>${offering.v_cnt}</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan='4'>댓글</td>
			</tr>
			<tr>
				<td><input type="checkbox" name="user_select" value ="${user.id }" /></td>
				<td width="150px">아이디</td>
				<td width="150px">제목</td>
				<td width="150px">조회수</td>
			</tr>
			<c:forEach items="${cList}" var="board">
				<tr class="comment">
					<td><a href=" ${board.comment_no}">${board.comment_no}</a></td>    
					<td>${board.id}</td>
					<td><a href=" ${board.comment_no}">${board.comment_con}</a></td>
					<td><fmt:formatDate value="${board.comment_date}" pattern="mm/dd"/> </td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="paging" align="center">
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
	
	<nav>
<div class="quick">
	<div class="quick_shape">
		<a href="/search/searchlist">
			<img src="/images/search.png" title="검색">
		</a>
	</div>
	<div class="quick_shape">
		<a href="">
			<img src="images/like.png" title="찜">
		</a>
	</div>
	<div class="quick_shape">
		<a href="">
			<img src="images/chat.png" title="채팅">
		</a>
	</div>
</div>
</nav>
<footer>
</footer>
	
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

	<script>
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
				} else if (select == "commentview"){
					$('.commline').hide();
					$('.boardline').hide();
					$('.comment').show();
					
				}
				else{
					$('.commline').show();
					$('.boardline').show();
					$('.comment').show();
				}
			})
		}
	</script>
</body>
</html>