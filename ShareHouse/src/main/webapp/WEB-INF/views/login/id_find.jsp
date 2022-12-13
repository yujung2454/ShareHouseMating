<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디/비밀번호 찾기</title>
</head>
<style>

</style>
</head>
<body>
<h1>아이디 찾기</h1>
<form action="/manager" method="post" id="joinForm">
	<table >
		<tr><td>name</td><td><input name="name" id="name">
		<div id="name_msg"></div></td></tr>
		<tr><td>email</td><td><input name="email" id="email">
		<input type="button" id="mail_ck" value="메일 인증">
		<div id="emailresult"></div>
		<div id="input"><input name="certification" id="ck_num"> 
		<input type="button" id="ck_b" value="인증 확인"></div>
		<div id="result"></div>
		</td></tr>
		<tr><td colspan="2"><input type="submit" value="확인"></td></tr>
	</table>
	
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	let num ="";
	$(function(){
		 $("#mail_ck").click(function(){
			 let email = $("#email").val();
			if(!email){
					$("#result").css("display","block").html("메일 주소를 입력하세요");	
					return false;
				}
			
		 $.ajax({url:"/send",
			 	data:"emailAddress="+email,
				dataType:"json"}
			).done(function(data){
				if(eval(data[1])){
					num = data[0];
					alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
					$("#input,#result").css("display","block");
				}
			}); 
		}) 
		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			if(ck_num == num){
				alert("인증에 성공했습니다.")
				$("#result").append("<input type='hidden' id='ck' value='1'>");
			}else{
				alert("인증에 실패했습니다. 다시 확인하세요.")
			}
		})
		
	})

</script>

</body>
</html>