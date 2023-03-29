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
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_review_list.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="http://localhost:9000/myshop/resources/js/admin_review_list.js"></script>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
   <!--폰트어썸 최신 CDN-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

    <title>회원 관리페이지</title> 
<script>
/* 체크박스 전체 선택(리뷰)  */
  //리뷰 상세보기 함수
	   function reviewContent(rid){
		   $.ajax({
		 		url:"admin_review_content.do?rid="+rid,
		 		success:function(rvo){
		 			/* alert(rvo.rcontent); */
		 			var score =parseInt(rvo.score);
		 			
		 			let output = "<div id='modal'></div>";
		 			output += "<div class='lay_review_content'>";
		 			output += "<div class='header'>";
		 			output += "<div class='rtitle'>리뷰 상세보기</div>";
		 			output += "<div id='close_button' style='cursor: pointer;'><img src='http://localhost:9000/myshop/resources/images/close.png'></div>";
		 			output += "</div>";
		 			output += "<div class='content'>";
		 			output += "<div class='flame'>";
		 			output += "<div class='star'>";
		 			for(var i=0;i<score; i++){
			 			output +="<label>⭐</label>";
		 			}
		 			output +="<span>"+rvo.score+"</span>";
		 			output +="<div>"+rvo.rwriter+"  |  "+rvo.rdate+"</div>";
		 			output +="</div>";
		 			output +="<div class='rcontent'>"+rvo.rcontent+"</div>";
		 			if(rvo.rsfile != null){
		 				output +="<div class='rsfile'><img src='http://localhost:9000/myshop/resources/upload/"+rvo.psfile+"'></div>";
		 			}
		 			output += "<div class='order_info'>";
		 			output +="<span>"+rvo.pname+"  |  "+rvo.oid+"</span>";
		 			output +="</div>";
		 			output +="<div class='review_info'>";
		 			output +="<table>";
		 			output +="<tr>";
		 			output +="<th>리뷰 글 번호</th>";
		 			output +="<td>"+rvo.rid+"</td>";
		 			output +="<th>리뷰 공감수</th>";
		 			output +="<td>"+rvo.recom+"</td>";
		 			output +="</tr>";
		 			output +="</table>";
		 			output +="</div></div></div></div>";
		 			
		 			$("#modal").remove();
		 			$(".lay_review_content").remove();
					$("#nav-toggle").after(output);
			 		$(".lay_review_content").fadeIn();
			 		$("#modal").fadeIn();
		
				    $("#close_button").click(function(){
				        $(".lay_review_content").fadeOut();
				        $("#modal").fadeOut();
				    });
				    
		 		}//success
		 	}); 
	   }
$(document).ready(function(){
		var searchdate = "";
		var searchscore = "";
		var searchtype ="";
		var searchtext = "";
	
	//기간 값 세팅	
	$(".period_search").click(function(){
		searchdate = $(this).val();
	});
	
	
	//조건검색
	$("#submitbtn").click(function(){
		var chList = [];
			
		$("input[name=scorecheckbox]:checked").each(function(){
			searchscore = $(this).val();
			chList.push(searchscore);
		});
		/* if(chList == null){
			chList.push("");
		}	 */
		var param = {"searchdate":searchdate, "searchscore":chList, "searchtype":searchtype, "searchtext":searchtext};
		var search = JSON.stringify(param);
		
		alert(search);
		
		$.ajax({
			url:"admin_review_search.do",
	 		type: "POST",
	 		data: search,
	 		contentType : 'application/json;',
	 		/* dataType:"json", */ //아마 받는 타입이 String 이라서 오류 발생
	 		success:function(rvo){
	 			let dataset = JSON.parse(rvo);
	 			
	 			var output = "<div class='review_list'>";
	 			output += "<div class='list_heading'><div class='heading_left'>";
	 			output += "<h3>리뷰 조건검색 목록(총 "+dataset.count+"개)</h3></div>";
	 			output += "<div class='heading_right'><button type='button' class='btn_review_delete'>선택 삭제</button></div></div>";
	 			output += "<div class='list_content'><div class='table_flame'><table class='list_table' style='table-layout:fixed'>";
	 			output += "<colgroup><col width='50'><col width='100'><col width='350'><col width='120'><col width='350'><col width='150'>";
	 			output += "<col width='150'><col width='120'><col width='110'><col width='130'></colgroup>";
	 			output += "<tr><th><input type='checkbox' class='review_check' name='checkAll'></th>";
	 			output += "<th>리뷰글 번호</th><th>리뷰 상품명</th><th>상품 카테고리</th><th>리뷰 내용</th><th>리뷰 작성자</th><th>사용자 평점</th>";
	 			output += "<th>사진 첨부유무</th><th>리뷰 공감 수</th><th>작성일</th></tr>";
	 			for(obj of dataset.list){
		 			output += "<tr><td><input type='checkbox' class='review_check' name='check' value='"+obj.rid+"' ></td>";
		 			output += "<td>"+obj.rid+"</td><td>"+obj.pname+"</td><td>"+obj.category_id+"</td>";
		 			output += "<td><button class='openModalPop' type='button' value='"+obj.rid+"'>"+obj.rcontent+"</button></td>";
		 			output += "<td>"+obj.rwriter+"</td><td>";
		 			for(var i=0; i<obj.score; i++){
		 				output += "<label>⭐</label>";
		 			}
		 			output += obj.score+"</td>";
		 			if(obj.rfile == null){
			 			output += "<td>무</td>";
		 			}else{
		 				output += "<td>유</td>";
		 			}
		 			output += "<td>"+obj.recom+"</td><td>"+obj.rdate+"</td></tr>";
	 			}
	 			output += "</table></div></div></div>";
	 			
	 			$(".review_list").remove();
	 			$(".review_content").after(output);
	 			
	 			/* 전체 선택 중 체크박스 하나를 풀었을 때, checkAll flase */
	 			$("input[name=check]").click(function(){
		 				  if(!$("input[name=check]").prop("checked")){
		 					  $("input[name=checkAll]").prop("checked",false);
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
	 			 
	 			 $(".openModalPop").click(function() {
	 		    	var rid = $(this).val();
	 		    	reviewContent(rid);
	 		    });
	 			 
	 			 $(".btn_review_delete").click(function(){
	 				   reviewDelete();
	 			   });
	 		}//success
		});//ajax
	 			
	});//function
	
	//리셋버튼
	$("#resetbtn").click(function(){
		$(".period_search").val("");
		$(".period_search").css("background-color","#fff").css("color","black");
		period_search_count = 0;
		$("input[name=scorecheckbox]").prop("checked",false);
		$(".search_bar").val("");
		$(".search_class").val("defalt");
		searchdate = "";
		period_search_count = 0;
	});
	
	
	 let period_search_count = 0;
	   let period_search_id = "";
	
	 /* 리뷰 작성일 형식은 하나만 선택 가능 */
	   $(".first-date").click(function(){
		  /*  alert("선택"); */
		   if(period_search_count == 1){
			   $(".period_search").css("background-color","#fff").css("color","black");
			   searchdate = "";
			   period_search_count = 0;
		   }
	   });
	   /* 리뷰 작성일 형식은 하나만 선택 가능 */
	   $(".last-date").click(function(){
		  /*  alert("선택"); */
		   if(period_search_count == 1){
			   $(".period_search").css("background-color","#fff").css("color","black");
			   period_search_count = 0;
			   searchdate = "";
		   }
	   });
	   
	   $(".openModalPop").click(function() {
	    	var rid = $(this).val();
	    	reviewContent(rid);
	    });
	   
	   $(".btn_review_delete").click(function(){
		   reviewDelete();
	   });
	   
	   
	   function reviewDelete(){
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
				 		url:"admin_review_list_delete.do",
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
	 
});
</script>    
<style>
	.lay_review_content {
	    width:500px;
	    border: 1px solid black;
	    box-shadow: 3px 3px 7px 1px grey;
	    background-color: white;
	    z-index: 9999;
	  	margin-left: 36%;
	    margin-top: 10%;
	    display: none;
	    position: fixed;
	    border-radius:3px;
	}
	
	#close_button {
	    float: right;
	    margin-top: -3px;
	}
	
	#modal {
	  position:fixed;
	  width:100%;
	  height:100%;
	  background:rgba(0, 0, 0, 0.5);
	  top: 0;
	  left: 0;
	  z-index: 99;
	  display: none;
	}
	
	#close_button img{
		margin-top:12px; 
		width:20px;
		height:20px;
		filter:invert();
	}
	
	.header{
		padding: 0px 10px;
		height:40px;
		line-height:40px;
		background: #323232;
	}
	.rtitle{
		display:inline-block;
		color:#fff;
	}
	.content{
		padding:10px;
	}
	.flame{
		border:2px solid #323232;
		border-radius:5px;
		padding:10px;
	}
	.star div{
		display:inline-block;
		float:right;
		font-size: 13px;
		color:#666666;
	}
	.star label{
		color:transparent;
		text-shadow: 0 0 0 #a00;
	}
	.star span{
		margin-left:5px;
	}
	.rcontent{
		height: 100px;
		margin: 20px 0;
	}
	.review_info table{
		margin-top:10px;
		width: 100%;
	    border: 1px solid #323232;
	    border-collapse: collapse;
	    height:40px;
	}
	.review_info table th{
		border-rigth:1px solid #323232;
		background: #323232;
		color: #fff;
	}
	.review_info table td{
		padding-left: 5px;
	}
	.order_info span{
		font-size:13px;
		color:#666666;
		
	}
	
	.openModalPop{
		color:blue;
		text-decoration:underline;
		cursor:pointer;
		border:none;
		background:none;
		overflow: hidden; 
		text-overflow: ellipsis; 
		white-space: nowrap;
		word-break:break-all;
		width: 300px;
		height: 20px;
		
	}
</style>

</head>
<body>
	<!-- <div id="modal"></div>
	<div class="lay_review_content">
		<div class="header">
			<div class="rtitle">리뷰 상세보기
			</div>
			<div id="close_button" style="cursor: pointer;">
				<img src="http://localhost:9000/myshop/resources/images/close.png">
			</div>
		</div>
		<div class="content">
			<div class="flame">
				<div class="star">
					<label>⭐</label>
					<label>⭐</label>
					<label>⭐</label>
					<span>3</span>
					<div>사용자  |  2018-11-01</div>
				</div>
				<div class="rcontent">만족합니다!</div>
				<div class="rfile"></div>
				<div class="order_info">
					<span>상품 이름  |  상품주문번호</span>
				</div>
				<div class="review_info">
					<table>
						<tr>
							<th>리뷰 글 번호</th>
							<td>5000251</td>
							<th>리뷰 공감수</th>
							<td>500</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div> -->
	
    	<!-- header -->    
		<jsp:include page="/admin_header.do"></jsp:include>

        <main>
		
			<div class="recent-grid">
				<div class="title_box">
					<h3 class="search_title">리뷰 상세 조회</h3>
				</div>
				<div class="review_content">
					<form name="reviewListForm" action="conditional_search.do" method="post">
						<div class="list_content">
							<table class="review_search">
								<tr>
									<th>리뷰 작성일</th>
									<td colspan="3">
										<button type="button" class="period_search" id="p1" value="today">오늘</button>
										<button type="button" class="period_search" id="p2" value="week">1주일</button>
										<button type="button" class="period_search" id="p3" value="month">1개월</button>
										<button type="button" class="period_search" id="p4" value="3months">3개월</button>
										<button type="button" class="period_search" id="p5" value="6months">6개월</button>
										<button type="button"class="period_search" id="p6" value="years">1년</button>
										<button type="button" class="period_search" id="p7" value="all">전체</button> <input
										type="date" id="rsdate" class="first-date">~ <input type="date" id="redate"
										class="last-date">
									</td>
								</tr>
								<tr>
									<th>구매자 평점</th>
									<td><input type="checkbox" name="scorecheckbox" id="review_check1" value="1"> <label
										for="review_check1"></label> <span>1점</span> <input
										type="checkbox" name="scorecheckbox" id="review_check2" value="2"> <label
										for="review_check2"></label> <span>2점</span> <input
										type="checkbox" name="scorecheckbox" id="review_check3" value="3"> <label
										for="review_check3" ></label> <span>3점</span> <input
										type="checkbox" name="scorecheckbox" id="review_check4" value="4"> <label
										for="review_check4"></label> <span>4점</span> <input
										type="checkbox" name="scorecheckbox" id="review_check5" value="5"> <label
										for="review_check5"></label> <span>5점</span></td>
									<th>검색</th>
									<td><select class="search_class">
											<option value="defalt">분류</option>
											<option value="rcontent">리뷰 내용</option>
											<option value="pname">상품 이름</option>
											<option value="rid">리뷰 번호</option>
											<option value="rwriter">리뷰 작성자</option>
									</select> <input type="text" class="search_bar"></td>
								</tr>
								<!-- <tr>
									<th>카테고리</th>
									<td><select class="search_class_main">
											<option value="defalt">대분류</option>
											<option value="x">준비 중</option>
									</select> <select class="search_class_sub">
											<option value="defalt">소분류</option>
											<option value="x">준비 중</option>
									</select></td>
								</tr> -->
							</table>
							<div class="review_search_btns">
								<button class="search_btn" id="submitbtn" type="button">검색</button>
								<button class="search_btn" type="button" id="resetbtn">초기화</button>
							</div>
						</div>
					</form>

				</div>
				<div class="review_list">
					<div class="list_heading">
						<div class="heading_left">
							<h3>리뷰 목록(총 ${totalcount}개)</h3>
						</div>
						<div class="heading_right">
							<select>
								<option value="defalt">정렬</option>
								<option value="registration">상품 등록일 순</option>
								<option value="popularity">인기도 순</option>
								<option value="stock">남은 재고 수량순</option>
							</select>
							<button type="button" class="btn_review_delete">선택 삭제</button>
						</div>
					</div>
					<div class="list_content">
						<div class="table_flame">
							<table class="list_table" style='table-layout:fixed'>
							<colgroup>
								<col width="50">
								<col width="100">
								<col width="350">
								<col width="120">
								<col width="350">
								<col width="150">
								<col width="150">
								<col width="120">
								<col width="110">
								<col width="130">
							</colgroup>
								<tr>
									<th><input type="checkbox" class="review_check" name="checkAll"></th>
									<th>리뷰글 번호</th>
									<th>리뷰 상품명</th>
									<th>상품 카테고리</th>
									<th>리뷰 내용</th>
									<th>리뷰 작성자</th>
									<th>사용자 평점</th>
									<th>사진 첨부유무</th>
									<th>리뷰 공감 수</th>
									<th>작성일</th>
								</tr>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td><input type="checkbox" class="review_check" name="check" value="${vo.rid}" ></td>
										<td>${vo.rid }</td>
										<td style="width:300px">${vo.pname }</td>
										<td>${vo.category_id}</td>
										<td><button class="openModalPop" type="button" value="${vo.rid}">${vo.rcontent }</button></td>
										<td>${vo.rwriter}</td>
										<td><c:forEach  begin="1" end="${vo.score }"><label>⭐</label></c:forEach>${vo.score }</td>
										<c:choose>
											<c:when test="${empty vo.rfile}">
												<td>무</td>
											</c:when>
											<c:otherwise>
												<td>유</td>
											</c:otherwise>
										</c:choose>	
										<td>${vo.recom }</td>
										<td>${vo.rdate }</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</main>

    </div>
</body>
</html>