<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
<script>
	let update_result = '${update_result}';
	
	if(update_result == 'ok'){
		alert("수정되었습니다");
	}
$(document).ready(function(){
	$(".btn_delete").click(function(){
		var confirmflag = confirm("확인을 누르면 회원의 데이터가 삭제됩니다.");
		var delete_id= $("#id").val();
		if(confirmflag){
			$.ajax({
	    		url:"admin_member_delete.do?id="+delete_id,
		 		success:function(result){
		 			if(result == 1){
		 				alert("삭제되었습니다.");
		 				window.close();
		 			}else{
		 				alert("삭제오류");
		 			}
		 		}
		 	});
		}else{
			alert("취소")
		}
	});
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
	.btn_close{
		background:#fff;;
		border:1px solid #323232;;
		color:black;
	}
</style>
</head>
<body>
	<div class="member_content">
		<div class="header">
			<div class="title">${vo.id }(${vo.name })님의 회원정보입니다.</div>
		</div>
		<div class="mcontent">
			<div class="subtitle">■ 회원 기본 정보</div>
			<input type="hidden" id="id" name="id" value="${vo.id }">
			<table>
				<tr>
					<th>아이디</th>
					<td>${vo.id }</td>
					
				</tr>
				<tr>	
					<th>이름</th>
					<td>${vo.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${vo.email}</td>
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
			<div class="center_btn"><button type="button" class="btn_update" 
				onclick="location.href='http://localhost:9000/myshop/admin_member_update.do?id=${vo.id}'">정보수정</button></div>
			<div class="subtitle">■ 사이트 가입 정보</div>
			<table>
				<tr>
					<th>주소</th>
					<td>${vo.zonecode }<br>${vo.addr }</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>${vo.pnumber }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${vo.birth }</td>
				</tr>
				<tr>
					<th>이메일 수신여부</th>
					<c:choose>
						<c:when test="${vo.email_check eq 'Y' }">
							<td>동의</td>
						</c:when>
						<c:otherwise>
							<td>미 동의</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>성별</th>
					<c:choose>
						<c:when test="${vo.gender eq 'M' }">
							<td>남성</td>
						</c:when>
						<c:otherwise>
							<td>여성</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
			<div class="bottom_btn">
				<c:choose>
					<c:when test="${vo.id ne 'admin' }">
						<button type="button" class="btn_delete">회원 탈퇴</button>
					</c:when>
				</c:choose>
				<button type="button" class="btn_close" onclick="window.close()">닫기</button>
			</div>
		</div>
		
	</div>

</body>
</html>