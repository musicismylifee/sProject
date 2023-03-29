$(document).ready(function() {
	//레이드 팝업
   
	
    let period_search_count = 0;
	   let period_search_id = "";
	  
	   /* 작성일 형식은 하나만 선택 가능 */
	   $(".period_search").click(function(){
		   /* alert("선택"); */
		   if(period_search_count ==0){
			   $(this).css("background-color","black").css("color","#fff");
			   period_search_id = $(this).attr("id");
			   period_search_count = 1;
			   $(".first-date").val("");
			   $(".last-date").val("");
			   
		   }else if(period_search_count == 1){
			   if(period_search_id == $(this).attr("id")){
				   $(this).css("background-color","#fff").css("color","black");
				   period_search_count = 0;
			   }else{
			   		alert("하나만 선택이 가능합니다.");
				   
			   }   
		   }
	   });
	   
	   /* 리셋버튼 클릭시 선택해제 */
	   $("#btnReset").click(function(){
		   if(period_search_count == 1){
			   $(".period_search").css("background-color","#fff").css("color","black");
			   period_search_count = 0;
		   }
	   });
	   
	   
	   
	  /*검색 분류 선택해야 텍스트박스 사용가능 */
	   $(".search_bar").click(function(){
		  if($(".search_class").val()=="defalt") {
			  alert("검색 분류를 선택해주십시오.");
			  $(".search_class").focus();
			  $(".search_bar").val("");
		  }
	   });

	  /*  카테고리 대분류 박스 선택해야 소분류 선택가능 */
	  $(".search_class_sub").click(function(){
		 if($(".search_class_main").val()=="defalt"){
			 alert("카테고리 대분류를 먼저 선택해주십시오.");
			 $(".search_class_main").focus();
			 $(".search_class_sub").val("defalt");
		 }
	  });
	  
	  /* 체크박스 전체 선택(리뷰)  */
	  $("input[name=checkAll]").click(function(){
		  if($("input[name=checkAll]").prop("checked")){
			  $(".review_check").prop("checked",true);
		  }else{
			  $(".review_check").prop("checked",false);
		  }
	  });
	
    /* 전체 선택 중 체크박스 하나를 풀었을 때, checkAll flase */
	$("input[name=check]").click(function(){
		 if(!$("input[name=check]").prop("checked")){
		 		$("input[name=checkAll]").prop("checked",false);
		 }
	});
	
	
	//게시 기간 유효성 체크
	$("#rsdate").blur(function() {
		if ($("#redate").val() != "") {
			if (reviewdateCheck() == false) {
				$("#rsdate").val("");
			}
		}
	});
	
	
	$("#redate").blur(function() {
		if ($("#rsdate").val() != "") {
			if (reviewdateCheck() == false) {
				$("#redate").val("");
			}
		}
	});
	
	
	function reviewdateCheck(){
	 	var startDate = $("#rsdate").val();
        var startDateArr = startDate.split('-');
         
        var endDate = $("#redate").val();
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