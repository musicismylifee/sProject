<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_notice_list.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <title>회원 관리페이지</title>
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="http://localhost:9000/myshop/resources/js/admin_notice_write.js"></script>

<style>
	.flame{
		border:1px solid #dbdde2;
		border-radius:5px;
		padding:30px;
	}
	
	.write_table{
		/* border-collapse: separate; */
		width:100%;
		margin-bottom:30px;
	}
	.write_table th, td{
		border-bottom:1px solid #dbdde2;
		padding:20px;
	}
	.write_table td:list-child{
		border:none;
	}
	.write_table th{
		background: var(--main-color);
		color:#fff;
	}
	.textbox{
		padding: 5px 10px;
	    width: 400px;
	    border-radius: 0px;
	}
	#ntitle{
		margin-right:30px;
	}
	#ncontent{
		width:600px;
		height:150px;
		display:block;
		margin-bottom:10px;
		
	}
	
	.filebox .upload-name {
	    display: inline-block;
	    height: 40px;
	    padding: 0 10px;
	    vertical-align: middle;
	   /*  border: 1px solid #dddddd; */
	    width: 500px;
	    color: #999999;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: 10px 20px;
	    color: #fff;
	    vertical-align: middle;
	    background-color: #999999;
	    cursor: pointer;
	    height: 40px;
	    margin-left: 10px;
	}
	.filebox input[type="file"] {
	    position: absolute;
	    width: 0;
	    height: 0;
	    padding: 0;
	    overflow: hidden;
	    border: 0;
	}
	
	input[type=checkbox]{
		display:none;
	}
	
	input#ex_check + label:before, input#ncrucial_check + label:before{
		content:"";
		display:inline-block;
		width:20px;
		height:20px;
		line-height:20px;
		border:2px solid var(--main-color);
		border-radius:5px;
		vertical-align: middle;
	}
	
	input#ex_check:checked + label:before, input#ncrucial_check:checked + label:before{
		content:"\f00c";/*폰트어썸 유니코드*/
		font-family:"Font Awesome 5 free"; /*폰트어썸 아이콘 사용*/
		font-weight:900;
		color:#fff;
		background: var(--main-color);
		vertical-align: middle;
		text-align:center;
		font-size:10px;
	}
	
	.write_table span{
		padding:0 8px 0 10px;
	}
	
	input[type=date]{
		width: 150px;
		padding: 4px 10px;
		margin:0 5px;
		
	}
	
	.seller_search_btns a .search_btn{
		background: #fff;
	    border-radius: 10px;
	    color: var(--main-color);
	    font-size: .8rem;
	    padding: 0.5rem 0rem;
	    width:100px;
	    border: 1px solid var(--main-color);
	    margin-right: 10px;
	}
	
</style>

</head>
<body>
  	    <!-- header -->    
		<jsp:include page="/admin_header.do"></jsp:include>

		<main>


			<div class="recent-grid">
				<div class="seller_list">
					<div class="list_heading">
						<div class="heading_left">
							<h3>공지사항 작성</h3>
						</div>
					</div>
					<div class="list_content">
						<form name="noticewriteForm" action="admin_notice_write_check.do" method="post" enctype="multipart/form-data">
							<div class="flame">
								<table class="write_table">
								
									<tr>
										<th>분류</th>
										<td>
												<select name="ncode" id="ncode">
												<option value="notice">공지</option>
												<option value="event">이벤트</option>
												</select>
										</td>
									</tr>
									<tr>
										<th>제목</th>
										<td><input type="text" id="ntitle" name="ntitle" class="textbox"
											placeholder="제목을 입력해 주세요"> <input type="checkbox"
											class="notice_check" id="ncrucial_check"><label
											for="ncrucial_check"></label><input type="hidden" id="ncrucial" name="ncrucial" value="0">
											<span>중요 공지사항으로 등록</span></td>
									</tr>
									<tr>
										<th>공지 상세</th>
										<td><input type="text" id="ncontent" name="ncontent" class="textbox"
											placeholder="내용을 입력해 주세요">
											<div class="filebox">
											    <input class="upload-name" value="첨부파일" placeholder="첨부파일" disabled>
											    <label for="file1">파일찾기</label> 
											    <input type="file" id="file1" name="file1">
											</div>
										</td>
									</tr>
									<tr>
										<th>전시</th>
										<td><input type="checkbox" id="ex_check"><label
											for="ex_check"></label><span>게시 기간 설정</span><input
											type="date" id="nsdate" name="nsdate" disabled>~<input type="date" id="nedate" name="nedate" disabled></td>
									</tr>
								</table>
								<div class="seller_search_btns">
									<button class="search_btn" id="btnWriteNotice" type="button">공지사항 등록</button>
									<a href="admin_notice_list.do">
									<button class="search_btn" type="button">취소하기</button></a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>

	</div>
</body>
</html>