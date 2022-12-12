<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<header>
</header>

<div id = "center"><!-- 몸통 -->
	<div id="detailinfo"><!-- 몸통 내용 전부 -->
		<div id = "room_button_list"><!-- Livingroom, Kitchen, roomA, roomB,... --></div>
		
		<div id="slide_img">
			<div class="main_img"><!-- 화면에 나타날 이미지 -->
				<div class="left_btn"><!-- 이전사진 버튼 --></div>
				<div class="right_btn"><!-- 다음사진 버튼 --></div>
				<div class="report"><!-- 신고 --></div>
				<div class="favorite"><!-- 찜 --></div>
				<div class="chat"><!-- 채팅신청 --></div>
			</div>
		</div>
		<div id="info_btn_list">
			<div class="info_btn">
				<a href="#room_intro"><button type="button" ><span>집소개</span></button></a>
			</div>
			<div class="info_btn">
				<a href="#room_info"><button type="button"><span>방정보</span></button></a>
			</div>
			<div class="info_btn">
				<a href="#room_FAQ"><button type="button"><span>FAQ</span></button></a>
			</div>
		</div>
		<div id="room_intro">방 소개 머시기 머시기</div>
		<div id="room_info">
			<div class="drawing">여기 도면</div>
			<div class="map">여기 지도</div>
			<div class="room_table">여기 가격등등</div>
		</div>
		<div id="room_FAQ">여기 FAQ</div>
	</div>
</div>

<footer>
</footer>

</body>
</html>