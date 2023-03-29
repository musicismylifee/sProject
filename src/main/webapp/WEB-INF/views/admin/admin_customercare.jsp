<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_customercare.css">
    <link rel="stylesheet"  href="http://localhost:9000/myshop/resources/css/am-pagination.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <title>회원 관리페이지</title>
<script>

	$(document).ready(function(){
		var sorttype="";
		var searchtext = "";
		//페이징 리스트 출력
	/* 	var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total rows	
		    page: '${rpage}',		// initial page		
		    pageSize: '${pageSize}',	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		}); */
		
		//페이징 번호 클릭 시 이벤트 처리
		/* jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/myshop/notice_board.do?rpage="+e.page);         
	    }); */
	    
	    
		//정렬기능
		$(".non").click(function(){
			sorttype =$(this).attr("id");
			//임시방편css
			$(".non").css("background-color","#fff").css("padding","1rem")
			.css("border-radius","2px").css("color","var(--main-color)");
			$(".active1").css("background-color","#fff").css("padding","1rem")
			.css("border-radius","2px").css("color","var(--main-color)");
			$(this).css("background-color","var(--main-color)").css("padding","1rem")
			.css("border-radius","2px").css("color","#fff");
			searchUser(searchtext, sorttype);
			searchtext = "";
		});//function
		
		//검색기능
		$(".search").keyup(function(key){
			if(key.keyCode==13){
				searchtext = $(this).val();
				searchUser(searchtext,sorttype);
				searchtext = "";
			}//if
		});//function
		
		/* 회원 검색 함수 */
		function searchUser(searchtext, sorttype){
			$.ajax({
	    		url:"admin_member_search.do?searchtext="+searchtext+"&sorttype="+sorttype,
		 		success:function(mvo){
		 			if(mvo == "0"){
		 				alert("결과가 존재하지 않습니다!");
		 			}else{
			 			let dataset = JSON.parse(mvo);
			 			
			 			var output = "<div class='projects'>";
			 			output += "<div class='card' id='content'>";
			 			output += "<div class='card-header'>";
			 			output += "<div class='main_title'><h3> 정렬검색된 사용자: "+dataset.count+"명</h3></div>";
			 			output += "<div class='search-wrapper'>";
			 			output += "<span class='las la-search'></span>";
			 			output += "<input type='search' class='search' placeholder='사용자 입력'>";
			 			output += "</div>"
			 			output += "<div class='hearder-left'>"
                    	output +="<button type='button' class='btn_delete'>회원 일괄 탈퇴</button>"
                       
			 			output += "</div></div>";
			 			output +="<div class='card-body'>";
			 			output +="<table width='100%'><thead>";
			 			output +="<tr>";
			 			output +="<td><input type='checkbox' class='member_check' name='checkAll'></td>";
			 			output +="<td>이름</td><td>아이디</td><td>이메일</td><td>쇼핑등급</td><td>최근 방문일</td><td>글/구매평/문의</td><td>누적금액</td>";
			 			output +="</tr></thead><tbody>";
			 			for(obj of dataset.list){
				 			output +="<tr>";
				 			if(obj.id == "admin"){
				 				output+="<td></td>";
				 			}else{
					 			output +="<td><input type='checkbox' class='member_check' name='check' value='"+obj.id+"'></td>";
				 			}
				 			output +="<td><a href='#' class='subtitle' id='"+obj.id+"'>"+obj.name+"</a></td>";
				 			output +="<td>"+obj.id+"</td>";
				 			output +="<td>"+obj.email+"</td>";
				 			output +="<td>"+obj.grade+"</td>";
				 			if(obj.visit == null){
				 				output += "<td>최근 방문일 없음</td>"	
				 			}else{
					 			output +="<td>"+obj.visit+"</td>";			
				 			}	
				 			output +="<td>0/0/0</td>";
				 			output +="<td>"+obj.acc+"</td>";
				 			output +="</tr>";
			 			}
			 			output +="</tbody></table></div>";
			 			
			 			$(".projects").remove();
			 			$(".customercares").after(output);
			 			
			 			$(".search").keyup(function(key){
			 				if(key.keyCode==13){
			 					searchtext = $(this).val();
			 					alert(sorttype);
			 					searchUser(searchtext,sorttype);
			 				}//if
			 			});//function
			 			
			 			/* 체크박스 전체 선택  */
			 			$("input[name=checkAll]").click(function(){
			 				if($("input[name=checkAll]").prop("checked")){
			 					$(".member_check").prop("checked",true);
			 				}else{
			 					$(".member_check").prop("checked",false);
			 			 	}
			 			});
			 			/* 전체 선택 중 체크박스 하나를 풀었을 때, checkAll flase */
			 			 $("input[name=check]").click(function(){
			 				 alert("선택");
			 				  if(!$("input[name=check]").prop("checked")){
			 					  $("input[name=checkAll]").prop("checked",false);
			 				  }
			 			 });
			 			
			 			 /* 일괄 회원 탈퇴 버튼 */
			 			 $(".btn_delete").click(function(){
			 				/* alert("삭제"); */
			 				memberDelete();
			 			 });//delete function
			 			 
			 			function popup(url){
			 				window.open(url,'회원 상세보기', 'width=625, height=850'); return false;
			 			}
			 			 
			 			 $(".subtitle").click(function(){
			 				popup("http://localhost:9000/myshop/admin_member_content.do?id="+$(this).attr("id"));
			 			 });
			 			
		 			}//if-else
		 		}//success
			});//ajax
		}
		
		
		
		/* 체크박스 전체 선택(공지사항)  */
		$("input[name=checkAll]").click(function(){
			if($("input[name=checkAll]").prop("checked")){
				$(".member_check").prop("checked",true);
			}else{
				$(".member_check").prop("checked",false);
		 	}
		});
		/* 전체 선택 중 체크박스 하나를 풀었을 때, checkAll flase */
		 $("input[name=check]").click(function(){
			  if(!$("input[name=check]").prop("checked")){
				  $("input[name=checkAll]").prop("checked",false);
			  }
		 });
		 /* 일괄 회원 탈퇴 버튼 */
		 $(".btn_delete").click(function(){
			/* alert("삭제"); */
			memberDelete();
		 });//delete function
		
		/* 회원 탈퇴 함수 */
		function memberDelete(){
			var cnt= $("input[name=check]:checked").length;
			
			if($("input[name=check]:checked").length == 0){
				 alert("선택된 리스트가 없습니다.");
			 }else{			
				 var delete_list = new Array();			 
			 	 $("input[name=check]:checked").each(function(){
			 	 	delete_list.push($(this).val());
			 	 });
			 	
			 	 if(confirm("선택한 항목을 정말 삭제하시겠습니까?")==true){
			 		 
				 	$.ajax({
				 		url:"admin_member_list_delete.do",
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
		}//function
		
		
		
 	});
</script>  
</head>
<body>
   		<!-- header -->    
		<jsp:include page="/admin_header.do"></jsp:include>

        <main>

            
            <div class="recent-grid">
                <div class="customercares">
                    <div class="card">
                        <div class="card-body">
                            <ul>
                                <li>
                                    <a href="" class="active1"><span>전체 사용자 ${totalcount }</span></a>
                                </li>
                                <li>
                                    <a class="non" id="BASIC"><span>쇼핑 - Basic</span></a>
                                </li>
                                <li>
                                    <a class="non" id="VIP"><span>쇼핑 - VIP</span></a>
                                </li>
                                <li>
                                    <a class="non" id="VVIP"><span>쇼핑 - VVIP</span></a>
                                </li> 
                            </ul>
                        </div>
                    </div>                      
                </div>

                <div class="projects">
                    <div class="card" id="content">
                        <div class="card-header">
                            <div class="main_title"><h3>전체 사용자</h3></div>
                            <div class="search-wrapper">
                                <span class="las la-search"></span>
                                <input type="search" class="search" placeholder="사용자 입력">
                            </div>
                            <div class="hearder-left">
                            	<button type="button" class="btn_delete">회원 일괄 탈퇴</button>
                            </div>
                        </div>

                        <div class="card-body" id="content-body">
                            <table width="100%">
                                <thead>
                                    <tr>
                                        <td><input type="checkbox" class="member_check" name="checkAll"></td>
                                        <td>이름</td>
                                        <td>아이디</td>
                                        <td>이메일</td>
                                        <td>쇼핑등급</td>
                                        <td>최근 방문일</td>
                                        <td>글/구매평/문의</td>
                                        <td>누적금액</td>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach var="vo" items="${list}">
                                    <tr>
                                    	<c:choose>
											<c:when test="${vo.id eq 'admin'}">
												<td></td>
											</c:when>
											<c:otherwise>
		                                        <td><input type="checkbox" class='member_check' name="check" value="${vo.id }"></td>
											</c:otherwise>
										</c:choose>
                                        <td><a href="http://localhost:9000/myshop/admin_member_content.do?id=${vo.id}"
                                        		onclick="window.open(this.href,'회원 상세보기', 'width=625, height=850'); return false;">${vo.name }</a></td>
                                        <td>${vo.id }</td>
                                        <td>${vo.email }</td>
                                        <td>${vo.grade }</td>
                                        <%-- <td>${vo.visit }</td> --%>
                                        <c:choose>
											<c:when test="${vo.visit == null}">
												<td>최근 방문일 없음</td>
											</c:when>
											<c:otherwise>
												<td>${vo.visit }</td>
											</c:otherwise>
										</c:choose>
                                        <td>0/0/0</td>    
                                        <td>${vo.acc }원</td>                                        
                                    </tr>
                                    </c:forEach>
                                   <!--  <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr> -->
                                    <!-- <tr>
                                   		 <td colspan="4"><div id="ampaginationsm"></div></td>
                                    </tr> -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            
        </main>

    </div>
</body>
</html>