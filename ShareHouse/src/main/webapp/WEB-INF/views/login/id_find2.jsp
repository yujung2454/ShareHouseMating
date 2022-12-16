<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>찾은 아이디 보여주기</title>
</head>
<body>
<div class="container">
	<div class="title1">
		<h1>아이디찾기</h1>
		요청하신 아이디는 ${fbe2}입니다.
	</div>
	<button type="button" onclick="location.href='/login'">로그인</button>
	<button type="button" onclick="location.href='/pwd_find'">비밀번호 찾기</button>
</div>

</body>
</html>