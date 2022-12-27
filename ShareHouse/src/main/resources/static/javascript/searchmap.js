var latitude = null;
var longitude = null;
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

navigator.geolocation.getCurrentPosition(function(pos) {
    latitude = pos.coords.latitude;
    longitude = pos.coords.longitude;
	
	function initMap(){
		const myLatLng = {lat: latitude, lng: longitude};
	    const map = new google.maps.Map(document.getElementById("map"), {
	    center: myLatLng,
	    zoom: 12,
	    mapTypeControl: false,
	  	});
	  
		const infoWindow = new google.maps.InfoWindow({
		content:"",
		disableAutoPan: true,
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
})
	/*if (latitude == null & longitude == null){
	    latitude = pos.coords.latitude;
	    longitude = pos.coords.longitude;
	}
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var clusterer = new kakao.maps.MarkerClusterer({
	    map: map,
	    markers: markers,
	    gridSize: 35,
	    averageCenter: true,
	    minLevel: 6,
	    disableClickZoom: true,
	    styles: [{
	        width : '53px', height : '52px',
	        background: 'url(cluster.png) no-repeat',
	        color: '#fff',
	        textAlign: 'center',
	        lineHeight: '54px'
	    }]
	});
	
	var markers = new kakao.maps.Marker({
    	position: map.getCenter()
	});
	
	clusterer.addMarker(markers);
	kakao.maps.event.addListener(map,'click', function(mouseEvent) {
	    var latLng = mouseEvent.latLng;
	    markers.setPosition(latLng);
	});

})*/