<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물등록-3</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<link href="/css/registration.css" rel="stylesheet">
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
	<div class="quick">
	<div class="quick_shape">
		<a href="/search/searchlist">
			<img src="/images/search.png" title="검색">
		</a>
	</div>
	<div class="quick_shape">
		<a href="/wishlist">
			<img src="/images/like.png" title="찜">
		</a>
	</div>
</div>
	
<form method ="post" action = "/registration/third" enctype="multipart/form-data">
<div id="hidden"><input type='hidden' value='${board_no}' name='board_no'>

</div>
<div class="introduce">
집 소개<br>
<textarea name="offering_info" class="inputbox"></textarea>
<br><br>

대표이미지 설정<br>
	<img id="preview1" class="drawing"/>
	<input type="file" name="update_file" accept=".png, .jpg" onchange="readImage1(this);">
	
	<br><br>
	
내부도면<br>
	<img id="preview2" class="drawing"/>
	<input type="file" name="img_loc_file" accept=".png, .jpg" onchange="readImage2(this);">
	<br><br>
	
<table class="table" border='1'>
<tbody id="home_infor">
<tr>
<td>이름</td>
<td>타입</td>
<td>면적</td>
<td>보증금</td>
<td>월세</td>
<td>계약기간</td>
</tr>
<tr>
<td><!-- <input type="text" name="room_name" size="1" style="border:0" maxlength=5> -->
	<select name="rinfo[0].room_name">
		<c:forEach items="${dto}" var="room">
			<option value="${room.room_name }">${room.room_name }</option>
		</c:forEach>
	</select>
</td>

<td><input type="text" name="rinfo[0].mem_cnt" size="1" style="border:0" maxlength=1>인실</td>
<td><input type="text" name="rinfo[0].square" size="1" style="border:0" maxlength=3>㎡</td>
<td><input type="text" name="rinfo[0].deposit" size="3" style="border:0" maxlength=7>만원</td>
<td><input type="text" name="rinfo[0].rental" size="3" style="border:0" maxlength=7>만원</td>
<td><input type="text" name="rinfo[0].term" size="1" style="border:0" maxlength=2>개월</td>
</tr>
</tbody>
</table>
<input type="button" value="추가" onclick="add_row()">
<input type="button" value="삭제" onclick="del_row()">
</div>

<div class="btn">
<button type="submit" id="registration" value ="등록" onclick="regist()" class="registration">등록</button>
<button type="button" id="cancel" value ="취소" onclick="location.href='/'" class="cancel">취소</button>
</div>
</form>
</body>
<script>

function s_location(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	
	location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
	})
}

let num = 1;

var row = '	<select name="room_name">\n'+
	'<c:forEach items="${dto }" var="room">\n'+
'<option value="${room.room_name }">${room.room_name }</option>\n'+
'</c:forEach>\n'+
'</select>'
	function add_row() {	
        	var table = document.getElementById('home_infor');
        	var row = table.insertRow(table.rows.length);
        	var cell1 = row.insertCell(0);
        	var cell2 = row.insertCell(1);
        	var cell3 = row.insertCell(2);
        	var cell4 = row.insertCell(3);
        	var cell5 = row.insertCell(4);
        	var cell6 = row.insertCell(5);
        	
        	cell1.innerHTML='<select name="rinfo['+num+'].room_name">\n<c:forEach items="${dto }" var="room">\n<option value="${room.room_name }">${room.room_name }</option>\n</c:forEach>\n</select>'
        	cell2.innerHTML='<input type="text" name="rinfo['+num+'].mem_cnt" size="1" style="border:0" maxlength=1>인실';
        	cell3.innerHTML='<input type="text" name="rinfo['+num+'].square" size="1" style="border:0" maxlength=3>㎡';
        	cell4.innerHTML='<input type="text" name="rinfo['+num+'].deposit" size="3" style="border:0" maxlength=7>원';
        	cell5.innerHTML='<input type="text" name="rinfo['+num+'].rental" size="3" style="border:0" maxlength=7>원';
        	cell6.innerHTML='<input type="text" name="rinfo['+num+'].term" size="1" style="border:0" maxlength=2>개월';
        	num++;

        }

        function del_row() {
        	var table = document.getElementById('home_infor');
        	if(table.rows.length > 2) 
        		table.deleteRow(table.rows.length-1);
        	num--;
        	return;
        	}
        
        function regist() {
        	alert('등록 승인 신청이 완료되었습니다.');
        }

	function readImage2(input) {
      	  if (input.files && input.files[0]) {
      		    var reader = new FileReader();
      		    reader.onload = function(e) {
      		      document.getElementById('preview2').src = e.target.result;
      		    };
      		    reader.readAsDataURL(input.files[0]);
      		  } else {
      		    document.getElementById('preview2').src = "";
      		  }
      		}
	
	function readImage1(input) {
    	  if (input.files && input.files[0]) {
    		    var reader = new FileReader();
    		    reader.onload = function(e) {
    		      document.getElementById('preview1').src = e.target.result;
    		    };
    		    reader.readAsDataURL(input.files[0]);
    		  } else {
    		    document.getElementById('preview1').src = "";
    		  }
    		}
	

</script>
</html>