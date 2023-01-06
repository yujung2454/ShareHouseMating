<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta id="_csrf" name="_csrf" content="{{_csrf.token}}"/>
<meta id="_csrf_header" name="_csrf_header" content="{{_csrf.headerName}}"/>
<meta charset="UTF-8">
<title>상세검색</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/searchcontent.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
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
	<br><br><br><br><br><br>
<form id="search_btn" action="/search">
	<div id="search" >
		<ul>
			<li><img src="/images/search.png"></li>
			<li><input id="location" name="loc" placeholder="지역명 또는 역이름" size="40" autofocus></li>
			<li>
				<button type="submit">검색</button>
			</li>
			<li>
				<a href="/detailsearch"><img src="/images/detailsearch.png" alt="상세검색" title="상세검색"></a>
			</li>
		</ul>
	</div>
	<input id="latlng" name="latlng" type="hidden">
</form>
</div>
<br>
<hr>
<form id="detail_search" action="/detailresult">
<div id="select_boxes">
<select id="search_region" class="search_menu">
	<option>지역</option>
	<option value="01">서울특별시</option>
	<option value="02">경기도</option>
	<option value="03">인천광역시</option>
	<option value="04">대전광역시</option>
	<option value="05">충청남도</option>
	<option value="06">충청북도</option>
	<option value="07">광주광역시</option>
	<option value="08">전라남도</option>
	<option value="09">전라북도</option>
	<option value="10">대구광역시</option>
	<option value="11">경상북도</option>
	<option value="12">부산광역시</option>
	<option value="13">울산광역시</option>
	<option value="14">경상남도</option>
	<option value="15">강원도</option>
	<option value="16">제주특별자치도</option>
</select>
<select id="search_house" name="kind" class="search_menu">
	<option>주거형태</option>
	<option value="apt">아파트</option>
	<option value="house">주택</option>
	<option value="one">원룸</option>
	<option value="two">투룸</option>
	<option value="office">오피스텔</option>
</select>
<select id="search_contract" name="contract" class="search_menu">
	<option value="0">계약기간</option>
	<option value="1">1개월</option>
	<option value="3">3개월</option>
	<option value="6">6개월</option>
	<option value="12">1년</option>
</select>
<select id="search_pay" name="pay" class="search_menu">
	<option value="0">월세</option>
	<option value="30">30만원이하</option>
	<option value="60">30~60만원</option>
	<option value="100">60~100만원</option>
	<option value="101">100만원이상</option>
</select>
<label>
<input id="male" name="gender" type="checkbox" value="m">
남성</label>
<label>
<input id="female" name="gender" type="checkbox" value="f">
여성</label> <!-- 남성 여성 다 클릭하면 모든 값 허용  a값? -->
</div>
<hr>
<div class="select_frame">
<div class="scroll_frame">
<dl class="detail_con">
	<dd class="content_frame">
		<div class="region_content">
			지역을 선택해주세요
		</div>
	</dd>
</dl>
</div>
<div class="scroll_frame">
<dl class="detail_con">
	<dd class="content_frame">
		<div class="region_content2">
			읍/면/리/가/동을(를) 선택해주세요
		</div>
	</dd>
</dl>
</div>
<div class="selected_loc">
</div>
<div class="roomtoilet">
	<input type="hidden" id="selected_loc" name="region">
	<input type="submit" value="적용">
</div>
</div>
</form>
<div class="quick">
	<div class="quick_shape">
		<a href="/detailsearch">
			<img src="/images/search.png" title="검색">
		</a>
	</div>
	<div class="quick_shape">
		<a href="/mypage/wishlist">
			<img src="/images/like.png" title="찜">
		</a>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="/javascript/selectchange.js"></script>
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
	var autocomplete;
	var Id = 'location';
	geocoder = new google.maps.Geocoder();
	
	autocomplete = new google.maps.places.Autocomplete((document.getElementById(Id)),{
		types:['geocode','establishment'],
		componentRestrictions: {country:"KR"}
	})
	
	var place;
	var lat;
	var lng;
	google.maps.event.addListener(autocomplete,'place_changed',function(){
		
		place = autocomplete.getPlace();
		lat = place.geometry.location.lat();
		lng = place.geometry.location.lng();
		$("#lat").val(lat);
		$("#lng").val(lng);
	})
	//geocode(data,result)
	var geocoder;
	$("#search_btn").submit(function(event){
		event.preventDefault();
		geocoder = new google.maps.Geocoder();
		var address = document.getElementById('location').value;
		geocoder.geocode({'address': address},function(results,status){
			if(status == 'OK'){
				$("#location").val(results[0].formatted_address)
			} else {
				alert('Geocode was not successful for the following reason: ' + status);
			}
		})
		
		if($("#latlng").val() == ""){
			geocoder.geocode({'address' : address},function(results, status){
				if(status == 'OK'){
					$("#latlng").val(results[0].geometry.location)
					event.currentTarget.submit();
				} else {
					alert('Geocode was not successful for the following reason: ' + status);
				}
			})
		}
		
		if($("#location").val() == ""){
			return false;
		}
	})
})
</script>
</html>