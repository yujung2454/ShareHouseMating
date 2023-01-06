<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>비밀번호 찾기</title>
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
.certif {cursor : pointer;}
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
	</div>
	<form action="/pwd_find2" method="post" id="findPwd">
		<div class="tbl_type1">
			<p class="title2">이메일로 인증</p>
			<table>
				<tr>
					<td>
						<input name="id" id="id" placeholder="아이디">
						<div id="id_msg"></div>
					</td>
				</tr>
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
							<input class="certif" type="button" id="mail_ck" value="인증">
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

	let num ="";
	$(function(){
		 $("#mail_ck").click(function(){
			let id = $("#id").val();	
			if(!id){
				alert("아이디를 입력하세요.")
				return false;
			}
			
			let name = $("#name").val();	
			if(!name){
				alert("이름을 입력하세요.")
				return false;
			}
			
			let email = $("#email").val(); //폼에서 입력 받아와야할 데이터(email)
			if(!email){ // 폼에서 입력한 email값이 없으면
				alert("이메일을 입력하세요.")
				return false;
			}
			//name 받아오고
			// 컨트롤러 만들어서 메일주소 받아와서 있으면 아래 부분 실행하고 아니면 아무 동작 없게 if로 만들어... 
			
		 	$.ajax({
				url: "/pwd_find_id", //요청하면 이 url에 맞는 컨트롤러가 작동
				data: "email="+email+"&name="+name+"&id="+id // 받아올 데이터
			}).done(function(resp){
				//System.out.println("resp");// --> 전달받은 데이터 사용
				if(resp == ""){ // 서버에서 null값을 받아올 때는 빈문자열로 받아옴 (일반 데이터는 문자열로 받아오는데 null은 "null"이 되면 안됨)
					alert("틀린 정보가 있는지 확인하세요."+resp);
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
			
		$("#findPwd").submit(function(){ //submit버튼에 이벤트를 넣어 줄 때
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