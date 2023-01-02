 <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width : 50%;
		align : center;
		border : 1px slide black;
	}
</style>
</head>
<body>
	<header> </header>
	
	
	<div id="search">
		
	</div>
	
	<div class="btn_list">
		<button class="stop_btn" onclick="stop()">활동 정지</button>
		<button class="release_btn">정지 해제</button>
		<button class="del_btn" onclick="del_user()">강제 탈퇴</button>
	</div>
	<div id="board">
		<table>
			<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
			<colgroup>
				<col style="width: 5%;" />
				<col style="width: 5%;" />
				<col style="width: 5%;" />
				<col style="width: 20%;" />
				<col style="width: 20%;" />
				<col style="width: 5%;" />
				<col style="width: 10%;" />
				<col style="width: 20%;" />
				<col style="width: 10%;" />
				
			</colgroup>
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col" style="padding-left: 1%;">ID</th>
					<th scope="col" style="padding-left: 1%;">이름</th>
					<th scope="col" style="padding-left: 1%;">Email</th>
					<th scope="col" style="padding-left: 1%;">전화번호</th>
					<th scope="col" style="padding-left: 1%;">성별</th>
					<th scope="col" style="padding-left: 1%;">주소</th>
					<th scope="col" style="padding-left: 1%;">상세주소</th>
					<th scope="col">활동상태</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:if test="${count == 0}">
					<tr>
						<td colspan="5" id="none_post">회원이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${count != 0}">
					<c:forEach items="${uList}" var="user">
						<tr>
							<td><input type="checkbox" name="user_select" data-user ="${user.id }" /></td>
							<td>${user.id}</td>
							<td>${user.name}</td>
							<td>${user.email}</td>
							<td>${user.tel}</td>
							<td>${user.gender}</td>
							<td>${user.user_add}</td>
							<td>${user.user_add2}</td>
							<td>${user.status}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		<div id="paging" align="center">
			<c:if test="${begin > pageNum}">
				<a href="user_manage?p=${begin-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end = "${end}" var='i'>
				<a href="user_manage?p=${i}" class="page">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages}">
				<a href="user_manage?p=${end+1}">[다음]</a>
			</c:if>
		</div>
	</div>
			<footer> </footer>
			
			
<form name="deleteFrom" method="post" action="/admin/del_user">
	<input type="hidden" name="idList" />
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

function del_user(){
	
	var delArray = [];
	var uri = '/admin/del_user';
	var encoded = encodeURI(uri);
	
	$("input:checkbox[name='user_select']:checked").each(function(){
		delArray.push($(this).val("${user.id}"));
	});
	
	console.log(delArray);
	
	if(delArray == ""){
		alert("삭제할 항목을 선택해주세요.");
		return false;
	}
	
	var confirmAlert = confirm('정말로 삭제하시겠습니까?');

	if(confirmAlert){
		
		$.ajax({
	        type : 'post'
	       ,url : encoded
	       ,dataType : 'json'
	       ,data : JSON.stringify(delArray)
	       ,success : function(result) {
				alert("해당글이 정상적으로 삭제되었습니다.");
				location.reload();
	       },
	       error: function(request, status, error) {
	         
	       }
	   })	
	}
}



</script>
</body>
</html>