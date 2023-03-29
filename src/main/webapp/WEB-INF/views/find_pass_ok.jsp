<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.content {font-weight:bold; font-size:20px; text-align:center; width:1080px; margin:0 auto; padding:0; margin-buttom:49px; min-height:600px;}
	.find_area {margin:30px 0;}
	
	.line {text-align:center; width:24px; height:2px; border-top: 2px solid #d01f3c; margin:10px auto;}
	.find_result {text-align: left; font-size:12px; margin:18px auto; width: 372px; line-height:1.6; padding:35px 55px; background:#f8f8f8; }
	.find_result p {display:block; margin:0;}
	.find_result span {color:#d01f3c;}
	 input[type='button'] { height:60px; width:482px; cursor:pointer; font-weight:bold; background:#d01f3c; border:none; color:#ffffff; margin-top:4px;}
</style>
</head>
<body>
	<div class="content" id="new_member">
		<div id="find_pass_ok" class="find_area">
			<div class="find_header">
				<div class="mini_title">비밀번호 변경 완료!</div>
				<div class="line"></div>
			</div>
		</div>
		<div class="find_box">
			<div class="find_result">
				<p>새로운<span>비밀번호로 변경</span>되었습니다.</p>
				<p>변경된 비밀번호로 로그인 하세요</p>
			</div>
			<div class="find_button">
				<input type="button" value="로그인 하기" onclick="location.href='login.do';"> 
			</div>
		</div>
	</div>
</body>
</html>