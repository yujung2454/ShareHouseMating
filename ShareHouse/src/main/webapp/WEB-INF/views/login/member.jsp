<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
	<title>시큐리티 테스트</title>
</head>
<body>
	<h1>로그인 성공한 사용자만 접근할 수 있는 화면입니다.</h1>
	
		<h2>
		로그인 id :
		<sec:authentication property = "principal.users.Status"/><br>
		<sec:authorize access = "!isAuthenticated()">
		Login<br>
		</sec:authorize>
		<sec:authorize  access = "isAuthenticated()">
		Logout<br>
		</sec:authorize>
		권한 : 
		
	</h2>
	
	
	<a href="/login/loginSuccess">뒤로 가기</a></body>
</html>