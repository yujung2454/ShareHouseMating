<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 리스트</title>

<link rel="stylesheet" type="text/css" href="/css/list.css" />
</head>
<body>
<header>
</header>

<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
	<h1>문의리스트</h1>
</div>
	<!-- 검색창 -->
	<div id = "search" align="left">
		<form action="query_search">
		<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
			<input type="text" name="search" size="20" maxlength="225" placeholder = "검색어를 입력하세요">
			<button type='submit' value="검색" class="search"></button>
		</form>
	</div>
		<form method="post" action="/ad_query_list">
	<div id = "board">
		<table>
		<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
						<col style="width:10%;" />
						<col style="width:15%" />
						<col style="width:15%;" />
						<col style="width:45%;" />
						<col style="width:15%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" id="cbx_chkAll"/>전체 선택</th>
							<th scope="col">아이디</th>
							<th scope="col">카테고리</th>
							<th scope="col">제목</th>
							<th scope="col">처리현황</th>
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
								<input type="checkbox" name="query_no" value="${query.query_no}" class="chk">
								<td>${user.user_img} ${query.id}</td>
								<td>${query.category}</td>
								<td><a href="query_view/${query.query_no}">${query.query_title}</a></td>
								<td>${query.query_state}</td>
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
			<input type = "submit" class="query_write" id="del" value= " 삭제">
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
// 문의 글 삭제
/* $(function(){
	$("#del").click(function(){
		let query_no = $(".chk").val(); //..?히ㅏ핳
		alert("query_no"+query_no)
		/* $.ajax({url:"/delete", 
				data:"query_no="+query_no, 
				method:"post"
				}
		).done(function(){
			location.href="/ad_query_list";
		}) */
		return false;
	})//click
	

})//ready */
</script>
</body>
</html>