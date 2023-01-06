<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>

<head>
<title>로그인</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
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
	.sub_bundle {cursor : pointer;}
	.login {cursor : pointer;}
	.insert {cursor : pointer;}
	.find {cursor : pointer;}
	label{
	cursor : pointer;
		}
</style>

<body>
<div class="fixed">
<div id="uppernav">
		<div id="main">
			<span id="home_img" class="to_main" ><a href="/"><img src="/images/home.png"></a></span>
			<span id="home" class="to_main"><a href="/">우리집</a></span>
		</div>
		<ul class="upper_frame">
			<li class="upper_menu"><a href="/introduce/introduce">쉐어하우스란?</a></li>
			<li class="upper_menu" onclick="s_location()" style="cursor:pointer">방 찾기</li>
			<li class="upper_menu"><a href="/registration/registration_first">매물 등록</a></li>
			<li class="upper_menu"><a href="/community/community_list">커뮤니티</a></li>
			<li class="upper_menu"><a href="/query_list">문의</a></li>
		</ul>
		<div id="p_info">
			<span id="login">
				<c:if test="${user == null}">
					<a href="/login">로그인</a>
				</c:if>
				<c:if test="${user != null}">
					<c:if test="${user.user_Img == null}">
						<a href="/mypage/info"><img src="/images/profil.png"></a>
					</c:if>
					<c:if test="${user.user_Img != null}">
						<div class="user_profil_img">
							<a href="/mypage/info"><img class="user_uimg" src="${user.user_Img}"></a>
						</div>
					</c:if>
					<a href="/logout" class="logout">로그아웃</a>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						  <a href="/admin/admin_notice">관리자페이지</a>
					</sec:authorize>
				</c:if>
			</span>
		</div>
	</div>
</div>

<div class="container">
	<div class="title1"><h1>로그인</h1></div>
	<form action="/login" id="login" method="post">
		<div class="tbl_type1">
			<table align="center" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					아이디
					<input type="text" name="username" id="username"/>
				</td>
			</tr>
			<tr>
				<td>
					비밀번호
					<input type="password" name="password" id="password"/>
				</td>
			</tr>
			<tr>
				<td>
					
					<div class="sub_bundle">
						<span class="input-wrap">
							<input type="checkbox" id="checkId" name="checkId">                                         
							<label for="checkId"><span>아이디 저장</span></label>
						</span>
						
						<input class="insert" type="button" value="회원가입"
						onclick="location.href='/insert'" />
						
						<input class="find" type="button" value="아이디/비밀번호찾기"
						onclick="location.href='/id_find'" />
					</div>
					
					<input class="login" type="submit" value="로그인"/>
		
				</td>
			</tr>
		</table>
	</div>
	</form>
</div>

<nav>
		<div class="quick">
			<div class="quick_shape">
				<a href="/search/searchlist"> <img src="/images/search.png"
					title="검색">
				</a>
			</div>
			<div class="quick_shape">
				<a href=""> <img src="images/like.png" title="찜">
				</a>
			</div>
		</div>
	</nav>
	
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script async
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&libraries=places">
</script>
<script>
function s_location(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	
	location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
	})
}

$(function(){
	$("#login").submit(function(){ //submit버튼에 이벤트를 넣어 줄 때
		let username = $("#username").val();
		let password = $("#password").val();
		if(!username){
			alert("아이디를 입력하세요.")
			return false;
		}
		
		if(!password){
			alert("비밀번호를 입력하세요.")
			return false;
		}
	 })
})


	$(document).ready(function(){
		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#username").val(key); 
	     
	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	    if($("#username").val() != ""){ 
	        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#username").val(), 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#username").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#username").val(), 7); // 7일 동안 쿠키 보관
	        }
	    });
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
