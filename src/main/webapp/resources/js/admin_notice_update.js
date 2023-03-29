$(document).ready(function(){
		//분류 기본값
		$("#ncode").val($("#ncode_defu").val()); 
		
		//중요 공지사항 체크여부
		if($("#ncrucial").val()=="1"){
			$("#ncrucial_check").attr("checked",true);
		}else{
			$("#ncrucial_check").attr("checked",false);
		}
		
		//파일 이름 변경처리
		$("#file1").on('change',function(){
			  var fileName = $("#file1").val();
			  $(".upload-name").val(fileName);
			});
		
		//전시기간 설정기능-게시글 수정
		$("#ex_check").click(function(){
			var chk =$(this).is(":checked");
			if(chk == true){
				$("#nsdate_fk").attr("disabled",false);
				$("#nedate_fk").attr("disabled",false);	
					
			}else{
				$("#nsdate_fk").attr("disabled",true);
				$("#nedate_fk").attr("disabled",true);	
			}
		});
		
		//유효성체크
		$("#btnUpdateNotice").click(function(){
			if($("#ncode").val()=="event"){
				
				if($("#ntitle").val()==""){
					alert("제목을 입력해주세요");
					return false;
				}else if($("#ncontent").val()==""){
					alert("내용을 입력해주세요");
					return false;
				}else if($("#ex_check").is(":checked")==false){
					alert("이벤트 공지는 게시기간을 설정해야 합니다.");
					$("#ex_check").attr("checked",true);
					$("#nsdate").attr("disabled",false);
					$("#nedate").attr("disabled",false);
					return false;
				}else if($("#nsdate").val()==""){
					alert("게시 시작일을 입력해주세요");
					return false;
				}else if($("#nedate").val()==""){
					alert("게시 종료일을 입력해주세요");
					return false;
				}else{
					noticeupdateForm.submit();
				}
			}else{
				
				if($("#ntitle").val()==""){
					alert("제목을 입력해주세요");
					return false;
				}else if($("#ncontent").val()==""){
					alert("내용을 입력해주세요");
					return false;
				}else{
					noticeupdateForm.submit();
				}
				
			}
				
		});
		
		//전시 기간 재설정
		$("#ncrucial_check").click(function(){
			if($("#ncrucial_check").is(":checked")){
				
				$("#ncrucial").val("1");
				/* alert($("#ncrucial").val()); */
			}else{
				$("#ncrucial").val("0");
				/* alert($("#ncrucial").val()); */
			} 
		});
		
			//게시 기간 유효성 체크-update 버전
	$("#nsdate_fk").blur(function(){
		if(todayCheck($("#nsdate_fk").val())== true){
			if($("#nedate_fk").val() != ""){
				if(noticedateCheck()==false){
					$("#nsdate_fk").val($("#nsdate").val());
				}
			}
			
		}else{
			$("#nsdate_fk").val($("#nsdate").val());
			
		} 
		$("#nsdate").val($("#nsdate_fk").val());
		
	});
	
	$("#nedate_fk").blur(function(){
		if(todayCheck($("#nedate_fk").val()) == true){
			if($("#nsdate_fk").val() != ""){
				if(noticedateCheck()==false){
					$("#nedate_fk").val($("#nedate").val());
				}
			}
			
		}else{
			$("#nedate_fk").val($("#nedate").val());	
		} 
		$("#nedate").val($("#nedate_fk").val());
	});
	
	function todayCheck(ndate){
		var nowDate = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
		var nowDateArr = nowDate.split('-');

		var nDateArr = ndate.split('-');	
		
		var nowDateCompare = new Date(nowDateArr[0], parseInt(nowDateArr[1])-1, nowDateArr[2]);
	    var nDateCompare = new Date(nDateArr[0], parseInt(nDateArr[1])-1, nDateArr[2]);
		
	    if(nowDateCompare.getTime() > nDateCompare.getTime()) {
	        alert("오늘날짜 이전의 날짜는 입력할 수 없습니다.");
	        return false;
	    }else{
	    	return true;
	    }
	}
	
	function noticedateCheck(){
		 	var startDate = $("#nsdate_fk").val();
	        var startDateArr = startDate.split('-');
	         
	        var endDate = $("#nedate_fk").val();
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
		
		
	
		
