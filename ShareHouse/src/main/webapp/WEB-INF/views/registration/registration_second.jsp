<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물등록-2</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<link href="/css/registration.css" rel="stylesheet">
<style>
#att_zone {
  width: 660px;
  height: 300px;
  padding: 10px;
  border: 1px dotted #00f;
  clear:both;
  margin:auto;
}

#att_zone:empty:before {
  content: attr(data-placeholder);
  color: #999;
  font-size: .9em;
  clear:both;
  }

[contenteditable="true"]:empty:before {
   content: attr(placeholder);
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
						  <a href="/admin/admin_notice">관리자페이지</a>
					</sec:authorize>
				</c:if>
			</span>
		</div>
	</div>
<div class="quick">
	<div class="quick_shape">
		<a href="/search/searchlist">
			<img src="/images/search.png" title="검색">
		</a>
	</div>
	<div class="quick_shape">
		<a href="/wishlist">
			<img src="/images/like.png" title="찜">
		</a>
	</div>
</div>
<form >
	<div id="box" >
		<input type="button" value="방 추가" class="plus" onclick="textbox()">
		
	</div>
</form>

<form id="imgUpload" action="/upload" method="post" enctype="multipart/form-data" style="clear:both">
<input type="hidden" name= "board_no" value="${board_no }">

<div id="hidden">

</div>

<div id='image_preview'>
<input type='file' id='btnAtt' multiple='multiple' name='file' class="img"/>
	<div id='att_zone' 
	      data-placeholder="방 추가 버튼을 눌러 방이름을 정해주시고 방에 해당되는
	      					이미지를 첨부한 후 저장 버튼을 눌러주세요.
	      					(최대 8장)"></div><br>
</div>

<div class="btnfunc">
<button class="save_btn" type="button" value ="저장" onclick="uploadfile()">저장</button>
<button type="button" value ="다음" onclick="location.href='registration_third/${board_no}'" class="registration">다음</button>
<button type="button" value ="취소" onclick="location.href='/'" class="cancel">취소</button>
</div>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function s_location(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	
	location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
	})
}

	function textbox() {
        var room_name = prompt("방 이름을 입력해주세요.");
        const box = document.getElementById("box");
      	const newP = document.createElement('p');
        newP.innerHTML = "<input type='button' class='plustext' value='"+room_name+"'>"
        box.appendChild(newP);			
        $("#hidden").append("<input type='hidden' name='room_name' value='"+room_name+"' id='room_name'>")				
      	$("#btnAtt").attr("disabled",false);
	} //방추가 버튼
//	let arr_img = [];
	(
			  imageView = function imageView(att_zone, btn){

			    var attZone = document.getElementById(att_zone);
			    var btnAtt = document.getElementById(btn)
			    var sel_files = [];
			    
			    // 이미지와 체크 박스를 감싸고 있는 div 속성
			    var div_style = 'display:inline-block;position:relative;'
			                  + 'width:150px;height:120px;margin:5px;border:1px solid #00f;z-index:1';
			    // 미리보기 이미지 속성
			    var img_style = 'width:100%;height:100%;z-index:none';
			    // 이미지안에 표시되는 체크박스의 속성
			    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
			                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.1);color:#f00';
				
			    
			    btnAtt.onchange = function(e){
			      attZone.innerHTML ="";
			      var files = e.target.files;
			      var fileArr = Array.prototype.slice.call(files)
			      for(f of fileArr){
			        imageLoader(f);
			      }
			      
			    }  
			    
	
			  
			    attZone.addEventListener('drop', function(e){
			      var files = {};
			      e.preventDefault();
			      e.stopPropagation();
			      var dt = e.dataTransfer;
			      files = dt.files;
			      for(f of files){
			        imageLoader(f);
			      }
			      
			    }, false)
			    
			    /*첨부된 이미지를 배열에 넣고 미리보기 */
			    imageLoader = function(file){
			      sel_files.push(file);
			      var reader = new FileReader();
			      reader.onload = function(ee){
			        let img = document.createElement('img')
			        img.setAttribute('style', img_style)
			        img.src = ee.target.result;
			        attZone.appendChild(makeDiv(img, file));
			      }
			      
			      reader.readAsDataURL(file);
			    }
			    
			    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
			    makeDiv = function(img, file){
			      var div = document.createElement('div')
			      div.setAttribute('style', div_style)
			      div.setAttribute('class','imgfile')
			      
			      var btn = document.createElement('input')
			      btn.setAttribute('type', 'button')
			      btn.setAttribute('value', 'x')
			      btn.setAttribute('delFile', file.name);
			      btn.setAttribute('style', chk_style);
			      btn.onclick = function(ev){
			        var ele = ev.srcElement;
			        var delFile = ele.getAttribute('delFile');
			        for(var i=0 ;i<sel_files.length; i++){
			          if(delFile== sel_files[i].name){
			            sel_files.splice(i, 1);      
			          }
			        }
			        
			        dt = new DataTransfer();
			        for(f in sel_files) {
			          var file = sel_files[f];
			          dt.items.add(file);
			        }
			        btnAtt.files = dt.files;
			        var p = ele.parentNode;
			        attZone.removeChild(p)
			      }
			      div.appendChild(img)
			      div.appendChild(btn)
			      return div
			    }
			  }
			)('att_zone', 'btnAtt') // 다중이미지 미리보기
		
//file 값 변경시 		"<input type='file' id='btnAtt' multiple='multiple' name='file' style="margin-left:360px; margin-bottom:10px;"/>
//" 추가
			

	function uploadfile() {
	
	/* if(document.getElementById('btnArr').value){
		alert('방 하나당 업로드는 한번씩 가능합니다')
		return false;
	} */
	
	var form = $('#imgUpload')[0];
	var formData = new FormData(form);

	$.ajax({
	type:"post",
	enctype:'multipart/form-data',
    url:'/upload', //컨트롤러
    data:formData,
    processData:false,
    contentType:false,
    cache:false,
    success:function(data){
    	console.log("success : ", data);
    	
    	$("#room_name").remove()
// input type='file' 두번쨰부터 삭제
    },
    error:function(e){
        console.log("error : ", e);
    }
		});//ajax
	}	
	// 업로드 기능

	$(".btnfunc").off("click").on("click",".save_btn",function(){
    		$("#att_zone").empty()
    	})
    

</script>
</body>
</html>