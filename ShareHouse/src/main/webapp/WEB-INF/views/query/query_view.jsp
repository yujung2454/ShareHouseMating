<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
<style>
	#chooseFile {
    	visibility: hidden;
	}
	table {
		width: 800px;
		height: 400px;
		margin-left: 50px;
	}
	img-button {
		width:20;
		height:20;
	
	}
	textarea {
		width:100%;
		height:100%;
		border: 0;
		resize: none;
	}
</style>
</head>
<body>

<div id = "title">
	<h1>문의하기</h1>
</div>
<hr>
<form id="viewpost">
<table border="1" class="table">
<tr>
<td>
<pre><b>제목 : ${dto.query_title}							카테고리 : ${dto.category}</b>
</pre>
</td>
</tr>
<tr>
<td>
<pre><b>작성자 : ${dto.id}							작성일 : ${dto.query_date}</b>
</pre>
</td>
</tr>
<tr height ="300">
<td>
${dto.query}
</td>
</tr>

</table>
</form>
	<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
	<c:if test="${dto.answer == null}">
	<form method="post" action="/insert/answer/${dto.query_no}">
	<input name="answer" id="answer" >
	<button type="submit">답변 등록</button>
	</form>
	</c:if>
	</sec:authorize>
	
	${dto.answer} <!-- 문의 답변 내용 -->
	<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
	<c:if test="${dto.answer != null}">
	<a href="/admin/ad_query_update/${dto.query_no}">수정하기</a> 
	</c:if>
	</sec:authorize>
		<br>
		<c:if test="${dto.id == user.id }">
		<a href="/query_update/${dto.query_no}">글 수정</a> 
		<a id="${dto.query_no}" href="#">글 삭제</a>
		</c:if>
		<button type="button" onclick="location.href='/query_list'">목록으로</button>

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
	$(function(){
		$("a[id]").click(function(){
			let query_no = $(this).attr("id");
			$.ajax({url:"/delete", 
					data:"query_no="+query_no, 
					method:"delete"
					}
			).done(function(){
				location.href="/query_list";
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