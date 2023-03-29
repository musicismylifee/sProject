<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>Document</title>
</head>
<style>

body { padding: 50px; display: flex; justify-content: center; align-items: center;}
form {position: relative;  width: 982px;}
table { border-collapse: collapse; }
th {border-top:1px solid gray; border-bottom:1px solid gray;padding:10px; padding:10px;}
td {padding:15px; font-size: .9rem; color: #222; text-align: center; border-bottom:1px solid lightgray;}
.title{ text-align : left;}
select{
	width: 150px;padding: 9px 8px; border: 1px solid lightgray; outline: none; margin-right:10px;
}
.search-wrapper{ border: 1px solid lightgray; padding:0 8px; display:flex; align-items:center;}
input {width : 200px; padding: 10px 8px; border:none; outline: none;}

.searchArea{display:flex; justify-content: center; align-items: center;margin:10px;}

</style>
<body>
	
	<!-- header  -->
	<jsp:include page="/header.do"></jsp:include>
	
    <form class="">
    <p><img src="http://localhost:9000/myshop/resources/images/abc.jpg"></p>
        <table width="100%">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                
                <tr>
                    <td>313</td>
                    <td class="title">[네이버페이] 우리은행(9/11), 농협은행(9/19) 외 계좌 결제/취소 서비스 일시 중단</td>
                    <td>MUSTIT</td>
                    <td>2022-09-07</td>
                </tr>
                <tr>
                    <td>312</td>
                    <td class="title">[안내]추석연휴 고객센터 운영시간 변경 및 배송안내</td>
                    <td>MUSTIT</td>
                    <td>2022-09-06</td>
                </tr>
                <tr>
                    <td>311</td>
                    <td class="title">[안내]추석연휴 및 태풍으로 인한 깜짝배송 중단</td>
                    <td>MUSTIT</td>
                    <td>2022-09-06</td>
                </tr>
                <tr>
                    <td>310</td>
                    <td class="title">[안내]머스트잇 구매이용약관 개정 안내 (시행일: 2022년 10월 04일)</td>
                    <td>MUSTIT</td>
                    <td>2022-09-05</td>
                </tr>
	
        </table>
      	<div class="searchArea">	
	        <select id="search" name="search">
		        <option value="title">제목</option>
		        <option value="content">내용</option>
	        </select>
	        <div class="search-wrapper">
                <input type="search">
				<span class="las la-search" display="inline-block" padding="20px"></span>
            </div>
        </div>
    </div>   
    
    <!-- footer -->    
	<jsp:include page="/footer.do"></jsp:include>
</body>
</html>