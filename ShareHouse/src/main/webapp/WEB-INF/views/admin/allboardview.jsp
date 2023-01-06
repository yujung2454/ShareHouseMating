<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 게시물 보기</title>
<link rel="stylesheet" type="text/css" href="/css/admin_nav.css" />
</head>
<body>
   <header>
      <div id="uppernav">
         <div id="main">
            <span id="home_img" class="to_main"><a href="/"><img
                  src="/images/home.png"></a></span> <span id="home" class="to_main"><a
               href="/">우리집</a></span>
         </div>
         <ul class="upper_frame">
            <li class="upper_menu"><a href="/introduce/introduce">쉐어하우스란?</a></li>
            <li class="upper_menu" onclick="s_location()"
               style="cursor: pointer">방 찾기</li>
            <li class="upper_menu"><a
               href="/registration/registration_first">매물 등록</a></li>
            <li class="upper_menu"><a href="/community/community_list">커뮤니티</a></li>
            <li class="upper_menu"><a href="/query_list">문의</a></li>
         </ul>
         <div id="p_info">
            <span id="login"> <c:if test="${user == null}">
                  <a href="/login">로그인</a>
               </c:if> <c:if test="${user != null}">
                  <c:if test="${user.user_Img == null}">
                     <a href="/mypage/info"><img src="/images/profil.png"></a>
                  </c:if>
                  <c:if test="${user.user_Img != null}">
                     <div class="user_profil_img">
                        <a href="/mypage/info"><img class="user_uimg"
                           src="${user.user_Img}"></a>
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
   </header>
   <aside>
      <nav>
         <ul>
            <li><a href="/admin/admin_notice">공지사항 관리</a></li>
            <li><a href="/admin/user_manage">회원관리</a></li>
            <li><a href="/admin/report_list">신고리스트</a></li>
            <li><a href="/admin/ad_query_list">문의리스트</a></li>
            <li class="active"><a href="/admin/allboardview">모든 게시물 보기</a></li>
            <li><a href="/popup">메인 팝업 관리</a></li>
         </ul>
      </nav>
   </aside>
   <main>
      <h1 style="margin-left: 400px;">모든 게시물 보기</h1>
      <div>
         <select id="select" name="select" onchange="change()"
            style="margin: auto; margin-left:24%; margin-bottom: 10px; height: 30px">
            <option value="all">전체보기</option>
            <option value="commview">커뮤니티</option>
            <option value="boardview">매물</option>
         </select>
      </div>
      <div id="view">
         <table class="table_list" border="1" style="margin: auto;">
            <tr class="commline" bgcolor="#aaaaaa">
               <td colspan='4'>커뮤니티</td>
            </tr>
            <tr class="commline" bgcolor="#dcdcdc">
               <td width="150px">게시물 번호</td>
               <td width="150px">아이디</td>
               <td width="150px">제목</td>
               <td width="150px">조회수</td>
            </tr>
            <c:if test="${count == 0}">
               <tr>
                  <td colspan="5" id="none_post">게시판에 저장된 글이 없습니다.</td>
               </tr>
            </c:if>
            <c:if test="${count != 0}">
               <c:forEach items="${cList1}" var="comm">
                  <tr class="commline">
                     <td><a href="/community/community_view/${comm.comm_no}">${comm.comm_no}</a></td>
                     <td>${comm.id}</td>
                     <td><a href="/community/community_view/${comm.comm_no}">${comm.comm_title}</a></td>
                     <td>${comm.comm_v_cnt}</td>
                  </tr>
               </c:forEach>
            </c:if>
            <tr class="boardline" bgcolor="#aaaaaa">
               <td colspan='4'>매물</td>
            </tr>
            <tr class="boardline" bgcolor="#dcdcdc">
               <td width="150px">게시물 번호</td>
               <td width="150px">아이디</td>
               <td width="150px">제목</td>
               <td width="150px">조회수</td>
            </tr>
            <c:if test="${count == 0}">
               <tr>
                  <td colspan="5" id="none_post">게시판에 저장된 글이 없습니다.</td>
               </tr>
            </c:if>
            <c:if test="${count != 0}">
               <c:forEach items="${cList2}" var="board">
                  <tr class="boardline">
                     <td><a href="/offer/detail_info/${board.board_no}">${board.board_no}</a></td>
                     <td>${board.id}</td>
                     <td><a href="/offer/detail_info/${board.board_no}">${board.title}</a></td>
                     <td>${board.v_cnt}</td>
                  </tr>
               </c:forEach>
            </c:if>
         </table>
      </div>
      <div id="paging" align="center">
         <c:if test="${begin > pageNum}">
            <a href="allboardview?p=${begin-1}&sort=${sort}">[이전]</a>
         </c:if>
         <c:forEach begin="${begin}" end="${end}" var='i'>
            <a href="allboardview?p=${i}&sort=${sort}" class="page">${i}</a>
         </c:forEach>
         <c:if test="${end < totalPages}">
            <a href="allboardview?p=${end+1}&sort=${sort}">[다음]</a>
         </c:if>
      </div>
   </main>
   <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
   <script async
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAGSDqIXNX_0lFHR9SYcXafO5963zn2x68&libraries=places">
   </script>
   <script>

      function s_location() {
         navigator.geolocation.getCurrentPosition(function(pos) {
            var latitude = pos.coords.latitude;
            var longitude = pos.coords.longitude;

            location.href = "/search/searchlist?latitude=" + latitude
                  + "&longitude=" + longitude;
         })
      }
   </script>

   <script>
      function change() {
         $("#select").change(function() {
            var select = $("#select option:selected").val();
            if (select == "commview") {
               $('.boardline').hide();
               $('.commline').show();
            } else if (select == "boardview") {
               $('.commline').hide();
               $('.boardline').show();
            } else {
               $('.commline').show();
               $('.boardline').show();
            }
         })
      }
   </script>
</body>
</html>