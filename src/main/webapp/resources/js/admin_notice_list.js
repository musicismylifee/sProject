$(document).ready(function(){
	
	//데이터 전송, 유효성 체크
	$("#submitbtn").click(function(){
		var searchtype = $(".search_class").val();
		var startdate = $("input[name='startdate']").val();
		var enddate = $("input[name='enddate']").val();
		var text = $(".search_bar").val();
		var ncode = "";
		var ncrucial = "";
		var posttype ="";
		
		//날짜 비교를 위한 현재날짜 세팅
		const date = new Date();
		var now = date.getFullYear()+"-"+(date.getMonth() + 1)+"-"+date.getDate();
		/* if(now >= '2022-10-11'){
			alert("완료");
		} */
		
		//mapper처리를 위하여 null값이 아닌 빈값으로 넘기기
		if($("input[name='noticetype']:checked").val() == null){
			ncode = "";	
		}else{
			ncode = $("input[name='noticetype']:checked").val();		
		}
		
		if($("input[name='crucial']:checked").val() == null){
			ncrucial = "";
		}else{
			ncrucial = $("input[name='crucial']:checked").val();
		}
		
		if($("input[name='post_type']:checked").val() == null){
			posttype = "";
		}else{
			posttype = $("input[name='post_type']:checked").val();
		}
		
		/* alert(ncrucial); */
		
		var param = {"searchtype":searchtype, "startdate":startdate, "enddate":enddate, "text":text, "ncode":ncode, "ncrucial":ncrucial, "posttype":posttype};
		var search = JSON.stringify(param);
		
		//검색창에 값이 있지만 분류를 선택하지 않았을 때
		if($(".search_bar").val() != "" && $(".search_class").val() ==""){
			alert("검색 분류를 선택해야 합니다.");
			return false;
		//검색 분류는 선택했지만 검색어는 입력하지 않았을 때	
		}else if($(".search_class").val() != "" && $(".search_bar").val() == ""){
			alert("검색어를 입력해주세요");
			return false;
		//기간 시작일을 선택했지만 기간 종료일을 선택하지 않았을 때	
		}else if($("input[name='startdate']").val() != "" && $("input[name='enddate']").val() == ""){
			alert("기간 조건의 종료일을 선택해주세요");
			return false;
		//기간 종료일을 선택하고 기간 종료일을 선택하지 않았을 때	
		}else if($("input[name='enddate']").val() != "" && $("input[name='startdate']").val() == ""){		
			alert("기간 조건의 시작일을 선택해주세요");
			return false;
		}else{
			$.ajax({
				url:"admin_notice_search.do",
		 		type: "POST",
		 		data: search,
		 		contentType : 'application/json;',
		 		/* dataType:"json", */ //아마 받는 타입이 String 이라서 오류 발생
		 		success:function(nvo){
		 			let dataset = JSON.parse(nvo);
		 			
		 			var output = "<div class='seller_list'>";
		 			output += "<div class='list_heading'>";
		 			output += "<div class='heading_left'><h3>공지사항 검색목록(총 "+dataset.count+"개)</h3></div>";
		 			output += "<div class='heading_right'>";
		 			output += "<button type='button' class='btn_delete'>선택 삭제</button>";
		 			output += "<a href='admin_notice_write.do'><button type='button'>공지사항 등록</button></a>";
		 			output += "</div></div>";
		 			
		 			output += "<div class='list_content' id='datalist'>";
		 			output += "<div class='table_flame'>";
		 			output += "<table class='list_table' style='table-layout:fixed'>";
		 			output += "<colgroup><col width='50'><col width='80'><col width='110'><col width='300'><col width='130'>";
		 			output += "<col width='200'><col width='130'><col width='130'><col width='130'></colgroup>";
		 			output += "<tr>"
		 			output += "<th><input type='checkbox' class='notice_check' name='checkAll'></th>"
		 			output += "<th>번호</th><th>분류</th><th>제목</th><th>중요 여부</th><th>첨부 파일 유무</th><th>게시 현황</th><th>게시 시작일</th><th>게시 종료일</th></tr>"
		 			
		 			for(obj of dataset.list){
			 			output += "<tr>";
			 			output += "<td><input type='checkbox' class='notice_check' name='check' value='"+obj.nid+"'></td>";
			 			output += "<td>"+obj.rno+"</td>";
			 			output += "<td>"+obj.ncode+"</td>";
			 			output += "<td><a href='admin_notice_update.do?nid="+obj.nid+"'>"+obj.ntitle+"</a></td>";		
			 			//중요 선택여부
			 			if(obj.ncrucial == "1"){
				 			output += "<td>설정</td>";	
			 			}else{
				 			output += "<td>미 설정</td>";		
			 			}
			 			
			 			//파일 여부
			 			if(obj.nfile == null){
			 				output += "<td>-</td>";
			 			}else{
				 			output += "<td>"+obj.nfile+"</td>";
			 			}
			 			
			 			//게시현황
			 			if(obj.nsdate <= now && obj.nedate >= now){
			 				output += "<td>게시 중</td>";
			 			}else if(obj.nsdate > now){
			 				output += "<td>게시 준비중</td>";	
			 			}else{
			 				output += "<td>게시 종료</td>";				 				
			 			}
			 			output += "<td>"+obj.nsdate+"</td>";
			 			//게시 종료일
			 			if(obj.nedate == '9999-12-31'){
			 				output += "<td>-</td>"
			 			}else{
				 			output += "<td>"+obj.nedate+"</td>";			 				
			 			}
			 			output += "</tr>";
			 			
		 			}
		 			output += "</table></div></div></div>";
		 			
		 			$(".seller_list").remove();
		 			$(".seller_content").after(output);
		 			
		 			/* 체크박스 전체 선택(공지사항)  */
		 			$("input[name=checkAll]").click(function(){
		 				if($("input[name=checkAll]").prop("checked")){
		 					$(".notice_check").prop("checked",true);
		 				}else{
		 					$(".notice_check").prop("checked",false);
		 			 	}
		 			});
		 			/* 전체 선택 중 체크박스 하나를 풀었을 때, checkAll flase */
		 			 $("input[name=check]").click(function(){
		 				  if(!$("input[name=check]").prop("checked")){
		 					  $("input[name=checkAll]").prop("checked",false);
		 				  }
		 			 });
		 			
		 			$(".btn_delete").click(function(){
		 				/* alert("삭제"); */
		 				noticeDelete();
		 			});//delete function
		 		}//success
		 	});//ajax
		}//if
	});//function
	
	/* 공지사항 삭제 함수 */
	function noticeDelete(){
		var cnt = $("input[name=check]:checked").length;
		 
		 if($("input[name=check]:checked").length == 0){
			 alert("선택된 리스트가 없습니다.");
		 }else{
			
			 var delete_list = new Array();
			 
		 	 $("input[name=check]:checked").each(function(){
		 	 	delete_list.push($(this).val());
		 	 });
		 	
		 	 if(confirm("선택한 항목을 정말 삭제하시겠습니까?")==true){
		 		 /* alert(cnt); */
		 		 
			 	$.ajax({
			 		url:"admin_notice_list_delete.do",
			 		type: "POST",
			 		data: {clist: delete_list},
			 		dataType:"json",
			 		success:function(result){
			 			if(result != 1){
			 				alert("삭제 오류");
			 			}else{
			 				alert("삭제가 성공적으로 이루어졌습니다!");
			 				location.reload();
			 			}
			 		}//success
			 	}); 
			 	 
		 	 }//if문 
		 	
		 }//if-else
	}
		
	
		
	
	/* 체크박스 전체 선택(공지사항)  */
	$("input[name=checkAll]").click(function(){
		if($("input[name=checkAll]").prop("checked")){
			$(".notice_check").prop("checked",true);
		}else{
			$(".notice_check").prop("checked",false);
	 	}
	});
	/* 전체 선택 중 체크박스 하나를 풀었을 때, checkAll flase */
	 $("input[name=check]").click(function(){
		  if($("input[name=check]").prop("checked")){
			  $("input[name=checkAll]").prop("checked",false);
		  }
	 });
	
	//라디오 체크해제
	/* $("input[name=noticetype]").click(function(){
		if($(this).is(":checked")){
			
			$(this).prop("checked",false);
		}
	}); */
	
	//리셋버튼	
	$("#resetbtn").click(function(){
		$(".search_class").val("");
		$("input[type='date']").val("");
		$(".search_bar").val("");
		$("input[name=noticetype]").prop("checked",false);
		$("input[name=crucial]").prop("checked",false);
		$("input[name=post_type]").prop("checked",false);
	
	});
	
	$(".btn_delete").click(function(){
		noticeDelete();
	});//delete function
	
	//게시 기간 유효성 체크
	$("#nsdate").blur(function() {
		if ($("#nedate").val() != "") {
			if (noticedateCheck() == false) {
				$("#nsdate").val("");
			}
		}
	});
	
	
	$("#nedate").blur(function() {
		if ($("#nsdate").val() != "") {
			if (noticedateCheck() == false) {
				$("#nedate").val("");
			}
		}
	});
	
	
	function noticedateCheck(){
	 	var startDate = $("#nsdate").val();
        var startDateArr = startDate.split('-');
         
        var endDate = $("#nedate").val();
        var endDateArr = endDate.split('-');
                 
        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
         
        if(startDateCompare.getTime() > endDateCompare.getTime()) {
            alert("시작날짜와 종료날짜를 확인해 주세요.");
            return false;
        }else{
        	return true;
        }
        
	}
	
	
});