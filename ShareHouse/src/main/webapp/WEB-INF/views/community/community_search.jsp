<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" type="text/css" href="/css/list.css" />
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
			<a href="community_list" class="community_list">커뮤니티</a>
		</div>
		<hr>
		<!-- 검색창 -->
		<div id="search_community" align="left">
			<form action="community_search">
				<input type="text" name="search" size="20" maxlength="225"
					placeholder="검색어를 입력하세요">
				<button type='submit' value="검색" class="search"></button>
			</form>
		</div>
		<!-- 공지 숨김 여부 -->
		<div id="notice_hide" align="right">
			<label> <input type="checkbox" name="notice" value="hide">
			공지숨기기</label>
		</div>
		<!-- 조회수/최신순 정렬 -->
		<div id="sequence" align="right">
			<!-- 여긴 모르겠으니 나중에 -->
			<form action="community_search" class="sequence_sort">
				<input type="hidden" name="search" value="${search}" /> <input
					type="hidden" name="sort" value="0"> <input type="submit"
					value="최신순" class="recent"/>
			</form>
			<form action="community_search" class="sequence_sort">
				<input type="hidden" name="search" value="${search}" /> <input
					type="hidden" name="sort" value="1"> <input type="submit"
					value="조회수 순" class="view"/>
			</form>
		</div>
		<div id="board">
			<table class="table_list">
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
								<td><a href="community_view	/${comm.comm_no}">${comm.comm_no}</a></td>
								<td><a href="community_view/${comm.comm_no}">★${comm.comm_title}</a></td>
								<td>${comm.id}</td>
								<td><fmt:formatDate value="${comm.comm_date}"
										dateStyle="short" /></td>
								<td>${comm.comm_v_cnt}</td>
							</tr>
						</c:forEach>
						<c:forEach items="${cList}" var="comm">
							<tr>
								<td><a href="community_view/${comm.comm_no}">${comm.comm_no}</a></td>
								<td><a href="community_view/${comm.comm_no}">${comm.comm_title}</a></td>
								<td>${comm.id}</td>
								<td><fmt:formatDate value="${comm.comm_date}"
										dateStyle="short" /></td>
								<td>${comm.comm_v_cnt}</td>
							</tr>
						</c:forEach>
					</c:if>

				</tbody>
			</table>

			<div id="paging" align="center">
				<c:if test="${begin > pageNum}">
					<a
						href="community_search?p=${begin-1}&search=${search}&sort=${sort}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var='i'>
					<a href="community_search?p=${i}&search=${search}&sort=${sort}"
						class="page">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages}">
					<a href="community_search?p=${end+1}&search=${search}&sort=${sort}">[다음]</a>
				</c:if>
			</div>

			<div id="write" align="right">
				<button type="button" class="community_write">
					<a href="community_write" id="button" class="community_write">글쓰기</a>
				</button>
			</div>
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

	<footer> </footer>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	$(document).ready(function(){
	    $("input:checkbox[name='notice']").change(function(){
			if($("input:checkbox[name='notice']").is(":checked")){
				$('.notice').hide();		
			}else{
				$('.notice').show();
			}	
		})
	})
</script>
</body>
</html>