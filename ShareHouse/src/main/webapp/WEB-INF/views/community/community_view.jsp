<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		width:100%;
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
	
	#title{
		width : 55%;
		margin:auto;
	}
</style>

<link href="/css/community_view.css" rel="stylesheet">
</head>
<body>

<div id = "title">
	<a href="/community/community_list" class="community_list">커뮤니티</a> 	

<hr>
<div id="viewpost">
<table border="1" class="table">
<tr>
<td>제목 : ${dto.comm_title}</td>
</tr>
<tr>
<td>
<b>작성자 : ${dto.id}	작성일 : <fmt:formatDate value="${dto.comm_date }" dateStyle="short"/>	조회수 : ${dto.comm_v_cnt}</b>

</td>
</tr>
<tr height ="300">
<td>
${dto.comm_con}
</td>
</tr>
</table>

	<c:if test="${ user.id == dto.id }">
		<a href="/community/community_update/${dto.comm_no}">글 수정 </a> 
		<a id="${dto.comm_no}" href="#">글 삭제</a>
	</c:if>
		<button type="button" onclick="location.href='/community/community_list'">목록으로</button>
<div>
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
	<input name="content" id="content"><button id="add">등록</button>
</div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let comm_no = $(this).attr("id");
			$.ajax({url:"/community/delete", 
					data:"comm_no="+comm_no, 
					method:"delete"
					}
			).done(function(){
				location.href="/community/community_list";
			})
			return false;
		})//click
		
		$("#add").click(function(){
			let id = "${user.id}"; // 세션에 저장된 id값
			let comment_con = $("#content").val();
			let comm_no = ${dto.comm_no};
			
			$.ajax({url:"/comment/insert",
					data:"comm_no="+comm_no+"&id="+id+"&comment_con="+comment_con,
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
			
		})//click
	})//ready
</script>
</body>
</html>