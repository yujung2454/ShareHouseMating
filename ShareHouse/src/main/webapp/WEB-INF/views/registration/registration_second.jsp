<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>매물등록-2</title>
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
</style>
</head>
<body>
<form >
	<div id="box" >
		<input type="button" value="+" class="plus" onclick="textbox()">
		<input type="hidden" value="${board_no}" name="${board_no}">
		
	</div>
</form>
<form id="imgUpload" method="post" enctype="multipart/form-data">
<div id='image_preview'>
	<div id='att_zone' class='att_zone'
	      data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그&드랍 하세요'></div><br>
	      <input type='file' id='btnAtt' multiple='multiple' style='margin-left:370px' name="file"/>
	
</div>

<div class="btn">
<button type="submit" value ="저장" onclick="uploadfile()">저장</button>
<button type="button" value ="다음" onclick="location.href='registration_third'" class="registration">다음</button>
<button type="button" value ="취소" onclick="location.href='/'" class="cancel">취소</button>
</div>
</form>
<script>

	function textbox() {
        var room_name = prompt("방 이름을 입력해주세요.");
        const box = document.getElementById("box");
      	const newP = document.createElement('p');
        newP.innerHTML = "<input type='button' class='plustext' value='"+room_name+"'>"
        
        				+"";
        box.appendChild(newP);
	}
	
	( /* att_zone		 : 이미지들이 들어갈 위치 id, btn : file tag id */
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
			      var files = e.target.files;
			      var fileArr = Array.prototype.slice.call(files)
			      for(f of fileArr){
			        imageLoader(f);
			      }
			    }  
			    
			  
			    // 탐색기에서 드래그앤 드롭 사용
			    attZone.addEventListener('dragenter', function(e){
			      e.preventDefault();
			      e.stopPropagation();
			    }, false)
			    
			    attZone.addEventListener('dragover', function(e){
			      e.preventDefault();
			      e.stopPropagation();
			      
			    }, false)
			  
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
			)('att_zone', 'btnAtt')
			
			
	function uploadfile() {
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
    },
    error:function(e){
        console.log("error : ", e);
    }
		});//ajax
	}
	

    

</script>
</body>
</html>