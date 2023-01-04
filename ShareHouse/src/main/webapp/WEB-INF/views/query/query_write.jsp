<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<style>
	#center {
		width : 55%;
		margin : auto;
	}
	button{
		cursor : pointer;
		border-radius : 12px;
		width : 90px;
		height : 45px;
		border : none;
		outline : none;
		font-weight : bold;
		color : white;
	}
	
	table{
		width : 80%;
		margin:auto;
		border-collapse : collapse;
	}
	input, textarea {
		border : none;
	}
	input:focus, textarea:focus {
		outline-style : none;
	}
	.subject , .user{
		height : 40px;
	}
	#button {
		margin-top : 30px;
	}
	#save {
		background-color : #4CAF50;	
	}
	#cancel{
		background-color : #e7e7e7; color : black;
	}
	#list{
		background-color : #555555;
	}
</style>
</head>
<body>
<div class="fixed">
<div id="uppernav">
		<div id="main">
			<span id="home_img" class="to_main" ><a href="/"><img src="/images/home.png"></a></span>
			<span id="home" class="to_main"><a href="/">우리집</a></span>
		</div>
		<ul class="upper_frame">
			<li class="upper_menu"><a href="/introduce/introduce">쉐어하우스란?</a></li>
			<li class="upper_menu" onclick="s_location()" style="cursor:pointer">방 찾기</li>
			<li class="upper_menu"><a href="/registration/registration_first">매물 등록</a></li>
			<li class="upper_menu"><a href="/community/community_list">커뮤니티</a></li>
			<li class="upper_menu"><a href="/query_list">문의</a></li>
		</ul>
		<div id="p_info">
			<span id="notification"><img src="/images/notification.png"></span>
			<span id="login">
				<c:if test="${user == null}">
					<a href="/login">로그인</a>
				</c:if>
				<c:if test="${user != null}">
					<c:if test="${user.user_Img == null}">
						<a href="/mypage/info"><img src="/images/profil.png"></a>
					</c:if>
					<c:if test="${user.user_Img != null}">
						<div class="user_profil_img">
							<a href="/mypage/info"><img class="user_uimg" src="${user.user_Img}"></a>
						</div>
					</c:if>
					<a href="/logout" class="logout">로그아웃</a>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<a href="/admin/admin_main">관리자페이지</a>
					</sec:authorize>
				</c:if>
			</span>
		</div>
	</div>
</div>

<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
	<h1>문의하기</h1>
</div>
<form method="post" id="writeform" action="query_write">
 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<table border="1">
		<tr>
			<td class="subject">제목 : <input name="query_title" placeholder="제목을 입력해주세요" size="90" maxlength="100" required="required"/></td>
		</tr>
		<tr>
			<td class="user">작성자 : ${user.user_Img} ${user.id}
			<input type = "hidden" name="id" value="${user.id}"  >
			
			<select name="category" id="sign1">
			<option value = "매물 관련">매물 관련</option>
			<option value = "계약 관련">계약 관련</option>
			<option value = "커뮤니티 관련">커뮤니티 관련</option>
			<option value = "기타">기타</option>
			</select>
			</td>
		</tr>
		<tr>
			<td class="user">휴대전화 : ${user.tel}
			<input type = "hidden" name="tel" value="${user.tel}"  ></td>
		</tr>
		<tr>
			<td class="user">이메일 : ${user.email}
			<input type = "hidden" name="email" value="${user.email}"  ></td>
		</tr>
		<tr>
			<td><textarea name="query" id="query" 
			rows="20" cols="10" 
			placeholder="내용을 입력해주세요"
			style="width : 700px" required="required"></textarea>
			</td>
		</tr>
	</table>
	<div id="button" align="center">
		<button type="submit" id="save" value="완료">완료</button>
		<button type="button" id="cancel" value="취소" onclick="location.href='query_list'">취소</button>
		<button type="button" id="list" value="목록으로" onclick="location.href='query_list'">목록으로</button>
	</div>
</form>
</div>

<nav>
		<div class="quick">
			<div class="quick_shape">
				<a href="/search/searchlist"> <img src="/images/search.png"
					title="검색">
				</a>
			</div>
			<div class="quick_shape">
				<a href=""> <img src="images/like.png" title="찜">
				</a>
			</div>
		</div>
	</nav>
	
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script async
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&libraries=places">
</script>
<script>
	function s_location(){
		navigator.geolocation.getCurrentPosition(function(pos) {
		    var latitude = pos.coords.latitude;
		    var longitude = pos.coords.longitude;
		
		location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
		})
	}
</script>
</body>
</html>