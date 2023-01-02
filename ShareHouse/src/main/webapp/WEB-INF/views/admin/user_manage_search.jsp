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
			<form action="/admin/user_search">
			<input type="text" name="search" size="20" maxlength="225" placeholder = "검색어를 입력하세요">
			<button type='submit' value="검색" class="search"></button>
		</form>
	</div>
	
	<form id="form" method="post" action="/admin/user_manage">
	
	
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
					<th scope="col"><input type="checkbox" id="cbx_chkAll"/>전체 선택</th>
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
						<tr><c:if test="${user.status == 'ROLE_ADMIN' }">
							<td></td>
						</c:if>
						<c:if test="${user.status != 'ROLE_ADMIN' }">
							<td><input type="checkbox" name="user_select" value ="${user.id }" /></td>
						</c:if>
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
				<a href="user_manage?p=${begin-1}&search=${search}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end = "${end}" var='i'>
				<a href="user_manage?p=${i}&search=${search}" class="page">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages}">
				<a href="user_manage?p=${end+1}&search=${search}">[다음]</a>
			</c:if>
		</div>
	</div>
	<div class="btn_list">
		<input type="button" name="stopUser" class="btn" id="stopUser" value="활동 정지"  />
		<input type="button" name="release" class="btn" id="release" value="정지 해제" />
		<input type="button" name="delCheck" class="btn" id="delCheck" value="삭제" />
	</div>
	</form>
			<footer> </footer>
			
		

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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



    document.getElementById('stopUser').onclick = function() {
    	 document.getElementById('form').action = "/admin/stopUser";
        document.getElementById('form').submit();
        return false;

};

    document.getElementById('release').onclick = function() {
    	document.getElementById('form').action = "/admin/release";
        document.getElementById('form').submit();
        return false;
};

    document.getElementById('delCheck').onclick = function() {
    	document.getElementById('form').action = "/admin/delCheck";
        document.getElementById('form').submit();
        return false;
  
};
 


</script>
</body>
</html>