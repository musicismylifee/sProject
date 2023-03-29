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
	p{font-size:12px; }
	.sub_text{color:#d01f3c;}
	.find_box {width:426px; margin:0 auto;}
	.find_table {padding:15px 18px; border: 1px solid #999; border-width:1px 0; width:100%; margin-bottom:8px;}
	table {display:table; box-sizing: border-box; border-collapse:collapse; border-spacing:0;}

	td{margin: 4px 0; padding:0; display:inline-block;  letter-spacing:normal; word-spacing:normal;}
	.find_table input[type='pass'] {padding:0 20px; height:34px; width:382px; margin:0;}
	input[type='submit'] {height:60px; width:426px;}
	.text_center{font-size:12px; color:#999;}
	
	.passModifyBtn{ cursor:pointer; font-weight:bold; background:#d01f3c; border:none; color:#ffffff; margin-top:4px;}
</style>
</head>
<body>
		<!-- header -->    
	<jsp:include page="/header.do"></jsp:include>
	
	<div class="content" id="new_member">
		<div id="find_pass_modify" class="find_area">
			<div class="find_header">
				<div class="mini_title">비밀번호 찾기</div>
				<div class="line"></div>
				<p>
				<span class="sub_text">본인인증이 완료</span>되었습니다. 새로운 비밀번호를 설정해주세요.
				</p>
			</div>
		</div>
		<form action="find_pass_ok.do" method="post">
			<input type="hidden" name="id" id="id" value="">
			<div class="find_box">
				<table class="find_table">
					<tbody>
						<tr>
							<td>
								<input type="pass" name="pass" id="pass" maxlength="15" class="new_text" placeholder="새 비밀번호 입력">
							</td>
						</tr>
						<tr>
							<td>
								<input type="pass" name="pass" id="pass2" maxlength="15" class="new_text" placeholder="새 비밀번호 확인">
							</td>
						</tr>
						<tr>
							<td class="text_center">* 영문 대.소문자+숫자+특수문자 조합 8~15자</td>
						</tr>
					</tbody>
				</table>
				<div class="find_button">
					<input type="submit" value="비밀번호 변경" class="passModifyBtn">
				</div>
			</div>
			
		</form>
		
	
	</div>
	
	
	
	
		<!-- footer -->    
	<jsp:include page="/footer.do"></jsp:include>
	
</body>
</html>