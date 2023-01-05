<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기 검색창</title>
<link rel="stylesheet" type="text/css" href="/css/query.css" />

</head>
<body>
	<header> </header>

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
					<col style="width: 10%;" />
					<col style="width: 20%" />
					<col style="width: 30%;" />
					<col style="width: 15%;" />
					<col style="width: 15%;" />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col" style="padding-left: 1%;">번호</th>
						<th scope="col" style="padding-left: 1%;">카테고리</th>
						<th scope="col" style="padding-left: 1%;">제목</th>
						<th scope="col" style="padding-left: 1%;">작성자</th>
						<th scope="col" style="padding-left: 1%;">처리현황</th>
						<th scope="col" style="padding-left: 1%;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${count == 0}">
						<tr>
							<td colspan="5" id="none_post">문의페이지에 저장된 글이 없습니다.</td>
						</tr>
					</c:if>

					<c:forEach items="${qList}" var="query">
						<tr>
							<td><a href="query_view/${query.query_no}">${query.query_no}</a></td>
							<td>${query.category}</td>
							<td><a href="query_view/${query.query_no}">${query.query_title}</a></td>
							<td>${user.user_img}${query.id}</td>
							<td>${query.query_state}</td>
							<td><fmt:formatDate value="${query.query_date}"
									dateStyle="short" /></td>
						</tr>
					</c:forEach>


				</tbody>
			</table>

			<div id="paging" align="center">
				<c:if test="${begin > pageNum}">
					<a href="query_search?p=${begin-1}&search=${search}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin}" end="${end}" var='i'>
					<a href="query_search?p=${i}&search=${search}" class="page">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages}">
					<a href="query_search?p=${end+1}&search=${search}">[다음]</a>
				</c:if>
				<div id="write" align="right">
					<button type="button" class="query_write">
						<a href="query_write" id="button" class="query_write">글 쓰기</a>
					</button>
				</div>
			</div>
		</div>

</div>
		<div>
			<!-- 오른쪽 네비게이션 바 검색, 찜, 채팅 링크  -->
		</div>

		<footer> </footer>
</body>
</html>