<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 게시물 보기</title>
<link rel="stylesheet" type="text/css" href="/css/admin_nav.css" />
</head>
<body>
<aside>
			<nav>
			<div class="logo">
			<span><img src="/images/home.png"></span><span style="text-align : center; line-height:3rem; font-size : 1.5rem;">우리 집</span>
			</div>
				<ul>
					<li><a href="/admin/admin_notice">공지사항 관리</a></li>
					<li><a href="/admin/user_manage">회원관리</a></li>
					<li><a href="/admin/report_list">신고리스트</a></li>
					<li><a href="/admin/ad_query_list">문의리스트</a></li>
					<li><a href="/admin/allboardview">모든 게시물 보기</a></li>
					<li><a href="/popup">메인 팝업 관리</a></li>
				</ul>				
			</nav>
		</aside>
<h1 style="margin-left:400px;">모든 게시물 보기</h1>
<div>
<select id="select" name="select" onchange="change()" style="margin-left:150px; margin-bottom:10px; width:100px; height:30px">
<option value="all">전체보기</option>
<option value="commview">커뮤니티</option>
<option value="boardview">매물</option>
</select>
</div>
<div id="view">
<table class="table_list" border="1" style="margin-left:400px;">
<tr class="commline" bgcolor="#aaaaaa">
<th colspan='4' style="text-align:center; font-size:20px;"> 커뮤니티 </th>
</tr>
<tr class="commline" bgcolor="#dcdcdc">
<td width="150px">게시물 번호</td>
<td width="150px">아이디</td>
<td width="150px">제목</td>
<td width="150px">조회수</td>
</tr>
<c:if test="${count == 0}">
						<tr>
							<td colspan="5" id="none_post">게시판에 저장된 글이 없습니다.</td>
						</tr>
					</c:if>
				<c:if test="${count != 0}">
<c:forEach items="${cList1}" var="comm">
<tr class="commline">
<td><a href="/community/community_view/${comm.comm_no}">${comm.comm_no}</a></td>
<td>${comm.id}</td>
<td><a href="/community/community_view/${comm.comm_no}">${comm.comm_title}</a></td>
<td>${comm.comm_v_cnt}</td>
</tr>
</c:forEach>
</c:if>
<tr class="boardline" bgcolor="#aaaaaa">
<th colspan='4' style="text-align:center; font-size:20px;"> 매물 </th>
</tr>
<tr class="boardline" bgcolor="#dcdcdc">
<td width="150px">게시물 번호</td>
<td width="150px">아이디</td>
<td width="150px">제목</td>
<td width="150px">조회수</td>
</tr>
<c:if test="${count == 0}">
						<tr>
							<td colspan="5" id="none_post">게시판에 저장된 글이 없습니다.</td>
						</tr>
					</c:if>
				<c:if test="${count != 0}">
<c:forEach items="${cList2}" var="board">
<tr class="boardline">
<td><a href="/offer/detail_info/${board.board_no}">${board.board_no}</a></td>
<td>${board.id}</td>
<td><a href="/offer/detail_info/${board.board_no}">${board.title}</a></td>
<td>${board.v_cnt}</td>
</tr>
</c:forEach>
</c:if>
</table>
</div>
<div id="paging" align="center">
			<c:if test="${begin > pageNum}">
				<a href="allboardview?p=${begin-1}&sort=${sort}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end = "${end}" var='i'>
				<a href="allboardview?p=${i}&sort=${sort}" class="page">${i}</a>
			</c:forEach>
			<c:if test="${end < totalPages}">
				<a href="allboardview?p=${end+1}&sort=${sort}">[다음]</a>
			</c:if>
		</div>
		
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>

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
		else{
			$('.commline').show();
			$('.boardline').show();
			}
	})
}

	
	
</script>
</body>
</html>