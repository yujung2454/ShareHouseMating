<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
</div><br><hr><br>
<div class="frame">
	<div id="map"></div>
	<div class="list_frame">
	<c:if test="${offering.size() != 0 }">
		<c:forEach var="offer" items="${offering}">
			<div class="offer_list" style="cursor:pointer" onclick="location.href='/offer/detail_info/${offer.board_no}'">
				<div class="list_img">
					<img class="img" src="${offer.thumbnail}">
				</div>
				<div class="list_con">
					<p> ${offer.title}
					<p> 보증금:${offer.deposit} 월세:${offer.rental }
					<p> ${offer.dong }
				</div>
			</div>
		</c:forEach>
	</c:if>
	<c:if test="${offering.size() == 0 }">
		<div>
			<span>검색하신 조건의 매물은 0건입니다.</span>
		</div>
	</c:if>
</div>
</div>
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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://unpkg.com/@googlemaps/markerclusterer/dist/index.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&v=beta&libraries=marker,places&callback=initMap"></script>
<script>
function s_location(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	
	location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
	})
}

var locations = [];

$.ajax({
	type:"get",
	url:"/latlng",
	dataType:"json",
	data:{},
	success:function(data){
		$.each(data,function(index,item){
			locations.push({lat: item.latitude, lng: item.longitude})
		})
	},
	error:function(){
		alert("error")
	}
})

$(function(){
	
	var lat = ${lat}
	var lng = ${lng}
	locations.push({lat: lat, lng: lng})
	function initMap(){
		const latlng = {lat: lat, lng: lng};
	    const map = new google.maps.Map(document.getElementById("map"), {
	    center: latlng,
	    zoom: 7,
	    mapTypeControl: false,
	  	});
		const markers = locations.map((position,i) => {
			var lat2 = Object.values(position)[0]
			lat2 *= 1
			var lng2 = Object.values(position)[1]
			lng2 *= 1
			const marker = new google.maps.Marker({
				position: {lat: lat2, lng: lng2}
			})
			
			marker.addListener("click",() => {
				infoWindow.open(map,marker)
			})
			return marker;
		})
		
		new markerClusterer.MarkerClusterer({markers,map});
	}
	window.initMap = initMap;
	
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
	}
	)
})


</script>