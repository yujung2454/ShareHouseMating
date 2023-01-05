<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 홈페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin_nav.css" />
</head>
<body>
<header>
</header>


	
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
		<main>
		
		전체 방문자 수: ${sessionScope.totalCount}

		오늘의 방문자 수: ${sessionScope.todayCount}
		</main>







	<footer>
</footer>
</body>
</html>