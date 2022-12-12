<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
</head>
<body>
	<h3>회원 가입을 환영합니다.</h3>
<form action="insert" method="post" id="joinform">
	<table>
		<tr><td>id</td><td><input name="id" id="id"></td></tr>
		<tr><td>password</td><td><input name="pwd" type="password" id="pwd"></td></tr>
		<tr><td>name</td><td><input name="name" id="name"></td></tr>
		<tr>
		<td colspan="2" align="center">
			<input type="button" value="로그인"/>
			<input type="submit" value="가입"
			onclick="location.href='/login/insert'" />
		</td>
		</tr>
	</table>
</form>
</body>
</html>