<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
	<title>시큐리티 테스트</title>
</head>

<body>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<h1>관리자 권한을 가진 사용자를 위한 화면입니다.</h1>
	
	<a href="/baesoeun/loginSuccess">뒤로 가기</a>

	
		

		
		

		
	<form action="logout" method="get">
		<input type="submit" value="로그아웃"></input>
	</form>
</sec:authorize>
<sec:authorize access="hasRole('ROLE_MEMBER')">
회원만 보이는 화면
</sec:authorize>

</body>
</html>