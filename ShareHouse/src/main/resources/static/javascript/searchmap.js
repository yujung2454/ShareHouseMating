navigator.geolocation.getCurrentPosition(function(pos) {
    var latitude = pos.coords.latitude;
    var longitude = pos.coords.longitude;
	var mapOptions = {
	    center: new naver.maps.LatLng(latitude, longitude),
	    zoom: 18
	};
	
	var map = new naver.maps.Map('map', mapOptions);
});
