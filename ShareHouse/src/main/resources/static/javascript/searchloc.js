/**
 * 자동완성을 통해 지도 검색
 */
 
var latitude = null;
var longitude = null;

function initMap(){
	const myLatLng = {lat: latitude, lng: longitude};
    const map = new google.maps.Map(document.getElementById("map"), {
    center: myLatLng,
    zoom: 17,
    mapTypeControl: false,
  });
    new google.maps.Marker({
	position:myLatLng,
	map,
})
		
}

window.initMap = initMap;

function codeAddress(){
	var address = document.getElementById('location').value();
	geocoder.geocode({'address' : address}, function(results,status){
		if(status=='OK'){
			map.setCenter(results[0].geometry.location);
			var marker = new google.map.Marker({
				map:map,
				position: results[0].geometry.location
			});
		} else {
			alert('Geocode was not successful for the following reason: ' + status);
		}
	})
}