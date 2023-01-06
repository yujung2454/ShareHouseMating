<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
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
.confirm {cursor : pointer;}
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
						<input type="password" name="pwd" id="pwd" placeholder="새 비밀번호를 입력해주세요">
						<div id="pwd_msg"></div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="password" name="pwd_c" id="pwd_c" placeholder="새 비밀번호 확인">
						<div id="c_msg"></div>
					</td>
				</tr>
				<tr>
					<td> 
						<input class="confirm" type="submit" id="ck_b" value="확인">
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