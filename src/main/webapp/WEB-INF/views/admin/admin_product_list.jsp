<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_product_list.css">
    <link rel="stylesheet"  href="http://localhost:9000/myshop/resources/css/am-pagination.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <script src="http://localhost:9000/myshop/resources/js/am-pagination.js"></script>
    <script src="http://localhost:9000/myshop/resources/js/admin_list.js"></script>
    <title>회원 관리페이지</title> 
<script>
	$(document).ready(function(){
		
		//페이징 리스트 출력
		/*var pager = jQuery('#ampaginationsm').pagination({
		
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
		});
		
		//페이징 번호 클릭 시 이벤트 처리
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/myshop/admin_product_list.do?rpage="+e.page);         
	    }); */ 
		
		
		//체크박스 allCheck
		$("#allCheck").click(function(){
			var chk = $("#allCheck").prop("checked");
			if(chk) {
				$(".checkBox").prop("checked", true);
			}else {
				$(".checkBox").prop("checked", false);
			}
		});
		
		//체크박스 선택체크 
		$(".checkBox").click(function(){
			$("#allCheck").prop("checked", false);
		});
		
		//삭제 버튼 클릭시  
		$(".selectDeleteBtn").click(function(){
			var confirmVal = confirm("정말 삭제하시겠습니가?");
			
			if(confirmVal) {
				var checkArr = new Array();
				$("input[class='checkBox']:checked").each(function(){
					checkArr.push($(this).val());
				});
				
				$.ajax({
					url:"/myshop/deleteProduct.do",
					type:"POST",
					data:{checkBox:checkArr},
					success:function(result){
						location.reload();
					}
				});
			}
		});
 	});
</script> 
</head>
<body>
    	<!-- header -->    
		<jsp:include page="/admin_header.do"></jsp:include>

        <main>


			<div class="recent-grid">
				<div class="title_box">
					<h3 class="search_title">상품 현황</h3>
				</div>
				<div class="seller_content">
					<div class=search>
						<div class="form_status">
							<ul class="status_list">
								<li>
									<a class="link-area">
										<span class="material-symbols-outlined"> border_all </span>		
										<div class="status-text">
											<p>전체</p>
											<strong>200</strong>
											<em>건</em>
										</div>
									</a>
								</li>
								<li>
									<a class="link-area">
											<span class="material-symbols-outlined"> shopping_cart </span>
										<div class="status-text">
											<p>판매 중</p>
											<strong>198</strong>
											<em>건</em>
										</div>
									</a>
								</li>
								<li>
									<a class="link-area">
										<span class="material-symbols-outlined">
											remove_shopping_cart </span>
										<div class="status-text">
											<p>판매 종료</p>
											<strong>2</strong>
											<em>건</em>
										</div>
									</a>
								</li>
								<li>
									<a class="link-area">
										<span class="material-symbols-outlined">
											production_quantity_limits </span>
										<div class="status-text">
											<p>품절</p>
											<strong>2</strong>
											<em>건</em>
										</div>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="title_box">
					<h3 class="search_title">상품 상세 조회</h3>
				</div>
				<div class="seller_content">
				<form name="adminProudctForm" action="admin_conditional_search.do" method="post">
					<div class="list_content">
						<table class="seller_search">
							<tr>
								<th>검색</th>
								<td>
									<select class="search_class">
										<option value="defalt">분류</option>
										<option value="registration">상품번호</option>
										<option value="popularity">상품명</option>
										<option value="stock">브랜드 명</option>
									</select>
									<input type="text" class="search_bar">
								</td>
								<th>카테고리</th>
								<td>
									<select class="search_class main">
										<option value="defalt">대분류</option>
										<option value="x">준비 중</option>
									</select>
									<select class="search_class sub">
										<option value="defalt">소분류</option>
										<option value="x">준비 중</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>기간</th>
								<td colspan="3">
									<button class="period_search" id="p1" type="button">오늘</button>
									<button class="period_search" id="p2" type="button">1주일</button>
									<button class="period_search" id="p3" type="button">1개월</button>
									<button class="period_search" id="p4" type="button">3개월</button>
									<button class="period_search" id="p5" type="button">6개월</button>
									<button class="period_search" id="p6" type="button">1년</button>
									<button class="period_search" id="p7" type="button">전체</button>
									<input type="date" class="first-date">~
									<input type="date"> 
								</td>	
							</tr>
						</table>
						<div class="seller_search_btns">
							<button class="search_btn" type="submit">검색</button>
							<button class="search_btn" type="reset">초기화</button>
						</div>
					</div>
					
				</form>
				</div>
				<div class="seller_list">
					<div class="list_heading">
						<div class="heading_left">
							<h3>상품 목록(총 200개)</h3>
						</div>
						<div class="heading_right">
							<select>
								<option value="defalt">정렬</option>
								<option value="registration">상품 등록일 순</option>
								<option value="popularity">인기도 순</option>
								<option value="stock">남은 재고 수량순</option>
							</select>
							<button type="button" class="selectDeleteBtn">선택 삭제</button>
							<a href="admin_product_write.do"><button type="button">상품 등록</button></a>
						</div>
					</div>
					<div class="list_content">
						<div class="table_flame">
							<table class="list_table">
								<tr>
									<th><input type="checkbox" name="allCheck" id="allCheck">no</th>
									<th>상품명</th>
									<th>브랜드</th>
									<th>카테고리</th>
									<th>재고수량</th>
									<th>판매가</th>
									<th>고정 할인가</th>
									<th>판매상태</th>
									<th>배송비</th>
									<th>상품 등록일</th>
									<th>최종 수정일</th>
								</tr>
								
								<c:forEach var="vo" items="${list}">
								<tr>
									<td><input type="checkbox" name="checkBox" class="checkBox" value="${vo.pid}"> ${vo.rno}</td>
									<td>
									<c:if test="${vo.psfile != null }">
									<a href="http://localhost:9000/myshop/admin_product_update.do?pid=${vo.pid}"><img src="http://localhost:9000/myshop/resources/upload/${vo.psfile }" ></a>
									</c:if>
									<a href="http://localhost:9000/myshop/admin_product_update.do?pid=${vo.pid}">${vo.pname}</a>
									</td>
									<td>${vo.brand}</td>
									<td>${vo.category_id}${vo.category_nm}</td>
									<td>${vo.quantity}</td>
									<td>${vo.price}</td>
									<td>20,000</td>
									<td>판매중</td>
									<td>${vo.delivery_price}</td>
									<td>${vo.regdate}</td>
									<td>${vo.updatedate}</td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="4"><div id="ampaginationsm"></div></td>
								</tr>  
								
							</table>
						</div>
					</div>
				</div>
			</div>
		</main>

    </div>
</body>
</html>