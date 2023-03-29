<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content{
    float: left;
    width: 1080px;
    margin: 0 20px 0;
    }
	.find_area{
	margin: 60px 0;
	}
	.find_header{
	margin-bottom: 40px;
    text-align: center;
	}
	.mini_title{
	font-size: 20px;
    font-weight: bold;
    color: #141414;
    }
    .line{
    width: 24px;
    border-top: 2px solid #d01f3c;
    margin: 10px auto 20px !important;
    }
    .find_box{
    border: 1px solid #ccc;
    width: 500px;
    margin: 0 auto;   
    }
    .sub_tab{
    overflow: auto;  
    list-style: none;
    margin: 0;
    padding: 0;
    border: 0;
    font-size:12px;
    vertical-align: baseline;
    color: inherit;
    font-family: 'Pretendard','SD Gothic Neo', 'Apple SD Gothic Neo', sans-serif;
    }
    .on{
    border-color: #333;
    background-color: #333;
    color: #fff;   
    }
    .sub_tab li{
    width: 250px;
    height: 50px;
    line-height: 50px;
    border-bottom: 1px solid #ccc;
    font-weight: bold;
    float: left;
    text-align: center;
    cursor: pointer;
    font-size: 12px;
    }
   
	.sub_desc{
	line-height: 1.4;
    margin-top: 40px;
    text-align: center;
    }
    .sub_desc p{
    font-weight: bold;
    color: #333;  
    margin: 0;
    font-size:12px; 
    font-family: 'Pretendard','SD Gothic Neo', 'Apple SD Gothic Neo', sans-serif;
    }
    .find_method{/*이메일 휴대폰 라디오*/
    margin: 40px 65px 25px;
    overflow: auto;
    font-family: 'Pretendard','SD Gothic Neo', 'Apple SD Gothic Neo', sans-serif;
    font-size: 12px;
    padding: 0;
    border: 0;
   
    }
    .find_ck{
    width: 50%;
    text-align: center;
    float: left;
    }
    .new_radio{
    width: 20px;
    height: 20px;
    border: 1px solid #e1e1e1;
    border-radius: 20px;
    vertical-align: middle;
    -webkit-appearance: none;
     outline: none;
    cursor: pointer;   
    }
    .new_radio:checked:after{
    width: 10px;
    height: 10px;
    content: '';
    display: block;
    background-color: #d01f3c;
    border-radius: 10px;
    position: relative;
    top: 4px;
    left: 4px;
    }
    .find_ck label{
    font-weight: bold;
    color: #333;   
    cursor: pointer; 
    }
    .new_radio~label{
    margin-left: 3px;
    }
    .content_box{
    padding: 0 20px 50px;
    }
    .find_table{
    width: 100%;
    display: none;
    }
    .find_table tr td{
    padding: 5px 0;
    }
    .new_text{
    width: 418px;
    height: 40px;
    padding: 0 20px;
    border: 1px solid #ccc;
    }
    .mi_colum_item{/*휴대폰 */
    display: table-cell;  
    }
    .find_table select{/*휴대폰 창 크기*/
    width: 143px;
    height: 42px;
    padding: 0 15px;
    border-color: #ccc;
    font: inherit;
    color: inherit;   
    }
    .hyphen{
    padding: 0 5px;
    display: inline-block;
    }
    .find_button{
    margin-top: 25px;
    }
    .find_button input{
    width: 100%;
    height: 60px;
    font-size: 14px;
    padding: 0;
    }
    .btn_mustit{
    background-color: #d01f3c;
    color: #fff;
    font-family: 'SD Gothic Neo', sans-serif;
    border: 1px solid #d01f3c;
    -webkit-appearance: button;
    cursor: pointer;
    }
</style>
</head>
<body>
<div class="content" id="new_member">
	<div id="find_info" class="find_area">
		<div class="find_header">
			<div class="mini_title">아이디/비밀번호 찾기</div>
			<div class="line"></div>
		</div>
		
				<div class="find_box">
			<ul class="sub_tab">
				<li class="on" onclick="location.href='http://localhost:9000/myshop/find_id.do';">아이디 찾기</li>
				<li class="" onclick="location.href='http://localhost:9000/myshop/find_pass.do';">비밀번호 찾기</li>
			</ul>
			
							
								<form action="/member/find_id_ok" method="post" accept-charset="utf-8" onsubmit="return form_validId();">				<input type="hidden" name="find_search_type" id="find_search_type" value="email">
			
					
			<div class="sub_desc">
				<p>최초 회원가입 시 등록한 회원정보를 입력하시면</p>
				<p>아이디를 찾을 수 있습니다.</p>
			</div>
			<div class="find_method">
				<div class="find_ck">
					<input type="radio" class="new_radio" id="check_email" name="find_id" value="id" checked="checked" onclick="find_id_check('1', 'ID')">
					<label for="check_email">이메일</label>
				</div>
				<div class="find_ck">
					<input type="radio" class="new_radio" id="check_phone" name="find_id" value="pw" onclick="find_id_check('2', 'ID')">
					<label for="check_phone">휴대폰</label>
				</div>
			</div>
			<!-- 아이디찾기 -->
						<div class="content_box">
				<!-- 이메일 -->
				<table id="open_email" class="find_table" style="display:table;">
					<tbody><tr>
						<td>
							<input type="text" class="new_text" name="per_name" id="per_name" placeholder="이름">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" class="new_text" name="per_email" id="per_email" placeholder="이메일">
						</td>
					</tr>
				</tbody></table>
				<!-- 휴대폰 -->
				<table id="open_phone" class="find_table">
					<tbody><tr>
						<td>
							<input type="text" name="per_name2" id="per_name2" class="new_text" placeholder="이름">
						</td>
					</tr>
					<tr>
						<td>
							<div class="mi-column-item">
								<select name="per_cell" id="per_cell">
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="0130">0130</option>
								</select>
							</div>
							<div class="mi-column-item">
								<span class="hyphen">-</span>
							</div>
							<div class="mi-column-item">
								<input type="text" class="new_text" name="per_cell2" id="per_cell2" maxlength="4" pattern="[0-9]*" inputmode="numeric" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" onkeyup="checkNum(this, this.value); next_focus(this.value,this,4);" style="width:101px;">
							</div>
							<div class="mi-column-item">
								<span class="hyphen">-</span>
							</div>
							<div class="mi-column-item">
								<input type="text" class="new_text" name="per_cell3" id="per_cell3" maxlength="4" pattern="[0-9]*" inputmode="numeric" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" onkeyup="checkNum(this, this.value);" style="width:101px;">
							</div>
						</td>
					</tr>
				</tbody></table>
				<div class="find_button">
					<input type="submit" value="아이디 찾기" class="btn_mustit">
				</div>
			</div>
			</form>
		</div>
		
	</div>
</div>




</body>
</html>