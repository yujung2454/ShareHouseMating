<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̵�/��й�ȣ ã��</title>
</head>
<style>

</style>
</head>
<body>
<h1>���̵� ã��</h1>
<form action="/manager" method="post" id="joinForm">
	<table >
		<tr><td>name</td><td><input name="name" id="name">
		<div id="name_msg"></div></td></tr>
		<tr><td>email</td><td><input name="email" id="email">
		<input type="button" id="mail_ck" value="���� ����">
		<div id="emailresult"></div>
		<div id="input"><input name="certification" id="ck_num"> 
		<input type="button" id="ck_b" value="���� Ȯ��"></div>
		<div id="result"></div>
		</td></tr>
		<tr><td colspan="2"><input type="submit" value="Ȯ��"></td></tr>
	</table>
	
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	let num ="";
	$(function(){
		 $("#mail_ck").click(function(){
			 let email = $("#email").val();
			if(!email){
					$("#result").css("display","block").html("���� �ּҸ� �Է��ϼ���");	
					return false;
				}
			
		 $.ajax({url:"/send",
			 	data:"emailAddress="+email,
				dataType:"json"}
			).done(function(data){
				if(eval(data[1])){
					num = data[0];
					alert("������ ���۵Ǿ����ϴ�. ������ȣ�� �Է��ϼ���.")
					$("#input,#result").css("display","block");
				}
			}); 
		}) 
		$("#ck_b").click(function(){
			let ck_num = $("#ck_num").val();
			if(ck_num == num){
				alert("������ �����߽��ϴ�.")
				$("#result").append("<input type='hidden' id='ck' value='1'>");
			}else{
				alert("������ �����߽��ϴ�. �ٽ� Ȯ���ϼ���.")
			}
		})
		
	})

</script>

</body>
</html>