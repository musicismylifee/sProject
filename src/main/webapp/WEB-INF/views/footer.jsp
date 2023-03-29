<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>

<style>
	.footer_top {
    position: relative;
    width: 100%;
    margin-top: 20px;
    padding: 50px 0;
    border-top: 1px solid #ddd;
    line-height: 2;
	}
	
	.footer_inner {
    position: relative;
    width: 90%;
    max-width: 1920px;
    min-width: 960px;
    margin: 0 auto;
    padding: 0;
    overflow: hidden;
	}
	
	.foot_content li {
	list-style:none;
    float: left;
    padding: 0;
	}
	.foot_content li p {
	font-size:12px;
    color:#666666;
	}
	
	.foot_content h2 {
	font-size:15px;
	margin:0; padding:0;
	}	
	.foot_content h1 {
	margin:0; padding:0;
	font-size:20px;
	color:#666;
	}	
	.foot_content a {
    text-decoration:none;
    font-size:12px;
    color:#666666;
	}
	
	.f_board_list li {
    width: 100%;
	}
	
	.footer_bottom {
    position: relative;
    width: 100%;
    padding: 0 0 50px 0;
	}
	
	.foot_menu li {
	list-style:none;
	display:inline-block;
	}
	
	.foot_info {
    margin: 20px 0 0;
	}
	
	.footer_bottom a {
	text-decoration:none;
	color:black;
	padding-right: 10px;
	}
	
	.foot_menu {
    position: relative;
    margin: 0;
    padding: 10px 0;
    overflow: hidden;
	}
	
	.f_right {
    position: absolute;
    right: 0;
    top: 10px;
	}
	
	.foot_info {
    position: relative;
    margin: 20px 0 0;
    overflow: hidden;
	}
	
	.foot_info span {
    margin-right: 15px;
    font-size: 12px;
    color: #666;
	}
</style>
</head>
<body class="footer_all">
    <!---------------------------------------------->
	<!--------------- footer ----------------------->
	<!---------------------------------------------->
	<div id="footer_top" class="footer_top">
		<div class="footer_inner">
        	<div class="foot_content">
	        	<ul>
					<li style="width:30%;padding-right:0;">
        				<h2>상품 문의 / 전화 주문 문의 C/S</h2>
        				<h1>010-1234-1234</h1>
        				<h2>쇼핑몰 배송 / 교환 문의 C/S</h2>
						<h1>010-1234-1234</h1>
        			
						<p>온라인스토어 고객센터 (평일 10:00 – 17:00)</p>
        				<p>토요일, 일요일, 공휴일 휴무</p>
        			</li>
        			<li style="width:30%;padding-right:0;">
        				<h2 style="margin-bottom:7px; margin-left:40px;">NOTICE</h2>
						<div class="f_board">
							<div class="f_board_list">
								<ul>
									<li class="f_title">
										<a href="#">공지</a> <!--2022/09/01-->
									</li>
									<li class="f_title">
										<a href="#">공지</a> <!--2022/01/18-->
									</li>
									<li class="f_title">
										<a href="#">공지</a> <!--2021/09/18-->
									</li>
									<li class="f_title">
										<a href="#">이벤트</a> <!--2021/07/05-->
									</li>
									<li class="f_title">
										<a href="#">A/S 안내</a> <!--2021/06/29-->
									</li>
								</ul>
							</div>
						</div>
        			</li>
        			<li style="width:25%;padding-right:0;">
        				<h2 style="margin-bottom:7px;">BANK INFO.</h2>
        				<p>국민은행 930000-00-240000</p>
        				<p>예금주 : 홍길동(SKETCH1993)</p>
        			</li>
					<li style="width:15%;padding-right:0;">
	        			<h2 style="margin-bottom:7px;">DELIVERY</h2>
	                    <!--  반품주소 수정 및 택배사 링크걸기 -->
	        			<p>반품주소 : 경기도 용인시 처인구 원삼면 원양로124번길82</p>
						<p>[ <a href="https://www.ilogen.com/web" target="_blank">택배사 바로가기</a> ]</p>
	        		</li>
		        </ul>
			</div>
		</div>
	</div>
	<div id="footer_bottom" class="footer_bottom">
		<div class="footer_inner" style="border-top:1px dashed #ddd;padding-top:20px;">
			<div class="foot_menu">
            	<ul>
					<li><a href="/member/privacy.html"><strong>개인정보처리방침</strong></a></li>
					<li><a href="/member/agreement.html">이용약관</a></li>
					<li><a href="/shopinfo/guide.html">이용안내</a></li>
				</ul>
				<div class="f_right">
					<ul>
						<li><a href="https://www.sketch1993b2b.com" target="_blank"><img src="http://localhost:9000/myshop/resources/images/sketch.png" height="20px" alt="blog"></a></li>
	            		<li><a href="https://blog.naver.com/sketch1993" target="_blank"><img src="http://localhost:9000/myshop/resources/images/blog.png" height="20px" alt="blog"></a></li>
	            		<li><a href="https://www.instagram.com/sketch1993_official/" target="_blank"><img src="http://localhost:9000/myshop/resources/images/insta.png" height="20px" alt="instagram"></a></li>
					</ul>
				</div>
			</div>
			<div class="foot_info" style="padding-left:40px;">
			<span>상호 : sketch1993</span> 
			<span>대표 : 홍성하</span> 
			<span>사업자등록번호 : 128-40-31049</span> 
			<span>통신판매업신고 : 2020-용인처인-01304</span> <span><a href="#none" onclick="window.open('http://www.ftc.go.kr/bizCommPop.do?wrkr_no=1284031049', 'bizCommPop', 'width=750, height=950;');return false;">[사업자정보확인]</a></span>
			<br><span>전화 : 010-1234-1234</span> 
			<span>팩스 : </span> 
			<span>이메일 : <a href="mailto:zoflej@gmail.com">이태연</a></span>
			<span>주소 : 17168 경기도 용인시 처인구 원삼면 원양로124번길 82 1층</span>
			<span>개인정보보호책임자 : <a href="mailto:zoflej@gmail.com">홍성하</a></span><br>
			<span>안전거래를 위해 결제시 저희 쇼핑몰에서 가입한 PG사의 구매안전서비스를 이용하실 수 있습니다. <a href="#" target="_blank">
				<span><br><br>
				<span>Copyright © sketch1993. All rights reserved.</span>
				</span></a>
			</span>
			</div>
    </div>
</div>
</body>
</html>