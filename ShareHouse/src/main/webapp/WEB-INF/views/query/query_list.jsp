<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 목록</title>

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
				<span id="notification"><img src="/images/notification.png"></span>
				<span id="login"> <c:if test="${user == null}">
						<a href="/login">로그인</a>
					</c:if> <c:if test="${user != null}">
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

<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
	<h1>문의하기</h1>
</div>
<hr>
	<!-- 검색창 -->
	
	<div id = "search" align="left">
		<form action="query_search">
		<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
			<input type="text" name="search" size="20" maxlength="225" placeholder = "검색어를 입력하세요">
			<button type='submit' value="검색" class="search"></button>
		</form>
	</div>
	<div id = "board">
		<table>
		<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
						<col style="width:10%;" />
						<col style="width:20%" />
						<col style="width:30%;" />
						<col style="width:15%;" />
						<col style="width:15%;" />
						<col style="width:10%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">처리현황</th>
							<th scope="col">작성일</th>
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
								<td><a href="query_view/${query.query_no}">${query.query_no}</a></td>
								<td>${query.category}</td>
								<td><a href="query_view/${query.query_no}">${query.query_title}</a></td>
								<td>${user.user_img} ${query.id}</td>
								<td>${query.query_state}</td>
								<td><fmt:formatDate value="${query.query_date}" dateStyle="short" /></td>
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
			<button type = "button" class="query_write">
				<a href="query_write" class="query_write">글 쓰기</a>
			</button>
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
			<div class="quick_shape">
				<a href=""> <img src="images/chat.png" title="채팅">
				</a>
			</div>
		</div>
	</nav>
</body>
</html>