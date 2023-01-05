<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지사항</title>
<link rel="stylesheet" type="text/css" href="/css/admin_nav.css" />
<link rel="stylesheet" type="text/css" href="/css/admin_user.css" />
</head>
<body>
<header></header>
<aside>
			<nav>
			<div class="logo">
			<span><img src="/images/home.png"></span><span style="text-align : center; line-height:3rem; font-size : 1.5rem;">우리 집</span>
			</div>
				<ul>
					<li>통계</li>
					<li><a href="/admin/admin_notice">공지사항 관리</a></li>
					<li>대기매물 승인</li>
					<li><a href="/admin/user_manage">회원관리</a></li>
					<li>신고리스트</li>
					<li>문의리스트</li>
					<li>모든 게시물 보기</li>
					<li>꾸미기</li>
					<li>사이트 설정</li>
				</ul>				
			</nav>
		</aside>
		<main>
		
		<table class="table_list" border = "1">
				<!-- 세로줄 없앨지, 세로 간격 의논해보기 -->
				<colgroup>
					<col style="width: 10%;" />
					<col style="width: 40%" />
					<col style="width: 20%;" />
					<col style="width: 20%;" />
					<col style="width: 10%;" />
				</colgroup>
				<thead>
					<tr style="font-size: 1.3rem;">
						<th scope="col" style="padding-left: 1%;">번호</th>
						<th scope="col" style="padding-left: 1%;">제목</th>
						<th scope="col" style="padding-left: 1%;">작성자</th>
						<th scope="col" style="padding-left: 1%;">작성일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${count == 0}">
						<tr>
							<td colspan="5" id="none_post">게시판에 저장된 글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${count != 0}">
						<c:forEach items="${nList}" var="comm">
							<tr class="notice">
								<td><a href="/community/community_view/${comm.comm_no}">${comm.comm_no}</a></td>
								<td><a href="/community/community_view/${comm.comm_no}">${comm.comm_title}</a></td>
								<td>${user.user_img}${comm.id}</td>
								<td><fmt:formatDate value="${comm.comm_date}"
										dateStyle="short" /></td>
								<td>${comm.comm_v_cnt}</td>
							</tr>
						</c:forEach>
					</c:if>

				</tbody>
			</table>
		</main>
<footer></footer>
</body>
</html>