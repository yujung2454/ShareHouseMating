<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<style>
	#chooseFile {
    	visibility: hidden;
	}
	table {
		width: 800px;
		height: 400px;
		margin-left: 50px;
	}
	img-button {
		width:20;
		height:20;
	
	}
	textarea {
		width:100%;
		height:100%;
		border: 0;
		resize: none;
	}
</style>
</head>
<body>

<div id = "title">
	<h1>문의하기</h1>
</div>
<hr>
<form id="viewpost">
<table border="1" class="table">
<tr>
<td>제목 : ${dto.query_title}</td>
</tr>
<tr>
<td>
<pre><b>작성자 : ${dto.id}							작성일 : ${dto.query_date}</b>
</pre>
</td>
</tr>
<tr height ="300">
<td>
${dto.query}
</td>
</tr>

</table>
</form>
		<c:if test="${dto.id == user.id }">
		<a href="/query_update/${dto.query_no}">글 수정 </a> 
		<a id="${dto.query_no}" href="#">글 삭제</a>
		</c:if>
		<button type="button" onclick="location.href='/query_list'">목록으로</button>
<%-- <div>
	<div id="comment">
	<c:forEach items="${commentList}" var="comm">
		<div>${dto.id} / <fmt:formatDate value="${dto.comment_date }" dateStyle="short"/></div>
		<div>${dto.comment_con} 
		<c:if test="${dto.id == user.id }">
		<button class="dbtn" id="${dto.comment_no}">삭제</button>
		</c:if>
		</div>
		<hr>
	</c:forEach>
	</div>
	<input name="content" id="content"><button id="add">등록</button>
</div> --%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let query_no = $(this).attr("id");
			$.ajax({url:"/delete", 
					data:"query_no="+query_no, 
					method:"delete"
					}
			).done(function(){
				location.href="/query_list";
			})
			return false;
		})//click
		
	
	})//ready

</script>
</body>
</html>