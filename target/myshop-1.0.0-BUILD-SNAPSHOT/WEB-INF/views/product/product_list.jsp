<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="http://localhost:9000/myshop/resources/css/am-pagination.css">
<link rel="stylesheet"  href="http://localhost:9000/myshop/resources/css/product_list.css">
<script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/myshop/resources/js/am-pagination.js"></script>
<Style>

	/*폰트&기본세팅*/
	html, h1, h2, h3, h4, h5, h6, form, fieldset, img {margin:0;padding:0;border:0}
	h1, h2, h3, h4, h5, h6 {font-size:1em;font-family:'Noto Sans KR', sans-serif;}
	article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {display:block}
	
	ul, ul li {margin:0;padding:0;list-style:none}
	legend {position:absolute !important;margin:0 !important;padding:0 !important;font-size:0 !important;line-height:0 !important;text-indent:-9999em !important;overflow:hidden !important}
	label, input, button, select, img {vertical-align:middle}
	input, button {margin:0;padding:0;font-family:dotum;font-size:1em}
	button {cursor:pointer}
	textarea, select {font-family:dotum;font-size:1em}
	select {margin:0}
	p {margin:0;padding:0;word-break:break-all}
	hr {display:none}
	pre {overflow-x:scroll;font-size:1.1em}
	a:link, a:visited {color:#000;text-decoration:none}
	a:hover, a:focus, a:active {color:#000;text-decoration:underline}

	h2{font-size:1.2em !important;font-weight:bold}
	input[type=checkbox], input[type=radio] {margin: -5px 0 0; margin-top: 1px \9;line-height: normal;}


	/*콘테이너 세팅*/
	#container {margin:auto;padding:80px 0 10px 0;/* background:#f4f4f4  */!important;z-index:3;position:relative;height:auto !important;font-size:1em;zoom:1;right:0;max-width:1100px;}
	#container:after {display:block;visibility:hidden;clear:both;content:""}
	#container_title {margin-bottom:20px;font-size:1.8em !important;text-align:center}
	
	/*상품리스트 제목*/
	#wrapper_title{width:300px;clear:both;font-size:1.8em;margin:30px 400px 20px; border-bottom:3px solid black;}
	#wrapper_title:after{display:block;visibility:hidden;clear:both;content:""}
	
	/* 상품 목록 */
	.sct_admin, .sit_admin {margin-right:20px;text-align:right}
	.sct_admin a, .sit_admin a{color:#fff}
	
	/*이벤트*/
	.sev_admin{margin:20px;text-align:right}
	
	/* 연관리스트 */
	/* #related_list {border:1px solid red !important;}
	#related_list ul {padding-left:0 !important; list-style: none; border:1px solid red !important;}
	#related_list ul li{display:inline !important; margin-right:5px !important;} */
	
	/* 상품 목록 현재 위치 */
	#sct_location{clear:both;zoom:1;background:#fff;border:1px solid #e9e9e9;border-radius:5px;margin:20px 10px}
	#sct_ct_1{zoom:1;padding:10px 0px;}
	#sct_location a {display:inline-block;padding:10px 10px 8px;text-decoration:none;letter-spacing:0 !important}
	.sct_here {font-weight:bold}
	.sct_bg {padding-right:15px !important;background:url('img/sct_bg_toright.gif') right center no-repeat}
	
	/* 상품 목록 카테고리 목록 */
	.sct_ct h2 {position:absolute;font-size:0;line-height:0;overflow:hidden}
	.sct_ct ul {padding:0 10px 10px;border-bottom:1px solid #e9e9e9;list-style:none;zoom:1}
	.sct_ct ul:after {display:block;visibility:hidden;clear:both;content:""}
	.sct_ct a {text-decoration:none}
	.sct_ct_parent {font-weight:bold}
	.sct_ct_here {color:#ff3600 !important}
	
	#sct_ct_1{padding:0 20px}
	#sct_ct_1 li {display:inline-block;float:left;text-align:left;margin:5px 10px 5px 0;}
	#sct_ct_1 li a span{color:red}
	#sct_ct_2 li {margin:0 0 10px}
	#sct_ct_2 a {display:inline-block;}
	#sct_ct_3 li {float:left;margin:0 10px 10px 0;width:120px}
	
	@media (max-width: 768px){
	    #sct_ct_1 ul{padding-bottom:20px;}
	    #sct_ct_1 li {text-align:center}
	}
	
	/* 상품 정렬 리스트 스타일 선택 공통 */
	#sct_sortlst {zoom:1;}
	#sct_sortlst:after {display:block;visibility:hidden;clear:both;content:""}
	
	/* 상품 정렬 */
	#sct_sort {width:100%;zoom:1;margin:10px 20px;float:right;}
	#sct_sort:after {display:block;visibility:hidden;clear:both;content:""}
	#sct_sort h2 {position:absolute;font-size:0;line-height:0;overflow:hidden}
	#sct_sort ul {margin:0;padding:0;list-style:none;zoom:1}
	#sct_sort ul:after {display:block;visibility:hidden;clear:both;content:""}
	#sct_sort li {position:relative;}
	
	
	#sct_hhtml, #sct_thtml{padding:10px;}
	/* #sct_hhtml img, #sct_thtml img{width:100%;height:auto} */
	
	#sct_sortlst #sct_sort a.btn01 {display:inline-block;padding:5px;border-left:1px solid #e2e2e2;color:#000;text-decoration:none;vertical-align:middle; float: right; }
	#ssch_sort{margin:15px 0 10px}
	#ssch_sort li a.btn01 {border-radius:0px;display:inline-block;text-align:center;float:left;padding:5px;margin:5px 5px 5px 0;border-left:1px solid #e2e2e2;color:#000;text-decoration:none;vertical-align:middle}
	#ssch_sort li a.btn01:hover{color:#0372ff;}
	#ssch_sort:after{display:block;visibility:hidden;clear:both;content:""}
	
	.sct {margin:20px 20px 10%;clear:both;margin:0;padding:0;list-style:none;zoom:1}
	.sct:after {display:block;visibility:hidden;clear:both;content:""}
	.sct_li {position:relative;}
	.sct_noitem {padding:100px 0;text-align:center}
	.sct img {position:relative} /* 리스트뷰 갤러리뷰 변경 시 ie6,7 에서 이미지 사라지는 문제 해결하기 위해 */
	.sct_icon img {margin:0 1px 0 0}
	.sct_sns a {display:inline-block;margin:0 4px 0 0}
	
	/* 상품 목록 스킨 10 */
	.sct_10 .sct_li {position:relative;display:block;margin:15px 0}
	.sct_10 .sct_li_pannel{border:1px solid #e2e2e2 !important;border-radius:5px !important;overflow:hidden;background:#fff;padding:10px}
	.sct_10 .sct_a {position:relative;text-decoration:none}
	.sct_10 .sct_a:focus, .sct_10 .sct_a:hover {text-decoration:none}
	.sct_10 .sct_img img{width:100% !important;}
	.sct_brand{ font-weight: bold;font-size:1.2em;}
	.sct_10 .sct_txt {margin:15px 0 10px 0; font-weight:bold; font-size:1.2em;}
	.sct_10 .sct_icon {margin:0 0 10px}
	.sct_10 .sct_id {display:block;margin:0 0 5px}
	.sct_10 .sct_basic {margin-bottom:10px;color:#a5a5a5;height:60px;overflow:hidden}
	.sct_10 .sct_cost {display:block;margin:0 0 10px;color:red;font-size:1em}
	.sct_10 .sct_cost:hover{color:#5bb0ff}
	.sct_10 .sct_sns {}
	.sct_10 .sct_wish .btn_wish{text-indent:-9999px;width:25px;height:25px;border:none;background:url('img/wish_btn.png') 0 0 no-repeat}
	.sct_10 .sct_wish .btn_wish:hover{background:url('img/wish_btn.png') 0 -25px no-repeat}
	.sct_10 .sct_wish span{margin-left:10px;line-height:25px}
	
	/* 평점 찜 */
	.product_zzim__num{padding-right:5px;}
	
	#top_btn, #top_btn2{position:fixed;top:70%;right:20px;background:#fff;width:42px;height:40px;background:url("http://localhost:9000//resources/myshop/top_btn.png") no-repeat;text-indent:-9999px;overflow:hidden;opacity:0.8;z-index: 6;}

</Style>
<script>
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
           $(location).attr('href', "http://localhost:9000/myshop/product_list.do?rpage="+e.page);         
    });
	
	});
</script>
</head>
<body>

<!-- header -->    
<jsp:include page="/header.do"></jsp:include>


	<!-- 추천상품 전시 -->
	<div id="wrapper">
		<!-- } 상단 끝 -->
		<!-- 콘텐츠 시작 { -->
		<div id="container">
			<div id="wrapper_title" class="col-lg-12 text-center">
				highly recommended </div>
				<ul class="sct sct_10">
					<c:forEach var="vo" items="${list}">
					<li class="sct_li col-md-3 col-sm-6 col-xs-6  sct_clear">
						<div class="sct_li_pannel">
							<div class="sct_img">
								<a
									href="product_detail.do?pid=${vo.pid}"
									class="sct_a"> <img
									src="http://localhost:9000/myshop/resources/upload/${vo.psfile}"
									width="230px" height="230px" alt="연청 스키니진" title="">
								</a>
							</div>
							<div class="sct_brand">STONE ISLAND</div>
							<div class="sct_txt">
								<a 
									href="product_detail.do?pid=${vo.pid}"
									class="sct_a">${vo.pname}</a>
							</div>
							<div class="sct_cost">${vo.price}원</div>
							<div class="sct_basic"></div>
							<div class="sct_wish">
								<span class="product_zzim__box">
							<i class="product_zzim__icon">
								<img src="http://localhost:9000/myshop/resources/images/icon_zzim_12.svg" alt="찜"></i>
							<span class="product_zzim__num">65</span>
							<i class="product_zzim__icon">
								<img src="http://localhost:9000/myshop/resources/images/icon-star-lp.svg" alt="별점"></i>
							<span class="product_zzim__num">5.0</span>
						</span>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
				
				
				<!-- 검색한 상품들 전시 -->
			<div id="wrapper_title" class="col-lg-12 text-center">
				OUTER</div>
			<!-- 상품 목록 시작  -->
			<div id="sct">
				<!-- <div id="sct_loc_magin"> -->
				<!-- <div class="related_list">
					<ul>
						<li><a href="">코트/트렌치코트</a></li>
						<li><a href="">자켓</a></li>
						<li><a href="">점퍼</a></li>
						<li><a href="">가디건</a></li>
						<li><a href="">집업</a></li>
						<li><a href="">조끼</a></li>
						<li><a href="">야상</a></li>
						<li><a href="">무스탕</a></li>
					</ul>
				</div> -->
				<div id="sct_location">
					<a href="https://theme.sir.kr/youngcart5/myshop/" class="sct_bg">Home</a>>
					<a href="./list.php?ca_id=80" class="sct_here ">BOTTOM</a>
				</div>
				<!-- 빈공란 -->
				<!-- <div id="sct_hhtml"></div> -->
				<div id="sct_sortlst">
					<!-- 상품 정렬 선택 시작 { -->
					<section id="sct_sort">
						<h2>상품 정렬</h2>

						<ul id="ssch_sort">
							<li><a class="text-center btn01"
								href="/youngcart5/myshop/list.php?ca_id=80&amp;sort=it_sum_qty&amp;sortodr=desc">판매많은순</a></li>
							<li><a class="text-center btn01"
								href="/youngcart5/myshop/list.php?ca_id=80&amp;sort=it_price&amp;sortodr=asc">낮은가격순</a></li>
							<li><a class="text-center btn01"
								href="/youngcart5/myshop/list.php?ca_id=80&amp;sort=it_price&amp;sortodr=desc">높은가격순</a></li>
							<li><a class="text-center btn01"
								href="/youngcart5/myshop/list.php?ca_id=80&amp;sort=it_use_avg&amp;sortodr=desc">평점높은순</a></li>
							<li><a class="text-center btn01"
								href="/youngcart5/myshop/list.php?ca_id=80&amp;sort=it_use_cnt&amp;sortodr=desc">후기많은순</a></li>
							<li><a class="text-center btn01"
								href="/youngcart5/myshop/list.php?ca_id=80&amp;sort=it_update_time&amp;sortodr=desc">최근등록순</a></li>
						</ul>
					</section>
					<!-- } 상품 정렬 선택 끝 -->
				</div>
				<!-- 상품진열 10 시작 { -->
				<ul class="sct sct_10">
					<c:forEach var="vo" items="${list}">
					<li class="sct_li col-md-3 col-sm-6 col-xs-6  sct_clear">
						<div class="sct_li_pannel">
							<div class="sct_img">
								<a
									href="http://localhost:9000/myshop/product_detail.do"
									class="sct_a"> <img src="http://localhost:9000/myshop/resources/upload/${vo.psfile}"
									width="230px" height="230px" alt="연청 스키니진" title="">
								</a>
							</div>
							<div class="sct_brand">${vo.brand}</div>
							<div class="sct_txt">
								<a
									href="http://localhost:9000/myshop/product_detail.do"
									class="sct_a">${vo.pname}</a>
							</div>
							<div class="sct_cost">${vo.price}원</div>
							<div class="sct_basic"></div>
							<div class="sct_wish">
								<span class="product_zzim__box">
							<i class="product_zzim__icon">
								<img src="http://localhost:9000/myshop/resources/images/icon_zzim_12.svg" alt="찜"></i>
							<span class="product_zzim__num">65</span>
							<i class="product_zzim__icon">
								<img src="http://localhost:9000/myshop/resources/images/icon-star-lp.svg" alt="별점"></i>
							<span class="product_zzim__num">5.0</span>
						</span>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
				<!-- } 상품진열 10 끝 -->

				<div id="sct_thtml"></div>
			</div>
			<!-- } 상품 목록 끝 -->

			
			<a href="#hd" id="top_btn2">상단으로</a>
		
		<script>
        $(function() {
            $("#container #top_btn2").on("click", function() {
                $("html, body").animate({scrollTop:0}, '500');
                return false;
            });
        });
        </script>
		</div>
		<!-- } container 끝 -->
	</div>

</body>
</html>