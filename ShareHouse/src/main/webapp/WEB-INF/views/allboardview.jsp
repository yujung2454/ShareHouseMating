<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
<h1>모든 게시물 보기</h1>
<div>
<select name="board">
<option value="전체보기">전체보기</option>
<option value="개시물">게시물</option>
<option value="매물">매물</option>
</select>
</div>

<table border="1" >
<tr>
<td width="150px">게시물 번호</td>
<td width="150px">아이디</td>
<td width="150px">제목</td>
<td width="150px">조회수</td>
</tr>
<tr>
<td>${comm_no }</td>
<td>${id }</td>
<td>${comm_title }</td>
<td>${comm_v_cnt }</td>
</tr>
</table>
</body>
</html>