<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
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
<header>
</header>

<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
	<h1>문의하기</h1>
</div>
<form method="post" id="writeform" action="query_write">
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<table border="1">
		<tr>
			<td class="subject">제목 : <input name="query_title" placeholder="제목을 입력해주세요" size="90" maxlength="100" required="required"/></td>
		</tr>
		<tr>
			<td class="user">작성자 : ${user.user_Img} ${user.id}
			<input type = "hidden" name="id" value="${user.id}"  >
			
			<select name="category" id="sign1">
			<option value = "매물 관련">매물 관련</option>
			<option value = "계약 관련">계약 관련</option>
			<option value = "커뮤니티 관련">커뮤니티 관련</option>
			<option value = "기타">기타</option>
			</select>
			</td>
		</tr>
		<tr>
			<td class="user">휴대전화 : 
			<input name="tel" value="${user.tel}"  ></td>
		</tr>
		<tr>
			<td class="user">이메일 : 
			<input name="email" value="${user.email}"  ></td>
		</tr>
		<tr>
			<td><textarea name="query" id="query" 
			rows="20" cols="10" 
			placeholder="내용을 입력해주세요"
			style="width : 700px" required="required"></textarea>
			</td>
		</tr>
	</table>
	<div id="button" align="center">
		<button type="submit" id="save" value="완료">완료</button>
		<button type="button" id="cancel" value="취소" onclick="location.href='query_list'">취소</button>
		<button type="button" id="list" value="목록으로" onclick="location.href='query_list'">목록으로</button>
	</div>
</form>
</div>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	//let title = $(#title).val();
	$(document).onclick('#save', function(e){
		const title = $("#title").val().trim();
		const content = $("content").val().trim();
		
		if(title==""){
			alert("제목을 입력해주세요");
			return;
		}
		if(content=""){
			alert("내용을 입력해주세요");
			return;
		}
		
		var 
	})

</script>
 -->
<footer>
</footer>

</body>
</html>