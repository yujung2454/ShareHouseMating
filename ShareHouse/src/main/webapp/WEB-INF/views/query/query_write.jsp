<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<link rel="stylesheet" type="text/css" href="/css/query.css" />
</head>
<body>
	<header> </header>

	<div id="center">
		<!-- 게시글 리스트 테이블 -->
		<div id="title">
			<a href="/query_list" class="query_list">문의</a> <br>
			<h2>글 작성</h2>
			<hr>
		</div>
		<form method="post" id="update" action="query_write">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="update_table">

				<div class="subject">
					제목 : <input name="query_title" placeholder="제목을 입력해주세요" size="50"
						maxlength="100" required="required" />
					<%-- <input type="hidden" name="comm_no" value="${dto.comm_no}" />  --%>
				</div>


				<div class="user">
					작성자 : ${user.user_Img} ${user.id} <input type="hidden" name="id"
						value="${user.id}"> <select name="category" id="sign1">
						<option value="매물 관련">매물 관련</option>
						<option value="계약 관련">계약 관련</option>
						<option value="커뮤니티 관련">커뮤니티 관련</option>
						<option value="기타">기타</option>
					</select> 휴대전화 : ${user.tel} <input type="hidden" name="tel"
						value="${user.tel}"> 
						<br>이메일 : ${user.email} <input
						type="hidden" name="email" value="${user.email}">
				</div>


				<div class="content">
					<textarea name="query" id="content" style="width: 100%" placeholder="내용을 입력하세요"
						required="required"> ${dto.query} </textarea>
				</div>

			</div>
			<div id="button" align="center">
				<button type="submit" id="save" class="save" value="완료">완료</button>
				<button type="button" id="cancel" value="취소" onclick="location.href='query_list'">취소</button>
			</div>
		</form>
	</div>


	<footer> </footer>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js"
		charset="utf-8"></script>
	<script>
		let oEditors = []

		smartEditor = function() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "content",
				sSkinURI : "/smarteditor/SmartEditor2Skin.html",
				fOnAppLoad : function() {
					oEditors.getById["content"].exec("PASTE_HTML",
							[ '${dto.query}' ]);
				},
				fCreator : "createSEditor2"
			})
		}

		$(document).ready(function() {
			smartEditor()

			$("#save").click(function() {
				oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				$("#update").submit();
			});

		})
	</script>
</body>
</html>