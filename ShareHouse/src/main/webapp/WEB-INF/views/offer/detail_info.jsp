<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매물 상세정보</title>
<link rel="stylesheet" type="text/css" href="/css/offerinfo.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<script>



</script>
</head>
<body>

<header>
</header>

<div id = "center" align ="center"><!-- 몸통 -->
	<div id="detailinfo" ><!-- 몸통 내용 전부 -->
		<div id = "room_button_list"><!-- Livingroom, Kitchen, roomA, roomB,... -->
			<div class="tab_btn active">거실</div>
			<div class="tab_btn">주방</div>
			<div class="tab_btn">방A</div>
			<div class="tab_btn">방B</div>
			<div class="tab_btn">방C</div>
			<div class="tab_btn">화장실</div>
			<div class="tab_btn">베란다</div>
		</div>
		
		<div id="slide_img">
			<div class="main_img"><!-- 화면에 나타날 이미지 -->
				<div class="slide active">
					<div class="slide_main">
						<div class="main_slide" style="background-image: url('/images/livingroom.png'); "></div>
						<div class="main_slide" style="background-image: url('/images/livingroom2.png');"></div>
					</div>
				<!-- <div class="bx-pager" style="float:left; width:100%;">
					<a data-slide-index="0" href=""><img src="/images/livingroom.png" style="width:100px; height:100px;" /></a>
					<a data-slide-index="1" href=""><img src="/images/livingroom2.png" style="width:100px; height:100px;" /></a>	
				</div>
				 --> 
				</div>
				<div class="slide">
					<div class="slide_main">
						<div class="main_slide" style="background-image: url('/images/livingroom.png');"></div>
						<div class="main_slide" style="background-image: url('/images/livingroom.png'); "></div>
						<div class="main_slide" style="background-image: url('/images/livingroom.png'); "></div>
						<div class="main_slide" style="background-image: url('/images/livingroom.png'); "></div>
						<div class="main_slide" style="background-image: url('/images/livingroom.png');"></div>
					</div>
				<!-- <div class="bx-pager" style="float:left;">
					<a data-slide-index="2" href=""><img src="/images/livingroom.png" style="width:100px; height:100px;" /></a>
					<a data-slide-index="3" href=""><img src="/images/livingroom.png" style="width:100px; height:100px;" /></a>
					<a data-slide-index="4" href=""><img src="/images/livingroom.png" style="width:100px; height:100px;" /></a>
					<a data-slide-index="5" href=""><img src="/images/livingroom.png" style="width:100px; height:100px;" /></a>	
					<a data-slide-index="6" href=""><img src="/images/livingroom.png" style="width:100px; height:100px;" /></a>					
				</div> 
				-->
				</div>
				<div class="slide">
					<div class="slide_main">
						<div class="main_slide" style="background-image: url('/경로');"></div>
					</div>
				</div>
				<div class="slide">f</div>
				<div class="slide">g</div>
				<div class="slide">h</div>
				<div class="slide">j</div>
				
				</div>
			</div>
			<form action="/offer/detail_info1/{board_no}" method="post">
			<div class="report"><input type="hidden" name="board_no" value="${offeringdto.board_no }">
			<input type="hidden" name="id" value="${offeringdto.id }">
			<button class="report-button" type="submit">
				<img src="/images/report.png">신고</button>
			</div>
			</form>
			<div class="favorite"><!-- 찜 --></div>
	
		
		
	
		<div id="info_btn_list">
			<div class="info_btn">
				<a href="#room_intro"><button type="button" class="info_btn"><span>집소개</span></button></a>
			</div>
			<div class="info_btn">
				<a href="#room_info"><button type="button" class="info_btn"><span>방정보</span></button></a>
			</div>
			<div class="info_btn">
				<a href="#room_FAQ"><button type="button" class="info_btn"><span>FAQ</span></button></a>
			</div>
		</div>
		
		<div id="room_intro">방 소개 머시기 머시기${offering.offering_info}</div>
		<div id="room_info">
			<div id="drawing">여기 도면</div>
			<div id="map" style="width : 100%; padding-top:55%; " ></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=635426cbf37254c67dec93b601cd3c9c"></script>
			<script>
				var container = document.getElementById('map');
				var options = {
					center: new kakao.maps.LatLng(37.485976668992, 126.96013875644),
					level: 3
				};

				var map = new kakao.maps.Map(container, options);
				
				var markerPosition  = new kakao.maps.LatLng(37.485976668992, 126.96013875644); 

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
	</script>
			<div id="room_table">여기 가격등등
				<table>
					<thead>
					<tr>
						<th>이름</th>
						<th>성별</th>
						<th>타입</th>
						<th>면적</th>
						<th>보증금</th>
						<th>월세</th>
						<th>입주가능일</th>
						<th>입주신청</th>
					</tr>	
					</thead>
					<tbody>
						<%-- <c:forEach items="${oList}" var="offering"> --%>
							<%-- <tr>
								<td>${offering.title}</td>
								<td>${offering.room_gender}</td>
								<td>${offering.house_kind}</td>
								<td>${offering.deposit}</td>
								<td>${offering.rental}</td>
								<td><fmt:formatDate value="${??}" dateStyle="short" /></td>
								<td><a href=""><span>입주신청</span></a></td>
							</tr> --%>
								<tr>
									<td>roomA</td>
									<td>남자전용</td>
									<td>1인실</td>
									<td>8평</td>
									<td>500000원</td>
									<td>450000원</td>
									<td>2023-01-19</td>
									<td><a href=""><span>입주신청</span></a></td>
								</tr>
								<tr>
									<td>roomA</td>
									<td>남자전용</td>
									<td>1인실</td>
									<td>8평</td>
									<td>500000원</td>
									<td>450000원</td>
									<td>2023-01-19</td>
									<td><a href=""><span>입주신청</span></a></td>
								</tr>
								<tr>
									<td>roomA</td>
									<td>남자전용</td>
									<td>1인실</td>
									<td>8평</td>
									<td>500000원</td>
									<td>450000원</td>
									<td>2023-01-19</td>
									<td><a href=""><span>입주신청</span></a></td>
								</tr>
								<tr>
									<td>roomA</td>
									<td>남자전용</td>
									<td>1인실</td>
									<td>8평</td>
									<td>500000원</td>
									<td>450000원</td>
									<td>2023-01-19</td>
									<td><a href=""><span>입주신청</span></a></td>
								</tr>
						<%-- </c:forEach> --%>
					</tbody>
				</table>
			</div>
		</div>
		<div id="room_FAQ">
			<div class="FAQ_title">FAQ</div>
			<div class = "FAQ_list">
				<div class="FAQ_button_list">
					<button id="FAQ_button_living" onclick="living()">입주관련</button>
					<button id="FAQ_button_cont" onclick="contract()">계약관련</button>
				</div>
				<div class="FAQ_con">
					<div class="living">
						<ul>
							<li class="faq">
								<div class="faq_question">1. 입주신청서를 제출했습니다. 이후 과정은 어떻게 되나요?</div>
								<div class="faq_answer">
									입주 신청서를 제출하면 접수 확인 문자가 발송됩니다. 신규 지점을 신청하신 경우 본인이 선택한 우주 하우스 투어 하루 전 날 확인 전화를 드리며,<br>
     								기존 지점을 신청하신 경우 입주 신청 후 2 일 내에 하우스 매니저가 우주 하우스 투어 일정 조율을 위해 전화를 드립니다.<br>
      								우주 하우스 투어 일정이 확정되면 해당 일시에 희망 지점을 방문하여 집을 둘러보고, 하우스 매니저와 간단한 인터뷰 시간을 가지게 됩니다.  </div>
							</li>
							<li class="faq">
								<div class="faq_question">2. 보증금과 월세 외에 다른 비용에는 무엇이 있나요?</div>
								<div class="faq_answer">
									<span style="color:red">지점 운영 관리비 </span>
									와 
									<span style="color:red">선불 공과금(전기, 가스, 수도요금, 건물관리비)</span>
									을 별도로 납부 해주셔야 합니다.
        							계약기간 내 납부해주신 <span style="color:red"> 선불 공과금은 퇴실 시 정산하고 정산후  생긴 차액은 반환 되거나 혹은 보증금에서 차감됩니다. </span><br>
        							공과금의  경우, 정산 방식은 1(쉐어하우스 인원수)/ N(실제공과금)로 사용하시는만큼 청구가 됩니다. <br>
        							청구된 공과금은 입주자 분들의 납부 및 정산 편의를 위해 매달 임대료(월세)와 별도로 받고 있습니다.  <br>
        						    일반적으로, 운영관리비는 3만원, 선불공과금은 5만원이지만 해당 금액은 지점별로 상이할 수 있으니 이 점 꼭 참고해주세요! 									
									</div>
							</li>
							<li class="faq">
								<div class="faq_question">3. 공과금은 어떻게 처리하나요?</div>
								<div class="faq_answer">
								계약 시 안내 된 선불 공과금을 매월 납부하고 퇴실 시에	실제 사용금액과 비교해 정산하게 됩니다.
   								</div>
							</li>
							<li class="faq">
								<div class="faq_question">4. 공과금을 왜 '선불 공과금'이라고 부르나요? 이게 왜 필요하죠?</div>
								<div class="faq_answer">
								선불 공과금이란 입주 계약기간 동안 일정 금액으로 정해진 예상 공과금을
								<span style="color:red">선불로 납부하는 것</span>을 말합니다. <br>
								사용량만큼 후불로 청구되는 공과금 특성 상, 매월 다른 금액이 청구되어 정기 요금 납부 때마다 일일이 액수를 신경 써야 한다는 불편이 있습니다. 우주는 이 점을 개선하고자 
								<span style="color:red">우주인이 미리 지정된 고정 금액을 매달 선불로 납부하는 방식</span>으로 공과금 제도를 운영하고 있습니다.<br> 
								</div>
							</li>
							<li class="faq">
								<div class="faq_question">5. 선불 공과금과 실제 사용금액에 차이가 나면 어떻게 하나요?</div>
								<div class="faq_answer">
     							 납부한 선불 공과금은 퇴실 시 실제 사용금액과 비교되어 정산됩니다.<br>
    							 계약기간 동안 납부한 선불 공과금보다 실제 사용금액이 적은 경우, 퇴실 후 보증금 반환시 차액만큼 더 반환됩니다. <br>
    							 반대로 실제 사용금액이 더 많은 경우, 보증금이 차액만큼 차감되어 반환됩니다
     							 </div>
							</li>
							<li class="faq">
								<div class="faq_question">6. 공과금은 어떤 절차로 납부하나요?</div>
								<div class="faq_answer">
   							   임대료와 동일하게 우주가 안내하는 대로 납부하시면 됩니다. 단, 실제로 거주했는지 여부와 관계 없이 계약기간을 기준으로 부담하는 것이 원칙입니다.<br>
   							   즉, 계약기간 중 개인사정으로 집을 비우는 기간이 발생하더라도 해당기간이 공과금 산정기간에서 제외되지 않습니다.
   							   </div>
							</li>
							<li class="faq">
								<div class="faq_question">7. 보증금은 언제 반환되나요?</div>
								<div class="faq_answer">
      							보증금은 퇴실 시 시행하는 하우스 매니저의 시설 점검 후 5일 내에 반환해드립니다.<br>
								다만 보증금은 다음의 두 가지 사유로 차감될 수 있으며 다음에 해당하는 사례의 경우 잔여 액만 반환 가능합니다.<br>
								① 임대료가1개월 이상 체납되는 경우 변제<br>
								② 입주자 과실로 시설/기물이 파손되는 경우 배상
								</div>
							</li>
							<li class="faq">
								<div class="faq_question">8. 퇴실 절차는 어떻게 되나요?</div>
								<div class="faq_answer">
      							WOOZOO는 현재 입주자 분께 계약 종료일로부터 2개월 전에 재계약 의사를 문의 드리며, 재계약 의사가 없으실 경우, 계약종료일에 하우스 매니저의 시설 점검을 후 시설에 이상이 없을 시 퇴실 하게 됩니다. 퇴실 시 열쇠는 반납하셔야 하며, 보증금은 계약종료일로부터 3 일 이내에 돌려드립니다.
    							</div>
							</li>
							<li class="faq">
								<div class="faq_question">9. 입주 시 지켜야 할 규정이 있나요?</div>
								<div class="faq_answer">
      							계약사항에 위배되지 않는한 WOOZOO는 입주자분들의 개인생활에 관여하지 않습니다.<br>
	  							다만, 같은 지점에 거주하는우주인들은 입주 후 협의 하에 ‘주거규칙 가이드라인’을 만들어 원활한 셰어 라이프를 지켜나갑니다.
      							</div>
							</li>
							<li class="faq">
								<div class="faq_question">10. 입주 후 추가 수납공간 및 기타 시설이 필요할 경우 어떻게 하나요?</div>
								<div class="faq_answer">
      							계약 전 우주 하우스 투어를 통해 수납공간과 시설에 대한 충분한 숙지 후 계약을 진행하므로 WOOZOO는 입주 후 추가 시설 또는 기타 물품 (수납장, 정수기 등)
								에 대한 지원을 진행하지 않습니다. 이 점 양해 부탁 드립니다!
   								</div>
							</li>
							<li class="faq">
								<div class="faq_question">11. 입주 시 꼭 챙겨야 하는 물건이 있나요?</div>
								<div class="faq_answer">
      							기본적인 가전제품과 가구만 준비되어 있으므로 그 외의 물품은 모두 개인적으로 준비하셔야 합니다.<br><br>	
      							<ul>
      								<li>개인식기 (수저, 그릇, 조리기구) </li>
      								<li>침구 (매트리스 커버, 이불, 베개) </li>
      								<li>개인 스탠드, 멀티탭 </li>
      								<li>빨래건조대는 공용으로 2~4개가 준비되어 있습니다. </li>
      							</ul> </div>
							</li>
							<li class="faq">
								<div class="faq_question">12. 반려동물/애완동물을 키울 수 있나요?</div>
								<div class="faq_answer">
      							크기와 종류에 관계 없이 모든 반려/애완동물을 키울 수 없으며, 이를 위반할 경우 계약 내용에 따라 퇴거요청을 받을 수 있습니다. <br>
      							이는 룸메이트나 해당 집의 입주자 전원이 동의하더라도 마찬가지입니다. 
   								</div>
							</li>
						</ul>
					</div>
					<div class="contract">
						<ul>
							<li class="faq">
								<div class="faq_question"> 1. 계약기간은 어떻게 되나요? </div>
								<div class="faq_answer">
      							입주 계약은 6개월 단위로 체결 가능합니다. WOOZOO HOUSE는 거주자 커뮤니티 형성과 셰어하우스 문화정착을 위해 6개월 단위로 거주 계약을 진행하고 있습니다.  <br>
						  	    다만 프로모션 정책에 따라 지점별로 최소 계약기간이 상이하니(최소 2개월) '지점소개' 란을 참고해 주세요.
   								</div>
   							</li>
							<li class="faq">
								<div class="faq_question">2. 입주일은 어떻게 정해지나요?</div>
								<div class="faq_answer">
      							입주일은 하우스 매니저와의 일정 조율을 통해 정해지나, <br>
      							통상 입주 가능일로부터 7일 이내에 입주 가능하신 분이 희망 지점 입주에 유리합니다. <br>
      							계약서를 작성 하고 나면 2일 이내에 보증금을 납부하셔야 하며, 월세는 입주 2일 전까지 납부해야 합니다.<br>
      							위 사항을 지키지 못 하실 경우 계약은 통보 없이 자동으로 취소되오니, 이 점 양해 부탁 드립니다.
   								</div>
   							</li>
							<li class="faq">
								<div class="faq_question">3. 입주기간을 연장할 수 있나요? </div>
								<div class="faq_answer">
      							입주기간은 초기 계약과 마찬가지로 6개월 단위로 연장하게 됩니다. 재계약을 원하실 경우, 계약 종료일로부터 두 달 전에 하우스 매니저께 재계약 의사를
								밝혀주셔야 하며, 재계약은 입주자 간 상호 만족도 조사와 담당자 소견을 바탕으로 결정됩니다.
   								</div>
   							</li>
							<li class="faq">
								<div class="faq_question">4. 보증금은 납부하였으나 아직 입주 전 입니다. 만약 현 상황에서 계약 취소 시 어떻게 되나요?</div>
								<div class="faq_answer">
      							입주 전 계약을 해지하는 경우, 계약시작일까지 남은 기간에 따라 다른 액수의 보증금이 차감됩니다. 자세한 사항은 계약서를 참조하시기 바랍니다.
   								</div>
   							</li>
							<li class="faq">
								<div class="faq_question">5. 보증금과 월세는 얼마인가요? </div>
								<div class="faq_answer">
      							임대료는 집에 따라 다르기 때문에, 입주를 희망하시는 집의 상세 소개페이지에서 확인해주시는 것이 가장 정확합니다.  <br>
      							마찬가지로 보증금도 집에 따라 달라지며, 입주를 희망하시는 방 월세의 2개월 분 금액입니다. <br>
      							(예를 들어 월세가 40만원인 방에 입주 하시면, 보증금은 80만원입니다.)
   								</div>
   							</li>
							<li class="faq">
								<div class="faq_question">6. 단기 입주가 가능한가요? </div>
								<div class="faq_answer">
      						     2개월 부터 가능합니다.  
   								</div>
   							</li>
							<li class="faq">
								<div class="faq_question">7. 입주할 수 있는 나이 제한이 있나요? </div>
								<div class="faq_answer">
      						    보다 빠르고 친밀한 커뮤니티 형성을 위해, 입주하시는 분들의 연령은 20세부터 41세까지로 정하고 있습니다.
   								</div>
   							</li>
							<li class="faq">
								<div class="faq_question">8. 입주 및 계약 문의는 어디로 해야하나요? </div>
								<div class="faq_answer">
      							입주/계약문의는 전화(02-2018-3718) 및 이메일(living@woozoo.kr) 로 영업시간(오전10시-오후6시)내에 문의하실 수 있습니다.
      							입주/계약에 대한 궁금하신 점은 홈페이지의 FAQ를 통해 확인 하실 수 있으니 문의하시기 전에 FAQ를 확인해주세요! 
      							카카오톡 혹은 라인 메신저로는 상담 진행해드리지 않고 있으니 이 점 참고 부탁드립니다. 
   								</div>
   							</li>
							<li class="faq">
								<div class="faq_question">9. 2인실 가격 기준은 어떻게 되나요? </div>
								<div class="faq_answer">
								홈페이지에 안내 되어있는 2인실 가격은 1인 가격 기준입니다.<br>
							    예를 들어 2인실인데 보증금 96만원/임대료 41만원/관리비3만원/공과금 5만원이라고 명시되어있는 자리는해당 금액 모두 1인이 부담하는 비용입니다.
   								</div>
   							</li>
							<li class="faq">
								<div class="faq_question">10. 지점 내 관리 직원이 상주하나요? </div>
								<div class="faq_answer">
							    아니오. 지점 내에서는 우주 직원이 상주하고 있지 않습니다.  
   								</div>
   							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<footer>
</footer>




<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
   
<script>

    var tabBtn = $(".tab_btn");      //각각의 버튼을 변수에 저장
	var tabCont = $(".slide");       //각각의 콘텐츠를 변수에 저장

	//컨텐츠 내용을 숨겨주세요!
	tabCont.hide().eq(0).show();

	tabBtn.click(function(){
	var target = $(this);         //버튼의 타겟(순서)을 변수에 저장
	var index = target.index();   //버튼의 순서를 변수에 저장
	tabBtn.removeClass("active");    //버튼의 클래스를 삭제
	target.addClass("active");       //타겟의 클래스를 추가
	tabCont.css("display","none");
	tabCont.removeClass("active"); 
	tabCont.eq(index).addClass("active");
	tabCont.eq(index).css("display","block");
	});
	

	$(document).ready(function(){
		$('.slide_main').bxSlider({
			auto:false,
			slideWidth:650,
			pager : false,
		});
		
	});
	
	
	$('.report-button').on('click', function(){
	      var url = "/report_maemul";
	      var name = "CalPopup";
	      var option = "width = 600, height = 600, left = 100, top = 50, location=no";
	      window.open(url, name, option)
	   });

	function living() {
	    $('.living').css('display' , 'block');
	    $('.contract').css('display' , 'none');
	    $('#FAQ_button_living').css('background-color' , '#c0d6e4');
	    $('#FAQ_button_cont').css('background-color' , '');
	}
	function contract(){
	        $('.contract').css('display', 'block');
	        $('.living').css('display' , 'none');
	        $('#FAQ_button_cont').css('background-color','#c0d6e4')
	        $('#FAQ_button_living').css('background-color' , '#f0f0f0');
	    }
	
	
    $(".faq").click(function(){
       $(this).toggleClass("active");
    })
    $(".faq_answer").click(function(){
    	return false;
    })
    
 

	
</script>
</body>
</html>