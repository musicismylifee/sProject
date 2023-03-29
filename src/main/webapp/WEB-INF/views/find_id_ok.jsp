<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content {font-weight:bold; font-size:20px; text-align:center; width:1080px; margin:0 auto; padding:0; margin-buttom:49px; min-height:600px;}
	.find_area {margin:30px 0;}
	.line {text-align:center; width:24px; height:2px; border-top: 2px solid #d01f3c; margin:10px auto;}
	
</style>
</head>
<body>
	<div class="content" id="new_member">
		<div id="find_pass_ok" class="find_area">
			<div class="find_header">
				<div class="mini_title">회원님의 아이디 찾기 결과입니다.</div>
				<div class="line"></div>
			</div>
		</div>
		<div class="find_box">
			<div class="text-cneter">
				<p><span>010-****-1256과 동일한 휴대폰번호</span>로 머스트잇에 가입한 정보가 있습니다.<br>개인정보 보호를 위해 아이디 일부가*표 처리되었습니다.</p>
			</div>
			<div class="find_result"></div>
			<div class="activeId"></div>
			<div class="dormantId"></div>
		</div>
	</div>
</body>
</html>