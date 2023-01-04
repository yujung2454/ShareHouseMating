<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물등록-3</title>
<link href="/css/registration.css" rel="stylesheet">
</head>
<body>
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
<td>성별</td>
<td>타입</td>
<td>면적</td>
<td>보증금</td>
<td>월세</td>
<td>계약기간</td>
</tr>
<tr>
<td><!-- <input type="text" name="room_name" size="1" style="border:0" maxlength=5> -->
	<select name="room_name">
		<c:forEach items="${dto }" var="room">
			<option value="${room.room_name }">${room.room_name }</option>
		</c:forEach>
	</select>
</td>
<td>
<select name="offering_gender">
	<option value="m">남자</option>
	<option value="f">여자</option>
	<option value="a">혼성</option>
</select>
</td>
<td><input type="text" name="mem_cnt" size="1" style="border:0" maxlength=1>인실</td>
<td><input type="text" name="square" size="1" style="border:0" maxlength=3>㎡</td>
<td><input type="text" name="deposit" size="3" style="border:0" maxlength=7>원</td>
<td><input type="text" name="rental" size="3" style="border:0" maxlength=7>원</td>
<td><input type="text" name="term" size="1" style="border:0" maxlength=2>개월</td>
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
        	var cell7 = row.insertCell(6);
        	cell1.innerHTML='<select name="room_name">\n<c:forEach items="${dto }" var="room">\n<option value="${room.room_name }">${room.room_name }</option>\n</c:forEach>\n</select>'
        	cell2.innerHTML='<select name="offering_gender"><option value="남자">남자</option><option value="여자">여자</option><option value="혼성">혼성</option></select>';
        	cell3.innerHTML='<input type="text" name="mem_cnt" size="1" style="border:0" maxlength=1>인실';
        	cell4.innerHTML='<input type="text" name="square" size="1" style="border:0" maxlength=3>㎡';
        	cell5.innerHTML='<input type="text" name="deposit" size="3" style="border:0" maxlength=7>원';
        	cell6.innerHTML='<input type="text" name="rental" size="3" style="border:0" maxlength=7>원';
        	cell7.innerHTML='<input type="text" name="term" size="1" style="border:0" maxlength=2>개월';
        }

        function del_row() {
        	var table = document.getElementById('home_infor');
        	if(table.rows.length > 2) 
        		table.deleteRow(table.rows.length-1);
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