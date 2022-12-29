<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
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
<header>
</header>

<div id="center">
<!-- 게시글 리스트 테이블 -->
<div id = "title">
	<a href="community_list" class="community_list">커뮤니티</a> 	
</div>
<form method="post" id="writeform" action="community_write">
	<table border="1">
		<tr>
			<td class="subject">제목 :
			<input name="Comm_title" placeholder="제목을 입력해주세요" size="90" maxlength="100" required="required"/></td>
		</tr>
		<tr>
			<td class="user">작성자 : 
			<input name="id" value="${user.id}"></td>	<!-- readonly -->
		</tr>
		<tr>
			<td>
			<div class="smarteditor"><textarea name="Comm_con" id="content" 
			rows="20" cols="10" 
			placeholder="내용을 입력해주세요"
			 required="required" style="width:100%"></textarea></div>
			</td>
		</tr>
	</table>
	<div id="button" align="center">
		<button type="submit" id="save" value="완료">완료</button>
		<button type="button" id="cancel" value="취소" onclick="location.href='community_list'">취소</button>
		<button type="button" id="list" value="목록으로" onclick="location.href='community_list'">목록으로</button>
	</div>
</form>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
     let oEditors = []

    smartEditor = function() {
    	 
      console.log("Naver SmartEditor")
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "content",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
      })
    } 

    $(document).ready(function() {
  
      smartEditor() 
      
      $("#save").click(function(){
    	  oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
    	  $("#writeform").submit();
      });
      
    })
    
    

 
  </script>
 

<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	//let title = $(#title).val();
	$(document).onclick('#save', function(e){
		const title = $("#title").val().trim();
		const content = $("content").val().trim();
		
		if(title==""){
			alert("제목을 입력해주세요");
			return;
		}
		if(content=""){
			alert("내용을 입력해주세요");
			return;
		}
		
		var 
	})
</script>
 -->

<footer>
</footer>

</body>
</html>