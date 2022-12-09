<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디/비밀번호 찾기</title>
</head>
<body>
<h3>아이디 찾기</h3>

<button type="button" onclick="location.href='/baesoeun/pwd_find'">
비밀번호찾기
</button> 
<br>
이메일로 인증
<br>
<input name="content" id="content" class="form-control" rows="10" 
placeholder="이름"
onfocus="placeholder=''" 
onblur="placeholder='이름'">
<br>
<input name="content" id="content" class="form-control" rows="10" 
placeholder="이메일"
onfocus="placeholder=''" 
onblur="placeholder='이메일'">
<button type="button" onclick="alert('인증되었습니다.')">인증</button>
<br>
<input name="content" id="content" class="form-control" rows="10" 
placeholder="인증번호"
onfocus="placeholder=''" 
onblur="placeholder='인증번호'">  


</body>
</html>