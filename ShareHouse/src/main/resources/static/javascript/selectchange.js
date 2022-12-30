$(function(){		
	var seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	var incheon = ["계양구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	var daejeon = ["대덕구", "동구", "서구", "유성구", "중구"];
	var chungnam = ["공주시", "금산군", "논산시", "당진시", "보령시", "부여군", "서산시", "서천군", "아산시", "예산군", "천안시 동남구", "천안시 서북구", "청양군", "태안군", "홍성군", "계룡시"]
	var chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	var gwangju = ["광산구", "남구", "동구", "북구", "서구"];
	var jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var jeonbuk = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
	var daegu = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
	var gyeongbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	var ulsan = ["남구","동구","북구","중구","울주군"];
	var busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var gyeongnam = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
	var gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var jeju = ["서귀포시","제주시"];
	
	$("#search_region").change(function(){
		var address1 = $(this).text();
		$(".region_content").empty();
		$(".region_content2").html("시/구를 선택해주세요")
		if($(this).val() == "01"){
			
			//$(".region_content").html("<ul><li>강남구</li><br><li>강동구</li><li>강북구</li><br><li>강서구</li><br><li>관악구</li><br><li>광진구</li><br><li>구로구</li><br></ul>")
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < seoul.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+seoul[i]+'</li><br>')
			}
		} else if($(this).val() == "02"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < gyeonggi.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+gyeonggi[i]+'</li><br>')
			}
		} else if($(this).val() == "03"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < incheon.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+incheon[i]+'</li><br>')
			}
		} else if($(this).val() == "04"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < daejeon.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+daejeon[i]+'</li><br>')
			}
		} else if($(this).val() == "05"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < chungnam.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+chungnam[i]+'</li><br>')
			}
		} else if($(this).val() == "06"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < chungbuk.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+chungbuk[i]+'</li><br>')
			}
		} else if($(this).val() == "07"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < gwangju.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+gwangju[i]+'</li><br>')
			}
		} else if($(this).val() == "08"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < jeonnam.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+jeonnam[i]+'</li><br>')
			}
		} else if($(this).val() == "09"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < jeonbuk.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+jeonbuk[i]+'</li><br>')
			}
		} else if($(this).val() == "10"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < daegu.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+daegu[i]+'</li><br>')
			}
		} else if($(this).val() == "11"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < gyeongbuk.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+gyeongbuk[i]+'</li><br>')
			}
		} else if($(this).val() == "12"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < busan.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+busan[i]+'</li><br>')
			}
		} else if($(this).val() == "13"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < ulsan.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+ulsan[i]+'</li><br>')
			}
		} else if($(this).val() == "14"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < gyeongnam.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+gyeongnam[i]+'</li><br>')
			}
		} else if($(this).val() == "15"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < gangwon.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+gangwon[i]+'</li><br>')
			}
		} else if($(this).val() == "16"){
			$(".region_content").html('<ul></ul>')
			for (var i = 0; i < jeju.length; i++){
				$(".region_content > ul").append('<li class="region_lst">'+jeju[i]+'</li><br>')
			}
		} else {
			$(".region_content").html('지역을 선택해주세요')			
			$(".region_content2").html("시/구를 선택해주세요")
		}
		
		$("body").on("mouseover",".region_lst",function(){
			$(this).css({"color": "#39f","font-weight": "bold"});
		})
		
		$("body").on("mouseleave",".region_lst",function(){
			if ($(" > span", this).attr("class") == undefined ){
				$(this).css({"color": "#000","font-weight": "normal"})
			}
		})
		
		var address2 = null;
		
		$("body").off("click").on("click", ".region_lst",function(){
			if ($(" > span", this).attr("class") == undefined ){				
				$(".region_lst").css({"color": "#000","font-weight": "normal"})
				$(".region_lst > span").remove();
				$(this).css({"color": "#39f","font-weight": "bold"})
				var address1 = $("#search_region :selected").text();
				address2 = $(this).text();
				$(this).append("<span class='ck'> </span>")		
				//let formData = new FormData();
				//formData.append("add2",address);
				
				//const header = document.querySelector('meta[name="_csrf_header"]').content;
    			//const token = document.querySelector('meta[name="_csrf"]').content;
				
				fetch("/search/detailsearch/"+address1+"/"+address2,{
					method: "get",
					/*headers: {'header': header,
				              	'X-Requested-With': 'XMLHttpRequest',
				                "Content-Type": "application/json",
				                'X-CSRF-Token': token},*/
					cache: "no-cache"
					//body: formData
				})
				.then((response) => response.json())
				.then((data) => {
					$(".region_content2").html("<ul></ul>");
					for (var i = 0; i < data.length; i++) {
						$(".region_content2 > ul").append("<li class='region_lst2'>"+data[i] + "</li><br>")
					}
				})
				return false;		
			} else{			
				$(this).css({"color": "#000","font-weight": "normal"})
				$(" span", this).remove()
				$(".region_content2").html("시/도를 선택해주세요")
				return false;
			}
		})
		
		$("region_lst2").mouseover(function(){
			$(this).css({"color": "#39f","font-weight": "bold"});
		})
		
		$("region_lst2").mouseleave(function(){
			$(this).css({"color": "#000","font-weight": "normal"});
		})		
	})
	
	$(".region_content2").on("mouseover",".region_lst2",function(){
		$(this).css({"color":"#39f", "font-weight":"bold"})
	})
	
	$(".region_content2").on("mouseleave",".region_lst2",function(){
		if($(" span",this).attr("class") == undefined){
			$(this).css({"color":"#000","font-weight":"normal"})
		}
	})
	
	var arr = []
	$(".region_content2").off("click").on("click",".region_lst2",function(){
		if ($(" span",this).attr("class") == undefined){
			//$(this).css({"color":"#39f", "font-weight":"bold"})
			$(this).append("<span class='ck'></span>")
			var loc = $(this).text();
			if(!$(this).hasClass("on")){
				$(this).addClass("on")
				$(".selected_loc").append("<div class='loc'><span class='"+loc+"'>"+loc+"</span><img class='close' src='/images/close.png'></div>")
				arr.push($(this).text())
			}
		} else {
			if(!$(this).hasClass("on")){
				$(this).css({"color":"#000", "font-weight":"normal"})
				$(" span",this).remove();
			}
		}
	})
	
	$(".selected_loc").on("click",".close",function(){
		var temp = $(this)
		$(".region_lst2").each(function(index, item){
			if($(item).text() == temp.closest("div").text()){
				$(item).css({"color":"#000", "font-weight":"normal"})
				$(item).removeClass("on")
				for(let i = 0; i < arr.length; i++){
					if(arr[i] == $(item).text()){
						arr.splice(i,1);
					}
				}
				$(" span", item).remove();
			}
			
		})
		
		$(this).closest("div").remove()
	})
	
	$("#detail_search").submit(function(event){
		event.preventDefault();
		var search = arr.join(" ");
		$("#selected_loc").val(search);
		var checkboxes = $("input[type='checkbox']")
		let len = 0;
		$.each(checkboxes,function(index,checkbox){
			if($(checkbox).prop("checked")){
				len += 1;
			}
		})
		
		if(len == 0){
			$("#detail_search").append("<input type='hidden' name='gender' value='n'>")
		}
		
		if($("#selected_loc").val() == ""){
			if($("#search_house").val() == "주거형태"){
				if($("#search_contract").val() == "계약기간"){
					if($("#search_pay").val() == "월세"){
						if(len == 0){
							alert("조건을 1개 이상 선택해주세요")
							return false;
						} else {
							event.currentTarget.submit();
						}
					} else {
						event.currentTarget.submit();
					}
				} else {
					event.currentTarget.submit();
				}
			} else {
				event.currentTarget.submit();
			}
		} else {
			event.currentTarget.submit();
		}
		
		
	})
	
})