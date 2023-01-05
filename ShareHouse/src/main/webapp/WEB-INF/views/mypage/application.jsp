<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입주신청목록</title>
<style>
table {
	width:600px;
	height:30%;
	text-align:center;
	margin:auto;
}  
</style>
</head>
<body>

<h1>입주신청목록</h1>
<p>입주신청자 </p>
<form>
<table border="1">
<tr>
<td>전체선택</td>
<td>입주신청자</td>
<td>핸드폰</td>
<td>이메일</td>
<td>매물 제목</td>
<td>신청한 룸</td>
</tr>
<tr>
<td><input type="checkbox" value="전체 선택">전체 선택</td>

<td>${dto.id}${dto.name}</td>
<td>${dto.tel}</td>
<td>${dto.email}</td>
<td>${dto.title}</td>
<td>${room.room_name}</td>
</tr>
</table>
<button type="submit">승인</button>
<button id="">거절</button>
</form>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(document).ready(function() {
	   $("#cbx_chkAll").click(function() {
	      if($("#cbx_chkAll").is(":checked")) $("input[name=user_select]").prop("checked", true);
	      else $("input[name=user_select]").prop("checked", false);
	   });
	   
	   $("input[name=user_select]").click(function() {
	      var total = $("input[name=user_select]").length;
	      var checked = $("input[name=user_select]:checked").length;
	      
	      if(total != checked) $("#cbx_chkAll").prop("checked", false);
	      else $("#cbx_chkAll").prop("checked", true); 
	   });
	});
</script>

</body>
</html>