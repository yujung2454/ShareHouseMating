<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 홈페이지</title>
<style>
	html, body{
		width : 100%;
		height : 100%;
		margin : 0;
	}
	main{
		width : 100%;
		height : 100%;
	}
	aside{
		width : 20%;
		height : 100%;
		margin : 0;
	}
	nav{
		background-color : #444444;
		color : white;
		height : 100%;	
	}
	ul{
		padding:0;
	}
	ul > li{
		list-style:none;
		width : 100%;
		height : 3rem;
		line-height : 3rem;
		text-align : center;
		cursor:pointer;
	}
	li:hover{
		background-color:#565656;
	}
	.logo{
		position : relative;
		display : inline-block;
		width : 100%;
		text-align:center;
	}
</style>
</head>
<body>
<header>
</header>


	<main>
		<aside>
			<nav>
			<div class="logo">
			<span><img src="/images/home.png"></span><span style="text-align : center; line-height:3rem; font-size : 1.5rem;">우리 집</span>
			</div>
				<ul>
					<li>통계</li>
					<li>공지사항 관리</li>
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
	</main>







	<footer>
</footer>
</body>
</html>