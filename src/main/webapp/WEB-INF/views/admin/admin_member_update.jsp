<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	//세팅 값
	$(".hp_check").val($(".hp_val").val());
	
	if($(".email_check_val").val()=="Y"){
		$("#ck_yes").attr("checked",true);
	}else{
		$("#ck_no").attr("checked",true);
	}
	
	if($(".gender_val").val()=="M"){
		$("#man").attr("checked",true);
	}else{
		$("#woman").attr("checked",true);
	}
	
	//수정버튼-유효성체크
	$(".btn_commit").click(function(){
		if($("#name").val() ==""){
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		}else if($("#email").val() == ""){
			alert("이메일을 입력해주세요");
			$("#email").focus();
			return false;
		}else if(email_regExp()== false){
			alert("올바른 이메일 형식이 아닙니다.");
			$("#email").focus();
			return false;	
		}else if($("#zonecode").val() == ""){
			alert("우편번호를 입력해주세요");
			$("#zonecode").focus();
			return false;
		}else if($("#addr1").val() == ""){
			alert("주소를 입력해주세요");
			$("#addr1").focus();
			return false;
		}else if($("#addr2").val() == ""){
			alert("상세주소를 입력해주세요");
			$("#addr2").focus();
			return false;
		}else if($(".hp_check").val()=="defalt"){
			alert("통신사를 선택해주세요");
			$("#hp").focus();
			return false;
		}else if($("#birth").val() == ""){
			alert("생년월일을 입력해주세요");
			$("#birth").focus();
			return false;	
		}else if($("input[name='gender']:checked").length == 0){
			alert("성별을 선택해주세요");
			return false;
		}else if($("input[name='email_check']:checked").length == 0){
			alert("이메일 수신 여부를 선택해주세요");
			return false;
		}else{
			memberupdateForm.submit();
		}
	});
	
		/*********************
		주소찾기 daum 주소 찾기 api
	 **********************/
	$("#btnSearchAddr").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            //alert(data.address);
	            $("#zonecode").val(data.zonecode);
	            $("#addr1").val(data.address);
	            $("#addr2").focus();
	        }
	    }).open(); 
	});
		
	//이메일 정규식 검토	
	function email_regExp(){
		/* alert($("#email").val()); */
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return regExp.test($("#email").val());	
	}	
	
});

</script>
<style>
	.member_content{
		width:600px;
		border: 1px solid black;
		height:825px;
	}
	.header{
		padding: 0px 10px;
		height:40px;
		line-height:40px;
		background: #323232;
	}
	.title{
		display:inline-block;
		color:#fff;
	}
	.mcontent{
		margin: 10px;
	}
	.mcontent table{
		width:100%;
		border:1px solid #323232;
		border-collapse: collapse;
		margin:15px 0;
	}
	.mcontent table th{
		/* border-rigth:1px solid #323232; */
		width:150px;
		background: #323232;
		color: #fff;
	}
	.mcontent table th,td{
		padding: 10px;
		/* border:1px solid #323232; */
	}	
	.center_btn, .bottom_btn{
		text-align: center;		
	}
	button{
		background:#a00;
		border:1px solid #a00;
		border-radius:2px;
		padding: 5px 10px;
		color:#fff
	}
	.btn_close, .btn_SearchAddr{
		background:#fff;;
		border:1px solid #323232;;
		color:black;
	}
	input[type='text'] {
	    padding: 0 10px;
	    border: 1px solid #ccc;
	    outline: none;
	    color: #141414;
	    width: 250px;
  	 	height: 30px;  
	}
	input[name='zonecode']{
		width: 120px;
		margin-right:25px;
	}
	.hp_check{
		height: 30px; 
		margin-bottom:2px;
		padding: 0 10px;
		border: 1px solid #ccc; 
	}
</style>
</head>
<body>
	<div class="member_content">
		<div class="header">
			<div class="title">회원 정보 수정</div>
		</div>
		<form name="memberupdateForm" action="admin_member_update_check.do" method="post">
		<input type="hidden" id="id" name="id" value="${vo.id }">
		<div class="mcontent">
			<div class="subtitle">■ 회원 기본 정보</div>
			<table>
				<tr>
					<th>아이디</th>
					<td>${vo.id}</td>
				</tr>
				<tr>	
					<th>이름</th>
					<td><input type="text" id="name" name="name" value="${vo.name }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email" name="email" value="${vo.email }"></td>
				</tr>
				<tr>
					<th>회원 등급</th>
					<td>${vo.grade }</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${vo.mdate }</td>
				</tr>
				<tr>
					<th>최근 접속일</th>
					<td>${vo.visit }</td>
				</tr>
			</table>
			<div class="subtitle">■ 사이트 가입 정보</div>
			<table>
				<tr>
					<th>주소</th>
					<td><input type="text" id="zonecode" name="zonecode" value="${vo.zonecode }"><button type="button" class="btn_SearchAddr" id="btnSearchAddr">주소찾기</button>
					<input type="text" id="addr1" name="addr1" value="${vo.addr }" style="margin:2px 0;">
					<input type="text" id="addr2" name="addr2" placeholder="상세 주소">
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td><div>
							<select name="hp" id="hp" class="hp_check">
								<option value="defalt">통신사 선택</option>
								<option value="SK">SK</option>
								<option value="LG">LG</option>
								<option value="KT">KT</option>
							</select>
							<input type="hidden" class="hp_val" value="${vo.hp}">
						</div> 
					<input type="text" id="pnumber" name="pnumber" value="${vo.pnumber }" disabled> 
					<button type="button" class="auth_btn">본인인증</button>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" id="birth" name="birth" value="${vo.birth }"></td>
				</tr>
				<tr>
					<th>이메일 수신여부</th>
					<td><input type="radio" id="ck_yes" name="email_check" value="Y"><span>동의</span>
						<input type="radio" id="ck_no" name="email_check" value="N"><span>비 동의</span>
						<input type="hidden" class="email_check_val" value="${vo.email_check}">
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" id="man" name="gender" value="M"><span>남자</span>
						<input type="radio" id="woman" name="gender" value="F"><span>여자</span>
						<input type="hidden" class="gender_val" value="${vo.gender}">
					</td>
				</tr>
			</table>
			<div class="bottom_btn">
				<button type="button" class="btn_commit">수정 완료</button>
				<button type="button" class="btn_close" onclick="window.close()">닫기</button>
			</div>
		</div>
		</form>
	</div>

</body>
</html>