<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>매물등록</title>
<link href="registration.css" rel="stylesheet">

<script>
        const add_textbox = () => {
            const box = document.getElementById("box");
            const newP = document.createElement('p');
            newP.innerHTML = "<input type='text' class='plustext'>";
            box.appendChild(newP);
        }
 
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
        	cell1.innerHTML='<input type="text" size=5 style="border:0">';
        	cell2.innerHTML='<input type="text" size=5 style="border:0">';
        	cell3.innerHTML='<input type="text" size=5 style="border:0">';
        	cell4.innerHTML='<input type="text" size=5 style="border:0">';
        	cell5.innerHTML='<input type="text" size=5 style="border:0">';
        	cell6.innerHTML='<input type="text" size=5 style="border:0">';
        	cell7.innerHTML='<input type="text" size=8 style="border:0">';
       
        }

        function del_row() {
        	var table = document.getElementById('home_infor');
        	if(table.rows.length > 2) 
        		table.deleteRow(table.rows.length-1);
        	return;
        	}
        
        function onClickUpload() {
            let myInput = document.getElementById("my-input");
            myInput.click();
        }
        
        function readImage(input) {
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

</script>
</head>
<body>
<form>
	<div id="box">
		<input type="button" value="+" class="plus" onclick="add_textbox()">
	</div>
</form>
<form>
<div class="imagebox">
	<input type=file name='file1' accept=".png, .jpg" onchange="readImage(this);" style='display: none;'> 
	<input type='text' name='file2' id='file2' style='display: none;'> 
	<img src="https://www.pngplay.com/wp-content/uploads/8/Upload-Icon-Logo-PNG-Clipart-Background.png" style="width:100px; height:100px;" border='0' onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'> 
	<img id="preview1"/>
</div>	
</form>

<div class="introduce">
집 소개<br><br>
<form>
	<textarea placeholder="내용을 입력해주세요" class="inputbox"></textarea>
</form>
<br><br>
집 위치(지도)<br><br>
<form>
	<textarea placeholder="내용을 입력해주세요" class="inputbox"></textarea>
</form>
<br><br>
몇호선 근처, 교통조건, 상권 등 정보 기재<br><br>
<form>
	<textarea placeholder="내용을 입력해주세요" class="inputbox"></textarea>
</form>
<br><br>
규칙 및 유의사항<br><br>
<form>
	<textarea placeholder="내용을 입력해주세요" class="inputbox"></textarea>
</form>
<br><br>	
<b>방정보</b><br><br>

내부도면<br><br>
  <input id="my-input" type="file" accept=".png, .jpg" onchange="readImage2(this);" multiple><br>
        <button id="my-button" onclick="onClickUpload();" >사진 불러오기</button>
        <img id="preview2"/>
	
<br><br><br><br>

<table border="1" id="home_infor" class="table">	
<thead>
<tr>
<th>이름</th>
<th>성별</th>
<th>타입</th>
<th>면적</th>
<th>보증금</th>
<th>월세</th>
<th>입주가능일</th>
</tr>
</thead>

<tbody>
<tr>
<td><input type="text" size=5 style="border:0"></td>
<td><input type="text" size=5 style="border:0"></td>
<td><input type="text" size=5 style="border:0"></td>
<td><input type="text" size=5 style="border:0"></td>
<td><input type="text" size=5 style="border:0"></td>
<td><input type="text" size=5 style="border:0"></td>
<td><input type="date" size=8 style="border:0"></td>
</tr>
</tbody>
</table>
<input type="button" value="추가" onclick="add_row()">
<input type="button" value="삭제" onclick="del_row()">
</div>

<form>
<div class="btn">
<button type="submit" class="registration">등록</button>
<button type="button" onclick="location.href='index.html'" class="cancel">취소</button>
<button type="button" onclick="" class="preview">미리보기</button>
</div>
</form>
</body>
</html>