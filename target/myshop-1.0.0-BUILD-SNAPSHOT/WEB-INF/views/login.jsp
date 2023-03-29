<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

let join_result = '${join_result}';
if(join_result == 'ok'){
	alert("회원가입에 성공하셨습니다.");
}
</script>
<style>
	/* 폰트적용 */
    html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, img, ins, kbd, q, s, samp, small, sub, sup, tt, var, b, u, center,
	dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption,
	tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed,
	figure, figcaption, footer, header, hgroup, menu, nav, output, ruby,
	section, summary, time, mark, audio, video {
		margin: 0;
		padding: 0;
		border: 0;
		font-family: 'Pretendard', 'SD Gothic Neo', 'Apple SD Gothic Neo',
			sans-serif;
		font-size: 12px;
		color: #666666;
		vertical-align: baseline;
		color: inherit;
	}
	
	/* .wraper { width: 100%; min-width:1344px; position: relative;} */
	/* #container{ width:1344px; min-width:1100px; margin:0 auto; text-align:left; *margin-bottom:50px; border:1px solid black;} */
	
	.icon-simple-login-v2 { display: inline-block; background: url('https://mustit-ux.s3.ap-northeast-2.amazonaws.com/img/m/m_sprites/sprite_simple_login_v2.png') no-repeat; background-size: 172px 39px; width: 36px; height: 36px; }
	.icon-simple-login-v2.naver { background-position: -77px -1.6px; }
	.icon-simple-login-v2.kakao { background-position: -152.3px -1.6px; width: 18px; height: 17px;}
	.icon-simple-login-v2.facebook { background-position: -39.3px -1.6px; }
	.icon-simple-login-v2.apple { background-position: -1.6px -1.6px; }
	.icon-simple-login-v2.wemakeprice { background-position: -114.6px -1.6px; }
	
	#new_member { /*  float:center; */
		width: 1080px;
		margin: auto; /*  margin-bottom:49px; min-height:600px; */
		border: 1px solid black;
	}
	
	#login .top_welcome {
		margin: 70px 0 50px;
		text-align: center;
	}
	
	
	#login .top_welcome span{
		font-size: 32px;
		font-weight: 600px;
		color: #222;
		vertical-align: -10px;
		/* border: 1px solid red; */
	}
	
	
	/* 로그인 탭  */
	.login_center{
		/* border: 1px solid red; */
		width:360px;
		height:448px;
		margin:0 auto 80px auto;
	}
	.tabs {
	    position: relative;
	    padding: 0;
	    list-style: none;	       
	}
	.tab {
		display:inline-block;
		/* border: 1px solid green; */
		width:50%;
	    float: left;
	    padding: 10px 0;
	}
	.tab label.tab-1 { /* 탭 헤더 */
	    position: relative;
	    /* background: #eee; */
	    color: #888;
	    padding: 8px 49px;
	    
	    /* border: 1px solid #ccc; */
	}
	.tab label.tab-2 { /* 탭 헤더 */
	    position: relative;
	  /*   background: #eee; */
	  	color: #888;
	    padding: 8px 30px;
	    
	   /*  border: 1px solid #ccc; */
	}
	.tab [type="radio"] {
	    display: none;
	}
	.tab .content { /* 탭 컨텐츠 */
	    display: none;
	    position: absolute;
	    background: white;
	    top: 39px; /*탭 헤더 아래쪽으로 위치 이동 */
	    left: 0;
	    right: 0;
	    padding: 0;
	    box-sizing: border-box;
	    border-top: 1px solid #ccc;
	}
	.tab [type="radio"]:checked ~ label {
		font-weight:bold;
		color:black;
	    border-bottom: 3px solid black;
	    
	    z-index: 2; /* 선택한 탭 헤더를 앞으로 옮겨 컨텐츠 테두리 선에 가려지지 않도록 처리 */
	}
	.tab [type="radio"]:checked + label + .content {
	    z-index: 1;
	    display: block;
	}
	
	
	/* login_content */
	.login_box{
		margin: 20px 0;
	}
	.LoginID{
		border: 1px solid #ddd; border-radius: 4px; padding: 11px 16px; box-sizing: border-box; -webkit-text-fill-color: inherit; color: #222; width:100%; margin-bottom:8px;
	}
	.LoginPW{
		border: 1px solid #ddd; border-radius: 4px; padding: 11px 16px; box-sizing: border-box; -webkit-text-fill-color: inherit; color: #222; width:100%
	}
	.btnLogin{
		margin-top:20px; height: 48px; border-radius: 4px; background-color: #222; color:white; width:100%
	}
	
	/* 로그인 버튼하단 */
	.login_addon{
		display:inline_block;
		font-size:12px;
		margin-bottom: 80px;
	}
	.saveID{
		float:left;
	}
	.find_lnfo{
		float:right;
		
	}
	.find_lnfo a{
		border-left:1px solid #ccc; 
		padding: 0 5px;
		color: #888;
		text-decoration: none;
	}
	
	.kakao_login_box{
		height: 44px; border-radius: 4px; background-color: #fee500; border-color: #fee500; padding: 0; color: #222; width:100%; margin-bottom:20px;
	}
	#kakao_icon{
		background-position: -152.3px -1.6px; width: 18px;height: 17px;
	}
	
	.social_btns {
		text-align:center;
	}
	
	.social_btns button{
		margin-right: 3px;
		border: none;
		background-color: white;
	}
	
	/* 비회원조회 */
	.search_order_textbox{
		border: 1px solid #ddd;
	    border-radius: 4px;
	    padding: 11px 16px;
	    box-sizing: border-box;
	    -webkit-text-fill-color: inherit;
	    color: #222;
	    width:100%;
	    margin-top: 20px;
	}
	
	.btnSerch{
		width:100%;
		height: 48px;
	    border-radius: 4px;
	    background-color: #222;
	    color:white;
	    margin-top: 20px;
	}
	.find_ordernum{
		margin-top: 20px;
		font-size: 13px !important;
	    line-height: 18px;
	    text-decoration: underline;
	    display: inline-block;
	    color: #888 !important;
	}

</style>
</head>
<body>

	<!-- header  -->
	<jsp:include page="/header.do"></jsp:include>
	
	<div class="wraper" id="wrap">
		<div id="container">
			<div id="new_member">
				<div id="login">
					<div class="top_welcome">
						<span>머스트잇에 오신 것을 환영 합니다!</span>
					</div>
					<div class="login_center">
						<ul class="tabs">
						    <li class="tab">
						      <input type="radio" id="tab-1" name="tab-group-1" checked>
						      <label class="tab-1" for="tab-1">회원로그인</label>
						      <div class="content">
						        <form name="loginForm" action="" method="">
						        	<div class="default">
						        		<div class = "login_box">
						        			<input type="text" class="LoginID" placeholder="아이디">
						        			<input type="password" class="LoginPW" placeholder="패스워드">
						        			<button type="submit" class="btnLogin">로그인</button>
						        		</div>
						        		<div class="login_addon">
						        			<div class="saveID">
						        				<input type="checkbox" class="checkbox_savaID">아이디 저장
						        			</div>
						        			<div class="find_lnfo">
						        				<a href="/find_id">아이디 찾기</a>
						        				<a href="/find_pw">비밀번호 찾기</a>
						        				<a href="/join">회원가입</a>
						        			</div>
						        		</div>
						        		<div class="social_login">
						        			<div class="kakao_login">
						        				<button type="button" class="kakao_login_box" onclick="window.open('https://kauth.kakao.com/oauth/authorize?client_id=68b2f8ac84a0230855cd96fe9a508f5f&redirect_uri=https%3A%2F%2Fm.mustit.co.kr%2Fmember%2Fkakao_login_callback&state=web||%2Fmain%2Findex||5a6e22875368245b44e75c80c10625cb||&encode_state=true&response_type=code', '카카오 계정으로 로그인', 'width=320, height=480, toolbar=no, location=no');">
						        					<i class="icon-simple-login-v2 kakao" id="kakao_icon"></i>카카오로 시작하기
						        				</button>
						        			</div>
						        			<div class="social_btns">
						        				<button type="button" class="btn_naver" onclick="popup('/popup/naver_login_popup?redirect=%2Fmain%2Findex', 500, 500);">
						        					<i class="icon-simple-login-v2 naver"></i>
						        				</button>
						        				<button type="button" class="btn_facebook">
						        					<i class="icon-simple-login-v2 facebook"></i>
						        				</button>
						        				<button type="button" class="btn_apple" onclick="">
						        					<i class="icon-simple-login-v2 apple"></i>
						        				</button>
						        				<button type="button" class="btn_wemake" onclick="">
						        					<i class="icon-simple-login-v2 wemakeprice"></i>
						        				</button>
						        				
						        			</div>
						        		</div>
						        	</div>
						        </form>
						      </div>
						    </li>
						    <li class="tab">
						      <input type="radio" id="tab-2" name="tab-group-1">
						      <label class="tab-2" for="tab-2">비회원 주문조회</label>
						      <div class="content">
						        <form name="order_search_Form" action="" method="">
						        	<div class="order_search">
						        		<input type="text" placeholder="주문번호 (숫자 13자리 입력)" class="search_order_textbox">
						        		<button type="submit" class="btnSerch">주문조회</button>
						        		<a href="/find_orderNum" class="find_ordernum">주문번호를 잊으셨나요?</a>
						        	</div>
						        </form>
						      </div>
						    </li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>