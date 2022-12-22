<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
</head>
<style>
	* {box-sizing: border-box;}
	.container {margin: 0 auto; width: 700px;}
	.title1 {position: relative;}
	.title1 h1 {font-size: 28px;font-weight: 800;}
	.tbl_type1 {margin: 30px auto 0; width: 80%;}
	.tbl_type1 table {width: 100%;}
	.tbl_type1 td {padding: 8px 0;line-height: 30px;font-size: 14px;}
	.tbl_type1 input::placeholder {color: #555;}
	.tbl_type1 .inp1 {width: 100%; display: block;border: 1px solid #ddd;padding: 10px;border-radius: 4px;font-size: 14px;background-color: #fff;min-height: 40px;}
	.tbl_type1 .btn1 {width: 100%; display: block;border: 1px solid #ddd;background-color: #ddd;padding: 10px;border-radius: 4px;font-size: 14px;min-height: 40px;}
	.tbl_type1 .btn2 {background-color: #ddd;font-size: 20px;font-weight: 700;width: 100%; display: inline-block;border: 1px solid #ddd;padding: 10px;border-radius: 4px;margin-top: 50px;}
	.tbl_type1 .inp_type1 {overflow: hidden;clear: both;}
	.tbl_type1 .inp_type1 .inp1 {width: 70%;float: left;}
	.tbl_type1 .inp_type1 .btn1 {width: 29%; float: right;}
	.tbl_type1 .inp_tit1 {font-size: 14px;margin: 0 0 10px;}

	.mt_10 {margin-top: 5px;}
</style>

<body>
<div class="container">
	<div class="title1"><h1>회원가입</h1></div>
	<form action="/insert" id="insert" method="post">
		<div class="tbl_type1">
			<table align="center" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<p class="inp_tit1">아이디</p>
						<div class="inp_type1">
							<input name="id" id="id" class="inp1"/>
							<input type="button" id="id_check" value="중복확인" class="btn1">
						</div>
						<div id="id_msg"></div>
					</td>
				</tr>
				<tr>
					<td>
						<p class="inp_tit1">비밀번호</p>
						<input type="password" name="pwd" id="pwd" class="inp1"/>
					</td>
				</tr>
				<tr>
					<td>
						<p class="inp_tit1">비밀번호 확인</p>
						<input type="password" name="pwd_check" id="pwd_check" class="inp1"/>
					</td>
				</tr>
				<tr>
					<td>
						<p class="inp_tit1">이름</p>
						<input name="name" id="name" class="inp1"/>
					</td>
				</tr>
				<tr>
					<td>
						<p class="inp_tit1">성별</p>
						<div class="radio_bundle">
							<span class="radio">
								<input type="radio" id="man" name="gender" value = "남성">                                         
								<label for="man"><span>남성</span></label>
							</span>
							<span class="radio">
								<input type="radio" id="woman" name="gender" value = "여성">                                         
								<label for="woman"><span>여성</span></label>
							</span>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<p class="inp_tit1">이메일</p>
						<div class="inp_type1">
							<input name="email" id="email" class="inp1"/>
							<input type="button" id="mail_ck" value="인증 하기" class="btn1">
						</div>
						<div id="input" class="inp_type1 mt_10">
							<input id="ck_num" placeholder="인증번호를 입력하세요." class="inp1"> 
							<input type="button" id="ck_b" value="인증 확인" class="btn1">
						</div>
						<div id="result"></div>
					</td>
				</tr>
				<tr>
					<td>
						<p class="inp_tit1">주소</p>
						<div class="inp_type1">
							<input name="user_add" id="address" class="inp1"/>
							<input type="button" id="find_ad" value="주소 찾기" onclick = "addPost()" class="btn1">
						</div>
						<input name="user_add2" id="user_add2" placeholder="상세주소를 입력하세요." class="inp1 mt_10">
					</td>
				</tr>
				<tr>
					<td>
						<p class="inp_tit1">휴대전화</p>
						<input name="tel" maxlength="13" id="tel" class="inp1"/>
					</td>
				</tr>
			</table>
			<input type="submit" class="btn2" value="가입하기"/>
		</div>
	</form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            	document.querySelector("#address").value = data.address;
        }
    }).open();
}    


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
				//$("#input,#result").css("display","block");
			}
		}); 
	}) 
	$("#ck_b").click(function(){
		let ck_num = $("#ck_num").val();
		if(!ck_num){
			alert("인증번호를 입력하세요.")
			return false;
		}
		if(ck_num == num){
			$("#result").html("인증이 확인되었습니다.")
			$("#result").append("<input type='hidden' id='ck' value='1'>");
		}else{
			$("#result").html("인증 실패했습니다. 다시 확인하세요.");
		}
	})
	$("#id_check").click(function(){
		let id = $("#id").val();
		if(!id){
			$("#id_msg").html("아이디를 입력하세요")
			return false;
		}
		$.ajax({url:"/idCheck", data:"id="+id, datatype:"text"}
		).done(function(data){
			
			if(data == ""){
				$("#id_msg").html("사용할 수 있는 아이디 입니다.");
				$("#id_msg").append("<input type='hidden' id='id_ck' value='1'>");
			}else{
				$("#id_msg").html("이미 사용중인 아이디 입니다.");
			}
		})
	});//아이디 중복 확인 click
	
	$("#insert").submit(function(){
		alert("가입이 완료되었습니다.")
		
	 })
	
})

$(document).on("keyup", "#tel", function() {
    $(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
})
</script>
</body>
</html>