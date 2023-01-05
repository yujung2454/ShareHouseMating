<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리집</title>
</head>
<body>
	<h1 class="display-1">ACCESS-DENIED</h1>
	<h2>죄송합니다. 요청하신 페이지의 접근 권한이 없습니다.</h2>
	<p>
		방문하시려는 페이지의 접근 권한이 없습니다.
	</p>
	<button class="toMain" onclick="toMain()">홈으로</button>
</body>
<script>
function toMain(){
	location.href="/"
}
</script>
</html>
