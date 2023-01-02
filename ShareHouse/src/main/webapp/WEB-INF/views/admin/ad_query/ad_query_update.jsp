<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
<td>
<pre><b>제목 : ${dto.query_title}							카테고리 : ${dto.category}</b>
</pre>
</td>
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
	<form method="post" action="/insert/answer/${dto.query_no}">
	<input name="answer" id="answer" >${dto.answer}
	<button type="submit">답변 등록</button>
	</form>
		<button type="button" onclick="location.href='/query_view/${query_no}'">취소</button>

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