<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 게시물 보기</title>
<style>
table {
	width:600px;
	height:30%;
	text-align:center;
	margin:auto;
}  
</style>
</head>
<body>
<h1 style="margin-left:200px;">모든 게시물 보기</h1>
<div>
<select id="select" name="select" onchange="change()" style="margin-left:200px; width:100px; height:30px">
<option value="all">전체보기</option>
<option value="commview">커뮤니티</option>
<option value="boardview">매물</option>
</select>
</div>
<div id="view">
<table border="1" >
<tr class="commline" bgcolor="#aaaaaa">
<td colspan='4'> 커뮤니티 </td>
</tr>
<tr class="commline" bgcolor="#dcdcdc">
<td width="150px">게시물 번호</td>
<td width="150px">아이디</td>
<td width="150px">제목</td>
<td width="150px">조회수</td>
</tr>
<c:forEach items="${cList1}" var="comm">
<tr class="commline">
<td><a href="community/community_view/${comm.comm_no}">${comm.comm_no}</a></td>
<td>${comm.id}</td>
<td><a href="community_view/${comm.comm_no}">${comm.comm_title}</a></td>
<td>${comm.comm_v_cnt}</td>
</tr>
</c:forEach>

<tr class="boardline" bgcolor="#aaaaaa">
<td colspan='4'> 매물 </td>
</tr>
<tr class="boardline" bgcolor="#dcdcdc">
<td width="150px">게시물 번호</td>
<td width="150px">아이디</td>
<td width="150px">제목</td>
<td width="150px">조회수</td>
</tr>
<c:forEach items="${cList2}" var="board">
<tr class="boardline">
<td><a href=" ${board.board_no}">${board.board_no}</a></td>
<td>${board.id}</td>
<td><a href=" ${board.board_no}">${board.title}</a></td>
<td>${board.v_cnt}</td>
</tr>
</c:forEach>
</table>
</div>
<div id="paging" align="center">
			<c:if test="${begin > pageNum}">
				<a href="allboardview?p=${begin-1}&sort=${sort}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end = "${end}" var='i'>
				<a href="allboardview?p=${i}&sort=${sort}" class="page">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages}">
				<a href="allboardview?p=${end+1}&sort=${sort}">[다음]</a>
			</c:if>
		</div>
		
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>

function change() {
	$("#select").change(function() {
		var select = $("#select option:selected").val();
		if(select == "commview") {
			$('.boardline').hide();
			$('.commline').show();
		}
		else if(select == "boardview") {
			$('.commline').hide();
			$('.boardline').show();
		}
		else{
			$('.commline').show();
			$('.boardline').show();
			}
	})
}

	
	
</script>
</body>
</html>