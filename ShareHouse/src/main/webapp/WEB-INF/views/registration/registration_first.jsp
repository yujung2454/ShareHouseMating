<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물등록-1</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<link href="/css/registration.css" rel="stylesheet">
</head>
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
<div class="quick">
	<div class="quick_shape">
		<a href="/search/searchlist">
			<img src="/images/search.png" title="검색">
		</a>
	</div>
	<div class="quick_shape">
		<a href="/wishlist">
			<img src="/images/like.png" title="찜">
		</a>
	</div>
</div>
<div class="container">
	<div class="title1"><h1>매물 등록</h1></div>
	<form action="/registration/registration_first" method="post" id="daum">
		<div class="tbl_type1">
			<table align="center" cellpadding="0" cellspacing="0" class="table_1" border="0">
			<tr>
				<td>
					<input type = "hidden" name = "id" value="${user.id}">
					아이디 : ${user.id}
				</td>
			</tr>
			<tr>
				<td>
					제목 :
					<input type="text" name="title" id="title"/>
				</td>
			</tr>
			<tr>
				<td>
					주거형태 :
					<select id="house_kind" name="house_kind" class="search_menu">
						<option>주거형태</option>
						<option value="apt">아파트</option>
						<option value="house">주택</option>
						<option value="one">원룸</option>
						<option value="two">투룸</option>
						<option value="office">오피스텔</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>
				성별타입 :
				<select name="offering_gender">
				<option value="m">남자</option>
				<option value="f">여자</option>
				<option value="a">혼성</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>
					<p class="inp_tit1">매물 주소</p>
						<div class="inp_type1">
							<input name="offering_add" id="address" class="inp1" readonly/>
							<input name="offering_add2" id="address2" class="inp1" readonly/>
							<button type="button" id="find_ad" value="주소 찾기" onclick = "addPost()" class="btn1">주소 찾기</button>
						</div>
				</td>
			</tr>
			<tr>
				<td>
						<div class="inp_type2">
							<input type = "hidden" name="latitude" id="latitude" class="inp2" value=""/>
							<input type = "hidden" name="longitude" id="longitude" class="inp2"/>
						</div>
				</td>
			</tr>
		</table>
		<br>
		<div class="btn">
		<button type="submit"  value="다음" class="registration" >다음</button>
		<button type="button" id="cancel" value="취소" onclick="location.href='/'" class="cancel">취소</button>
		</div>
	</div>
	</form>
</div>
</div>

	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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


function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
        		document.querySelector("#address").value = data.roadAddress;
            	document.querySelector("#address2").value = data.jibunAddress;
        }
    }).open();
}

$(function(){
	var geocoder;
	$("#daum").submit(function(event){
		event.preventDefault();
		geocoder = new google.maps.Geocoder();
		var address = document.getElementById('address').value;
		geocoder.geocode({'address': address},function(results,status){
			if(status == 'OK'){
				// { lat: 12321 , lng: 12312 }
				$("#latitude").val(results[0].geometry.location.lat);
				$("#longitude").val(results[0].geometry.location.lng);
			} else {
				alert('Geocode was not successful for the following reason: ' + status);
			}

			event.currentTarget.submit();
		})
		
})
})
</script>
</body>
</html>