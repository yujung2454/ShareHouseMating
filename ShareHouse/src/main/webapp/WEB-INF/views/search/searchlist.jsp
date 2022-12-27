<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>매물찾기</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/map.css" rel="stylesheet">
<link href="/css/searchlist.css" rel="stylesheet">
</head>
<body>
<div class="fixed">
<div id="uppernav">
		<div id="main">
			<span id="home_img" class="to_main" ><a href="/"><img src="/images/home.png"></a></span>
			<span id="home" class="to_main"><a href="/">우리집</a></span>
		</div>
		<ul class="upper_frame">
			<li class="upper_menu">쉐어하우스란?</li>
			<li class="upper_menu"><a href="/search/searchlist">방 찾기</a></li>
			<li class="upper_menu">매물 등록</li>
			<li class="upper_menu"><a href="/community/community_list">커뮤니티</a></li>
			<li class="upper_menu">문의</li>
		</ul>
		<div id="p_info">
			<span id="notification"><img src="/images/notification.png"></span>
			<span id="login">
				<c:if test="${user == null}">
					<a href="/login">로그인</a>
				</c:if>
				<c:if test="${user != null}">
					<c:if test="${user.user_Img == null}">
						<a href="/mypage/info"><img src="/images/profil.png"></a>
					</c:if>
					<c:if test="${user.user_Img != null}">
						<a href="/mypage/info"><img src="${user.user_img}"></a>
					</c:if>
				</c:if>
			</span>
		</div>
	</div>
	<br><br><br><br><br><br>
<form id="search_btn" action="/search">
	<div id="search" >
		<ul>
			<li><img src="/images/search.png"></li>
			<li><input id="location" name="loc" placeholder="지역명 또는 역이름" size="50"></li>
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
<div class="frame">
	<div id="map"></div>
	<div class="list_frame">
		<c:forEach var="offer" items="${offering}">
			<div class="offer_list">
				<div class="list_img">
					<img class="img" src="${offer.thumbnail}">
				</div>
				<div class="list_con">
					<p> ${offer.title}
				</div>
			</div>
		</c:forEach>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be0e94507c189370b7652c07b56d35fd&libraries=clusterer"></script> -->
<script src="/javascript/searchmap.js"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&v=beta&libraries=marker,places&callback=initMap"></script>
<script>

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
</body>
</html>