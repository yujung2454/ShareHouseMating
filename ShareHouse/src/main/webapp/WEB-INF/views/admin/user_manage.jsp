 <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width : 50%;
		align : center;
		border : 1px slide black;
	}
</style>
</head>
<body>
	<header> </header>

	<div id="board">
		<table>
			<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: 5%;" />
				<col style="width: 20%;" />
				<col style="width: 20%;" />
				<col style="width: 5%;" />
				<col style="width: 10%;" />
				<col style="width: 20%;" />
				<col style="width: 10%;" />
				<col style="width: 5%;" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col" style="padding-left: 1%;">ID</th>
					<th scope="col" style="padding-left: 1%;">이름</th>
					<th scope="col" style="padding-left: 1%;">Email</th>
					<th scope="col" style="padding-left: 1%;">전화번호</th>
					<th scope="col" style="padding-left: 1%;">성별</th>
					<th scope="col" style="padding-left: 1%;">주소</th>
					<th scope="col" style="padding-left: 1%;">상세주소</th>
					<th scope="col">활동상태</th>
					<th scope="col">추방</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${count == 0}">
					<tr>
						<td colspan="5" id="none_post">게시판에 저장된 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${count != 0}">
					<c:forEach items="${uList}" var="user">
						<tr>
							<td>${user.id}</td>
							<td>${user.name}</td>
							<td>${user.email}</td>
							<td>${user.tel}</td>
							<td>${user.gender}</td>
							<td>${user.user_add}</td>
							<td>${user.user_add2}</td>
							<td>${user.status}</td>
							<td><button class="drop_out"></button></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div id="paging" align="center">
			<c:if test="${begin > pageNum}">
				<a href="user_manage?p=${begin-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end = "${end}" var='i'>
				<a href="user_manage?p=${i}" class="page">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages}">
				<a href="user_manage?p=${end+1}">[다음]</a>
			</c:if>
		</div>
	</div>
			<footer> </footer>
</body>
</html>