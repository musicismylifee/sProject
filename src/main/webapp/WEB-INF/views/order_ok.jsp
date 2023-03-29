<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료페이지</title>

<style>
	body {width:97%;}
	.top {display:flex; justify-content: right; /* float:right; */ padding-top:20px; padding-bottom:20px; border-bottom:3px solid lightgrey;}
	.top a{font-size:35px;opacity: 0.5; font-weight:bold;}
	.top a:last-child{font-size:35px;opacity: 1;}
	.main {  display: block; text-align : center;}
	.main p {opacity:0.5;}
	.main button {
	  background-color: white;
	  font-size: 20px;
	  border: lightgrey solid 1px;
	  border-radius: 5px;
	  padding: 7px;
	}
	.main button:hover{
		cursor: pointer;
		background-color: #333;
		color: white;
	}
	
	table {
	border-top: solid 1.5px black;
	border-collapse: collapse;
	width: 100%;
	font-size: 14px;
	}
	td {
	padding: 15px 0px;
	border-bottom: 1px solid lightgrey;
	text-align:center;
	}
	.order_user th {
	border-right:1px solid lightgrey;
	border-bottom:1px solid lightgrey;
	}
	
</style>
</head>
<body>
	<div class="top">
		<div>
			<a>01장바구니</a>
			<a>></a>
			<a>02주문 결제</a>
			<a>></a>
			<a>03주문완료</a>
		</div>
	</div>
	<div class="main">
			<h2>주문이 성공적으로 완료되었습니다</h2>
			<p>주문번호:000000001</p>
			<button>마이페이지</button>
			<button>고객센터</button>
	</div>
	<h3>주문상품내역</h3>
	<table class="order_list">
		<tr>
			<th>상품구분</th>
			<th>상품명</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
		<tr>
			<td>의류</td>
			<td> <p>NYGÅRDSANNA 오가닉 데님 랩스커트</p></td>
			<td>1</td>
			<td><span>380,000원</span></td>
		</tr>
		<tr>
			<td>의류</td>
			<td> <p>NYGÅRDSANNA 오가닉 데님 와이드 팬츠</p></td>
			<td>1</td>
			<td><span>480,000원</span></td>
		</tr>
	</table>
	<h3>주문정보(주문자)</h3>
	<table class="order_user">
		<tr>
			<th>이름</th>
			<td>홍길동</td>
		</tr>
		<tr>
			<th>ID</th>
			<td>hong_gil</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>서울 강동구 천호대로 123-4</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>010-1234-1234</td>
		</tr>
		<tr>
			<th>Email</th>
			<td>hong_gil@gmail.com</td>
		</tr>
	</table>
	
	<!-- footer -->    
	<jsp:include page="/footer.do"></jsp:include>
</body>
</html>








