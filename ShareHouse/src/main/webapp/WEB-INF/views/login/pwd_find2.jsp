<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {box-sizing: border-box;}
.container {margin: 0 auto; width: 700px;}
.title1 {position: relative;}
.title1 h1 {font-size: 28px;font-weight: 800;}
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
<body>
<div class="container">
	<div class="title1">
		<h1>비밀번호 찾기</h1>
	</div> <!-- action 변경 -->
	<form action="/update_pwd" method="post" id="findPwd2">
		<div class="tbl_type1">
			<p class="title2">비밀번호를 변경해주세요.<br>아이디: ${id}</p>
			<table>
				<tr>
					<td>
						<input type="hidden" name="id" value="${id }">
						<input name="pwd" id="pwd" placeholder="새 비밀번호를 입력해주세요">
						<div id="pwd_msg"></div>
					</td>
				</tr>
				<tr>
					<td>
						<input name="pwd_c" id="pwd_c" placeholder="새 비밀번호 확인">
						<div id="c_msg"></div>
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
	$(function(){
		$("#findPwd2").submit(function(){ //submit버튼에 이벤트를 넣어 줄 때
			let pwd = $("#pwd").val();
			let pwd_c = $("#pwd_c").val();
			if(!pwd){
				alert("새 비밀번호를 입력하세요.")
				return false;
			}
			
			if(!pwd_c){
				alert("새 비밀번호를 확인하세요.")
				return false;
			}
			
			if(pwd != pwd_c){
				alert("입력하신 새 비밀번호가 틀렸습니다.")
				return false;
			}else{
				alert("비밀번호가 변경되었습니다.")
			}
			
		 })
	})

</script>
</body>
</html>