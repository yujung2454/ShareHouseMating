<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 내역</title>

<link rel="stylesheet" type="text/css" href="/css/list.css" />
</head>
<body>
<header>
</header>

<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
	<h1>찜 내역</h1>
</div>
<div id = "title2">
	<h2>찜${count}</h2>
</div>
		<form method="post" action="/wishlist">
	<div id = "board">
		<table>
		<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
						<col style="width:10%;" />
						<col style="width:90%;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" id="cbx_chkAll"/>전체 선택</th>
							<th scope="col">매물 제목</th>
						</tr>
					</thead>
					<tbody>
					
						<c:if test="${count == 0}">
							<tr>
								<td colspan="5" id="none_post">찜 내역에 저장된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${count != 0}">
							<c:forEach items="${wList}" var="wish">
							<tr>
								<td>
								<input type="checkbox" name="board_no" value="${wish.board_no}"></td>
								<td><a href="/offer/detail_info/${wish.board_no}">${wish.title}</a></td>
							</tr>
							</c:forEach>
						</c:if>
						
					</tbody>
		</table>

		<div id="paging" align="center">
			<c:if test="${begin > pageNum}">
				<a href="wishlist?p=${begin-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end = "${end}" var='i'>
				<a href="wishlist?p=${i}" class="page">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages}">
				<a href="wishlist?p=${end+1}">[다음]</a>
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
				if($("#cbx_chkAll").is(":checked")) $("input[name=board_no]").prop("checked", true);
				else $("input[name=board_no]").prop("checked", false);
			});
			
			$("input[name=board_no]").click(function() {
				var total = $("input[name=board_no]").length;
				var checked = $("input[name=board_no]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});
</script>
</body>
</html>