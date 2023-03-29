<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/review.css">
<link rel="stylesheet"  href="http://localhost:9000/myshop/resources/css/am-pagination.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://localhost:9000/myshop/resources/js/am-pagination.js"></script>
<script>
function mypageOrder(id){
	if(id == null){
		alert("로그인이 필요한 컨텐츠 입니다.");
	}else{
		/* alert("이동"); */
		location.href='http://localhost:9000/myshop/mypage_order.do?id='+id;
	}
}
	$(document).ready(function(){
		
		//페이징 리스트 출력
		var pager = jQuery('#ampaginationsm').pagination({
		
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
	           $(location).attr('href', "http://localhost:9000/myshop/notice_board.do?rpage="+e.page);         
	    });
		
		//검색기능
		/* $(".search").keyup(function(key){
			if(key.keyCode==13){
				alert("엔터");
			}
		}); */
 	});
</script> 

</head>
<body>

	<!-- header -->    
	<jsp:include page="/header.do"></jsp:include>
	
	<!-- 베스트 리뷰 -->
	<div class="bg">
	     <p><img src="http://localhost:9000/myshop/resources/images/review_banner2.png" class="shop_img"></p>
		<!-- 추천키워드 -->
		<div class="listArea">
			<ul class="listTab">
				<li class="li01"><label class="label01"> <input
						type="radio" name="tabmenu" id="tabAll" checked> <span
						class="span01">전체</span>
				</label></li>
				<li class="li01"><label class="label01"> <input
						type="radio" name="tabmenu" id="tabW"> <span
						class="span01">여성</span>
				</label></li>
				<li class="li01"><label class="label01"> <input
						type="radio" name="tabmenu" id="tabM"> <span
						class="span01">남성</span>
				</label></li>
				<li class="li01"><label class="label01"> <input
						type="radio" name="tabmenu" id="tabK"> <span
						class="span01">키즈</span>
				</label></li>
				<li class="li01"><label class="label01"> <input
						type="radio" name="tabmenu" id="tabL"> <span
						class="span01">라이프</span>
				</label></li>

			</ul>
			<div class="keyword">
				<h2 class="keywordTitle">#추천 키워드</h2>
				<div class="wordArea">
					<span class="word">#골든구스</span> <span class="word">#구찌</span> <span
						class="word">#알렉산더맥퀸</span> <span class="word">#스톤아일랜드</span> <span
						class="word">#오프화이트</span> <span class="word">#메종키츠네</span> <span
						class="word">#메종 마르지엘라</span> <span class="word">#겐조</span> <span
						class="word">#톰브라운</span> <span class="word">#스니커즈</span> <span
						class="word">#가디건</span> <span class="word">#티셔츠</span> <span
						class="word">#가방</span> <span class="word">#지갑</span> <span
						class="word">#스피드러너</span> <span class="word">#볼캡</span>
				</div>
				<div class="search1">
					<input type="text" class="search_keyword" placeholder="브랜드,카테고리,상품명으로 검색하세요.">
					<button class="search_btn"><img src="http://localhost:9000/myshop/resources/images/search_icon.png" width="30px"height="30px"
					padding="5px"></button>
				</div>
			</div>
		</div>
		<nav class="tabmenu" style="width:1080px; display:inline-block;">
			<input type="radio" name="tab" id="tab3" checked> <label
				for="tab1">최신 등록순</label> <input type="radio" name="tab" id="tab2"
				checked> <label for="tab2">최고 평점순</label> <input
				type="radio" name="tab" id="tab1" checked> <label for="tab3">추천
				많은순</label>

			<button type="button" onclick="mypageOrder('${sessionScope.svo.id}')">글쓰기</button>
			<div class="review" id="cont1">
				<div class="review_content" id="review_content">
					<ul>
					<c:forEach var="vo" items="${list}">
						<li>
							<div class="review_list">
								<div class="review_list_header">
									<div class="title">${vo.brand}</div>
									<div class="score"><c:forEach  begin="1" end="${vo.score }"><label>⭐</label></c:forEach></div>
									<div class="size">구매사이즈 : 260</div>
								</div>
								<div class="review_list_content">
									<div class="review_list_content_header">
										<div>${vo.category_id}</div>
										<span>|</span>
										<div class="link">
											<a href="">${vo.pname }</a>
										</div>
									</div>
									<p>${vo.rcontent }</p>
									<div class="review_list_content_footer">
										<button>
											<i class="xi-thumbs-up"></i>${vo.recom}
										</button>
										<div>${vo.rwriter}</div>
										<div>${vo.rdate }</div>
									</div>
								</div>
							</div>
						</li>
						</c:forEach>
						<!-- <li>
							<div class="review_list">
								<div class="review_list_header">
									<div class="review_list_header_rating">
										<div class="rating" data-rate="3">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i>
										</div>
									</div>
									<div class="title">정사이즈에요</div>
									<div class="size">구매사이즈 : 260</div>
								</div>
								<div class="review_list_content">
									<div class="review_list_content_header">
										<div>자켓</div>
										<span>|</span>
										<div class="link">
											<a href="">2022년 꼼데가르송 반팔티 레드와펜 블랙와펜 남성 여성(상품링크)</a>
										</div>
									</div>
									<p>So we needed up ordering the deep fried salmon roll
										width Chinese hot mustard and wasabi noodleSo we needed up
										ordering the deep fried salmon roll width Chinese hot mustard
										and wasabi noodless</p>
									<div class="review_list_content_footer">
										<button>
											<i class="xi-thumbs-up"></i>0
										</button>
										<div>scd***</div>
										<div>2022-09-06 11:04</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="review_list">
								<div class="review_list_header">
									<div class="review_list_header_rating">
										<div class="rating" data-rate="3">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i>
										</div>
									</div>
									<div class="title">정사이즈아니에요</div>
									<div class="size">구매사이즈 : 260</div>
								</div>
								<div class="review_list_content">
									<div class="review_list_content_header">
										<div>자켓</div>
										<span>|</span>
										<div class="link">
											<a href="">2022년 꼼데가르송 반팔티 레드와펜 블랙와펜 남성 여성(상품링크)</a>
										</div>
									</div>
									<p>So we needed up ordering the deep fried salmon roll
										width Chinese hot mustard and wasabi noodleSo we needed up
										ordering the deep fried salmon roll width Chinese hot mustard
										and wasabi noodless</p>
									<div class="review_list_content_footer">
										<button>
											<i class="xi-thumbs-up"></i>0
										</button>
										<div>scd***</div>
										<div>2022-09-06 11:04</div>
									</div>
								</div>
							</div>
						</li> -->
					</ul>
				</div>
			</div>
			
			
		</nav>
		<div id="ampaginationsm"></div>
	</div>
		
	<!-- header -->    
	<jsp:include page="/footer.do"></jsp:include>
</body>
</html>