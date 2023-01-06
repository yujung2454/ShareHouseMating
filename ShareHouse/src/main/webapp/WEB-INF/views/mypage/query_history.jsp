<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<link href="/css/mypage.css" rel="stylesheet">
<link href="/css/userinfo.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/css/list.css" />
</head>
<body>
<header>
</header>
<div class="fixed">
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
			<span id="login">
				<c:if test="${user == null}">
					<a href="/login">로그인</a>
				</c:if>
				<c:if test="${user != null}">
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
</div>
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
<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
	<h1>문의 내역</h1>
</div>
		<form method="post" action="/mypage/query_history">
	<div id = "board">
		<table class="table_list">
		<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
						<col style="width:20%;" />
						<col style="width:80%;" />
					</colgroup>
					<thead>
						<tr>
							<td scope="col" style="font-size:15px;"><input type="checkbox" id="cbx_chkAll"/>전체 선택</td>
							<td scope="col" style="font-size:15px;">문의 제목</td>
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
								<input type="checkbox" name="query_no" value="${query.query_no}"></td>
								<td><a href="/query_view/${query.query_no}">${query.query_title}</a></td>
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
		
		<div id="write" align="right">
			<input type = "submit" class="wish" id="del" value= "삭제">
		</div>
	</form>
</div>

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
		

function s_location(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	
	location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
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