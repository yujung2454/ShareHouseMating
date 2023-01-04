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
<div>
<select id="select" name="select" onchange="change()">
<option value="all">전체보기</option>
<option value="commview">커뮤니티</option>
<option value="boardview">매물</option>
<option value="commentview">댓글</option>
</select>
</div>

<form method="post" action="/admin/report_list">
<div id="write" align="center">
			<input type = "submit" class="report_list" id="del" value= "삭제">
</div>
		<table  border = "1" style = "margin-left:auto; 
    margin-right:auto; text-align:center;">
		<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
						<col style="width:10%;" />
						<col style="width:15%;" />
						<col style="width:15%" />
						<col style="width:15%;" />
						<col style="width:15%;" />
						<col style="width:30%;"/>

					</colgroup>
					<thead>
						<tr>
							<th scope="col"><input type="checkbox" id="cbx_chkAll"/>전체 선택</th>
							<th scope="col">신고자</th>
							<th scope="col">신고받은 자</th>
							<th scope="col">카테고리</th>
							<th scope="col">회원상태</th>
							<th scope="col">관리</th>
						</tr>
						
					</thead>
					<tbody>
					
							<c:forEach items="${rp}" var="rprp">
							<tr>
								<td><input type="checkbox" name="report_no" value="${rprp.report_no}"></td>
								<td>${rprp.reporter}</td>
								<td>${rprp.reported_id}</td>
								<td>${rprp.category}</td>
								<td>${status}</td>
								<td colspan = "2"><button type="button" class="updateuser" itemid="${rprp.reported_id}">활동정지</button><button type="button" class="deleteuser" itemid="${rprp.reported_id}">강제탈퇴</button></td>

							</tr>
								
							<tr>
							
								<td colspan = "5" id = "goodtd">신고 내용 : ${rprp.report_con}</td>
							</tr>
							</c:forEach>
					
					</tbody>
		</table>
		<input type = "hidden" value= "${rprp.reported_id}" name = "reported_id"/>
		</form>	
		
		
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>		
<script>
//체크박스
$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=report_no]").prop("checked", true);
				else $("input[name=report_no]").prop("checked", false);
			});
			
			$("input[name=report_no]").click(function() {
				var total = $("input[name=report_no]").length;
				var checked = $("input[name=report_no]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});
		
// 옵션		
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

// 탈퇴, 중지
$(function(){
	$(".deleteuser").click(function(){
		 let reported_id = $(this).attr("itemid");
		
		if (!confirm("정말로 탈퇴 시키겠습니까?")) {
    			return false;
			} else {
				$.ajax({url:"/tae/delete",
				 	data:"reported_id="+reported_id,
				 	method:'post'
				}).done( function(data){
					alert("회원을 탈퇴시켰습니다.");
					window.location.href = "/admin/report_list";
				})
			}//if
	})//click
	$(".updateuser").click(function(){
		 let reported_id = $(this).attr("itemid");
		
		if (!confirm("정말로 중지 시키겠습니까?")) {
   			return false;
			} else {
				$.ajax({url:"/tae/update",
				 	data:"reported_id="+reported_id,
				 	method:'post'
				}).done( function(data){
					alert("회원을 활동 중지시켰습니다.");
					
					window.location.href = "/admin/report_list";
				})
			}//if
	})//click
})//ready
</script>
</body>
</html>