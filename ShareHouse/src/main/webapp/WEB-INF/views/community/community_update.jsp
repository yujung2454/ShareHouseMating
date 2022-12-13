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
	#save {
		background-color : #4CAF50;	
	}
	#cancel{
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
	<h2>글 수정</h2>
</div>
<form method="" id="" action="">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<table border="1">
		<tr>
			<td class="subject">제목 :
			<input name="Comm_title" placeholder="제목을 입력해주세요" size="90" maxlength="100" required="required"/></td>
		</tr>
		<tr>
			<td class="user">작성자 : 
			<input name="id" value="${user.user_img} ${user.id}" readonly ></td>
		</tr>
		<tr>
			<td><textarea name="Comm_con" id="content" 
			rows="20" cols="10" 
			placeholder="내용을 입력해주세요"
			style="width : 700px" required="required"></textarea>
			</td>
		</tr>
	</table>
	<div id="button" align="center">
		<button type="submit" id="save" value="수정">수정</button>
		<button type="button" id="cancel" value="취소" onclick="location.href='community_list'">취소</button>
	</div>
</form>
</div>

</body>
</html>