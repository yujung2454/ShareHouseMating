<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
	<title>시큐리티 테스트</title>
</head>

<body align="center">
<h1>로그인</h1>
<form method="post">
<table align="center" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td bgcolor="cyan">아이디</td>
		<td><input type="text" name="username"/></td>
	</tr>
	<tr>
		<td bgcolor="cyan">비밀번호</td>
		<td><input type="password" name="password"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="로그인"/>
			
			<span class="input-wrap">
   			<input type="checkbox" id="checkId" name="checkId">                                         
   			<label for="checkId"><span></span></label>
   			 아이디 저장
  			</span>
  						
			<input type="button" value="회원가입"
			onclick="location.href='/baesoeun/insert'" />
			
			<input type="button" value="아이디/비밀번호찾기"
			onclick="location.href='/baesoeun/find'" />
			

		</td>
	</tr>
</table>
</form>

		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>	
	$(document).ready(function(){
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#id").val(key); 
	     
	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	    if($("#id").val() != ""){ 
	        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });

	// 쿠키 저장하기 
	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	// 쿠키 삭제
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
     
	// 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) { // 쿠키가 존재하면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
				end = cookieData.length;
                console.log("end위치  : " + end);
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>
</body>
</html>
