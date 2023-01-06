<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
			<li><input id="location" name="loc" placeholder="지역명 또는 역이름" size="45" autofocus></li>
			<li>
				<button type="submit" class="submit">검색</button>
			</li>
			<li>
				<a href="/detailsearch"><img src="/images/detailsearch.png" alt="상세검색" title="상세검색"></a>
			</li>
		</ul>
	</div>
	<input id="latlng" name="latlng" type="hidden">
</form>
</div><br>
<hr><br>
<jsp:include page="popup/popup.jsp"/>
<div style="position:relative; width:60%; margin : auto;">
	<div class="offering_lst">
		<c:forEach var="offer" items="${offering}">
			<div class="offer">
				<div class="offer_frame" style="cursor:pointer" onclick="location.href='/offer/detail_info/${offer.board_no}'">
					<div class="offer_img_frame">
						<img class="offer_img" src="${offer.thumbnail}">
					</div>
					<div class="offer_info">
						<p class="offer_title">${offer.title}</p>
						<p>보증금:<span>${offer.deposit}</span> 월세:<span>${offer.rental}</span></p>
						<p class="loc">${offer.dong }</p>
					</div>
				</div>
			</div>
		</c:forEach>
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

</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- <script src="/javascript/offeringlist"></script> -->
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