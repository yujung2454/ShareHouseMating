<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
</head>
<style>
	#save{
		background-color : #4CAF50;	
		color : white;
		cursor : pointer;
		border-radius : 12px;
		width : 80px;
		height : 40px;
		border : none;
		outline : none;
		font-weight : bold;
	}
	#cancel{
		background-color : #8c8c91;	
		color : white;
		cursor : pointer;
		border-radius : 12px;
		width : 80px;
		height : 40px;
		border : none;
		outline : none;
		font-weight : bold;
	}
	h1{
	text-align : center;
	}
</style>
<body>
<header>
</header>

<div id="center">
<div id = "title">
	<h1>신고하기</h1>
</div>
<form method="post" id="writeform" action="/report_maemul2">
	<table border="1">
		<tr>
			<td class="report">
			<select name="category" id="sign1">
			<option value = "욕설&비방">욕설&비방</option>
			<option value = "나쁜 사람">나쁜 사람</option>
			<option value = "기타">기타</option>
			</select>
			</td>
		</tr>
		<tr>
			<td>신고 내용
			<textarea name="report_con" id="report_con" 
			rows="20" cols="10" 
			placeholder="내용을 입력해주세요"
			style="width : 700px" required="required"></textarea>
			</td>
		</tr>
	</table>
	<div id="button" align="center">
		<input type="hidden" name="reported_id" value="${communitydto.id}">
		<input type="hidden" name="board_no" value="${communitydto.comm_no}">
		<button type="button" id="cancel" value="취소" onclick="location.href='/re_cancle_popup'">취소</button>
		<button type="submit" id="save" value="제출">제출</button>
	</div>
</form>
</div>
<footer>
</footer>

</body>
</html>
