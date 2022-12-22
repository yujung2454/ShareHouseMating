<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>찾은 아이디 보여주기</title>
</head>

<style>
	* {box-sizing: border-box;}
	.container {margin: 0 auto; width: 700px;padding: 0 5%;}
	.title1 h1 {font-size: 28px;font-weight: 800;}
	.title1 .txt1 {font-size: 18px;}
	.btn_wrap {margin-top: 50px;}
	.btn_wrap .btn_type1 {background-color: #ddd;background-color: #ddd;font-size: 20px;font-weight: 700;display: inline-block;width: 100%;border: 1px solid #ddd;padding: 10px;border-radius: 4px;}
	.btn_wrap .btn_type1:not(:first-child) {margin-top: 15px;}
</style>

<body>
<div class="container">
	<div class="title1">
		<h1>아이디찾기</h1>
		<p class="txt1">요청하신 아이디는 ${fbe2}입니다.</p>
	</div>
	<div class="btn_wrap">
		<button type="button" onclick="location.href='/login'" class="btn_type1">로그인</button>
		<button type="button" onclick="location.href='/pwd_find'" class="btn_type1">비밀번호 찾기</button>
	</div>
</div>

</body>
</html>