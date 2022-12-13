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
	<h1>커뮤니티</h1>
</div>
<hr>
<form id="viewpost">
<table border="1" class="table">
<tr>
<td>제목 : ${comm.comm_title}</td>
</tr>
<tr>
<td>
<pre><b>작성자 : ${comm.id}							작성일 : ${comm.comm_date}		조회수 : ${comm.comm_v_cnt}</b>
</pre>
</td>
</tr>
<tr height ="300">
<td>
${comm.comm_con}
</td>
</tr>
<tr>
<td> <button type="button" class="img-button">
<img src="https://w7.pngwing.com/pngs/6/367/png-transparent-comment-dots-regular-icon.png" width="20" height="20" alt="댓글">
</button>
댓글
</td>
</tr>

</table>
</form>
</body>
</html>