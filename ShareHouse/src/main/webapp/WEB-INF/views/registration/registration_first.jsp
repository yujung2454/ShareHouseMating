<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물등록-1</title>
</head>
<body>
<div class="container">
	<div class="title1"><h1>매물 등록</h1></div>
	<form action="/registration/registration_first" method="post" id="daum">
		<div class="tbl_type1">
			<table align="center" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<input type = "hidden" name = "id" value="${user.id}">
					아이디 : ${user.id}
				</td>
			</tr>
			<tr>
				<td>
					제목
					<input type="text" name="title" id="title"/>
				</td>
			</tr>
			<tr>
				<td>
					<p class="inp_tit1">매물 주소</p>
						<div class="inp_type1">
							<input name="offering_add" id="address" class="inp1"/>
							<input name="offering_add2" id="address2" class="inp1"/>
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
		<button type="button" id="cancel" value="취소" onclick="location.href='/'">취소</button>
		<button type="submit" class="btn2" value="다음" >다음</button>
	</div>
	</form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script async
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&libraries=places">
</script>
<script>
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