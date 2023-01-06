<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="{{_csrf.token}}"/>
<meta id="_csrf_header" name="_csrf_header" content="{{_csrf.headerName}}"/>
<meta charset="UTF-8">
<title>우리집</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<link href="/css/admin_nav.css" rel="stylesheet">
<style>
/* p{
margin: 10px 0px;
}

.pop_administration{
	display:inline-block;
	border: solid thin;
	height: 550px;
	width: 300px;
	position: relative;
	left: 40%;
	top:10%;
}

.pop_title{
	border-bottom: solid thin;
}

.title_input{
	left:5%;
	position:relative;
} */
font-family: SF Pro KR, SF Pro Display, SF Pro Icons, AOS Icons, Apple Gothic, HY Gulim, MalgunGothic, HY Dotum, Lexi Gulim, Helvetica Neue, Helvetica, Arial, sans-serif;
.layerPopup img{
margin-bottom : 20px;}
.layerPopup:before {display:block; content:""; position:relative; left:0; top:0; width:100%; height:100%; z-index:9000}
.layerPopup .layerBox {    z-index:10000;   border:solid thin; width:350px;
position:fixed; left:45%; top:48%; transform:translate(-50%, -50%); padding:30px; background:#fff; border-radius:6px; }
.layerPopup .layerBox .title {margin-bottom:10px; padding-bottom:10px; font-weight:600; border-bottom:1px solid #d9d9d9;}
.layerPopup .layerBox .btnTodayHide {
font-size:14px; font-weight:600; color:black; 
float: left;text-decoration:none;width: 150px; 
height : 30px;line-height:30px;border:black solid 1px; text-align : center;text-decoration:none;
}
.layerPopup div{
	display : inline;
}
.layerPopup form{
	margin-top : 5px;
	font-size:16px; font-weight:600;
	weight: 100%;
	height : 30px;
	line-height:30px
}
.layerPopup #close {
font-size:16px; font-weight:600; width: 40px; height : 30px;color:black; float: right; line-height:30px; text-align : center;text-decoration:underline;
}
.layerPopup a{
	text-decoration : none;
	color : black;width: 50px;height : 40px;
}
</style>
</head>
<body>
<header>
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
								<a href="/mypage/info"><img class="user_uimg"
									src="${user.user_Img}"></a>
							</div>
				</c:if>
				<a href="/logout" class="logout">로그아웃</a>
			</c:if>
		</span>
	</div>
</div>
</div>
</header>
<aside>
		<nav>
			<ul>
				<li><a href="/admin/admin_notice">공지사항 관리</a></li>
				<li><a href="/admin/user_manage">회원관리</a></li>
				<li><a href="/admin/report_list">신고리스트</a></li>
				<li><a href="/admin/ad_query_list">문의리스트</a></li>
				<li><a href="/admin/allboardview">모든 게시물 보기</a></li>
				<li class="active"><a href="/popup">메인 팝업 관리</a></li>
			</ul>
		</nav>
	</aside>
	<main>

<!-- 광고팝업 관리자 툴 -->
<!-- <div class="pop_administration">
	<div class="pop_title">
		<p><input class="title_input" name="pop_title" placeholder="공지사항 제목을 쓰시오">
	</div>
	<div class="pop_image">
			<img id="preview" width="100%">
	</div>
</div> -->
<div class="layerPopup" id="layer_popup" style="visibility: visible;">
    <div class="layerBox">
        <h4 class="title"><input class="title_input" name="pop_title" placeholder="공지사항 제목을 쓰시오"></h4>
        <div class="cont">
            <p>
             <img id="preview" width=350>
            </p>
        </div>
          <form name="pop_form">
        <div id="check" ><input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
        <label for="chkbox">&nbsp&nbsp오늘 하루동안 보지 않기</label></div>
		<div id="close" >닫기</div>    
		</form>
	</div>
</div>
<div style="display:inline-block; position:absolute; right:20%; bottom:10%">
	<form class="imgupload" action="" enctype="multipart/form-data" method="post">
		<div><!-- onchange="preview(this)" -->
			<input onchange="preview(this)" class="image_input" name="image" type="file"><br>
		</div>
			<button type="button" onclick="pop_insert();" >적용</button>
	</form>
</div>
</main>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script async
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&libraries=places">
		
	</script>
	<script>

		function s_location() {
			navigator.geolocation.getCurrentPosition(function(pos) {
				var latitude = pos.coords.latitude;
				var longitude = pos.coords.longitude;

				location.href = "/search/searchlist?latitude=" + latitude
						+ "&longitude=" + longitude;
			})
		}
	</script>
<script>
function preview(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			document.getElementById('preview').src = e.target.result;
		}
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('preview').src = "";
	}
} 

function pop_insert(){
/* 	var form = $(".imgupload")[0];
	var formData = new FormData(form);
	$.ajax({
		type:"get",
		url:"/preview",
		data: formData,
		success:function(data){
			
		}
	}) */
	if (document.querySelector('.title_input').value == ""){
		alert("제목을 입력하시오")
		return false;
	} else 	if (document.querySelector('.image_input').value == ""){
		alert("이미지 파일을 선택하시오")
		return false;
	}
	const header = document.querySelector('meta[name="_csrf_header"]').content;
    const token = document.querySelector('meta[name="_csrf"]').content;
	
    var formData = new FormData();
	var fileField = document.querySelector('.image_input');
	
	formData.append('image', fileField.files[0]);
	formData.append('pop_title',document.querySelector('.title_input').value)
	
	fetch('/pop_insert',{
		method: 'POST',
		/* headers: {
						
			'Content-Type':'multipart/form-data',
            'header': header,
          	'X-Requested-With': 'XMLHttpRequest',
            "Content-Type": "application/json",
            'X-CSRF-Token': token	// header에 X-CSRF-Token부분에 토큰값이 들어가 정상적으로 POST값이 넘어가는 것을 볼 수 있다!
        }, */
		credentials:'include',
		body: formData,
	})
	//.then((response) => response.json())
	.then((result) => {alert("이미지 적용 완료")})
	.catch((error) => {console.error("실패:",error)})
	
	//return false;
}
</script>
</html>