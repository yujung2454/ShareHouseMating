<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 목록</title>

<link rel="stylesheet" type="text/css" href="/css/query.css" />
</head>
<body>
<header>
</header>

<div id="center">
		<!-- 게시글 리스트 테이블 -->
		<div id="title">
			<a href="query_list" class="query_list">문의하기</a>
		</div>
		<hr>
		<!-- 검색창 -->

			<div id="search_query" align="left">
				<form action="query_search">
					<input type="text" name="search" size="20" maxlength="225"
						placeholder="검색어를 입력하세요">
					<button type='submit' value="검색" class="search"></button>
				</form>
			</div>

		<div id="board">
			<table class="table_list">
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
							<td colspan="6" id="none_post">문의페이지에 저장된 글이 없습니다.</td>
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
			<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_ADMIN')">
				<button type="button" class="query_write">
					<a href="query_write" class="query_write">글 쓰기</a>
				</button>
			</sec:authorize>
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
		</div>
	</nav>

	<footer> </footer>


<script>

</script>
</body>
</html>