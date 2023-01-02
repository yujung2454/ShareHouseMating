<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#goodtd {
	text-align:left;
}
</style>
<title>배소은을 신고하는 리스트</title>
</head>
<body>
<!-- <div>
<select id="select" name="select" onchange="change()">
<option value="all">전체보기</option>
<option value="commview">커뮤니티</option>
<option value="boardview">매물</option>
<option value="commentview">댓글</option>
</select>
</div> -->
		<table  border = "2" style = "    margin-left:auto; 
    margin-right:auto; text-align:center;">
		<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
						<col style="width:20%;" />
						<col style="width:20%" />
						<col style="width:20%;" />
						<col style="width:40%;"/>

					</colgroup>
					<thead>
						<tr>
							
							<th scope="col">신고자</th>
							<th scope="col">신고받은 자</th>
							<th scope="col">카테고리</th>
							<th scope="col">관리</th>
						</tr>
						
					</thead>
					<tbody>
							<c:forEach items="${rp}" var="rp">
							<tr>
								<td>${rp.reporter}</td>
								<td>${rp.reported_id}</td>
								<td>${rp.category}</td>
								<td colspan = "2"><button>활동정지</button><button>강제탈퇴</button></td>

							</tr>
								
							<tr>
							
								<td colspan = "3" id = "goodtd">신고 내용 : ${rp.report_con}</td>
							</tr>
							</c:forEach>
						
					</tbody>
		</table>
<!-- <script>
function change() {
	   $("#select").change(function() {
	      var select = $("#select option:selected").val();
	      if(select == "commview") {
	         $('.boardline').hide();
	         $('.commline').show();
	      }
	      else if(select == "boardview") {
	         $('.commline').hide();
	         $('.boardline').show();
	      }
	      else if(select == "commentview") {
		         $('.commline').hide();
		         $('.boardline').show();
		      }
	      else{
	         $('.commline').show();
	         $('.boardline').show();
	         }
	   })
	}
</script> -->
</body>
</html>