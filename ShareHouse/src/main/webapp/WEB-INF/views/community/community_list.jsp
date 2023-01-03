<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/list.css" />

</head>
<body>
<header>
</header>

<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
	<a href="community_list" class="community_list">커뮤니티</a> 	
</div>
	<!-- 검색창 -->
	<div id = "search" align="left">
		<form action="community_search">
		<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
			<input type="text" name="search" size="20" maxlength="225" placeholder = "검색어를 입력하세요">
			<button type='submit' value="검색" class="search"></button>
		</form>
	</div>
	<!-- 공지 숨김 여부 -->
	<div id = "notice_hide" align="right">
		<label>
		<input type = "checkbox" name="notice" value="hide" onclick="getCheckboxValue()">
		공지숨기기</label>
	</div>
	<!-- 조회수/최신순 정렬 -->
	<div id = "sequence" align="right">
		<!-- 여긴 모르겠으니 나중에 -->
		<form action="community_list">
		<input type="hidden" name="sort" value="0">
		<input type="submit" value="최신순" />
		</form>
		<form action="community_list">
		<input type="hidden" name="sort" value="1">
		<input type="submit" value="조회수 순" />
		</form> 
		
		<!-- <form action="community_list">
			<select name="sort">
				<option value="0">최신순</option>
				<option value="1">조회수순</option>
			</select>
			<input type="submit" value="검색" />
		</form> -->
	</div>
	<div id = "board">
		<table>
		<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
						<col style="width:10%;" />
						<col style="width:40%"/>
						<col style="width:20%;" />
						<col style="width:20%;" />
						<col style="width:10%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
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
							<c:forEach items="${cList}" var="comm">
							<tr>
								<td><a href="community_view/${comm.comm_no}">${comm.comm_no}</a></td>
								<td><a href="community_view/${comm.comm_no}">${comm.comm_title}</a></td>
								<td>${user.user_img} ${comm.id}</td>
								<td><fmt:formatDate value="${comm.comm_date}" dateStyle="short" /></td>
								<td>${comm.comm_v_cnt}</td>
							</tr>
							</c:forEach>
						</c:if>
						
					</tbody>
		</table>

		<div id="paging" align="center">
			<c:if test="${begin > pageNum}">
				<a href="community_list?p=${begin-1}&sort=${sort}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end = "${end}" var='i'>
				<a href="community_list?p=${i}&sort=${sort}" class="page">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages}">
				<a href="community_list?p=${end+1}&sort=${sort}">[다음]</a>
			</c:if>
		</div>
	</div>	
		<div id="write" align="right">
			<button type = "button" class="community_write">
				<a href="community_write" class="community_write">글 쓰기</a>
			</button>
		</div>
	
</div>

<div>
<!-- 오른쪽 네비게이션 바 검색, 찜, 채팅 링크  -->
</div>

<footer>
</footer>
</body>
</html>