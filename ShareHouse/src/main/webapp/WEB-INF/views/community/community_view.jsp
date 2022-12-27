<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<link href="/css/community_view.css" rel="stylesheet">
</head>
<body>

<div id = "title">
	<h1>커뮤니티</h1>
</div>
<hr>
<form id="viewpost">
<table border="1" class="table">
<tr>
<td>제목 : ${dto.comm_title}</td>
</tr>
<tr>
<td>
<pre><b>작성자 : ${dto.id}							작성일 : ${dto.comm_date}		조회수 : ${dto.comm_v_cnt}</b>
</pre>
</td>
</tr>
<tr height ="300">
<td>
${dto.comm_con}
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