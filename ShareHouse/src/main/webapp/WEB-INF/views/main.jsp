<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리집</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
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
<div style="position:absolute; width:60%; left:19%;">
	<div class="offering_lst">
		<c:forEach var="offer" items="${offering}">
			<div class="offer">
				<div class="offer_frame" style="cursor:pointer" onclick="locatioin.href='/offerinfo/detail_info'">
					<div class="offer_img_frame">
						<img class="offer_img" src="${offer.thumbnail}">
					</div>
					<div class="offer_info">
						<p class="offer_title">${offer.title}</p>
						<p>보증금 : <span>${offer.deposit}</span> 월세 : <span>${offer.rental}</span></p>
						<p class="loc"></p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div class="quick">
	<div class="quick_shape">
		<a href="/search/searchlist">
			<img src="/images/search.png" title="검색">
		</a>
	</div>
	<div class="quick_shape">
		<a href="">
			<img src="images/like.png" title="찜">
		</a>
	</div>
	<div class="quick_shape">
		<a href="">
			<img src="images/chat.png" title="채팅">
		</a>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- <script src="/javascript/offeringlist"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be0e94507c189370b7652c07b56d35fd&libraries=services"></script>
<script async
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&libraries=places">
</script>
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






var offer_lst = [];

let offer = ${offering2};

$(".loc").each(function(j,jitem){
	let ploc = $(this);
	let lat = offer[j].latitude;
	let lng = offer[j].longitude;
	
	let geocoder = new kakao.maps.services.Geocoder();

    let coord = new kakao.maps.LatLng(lat, lng);
    let callback = function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
        	let words = result[0].address.address_name.split(' ')
        	ploc.text( words[2]);
        }	
    }
    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	
})
</script>

</html>