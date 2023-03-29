<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/mypage_order.css">
<script>
//onclick 정렬 & 검색 이벤트
function buying_tab(searchtext,searchtype ,sorttype){
	/* alert(searchtext);
	alert(searchtype); */
	
	var id = $(".user_id").val();
	var param ={"searchtext":searchtext,"searchtype":searchtype,"sorttype":sorttype,"id":id};
	var search = JSON.stringify(param);
	$.ajax({
		url:"order_search.do",
 		type: "POST",
 		data: search,
 		contentType : 'application/json;',
 		/* dataType:"json", */ //아마 받는 타입이 String 이라서 오류 발생
 		success:function(ovo){
 			let dataset = JSON.parse(ovo);
 			/* alert(dataset.list[0].oid); */
 			if(dataset.count == 0){
 				alert("없음");
 			}else{
 				let output = "<table class='new_mypage_table order_progress' id='new_mypage_table' style='table-layout: fixed';>"
 				output += "<colgroup>";
 				output += "<col width='140'><col width='340'><col width='50'><col width='98'><col width='110'><col width='110'>";
 				output += "</colgroup><tbody><tr>";
 				output += "<th>주문정보</th><th>상품정보</th><th>상품단가</th><th>수량</th><th>배송비</th><th>관리</th></tr>";
 				for(obj of dataset.list){
 					output += "<tr class='first'>";
 					if(obj.status ==0){
 						output += "<td>"+obj.odate+"<br>"+obj.oid+"<br><h3>입금준비중</h3></td>";
 					}else if(obj.status ==1){
 						output += "<td>"+obj.odate+"<br>"+obj.oid+"<br><h3>발송전</h3></td>";
 					}else if(obj.status ==2){
 						output += "<td>"+obj.odate+"<br>"+obj.oid+"<br><h3>배송준비중</h3></td>";
 					}else if(obj.status ==3){
 						output += "<td>"+obj.odate+"<br>"+obj.oid+"<br><h3>배송중</h3></td>";
 					}else if(obj.status ==4){
 						output += "<td>"+obj.odate+"<br>"+obj.oid+"<br><h3>배송완료</h3></td>";
 					}else if(obj.status ==5){
 						output += "<td>"+obj.odate+"<br>"+obj.oid+"<br><h3>구매완료</h3></td>";
 					}else if(obj.status ==6){
 						output += "<td>"+obj.odate+"<br>"+obj.oid+"<br><h3 style='color:#a00'>구매취소</h3></td>";
 					}else{
 						output += "<td>"+obj.odate+"<br>"+obj.oid+"<br><h3>판매취소</h3></td>";
 					}
 				output +="<td>";
 				output +="<div class='pro_img'><img class='proimg' src='http://localhost:9000/myshop/resources/upload/"+obj.psfile+"' ></div>";
 				output +="<div class='pro_text'><h4>"+obj.brand+"</h4><p>"+obj.pname+"</p></div>";
 				output +="</td>";
 				output +="<td><a>"+obj.price+"</a> 원</td><td><a>"+obj.quantity+"</a></td><td><a>3000</a> 원</td>";
 				if(obj.status < 2){
 					output +="<td>주문 취소 요청<button type='button' class='cancel_order' value='"+obj.oid+"'>주문 취소</button></td>"
 				}else if(obj.status ==5){
 					if(obj.rid == 0){
 						output += "<td>리뷰 작성하기<button type='button' class='openModalPop' value='"+obj.oid+"'>리뷰 작성</button></td>"
 					}else{
 						output += "<td>리뷰가 작성된 주문<button type='button' class='openModalPop_update' value='"+obj.rid+"'>리뷰 수정</button>"
 						output += "<button type='button' class='openModalPop_delete' value='"+obj.rid+"'>리뷰 삭제</button></td>"
 					}
 				}else if(obj.status ==6){
 					output +="<td><div style='color:#a00'>주문 취소 요청 중</div><button type='button' class='cancel_order_cancel' value='"+obj.oid+"' style='color:#a00'>요청 취소</button></td>"
 				}else{
 					output +="<td>-</td>";
 				}
 				output +="</tr>";
 			}//for	
 			$("#new_mypage_table").remove();
 			$(".menu_tab").after(output);
 			
 			
 			$(".openModalPop").click(function() {
 				var oid = $(this).val();
 				reviewwrite(oid);
 		    });
 			
		  $(".cancel_order").click(function(){
		    	var confirmflag = confirm("주문 취소 요청을 하시겠습니까?.");
		    	var cancel_order = $(this).val();
		    	if(confirmflag){
		    		cancelorder(cancel_order);
		    	}else{
		    		
		    	}
		    });
		//리뷰수정
			$(".openModalPop_update").click(function(){
				var rid = $(this).val();
				reviewupdate(rid);
			});
		  
		  
 		}//if-else
	}//success
	});
}
//리뷰작성
function reviewwrite(oid){
	$.ajax({
		url:"review_write.do?oid="+oid,
 		success:function(ovo){
 			
 			let output = "<div id='modal'></div>"
 			output += "<div class='review_write'>"
 			output += "<div id='close_button' style='cursor: pointer;'>"
 			output += "<img src='http://localhost:9000/myshop/resources/images/close.png'>"
 			output += "</div>"
 			output += "<form name='reviewwriteForm' action='review_write_check.do' method='post' enctype='multipart/form-data'>"
 			output += "<input type='hidden' name='pid' value='"+ovo.pid+"'>"
 			output += "<input type='hidden' name='rwriter' value='"+ovo.id+"'>"
 			output += "<input type='hidden' name='oid' value='"+ovo.oid+"'>"
 			output += "<div class='flame'>"
 			output += "<div class='product_info'>"
 			output += "<div class='pro_flame'>"
 			output += "<div class='pro_img'><img class='proimg' src='http://localhost:9000/myshop/resources/upload/"+ovo.psfile+"'></div>"
 			output += "<div class='pro_text'>"
 			output += "<ul><li>"+ovo.pname+"/<a>옵션</a></li><li>"+ovo.brand+"</li><li>₩ "+ovo.price+"</li></ul>"
 			output += "</div></div></div>"
 			output += "<span>상품에 만족하셨나요?</span>"
 			output += "<div class='score_star'>"
 			output += "<input type='radio' name='score' value='5' id='rate1'><label for='rate1'>⭐</label><input type='radio' name='score' value='4' id='rate2'><label for='rate2'>⭐</label><input type='radio' name='score' value='3' id='rate3'><label for='rate3'>⭐</label>" 
 			output += "<input type='radio' name='score' value='2' id='rate4'><label for='rate4'>⭐</label><input type='radio' name='score' value='1' id='rate5'><label for='rate5'>⭐</label>"
 			output += "</div>"
 			output += "<div class='filebox'>"
 			output += "<label for='file1'><span class='material-symbols-outlined'>add_a_photo</span><a>사진 추가하기(0/1)</a></label><input type='file' id='file1' name='file1'>"
 			output += "</div>"
 			output += "<span>간단한 리뷰를 작성해 주세요!</span>"
 			output += "<input type='text' class='rcontent' name='rcontent'>"
 			output += "<button type='button' class='btn_style' id='btnWritereview'>"
 			output += "<span>리뷰 남기기</span>"
 			output += "</button></div></form></div>"
 			
 			$(".content").before(output);
	        $(".review_write").fadeIn();
	        $("#modal").fadeIn();
	        
 			
		    $("#close_button").click(function(){
		        $(".review_write").fadeOut();
		        $("#modal").fadeOut();
		        $(".review_write").remove();
		        $("#modal").remove();
		    });
		    
		    $("#btnWritereview").click(function(){
		    	if($("input[name='score']:checked").length ==0){
		    		alert("평점을 남겨주세요");
		    		return false;
		    	}else if($(".rcontent").val()==""){
		    		alert("간단한 리뷰를 남겨주세요!")
		    	}else{
		    		reviewwriteForm.submit();
		    	}
		    });
 		}
	});
}
//리뷰 수정
function  reviewupdate(rid){
	$.ajax({
		url:"review_update.do?rid="+rid,
 		success:function(rvo){
 			
 			let output = "<div id='modal'></div>"
 	 			output += "<div class='review_write'>"
 	 			output += "<div id='close_button' style='cursor: pointer;'>"
 	 			output += "<img src='http://localhost:9000/myshop/resources/images/close.png'>"
 	 			output += "</div>"
 	 			output += "<form name='reviewUpdateForm' action='review_update_check.do' method='post' enctype='multipart/form-data'>"
 	 			output += "<input type='hidden' name='pid' value='"+rvo.pid+"'>"
 	 			output += "<input type='hidden' name='rid' value='"+rid+"'>"
 	 			output += "<input type='hidden' name='oid' value='"+rvo.oid+"'>"
 	 			output += "<input type='hidden' name='rwriter' value='"+rvo.rwriter+"'>"
 	 			output += "<div class='flame'>"
 	 			output += "<div class='product_info'>"
 	 			output += "<div class='pro_flame'>"
 	 			output += "<div class='pro_img'><img class='proimg' src='http://localhost:9000/myshop/resources/upload/"+rvo.psfile+"'></div>"
 	 			output += "<div class='pro_text'>"
 	 			output += "<ul><li>"+rvo.pname+"/<a>옵션</a></li><li>"+rvo.brand+"</li><li>₩ "+rvo.price+"</li></ul>"
 	 			output += "</div></div></div>"
 	 			output += "<span>상품에 만족하셨나요?</span>";	 				
 	 			output += "<div class='score_star'>"
 	 			output += "<input type='radio' name='score' value='5' id='rate1'><label for='rate1'>⭐</label><input type='radio' name='score' value='4' id='rate2'><label for='rate2'>⭐</label><input type='radio' name='score' value='3' id='rate3'><label for='rate3'>⭐</label>" 
 	 			output += "<input type='radio' name='score' value='2' id='rate4'><label for='rate4'>⭐</label><input type='radio' name='score' value='1' id='rate5'><label for='rate5'>⭐</label>"
 	 			output += "</div>"
 	 			output += "<div class='filebox'>"
 	 			if(rvo.rsfile != ""){
 	 				output += "<label for='file1'><span class='material-symbols-outlined'>add_a_photo</span><a>사진 변경하기(1/1)</a></label><input type='file' id='file1' name='file1'>"
 	 			}else{
	 	 			output += "<label for='file1'><span class='material-symbols-outlined'>add_a_photo</span><a>사진 변경하기(0/1)</a></label><input type='file' id='file1' name='file1'>"	
 	 			}
 	 			output += "</div>"
 	 			output += "<span>간단한 리뷰를 작성해 주세요!</span>"
 	 			output += "<input type='text' class='rcontent' name='rcontent' value='"+rvo.rcontent+"'>"
 	 			output += "<button type='button' class='btn_style' id='btnUpdatereview'>"
 	 			output += "<span>리뷰 수정하기</span>"
 	 			output += "</button></div></form></div>"
 	 			
 	 			
 	 			$(".content").before(output);
 		        $(".review_write").fadeIn();
 		        $("#modal").fadeIn();
 		        
 		        //별점 세팅
 		       if(rvo.score ==1){
	 				$("#rate5").attr("checked",true);
	 			}else if(rvo.score == 2){
	 				$("#rate4").attr("checked",true);
	 			}else if(rvo.score == 3){
	 				/* alert("알람"); */
	 				$("#rate3").attr("checked",true);
	 			}else if(rvo.score == 4){
	 				$("#rate2").attr("checked",true);
	 			}else{
	 				$("#rate1").attr("checked",true);
	 			}
 		        
 	 			
 			    $("#close_button").click(function(){
 			        $(".review_write").fadeOut();
 			        $("#modal").fadeOut();
 			        $(".review_write").remove();
 			        $("#modal").remove();
 			    });
 			    
 			    $("#btnUpdatereview").click(function(){
 			    	if($("input[name='score']:checked").length ==0){
 			    		alert("평점을 남겨주세요");
 			    		return false;
 			    	}else if($(".rcontent").val()==""){
 			    		alert("간단한 리뷰를 남겨주세요!")
 			    	}else{
 			    		reviewUpdateForm.submit();
 			    	}
 			    });
 	 		}
	});
}
function cancelorder(cancel_order){
	$.ajax({
		url:"order_cancel_update.do?oid="+cancel_order,
 		success:function(result){
 			/* alert(result); */
 			if(result ==1){
 				
	    		alert("관리자에게 주문 취소 요청을 보냈습니다.");	
	    		location.reload();
 			}else{
 				alert("요청 오류");
 			}
 			
 		}
	});
}
function reviewdelete(rid){
	$.ajax({
		url:"review_delete_check.do?rid="+rid,
 		success:function(result){
 			if(result ==1){
	    		alert("삭제 완료");
	    		location.reload();
 			}else{
 				alert("삭제 오류");
 			}
 			
 		}
	});
}
	//리뷰쓰기 레이어 팝업	
	$(document).ready(function() {
		//레이어 팝업
	    $(".openModalPop").click(function() {
			var oid = $(this).val();
			reviewwrite(oid);
	    });
		
		
		
		//주문 취소 요청 버튼
	    $(".cancel_order").click(function(){
	    	var confirmflag = confirm("주문 취소 요청을 하시겠습니까?.");
	    	var cancel_order = $(this).val();
	    	if(confirmflag){
	    		cancelorder(cancel_order);
	    	}else{
	    		
	    	}
	    });
		
		//정렬 & 검색
	   $(".new_text").keyup(function(key){
			if(key.keyCode==13){
				buying_tab($(".new_text").val(),$(".new_select").val(),'');
				/* alert("선택"); */
			}
	   });
		
		//리뷰수정
		$(".openModalPop_update").click(function(){
			var rid = $(this).val();
			reviewupdate(rid);
		});
		
		//리뷰 삭제
		$(".openModalPop_delete").click(function(){
			var rid = $(this).val();
			var confirmflag = confirm("선택한 리뷰를 삭제합니다.");
			if(confirmflag){
	    		reviewdelete(rid);
	    	}else{
	    		
	    	}
		});
		
		
	});
</script>
<style>
.cancel_order{
	background:#fff;;
	border:1px solid #323232;
	color:black;
	border-radius:2px;
	padding: 5px 10px;
}
.cancel_order_cancel{
	background:#fff;;
	border:1px solid #323232;
	color:#a00;
	border-radius:2px;
	padding: 5px 10px;
}
.openModalPop{
	background:#a00;
	border:1px solid #a00;
	border-radius:2px;
	padding: 5px 10px;
	color:#fff
}
.openModalPop_update, .openModalPop_delete{
	margin-top: 2px;
	background:#323232;
	border:1px solid #323232;
	border-radius:2px;
	padding: 5px 10px;
	color:#fff
}
</style>
</head>
<body>
<jsp:include page="/header.do"/>

	<input type="hidden" class="user_id" value="${sessionScope.svo.id}">
	<div class="content" id="new_mypage" style="margin-bottom: 120px;">
		<div class="mypage_lnb">
			<a href="/mypage/new_mypage_home" class="lnb_header">마이페이지</a>
			<div class="lnb_menu">
				<p class="title">나의 주문관리</p>
				<a href="/mypage/my_buying" class="on">주문내역 조회</a> <a href="#"
					class="want_go" onclick="/member/change_seller">상품판매하기</a>
			</div>
		</div>
		
		<div id="layerNode"></div>
		<div id="my_buying" class="fl new_mypage" style="">
			<div class="now_order ">
				<div class="order_header mi-inline-block">주문내역 조회</div>
				<div class="fr margin_t_8">
					<div class="top_now cursor"
						onclick="window.location.href='/mypage/my_buying?stats=14'">
						구매취소
						<div class="num">${status6}</div>
					</div>
					<div class="top_now cursor"
						onclick="window.location.href='/mypage/my_buying?stats=11'">
						판매취소
						<div class="num">0</div>
					</div>
				</div>
				<div class="clear"></div>

				<div class="order_course home_buyer">
					<div class="course cursor">
						<div class="order_img_box">
							<img
								src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon_confirming_deposit.png"
								alt="입금확인중" style="width: 50px;">
						</div>
						<div class="course_desc">
							입금확인중
							<div class="num ">${status0}</div>
						</div>
					</div>

					<div class="course cursor">
						<div class="order_img_box">
							<img
								src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon_before_shipping.png"
								alt="발송전" style="width: 50px">
						</div>
						<div class="course_desc">
							발송전
							<div class="num ">${status1}</div>
						</div>
					</div>

					<div class="course cursor">
						<div class="order_img_box">
							<img
								src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon_preparing_ delivery.png"
								alt="배송준비중" style="width: 50px">
						</div>
						<div class="course_desc">
							배송준비중
							<div class="num ">${status2}</div>
						</div>
					</div>

					<div class="course cursor">
						<div class="order_img_box">
							<img
								src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon_shipping.png"
								alt="배송중" style="width: 50px">
						</div>
						<div class="course_desc">
							배송중
							<div class="num ">${status3}</div>
						</div>
					</div>

					<div class="course cursor">
						<div class="order_img_box">
							<img
								src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon_delivery_completed.png"
								alt="배송완료" style="width: 50px">
						</div>
						<div class="course_desc">
							배송완료
							<div class="num ">${status4}</div>
						</div>
					</div>

					<div class="course cursor">
						<div class="order_img_box">
							<img
								src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/icon_purchase_completed.png"
								alt="구매완료" style="width: 50px">
						</div>
						<div class="course_desc">
							구매완료
							<div class="num ">${status5}</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>

			<!-- 테이블영역 -->
			<div class="mypage_table" style="position: relative">
				<div class="menu_tab">
					<ul>
						<li class="on" onclick="location.href='http://localhost:9000/myshop/mypage_order.do?id=${sessionScope.svo.id}'">전체주문내역</li>
						<!--결제대기, 입금확인중, 발송전, 배송준비중, 배송중, 배송완료, 구매완료-->
						<li onclick="buying_tab('','','ing')">진행주문내역</li>
						<li onclick="buying_tab('','','complete')">완료주문내역</li>
						<!--발송전구매취소, 구매취소완료, 구매취소, 판매취소, 판매취소완료 상태-->
						<li onclick="buying_tab('','','cancel')">취소주문내역</li>
					</ul>
					<div class="clear"></div>
				</div>
				<div id="load_page">
					<table class="new_mypage_table order_progress"
						id="new_mypage_table" style="table-layout: fixed;">
						<colgroup>
							<col width="140">
							<col width="340">
							<col width="50">
							<col width="98">
							<col width="110">
							<col width="110">
						</colgroup>
						<tbody>
							<tr>
								<th>주문정보</th>
								<th>상품정보</th>
								<th>상품단가</th>
								<th>수량</th>
								<th>배송비</th>
								<th>관리</th>
							</tr>
							<c:forEach var="vo" items="${list}">
							<tr class="frist">
								<c:choose>
									<c:when test="${vo.status == 0}">
										<td>${vo.odate}<br>${vo.oid}<br><h3>입금준비중</h3></td>
									</c:when>
									<c:when test="${vo.status == 1}">
										<td>${vo.odate}<br>${vo.oid}<br><h3>발송전</h3></td>
									</c:when>
									<c:when test="${vo.status == 2}">
										<td>${vo.odate}<br>${vo.oid}<br><h3>배송준비중</h3></td>
									</c:when>
									<c:when test="${vo.status == 3}">
										<td>${vo.odate}<br>${vo.oid}<br><h3>배송중</h3></td>
									</c:when>
									<c:when test="${vo.status == 4}">
										<td>${vo.odate}<br>${vo.oid}<br><h3>배송완료</h3></td>
									</c:when>
									<c:when test="${vo.status == 5}">
										<td>${vo.odate}<br>${vo.oid}<br><h3>구매완료</h3></td>
									</c:when>
									<c:when test="${vo.status == 6}">
										<td>${vo.odate}<br>${vo.oid}<br><h3 style="color:#a00">구매취소</h3></td>
									</c:when>
									<c:otherwise>
										<td>${vo.odate}<br>${vo.oid}<br><h3>판매취소</h3></td>
									</c:otherwise>
								</c:choose>
								<td>
									<%-- <div>${vo.psfile }</div> --%>
									<div class="pro_img"><img class="proimg" src="http://localhost:9000/myshop/resources/upload/${vo.psfile }"></div>
									<div class="pro_text"><h4>${vo.brand}</h4><p>${vo.pname }</p></div>
									</td>
								<td><a>${vo.price }</a> 원</td>
								<td><a>${vo.quantity }</a></td>
								<td><a>3000</a> 원</td>
									<!--발송전까지는 구매철회, 발송 후(발송진행중), 구매완료면 리뷰작성-->
								<c:choose>
									<c:when test="${vo.status < 2 }">
										<td>주문 취소 요청<button type="button" class="cancel_order" value="${vo.oid }">주문 취소</button></td>
									</c:when>
									<c:when test="${vo.status == 5 }">
										<c:choose>
											<c:when test="${vo.rid eq '0' }">
												<td>리뷰 작성하기<button type="button" class="openModalPop" value="${vo.oid }">리뷰 작성</button></td>
											</c:when>
											<c:otherwise>
												<td>리뷰가 작성된 주문<button type="button" class="openModalPop_update" value="${vo.rid }">리뷰 수정</button>
												<button type="button" class="openModalPop_delete" value="${vo.rid }">리뷰 삭제</button></td>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${vo.status == 6 }">
										<td><div style="color:#a00">주문 취소 요청 중</div><button type="button" class="cancel_order_cancel" value="${vo.oid }">요청 취소</button></td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
								<%-- <td>리뷰 작성하기<br><button type="button" id="openModalPop" value="${vo.oid }">리뷰 작성하기</button></td> --%>
							</tr>
							</c:forEach>
							<!-- <tr class="second">
								<td colspan="7" class="nothing">주문내역이 없습니다.</td>
							</tr> -->
						</tbody>
					</table>

					<div class="pageArea">&nbsp;</div>

					<div style="text-align: center";>
						<div class="searchArea">
							<select name="searchType" class="new_select">
								<option value="pname">상품명</option>
								<option value="oid">주문번호</option>
							</select>
							<div class="search1">
								<input type="text" name="searchKeyword" value=""
									class="new_text"> <img
									src="https://s3.ap-northeast-2.amazonaws.com/mustit-ux/img/front/mypage/btn_search.png"
									class="search_img">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</body>
</html>