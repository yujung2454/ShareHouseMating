<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#center {
		width : 55%;
		margin : auto;
	}
	button{
		cursor : pointer;
		border-radius : 12px;
		width : 90px;
		height : 45px;
		border : none;
		outline : none;
		font-weight : bold;
		color : white;
	}
	
	table{
		width : 80%;
		margin:auto;
		border-collapse : collapse;
	}
	input, textarea {
		border : none;
	}
	input:focus, textarea:focus {
		outline-style : none;
	}
	.subject , .user{
		height : 40px;
	}
	#button {
		margin-top : 30px;
	}
	.save {
		background-color : #4CAF50;	
	}
	.cancel{
		background-color : #e7e7e7; color : black;
	}
	#list{
		background-color : #555555;
	}
</style>
</head>
<body>

<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
	<h1>문의하기</h1>
</div>
<form method="post" id="update" action="/query_update">
<%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
 <input type="hidden" name="_method" value="put">
	<table border="1">
		<tr>
			<td class="subject">제목 :
			<input name="query_title" value="${dto.query_title}" size="90" maxlength="100" required="required"/>
			<input type="hidden" name="query_no" value="${dto.query_no}" /> </td>
		</tr>
		<tr>
			<td class="user">작성자 : 
			<input name="id" value="${user.user_img} ${dto.id}"> <!-- readonly  --></td>
		</tr>
		<tr>
			<td><textarea name="query" id="content" 
			rows="20" cols="10" 
			style="width : 700px" required="required"> ${dto.query} </textarea>
			</td>
		</tr>
	</table>
	<div id="button" align="center">
		<button class="save" value="완료">완료</button>
		<button type="button" class="cancel" value="취소" onclick="location.href='/query_list'">취소</button>
	</div>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
<!--$(document).ready(function(){

	$("#save").click(function(){)
		$("#update").submit();
		});-->
</script>
</body>
</html>