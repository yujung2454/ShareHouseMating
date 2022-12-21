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
	.tbl_type1 {margin: 30px auto 0; width: 60%;}
	.tbl_type1 table {width: 100%;}
	.tbl_type1 td {padding: 8px 0;line-height: 30px;font-size: 14px;}
	.tbl_type1 input:not([type="checkbox"]) {width: 100%; display: inline-block;border: 1px solid #ddd;padding: 10px;border-radius: 4px;font-size: 14px;background-color: #fff;}
	.tbl_type1 input::placeholder {color: #555;}
	.tbl_type1 .sub_bundle {padding-bottom: 50px;}
	.tbl_type1 .sub_bundle >input { display: inline-block;width: auto;border: none;vertical-align: middle;text-align: center;color: #aaa;text-decoration: underline;}
	.tbl_type1 .sub_bundle .input-wrap {vertical-align: middle;margin-right: 10%;}
	.tbl_type1 .sub_bundle .input-wrap label {font-size: 14px;}
	.tbl_type1 input.btn {background-color: #ddd;background-color: #ddd;font-size: 20px;font-weight: 700;}
</style>

<body>
<div class="container">
	<div class="title1"><h1>회원가입</h1></div>
	<form action="/insert" id="insert" method="post">
		<div class="tbl_type1">
			<table align="center" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					아이디
					<input name="id" id="id"/>
					<input type="button" id="id_check" value="중복확인">
					<div id="id_msg"></div>
				</td>
			</tr>
			<tr>
				<td>
					비밀번호
					<input type="password" name="pwd" id="pwd"/>
					비밀번호 확인
					<input type="password" name="pwd_check" id="pwd_check"/>
				</td>
			</tr>
			<tr>
				<td>
					이름
					<input name="name" id="name"/>
				</td>
			</tr>
			
			<tr>
				<td>
					<div class="sub_bundle">
						<span class="input-wrap">
							<input type="radio" id="man" name="gender" value = "남성">                                         
							<label for="man"><span>남성</span></label>
							<input type="radio" id="woman" name="gender" value = "여성">                                         
							<label for="woman"><span>여성</span></label>
						</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					이메일
					<input name="email" id="email"/>
					<input type="button" id="mail_ck" value="인증">
					<div id="input"><input id="ck_num"> <input type="button" id="ck_b" value="인증 확인"></div>
					<div id="result"></div>
				</td>
			</tr>
			
			<tr>
				<td>
					주소
					<input name="user_add" id="address"/>
					<input type="button" id="find_ad" value="주소 찾기" onclick = "addPost()">
				</td>
			</tr>
			<tr>
				<td>
					<input name="user_add2" id="user_add2" placeholder="상세주소를 입력하세요.">
				</td>
			</tr>
			<tr>
				<td>
					휴대전화
					<input name="tel" maxlength="13" id="tel"/>
				</td>
			</tr>
		</table>
		<input type="submit" class="btn" value="가입하기"/>
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