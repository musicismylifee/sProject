<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		/*********************
		회원가입 폼 유효성 체크 
	**********************/
		$("#btnJoin").click(()=>{		
			
			if($("#id").val() == ""){
				alert("아이디를 입력해주세요");
				$("#id").focus();
				return false;
			}else if($("#pass").val() == ""){
				alert("패스워드를 입력해주세요");
				$("#pass").focus();
				return false;
			}else if($("#cpass").val() == ""){
				alert("패스워드 확인을 입력해주세요");
				$("#cpass").focus();
				return false;
			}else if($("#name").val() == ""){
				alert("성명을 입력해주세요");
				$("#name").focus();
				return false;
			}else if($(".hp_check").val()=="defalt"){
				alert("통신사를 선택해주세요");
				return false;
			}else if($("#pnumber").val() == ""){
				alert("폰번호를 입력해주세요");
				$("#pnumber").focus();
				return false;
			}else if($("#addr1").val() == ""){
				alert("주소를 입력해주세요");
				$("#addr").focus();
				return false;
			}else if($("#addr2").val() == ""){
				alert("상세주소를 입력해주세요");
				$("#addr2").focus();
				return false;
			}else if($("input[name='gender']:checked").length == 0){
				alert("성별을 선택해주세요");
				return false;
			}else if($("input[name='email_check']:checked").length == 0){
				alert("이메일 수신 여부를 선택해주세요");
				return false;
			}else{
				//서버전송
				joinForm.submit();
			}	
		});
		
			/*********************
			회원가입 - 주소찾기 daum 주소 찾기 api
		 **********************/
		$("#btnSearchAddr").click(function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            //alert(data.address);
		            $("#zonecode").val(data.zonecode);
		            $("#addr1").val(data.address);
		            $("#addr2").focus();
		        }
		    }).open(); 
		});
			
	 	
			/*********************
			비밀번호, 비밀번호 확인 비교: blur 영역을 벗어나면 작동
		**********************/
		$("#cpass").on("blur",()=>{
			if($("#pass").val() != "" && $("#cpass").val() != ""){
				if($("#pass").val() == $("#cpass").val()){
					$("#passCheckMsg").text("*비밀번호가 동일합니다.")
						.css("color","blue").css("font-size","12px");
				
				}else{
					$("#passCheckMsg").text("*비밀번호가 동일하지 않습니다. 다시 입력해주세요.")
						.css("color","red").css("font-size","12px");
	
					$("#cpass").val("");
					$("#pass").val("").focus();
				}
			}
		});
		//중복확인 버튼 이벤트 처리 아이디	
		$("#idCheck").click(function(){
			if($("#id").val() == ""){
				alert("아이디를 입력해주세요");
				$("#id").focus();
				return false;
			}else{
				//중복체크 진행 : AJAX 호출 및 결과 출력
				$.ajax({
					url:"id_check.do?id="+$("#id").val(),
					success:function(result){
						//alert("result===>>" + result);
						if(result == 1){
							$("#idCheckMsg").text("사용중인 아이디입니다. 다시 입력해주세요~")
								.css("color","red").css("font-size","11px")
								.css("margin","5px 0 0 156px");
							$("#id").val("").focus();							
						}else{
							$("#idCheckMsg").text("사용 가능한 아이디입니다.")
							.css("color","blue").css("font-size","11px")
							.css("margin","5px 0 0 156px");
							$("#pass").focus();
						}
						
					}//success
					
				});//ajax
			}
		});//ready
		
	});
	
	
</script>
<style>
.join {
	margin-bottom: 60px;
	width: 1080px;
	margin: auto; /*  margin-bottom:49px; min-height:600px; */
	/* border: 1px solid black; */
}

.content_header {	
	margin-bottom: 40px;
}

.f1 {
	float: left;
}

.content_title {
	
	padding-left: 10px;
	margin-bottom: 40px;
	border-left: 2px solid #d01f3c;
	font-size: 25px;
	line-height: 29px;
	font-weight: bold;
	color: #141414;
}
	.member_info{
	margin-bottom: 50px;
	padding: 5px 30px;
    color: #141414;
    font-size: 13px;
    /* border:1px solid red; */
	}
	.mini_desc{
	margin-bottom: 20px;
	}
	.margin_t_5{
	margin-top: 5px !important;
	}
	.c_gray9{
	color: #999 !important;
	}
	.fs13{
	font-size: 13px !important;
	}
	.fs14{
	font-size: 14px !important;
	}
	.btn_mustit{
	padding: 10px;
    background-color:  #f8f8f8;
    font-family: 'SD Gothic Neo', sans-serif;
    outline: none;
	}
	.line{
	width: 24px;
    margin: 10px 0 20px;
    border-top: 2px solid #d01f3c;
	}
	.nuts_table{
	width: 100%;
    margin-bottom: 50px;
    border: 1px solid #999;  
    border-width: 1px 0;
    text-align: left;
    border-collapse: collapse;
    
	}
	
	.nuts_table th {
	 /* border:1px solid red; */
	   border-bottom: 1px solid #e3e3e3;
	   background-color: #f8f8f8;
	   font-size: 13px;
	}
   .nuts_table td{
   	border-bottom: 1px solid #e3e3e3;
   	padding: 5px 10px;
   }
	
	.new_text{
	width: 250px;
    height: 30px;
    line-height: 28px;
    box-sizing: border-box;
    margin-right: 7px;
	}
	input[type="text"].new_text{
	padding: 0 10px;
    border: 1px solid #ccc;
    outline: none;
    color: #141414;
	}
	.mini_title{
	font-size: 20px;
    font-weight: bold;
    color: #141414;
	}
	.mi-selectbox{
	position: relative;
    background-color: #fff;
    display: inline-block;
	}
	.mi-selectbox:before{
	content: '';
    position: absolute;
    top: 50%;
    right: 10px;
    -webkit-transform: translateY(-50%);
    display: inline-block;
    border-style: solid;
    border-color: #333 transparent transparent transparent;
    border-width: 4px 4px 0 4px;
    z-index: 5;
	}
	.mi-input{
	border: 1px solid #ccc;
    padding: 5px 10px;
    box-sizing: border-box;
    height: 30px;
    width: 100%;
    font-size: 12px;
    line-height: 18px;
    color: #141414;
    outline: none;
    appearance: none;
    -webkit-appearance: none;
    position: relative;
    z-index: 10;
    background-color: transparent;
	}
	.mi-group-l10{
	margin-left: 10px;
	}
	.mi-group-r40{
	margin-right: 40px;
	}
	.btn_mwhite:hover{
	background-color: #fcf8f8;
	}
	.btn_mwhite{
	padding: 10px;
    background-color: #fff;
    color: #d01f3c;
    font-size: 12px;
    font-family: 'Pretendard','SD Gothic Neo', 'Apple SD Gothic Neo', sans-serif;
    border: 1px solid #d01f3c;
    outline: none;
    font: inherit;
	}
	.mi-hidden{
	/* display:none; */
	}
	 .mi-radio{
	display: inline-block;
    padding-left: 26px;
    position: relative;
    cursor: pointer;
    vertical-align: middle;
	}
	
	/* .mi-radio-label{
	font-size: 12px;
    line-height: 20px;
    color: #141414;
    display: inline-block;
    vertical-align: top;
	} */
	/* .mi-radio-label:before{
	position: absolute;
    content: '';
    top: 0;
    left: 0;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    box-sizing: border-box;
    border: 1px solid #999;
    background-color: #fff;
	} */
	
	.info_btn{
	margin-top: 50px;
    text-align: center;
    }
    .info_btn input{
    width: 180px;
    height: 60px;
    margin: 0 5px;
    font-weight: bold;
    }
    .btn_new{
    padding: 10px;
    background-color: #fff;
    color: #666;
    font-size: 12px;
    font-family: 'SD Gothic Neo',sans-serif;
    outline: none;
    }
    .info_btn input[type="button"]:last-child{
    	background-color: black;
    	color: #fff;
    }
    
</style>
</head>
<body>
	<!-- header  -->
	<jsp:include page="/header.do"></jsp:include>

	<div class="join">
		<div class="content_header">
			<div class="fl">
				<div class="content_title margin_b_10">개인 회원가입</div>

			</div>
		</div>
		<div class="member_info" id="seller">
			<div class="mini_desc">
				<div class="margin_t_5 c_gray9 fs13">타인의 정보를 도용하여 가입하는 경우 3년
					이하의 징역 또는 1천만원 이하의 벌금에 처하게 됩니다.</div>
			</div>
		</div>
		<div class="member_info" id="general">
			<div class="mini_title">회원정보</div>
			<div class="line"></div>
			
			<form name="joinForm" action="joinCheck.do" method="post">
				<table class="nuts_table">
					<colgroup>
						<col width="180">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><input type="text" class="new_text seller_id" name="id"
								id="id" maxlength="12" value=""
								 style="ime-mode: disabled;" placeholder="영문 또는 영문+숫자 조합 4~12">
								 <button type="button" class="btn_style" id="idCheck">중복확인</button>
								 <div id="idCheckMsg"></div>
								 </td>
							
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" class="new_text" name="pass"
								id="pass" maxlength="15" placeholder="영문,숫자 특수문자 조합 8~15"></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" class="new_text" name="cpass"
								id="cpass" maxlength="15" placeholder="비밀번호 확인"><span id="passCheckMsg">*비밀번호를 다시 입력해주세요</span></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" class="new_text" name="email"
								id="email" maxlength="50" placeholder="이메일"> <label
								class="mi-selectbox mi-inline-block mi-group-r5"
								style="width: 160px"> <select class="mi-input"
									name="select_email" onchange="fnEmailDomain(this.value, '')">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hotmail.com">hotmail.com</option>
								</select>
							</label> </td>
						</tr>
						<tr>
							<th colspan="2">휴대폰번호, 이름, 생년월일은 '본인인증' 확인 후 자동 입력됩니다.<input
								type="button" value="본인인증" class="btn_mwhite mi-group-l10"
								onclick="popCheckPlusSafe('seller');"></th>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" class="new_text" name="name"
								id="name" value=""
								style="background-color: #f8f8f8;"> <span id="s_name"
								class="c_mustit"></span></td>
						</tr>

						<tr>
							<th>생년월일</th>
							<td><input type="text" class="new_text birthday"
								name="birth" id="birth" value="" maxlength="8"
								placeholder="예 : 19990101" 
								style="background-color: #f8f8f8;"> <!-- 텍스트 추가 --> <span
								id="s_under14" class="c_mustit"></span></td>
						</tr>


						<tr>
							<th>휴대폰번호</th>
							<td>
								<div>
									<select name="hp" id="hp" class="hp_check">
										<option value="defalt">선택</option>
										<option value="SK">SK</option>
										<option value="LG">LG</option>
										<option value="KT">KT</option>
									</select>
								</div>
								<div>
									<input type="text" class="new_text seller_phone" name="pnumber"
										id="pnumber" maxlength="20" value=""
										style="background-color: #f8f8f8;"> <input
										type="hidden" id="chk_phone">
								</div>
							</td>
						</tr>
						<tr>
							<th>주소입력</th>
							<td>
								<input type="text" name="zonecode" id="zonecode" placeholder="우편번호">
								<input type="text" name="addr1" id="addr1">
								<button type="button" class="btn_style" id="btnSearchAddr">주소찾기</button>
							</td>
						</tr>
						<tr>
							<th>상세 주소입력</th>
							<td>
								<input type="text" name="addr2" id="addr2">
							</td>
						</tr>
						<tr>
							<th>성별(선택)</th>
							<td>
								<!-- '남' 선택이 디폴트가 아니도록 수정. 2016-12-12 서비스 기획팀 요청--> <label
								class="mi-radio mi-group-r40"> <input type="radio"
									class="mi-hidden" id="man" name="gender" value="M">
									<span class="mi-radio-label">남자</span>
							</label> <label class="mi-radio mi-group-l30"> <input
									type="radio" id="woman" class="mi-hidden" name="gender"
									value="F"> <span class="mi-radio-label">여자</span>
							</label>
							</td>
						</tr>
						<tr>
							<th>이메일 수신 동의</th>
							<td>
								<input type="radio" name="email_check" value="Y"><span>동의</span>
								<input type="radio" name="email_check" value="N"><span>비 동의</span>
							</td>
							
						</tr>

					</tbody>
				</table>
				<div class="info_btn">
					<!-- 셀러의 경우 회원등록 삭제, 구매회원의경우 다음단계 삭제 -->
					<input type="button" value="취소" class="btn_new fs14"
						onclick="if(confirm('회원가입을 취소하시겠습니까?')){window.location.href='/main/index'}">
					<input type="reset" class="btn_new fs14" value="초기화"> 
					<input type="button" class="btn_new fs14" id="btnJoin" value="회원가입">
				</div>
			</form>
		</div>
	</div>

</body>
</html>