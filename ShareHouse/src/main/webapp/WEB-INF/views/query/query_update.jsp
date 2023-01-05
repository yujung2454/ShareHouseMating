<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/css/query.css" />
</head>
<body>

	<div id="center">
		<!-- 게시글 리스트 테이블 -->
		<div id="title">
			<a href="/query_list" class="query_list">문의리스트</a> <br>
			<h2>글 수정</h2>
			<hr>
		</div>
		<form method="post" id="update" action="/query_update">
			<input type="hidden" name="_method" value="put">
			<div class="update_table">

				<div class="subject">
					제목 : <input name="query_title" value="${dto.query_title}" size="50"
						maxlength="100" required="required" /> <input type="hidden"
						name="query_no" value="${dto.query_no}" />
				</div>


				<div class="user">
					작성자 : ${user.user_Img} ${user.id} <input type="hidden" name="id"
						value="${user.id}" readonly> <select name="category"
						id="sign1">
						<option value="매물 관련">매물 관련</option>
						<option value="계약 관련">계약 관련</option>
						<option value="커뮤니티 관련">커뮤니티 관련</option>
						<option value="기타">기타</option>
					</select>
				</div>

				
				<div class="content">
					<textarea name="query" id="content" style="width: 100%"
						required="required"> ${dto.query} </textarea>
				</div>

			</div>
			<div id="button" align="center">
				<button type="submit" id="save" class="save" value="완료">완료</button>
				<button type="button" class="cancel" value="취소"
					onclick="location.href='/query_list'">취소</button>
			</div>
		</form>
	</div>
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