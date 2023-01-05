<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<style>
</style>
<link rel="stylesheet" type="text/css" href="/css/query.css" />
</head>
<body>

	<div id="center">
		<!-- 게시글 리스트 테이블 -->
		<div id="title">
			<a href="/query/query_list" class="query_list">문의하기</a> <br>
			<hr>


			<div class="table_view">
				<div class="subject">제목 : ${dto.query_title}</div>

				<div class="content_info">

					<div class="writer">작성자 : ${dto.id}</div>
					<div class="date">
						작성일 :
						<fmt:formatDate value="${dto.query_date }" dateStyle="short" />
					</div>
					<div class="category">카테고리 : ${dto.category}</div>


				</div>
				<div class="show_content">${dto.query}</div>
			</div>
		</div>
<hr>
		<div class="answer">
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
			<c:if test="${dto.answer == null}">
			<div class="answer_submit">
				<form method="post" action="/insert/answer/${dto.query_no}">
					<input name="answer" id="answer" class="answer_input" placeholder="답변을 작성해주세요">
					<button type="submit" class="submit">답변 등록</button>
				</form>
				</div>
			</c:if>
		</sec:authorize>
		<div class="answer_content">
			${dto.answer}
		</div>
			<!-- 문의 답변 내용 -->
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				<c:if test="${dto.answer != null}">
				<div class="answer_update">
					<a href="/admin/ad_query_update/${dto.query_no}">수정하기</a>
				</div>
				</c:if>
			</sec:authorize>
		</div>
		<br>
		<div class="btn">
			<c:if test="${ user.id == dto.id }">
				<button type="button" class="update">
					<a href="/query_update/${dto.query_no}">글 수정 </a>
				</button>
				<button type="button" class="delete">
					<a id="${dto.query_no}" href="#">글 삭제</a>
				</button>
			</c:if>
			<button type="button" class="redirect"
				onclick="location.href='/query_list'">목록으로</button>
		</div>

	</div>

	<%-- <div>
	<div id="comment">
		<c:forEach items="${commentList}" var="comm_comment">
				<div>${comm_comment.id} / <fmt:formatDate value="${comm_comment.comment_date }" dateStyle="short"/></div>
				<div>${comm_comment.comment_con} 
					<c:if test="${comm_comment.id == user.id }">
						<button class="dbtn" id="${comm_comment.comment_no}">삭제</button>
					</c:if>
				</div>
				<hr>
		</c:forEach>
	</div>

</div> --%>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function() {
			$("a[id]").click(function() {
				let query_no = $(this).attr("id");
				$.ajax({
					url : "/delete",
					data : "query_no=" + query_no,
					method : "delete"
				}).done(function() {
					location.href = "/query_list";
				})
				return false;
			})//click

			//답변 등록
			/* $("#answer").click(function(){
				let answer = $("#answer").val();
				let query_no = ${dto.query_no};
				
				$.ajax({url:"/comment/insert",
						data:"query_no="+query_no+"&answer="+answer,
						method:"get",
						dataType:"json"
				}).done(function(resp){
						let commentlist = "";
						resp.forEach(function(comm_comment,index){
							commentlist += "<div>"+comm_comment.id+" / "+new Date(comm_comment.comment_date).toLocaleDateString()
							+"</div><div>"+comm_comment.comment_con;
							
							if(id == comm_comment.id){
								commentlist +='<button class="dbtn" id="'+comm_comment.comment_no+'">삭제</button>';
							}
							commentlist+="</div><hr>";
						});
						
						$("#comment").html(commentlist);
						$("#content").val("");
					});
				
			})//click
			$("#comment").on("click",".dbtn",function(){
				let comment_no = $(this).attr("id");
				$.ajax({url:"/comment/delete/"+comment_no,
					method:"get"
			}).done(function(){
					location.reload();		
				});
				
			})//click */

		})//ready
	</script>
</body>
</html>