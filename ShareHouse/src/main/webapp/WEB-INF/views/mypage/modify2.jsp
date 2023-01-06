<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<link href="/css/uppernav.css" rel="stylesheet">
<link href="/css/offerlist.css" rel="stylesheet">
<link href="/css/quick.css" rel="stylesheet">
<link href="/css/mypage.css" rel="stylesheet">
<link href="/css/userinfo.css" rel="stylesheet">
<link href="/css/usermodify.css" rel="stylesheet">
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
</div>
<nav class="mypagelist">
	<ul>
		<li class="mypage_sidebar"><a href="/mypage/info">회원정보</a><br></li>
		<li class="mypage_sidebar"><a href="javascript:passwordQuestion()">개인 정보 수정</a><br></li>
		<li id="board" class="mypage_sidebar" style="cursor:pointer">내 게시글 보기<br></li>
		<li class="mypage_sidebar under"><a href="/mypage/myPage_community">- 매물/게시글 목록</a><br></li>
		<li class="mypage_sidebar under"><a href="/mypage/application">- 입주 신청 목록</a><br></li>
		<li class="mypage_sidebar under"><a href="/mypage/mywish">- 내 입주 신청 목록</a><br></li>
		<li class="mypage_sidebar"><a href="/mypage/wishlist">찜 내역</a><br></li>
		<li class="mypage_sidebar"><a href="/mypage/query_history">문의 내역</a></li>
	</ul>
</nav>
<form class="userform" method="post" action="/mypage/infomodify" enctype="multipart/form-data">
	<div class="mypage_title">
		<h3>개인정보수정</h3>
	</div>
	<div class="user_info">
		<div class="uimg">
			<c:if test="${user.user_Img != null }">
				<img id="uimg" src="${user.user_Img }">
			</c:if>
			<c:if test="${user.user_Img == null }">
				<img id="uimg" src="/images/profil.png">
			</c:if>
		</div>
		<div>
			<label class="userimg" for="userimg">
			이미지 변경
			</label>
		<input type="file" onchange="preview(this)" id="userimg" name="userimg" class="image_input">
		</div>
		<div class="uframe">
			<div class="uframe2">
				&nbsp; 이름 :&nbsp; 
			</div>
			<div id="uname">
				<input id="userid" name="name" value="${user.name }">
			</div>
		</div>
		<div class="uframe">
			<div class="uframe2">
				&nbsp; 새 비밀번호 :&nbsp; 
			</div>
			<div id="uname">
				<input id="userpwd" type="password">
			</div>
		</div>
		<div class="uframe">
			<div class="uframe2">
			&nbsp; 	새 비밀번호 확인 :&nbsp; 
			</div>
			<div id="uname">
				<input id="userpwdconfirm" name="pwd" type="password">
			</div>
			<button type="button" class="ok_btn" onclick="passwordConfirm()">확인</button>
		</div>
		<div class="uframe">
			<div class="uframe2">
				&nbsp; 이메일 :&nbsp; 
			</div>
			<div id="uemail">
				<input id="useremail" name="email" value="${user.email }">
			</div>
		</div>
		<div class="uframe">
			<div class="uframe2">
				&nbsp; 전화번호 :&nbsp; 
			</div>
			<div id="utel">
				<input id="usertel" name="tel" value="${user.tel }">
			</div>
		</div>
		<div class="uframe addmodify">
			<div class="uframe2">
				&nbsp; 거주지 :&nbsp; 
			</div>
			<div id="uadd">
				${user.user_add } ${user.user_add2 }
			</div>
			<div class="addDisplay" style="display:none;width:100%">
				<input type="text" id="sample4_postcode" placeholder="우편번호" readonly>
				<input type="text" id="sample4_roadAddress" name="user_add" value="${user.user_add }" placeholder="도로명주소" readonly>
				<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="sample4_detailAddress" name="user_add2" value="${user.user_add2 }" placeholder="상세주소">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
			</div>
	
			<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
			<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>
			<div>
			<button type="button" class="add_modify">주소수정하기</button>
		</div>
		
			</div>
			<input type="submit" class="add_confirm" value="수정하기">
	</div>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function s_location(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	
	location.href="/search/searchlist?latitude="+latitude+"&longitude="+longitude;
	})
}

$(function(){
	$("#board").on("click",function(){
		if(!$(this).hasClass("on")){
			$(this).addClass("on")
			$(this).css({"margin":"40px 0 20px 0"})
			$(".under").css({"display":"inline-block"})
		} else {
			$(this).removeClass("on")
			$(".under").css({"display":"none"})
			$(this).css({"margin":"40px 0 40px 0"})
		}
	})
})

function passwordConfirm(){
	var password1 = document.getElementById('userpwd').value
	var password2 = document.getElementById('userpwdconfirm').value
	if(password1 != password2){
		alert('새 비밀번호가 일치하지 않습니다')
	} else {
		alert('새 비밀번호가 일치합니다')
	}
}

function preview(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			document.getElementById('uimg').src = e.target.result;
		}
		reader.readAsDataURL(input.files[0]);
	} else {
		document.getElementById('uimg').src = "";
	}
} 

$(".userform").submit(function(event){
	event.preventDefault();
	var password1 = document.getElementById('userpwd').value
	var password2 = document.getElementById('userpwdconfirm').value
	if (password1 != password2){
		alert("새 비밀번호가 일치하지 않습니다.")
		return false;
	} else {
		event.currentTarget.submit();
	}
})

	$(".add_modify").click(function(){
		$(".addDisplay").css({"display":"block"})
		$("#uadd").css({"display":"none"});
		$(".add_modify").css({"display":"none"})	
		
	})

    // 우편번호 찾기 화면을 넣을 element
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</body>
</html>