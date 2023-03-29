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