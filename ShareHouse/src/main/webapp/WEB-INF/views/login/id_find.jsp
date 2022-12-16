<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
</head>
<style>
* {box-sizing: border-box;}
.container {margin: 0 auto; width: 700px;}
.title1 {position: relative;}
.title1 h1 {font-size: 28px;font-weight: 800;}
.title1 .btn_pw_find {position: absolute;right: 0;top: 50%;transform: translateY(-50%);}
.title1 .btn_pw_find button {color: #fff;background-color: #555;border: none;padding: 10px;border-radius: 4px;font-size: 14px;}
.tbl_type1 {margin: 30px auto 0; width: 60%;}
.tbl_type1 .title2 {font-size: 18px;font-weight: 600;}
.tbl_type1 table {width: 100%;}
.tbl_type1 td {padding: 8px 0;}
.tbl_type1 input {width: 100%; display: inline-block;border: 1px solid #ddd;padding: 10px;border-radius: 4px;font-size: 14px;}
.tbl_type1 input[type="button"], .tbl_type1 input[type="submit"] {background-color: #ddd;}
.tbl_type1 input::placeholder {color: #555;}
.tbl_type1 .inp_bundle input{ width: 80%;display: inline-block;}
.tbl_type1 .inp_bundle input[type="button"]{ width: calc(20% - 6px);}
</style>
</head>
<body>
<div class="container">
	<div class="title1">
		<h1>아이디찾기</h1>
		<div id="pwd_find" class="btn_pw_find"><button type="button" onclick="location.href='/pwd_find'">비밀번호 찾기</button></div>
	</div>
	<form action="/id_find2" method="post" id="findId">
		<div class="tbl_type1">
			<p class="title2">이메일로 인증</p>
			<table>
				<tr>
					<td>
						<input name="name" id="name" placeholder="이름">
						<div id="name_msg"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="inp_bundle">
							<input name="email" id="email" placeholder="이메일 주소">
							<input type="button" id="mail_ck" value="인증">
						</div>
						<div id="emailresult"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div id="input">
							<input name="certification" id="ck_num" placeholder="인증번호"> 
						</div>
					</td>
				</tr>
				<tr>
					<td> 
						<input type="submit" id="ck_b" value="확인">
					</td>
				</tr>
			</table>
		</div>
		
	</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	let num ="";
	$(function(){
		 $("#mail_ck").click(function(){
			 let email = $("#email").val(); //폼에서 입력 받아와야할 데이터(email)
			if(!email){ // 폼에서 입력한 email값이 없으면
				alert("이메일을 입력하세요.")
				return false;
			}
		
			let name = $("#name").val();	
			if(!name){
				alert("이름을 입력하세요.")
				return false;
			}
			//name 받아오고
			// 컨트롤러 만들어서 메일주소 받아와서 있으면 아래 부분 실행하고 아니면 아무 동작 없게 if로 만들어... 
			
		
		 	$.ajax({
				url: "/id_find_email", //요청하면 이 url에 맞는 컨트롤러가 작동
				data: "emailAddress="+email+"&name="+name // 받아올 데이터
			}).done(function(resp){ // --> 전달받은 데이터 사용
				if(resp == ""){ // 서버에서 null값을 받아올 때는 빈문자열로 받아옴 (일반 데이터는 문자열로 받아오는데 null은 "null"이 되면 안됨)
					alert("이름 혹은 메일 주소 틀림");
				}else{
					$.ajax({url:"/send",
					 	data:"emailAddress="+email,
						dataType:"json"}
					).done(function(data){
						if(eval(data[1])){
							num = data[0];
							alert("메일이 전송되었습니다. 인증번호를 입력하세요.")
						}
					}); 
					
				}
			}) 
		 }) 	
			
		$("#findId").submit(function(){ //submit버튼에 이벤트를 넣어 줄 때
			let ck_num = $("#ck_num").val();
			if(!ck_num){
				alert("인증번호를 입력하세요.")
				return false;
			}
			if(ck_num == num){
				alert("인증에 성공했습니다.")
				//$("#result").append("<input type='hidden' id='ck' value='1'>");
			}else{
				alert("인증에 실패했습니다. 다시 확인하세요.")
				return false;
			}
			
		 }) 
	})

</script>

</body>
</html>