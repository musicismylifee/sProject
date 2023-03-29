<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_review_list.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="http://localhost:9000/myshop/resources/js/admin_list.js"></script>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
   <!--폰트어썸 최신 CDN-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <title>회원 관리페이지</title> 

</head>
<body>
    	<!-- header -->    
		<jsp:include page="/admin_header.do"></jsp:include>
		
        <main>


			<div class="recent-grid">
				<div class="title_box">
					<h3 class="search_title">문의글 상세 조회</h3>
				</div>
				<div class="review_content">
					<form name="qnaListForm" action="qna_conditional_search.do" method="post">
						<div class="list_content">
							<table class="review_search">
								<tr>
									<th>문의글 작성일</th>
									<td colspan="5">
										<button type="button" class="period_search" id="p1">오늘</button>
										<button type="button" class="period_search" id="p2">1주일</button>
										<button type="button" class="period_search" id="p3">1개월</button>
										<button type="button" class="period_search" id="p4">3개월</button>
										<button type="button" class="period_search" id="p5">6개월</button>
										<button type="button"class="period_search" id="p6">1년</button>
										<button type="button" class="period_search" id="p7">전체</button> <input
										type="date" class="first-date">~ <input type="date"
										class="last-date">
									</td>
								</tr>
								<tr>
									<th>전시상태</th>
									<td><input type="radio" id="review_radio1"
										name="exhibition_status" checked="checked"> <label
										for="review_radio1"></label> <span>전체</span> <input
										type="radio" id="review_radio2" name="exhibition_status">
										<label for="review_radio2"></label> <span>정상</span> <input
										type="radio" id="review_radio3" name="exhibition_status">
										<label for="review_radio3"></label> <span>블라인드</span>
									</td>
									<th>답글 여부</th>
									<td><select class="answer_search_class">
											<option value="defalt">선택 안함</option>
											<option value="unanswered">미 답글</option>
											<option value="answer">답글</option>
									</select></td>
									<th>문의 종류</th>
									<td><select class="search_class">
											<option value="defalt">전체</option>
											<option value="x">배송</option>
											<option value="x">상품</option>
											<option value="x">주문/결제</option>
											<option value="x">취소</option>
											<option value="x">회원</option>
									</select></td>
								</tr>
								<tr>
									<th>검색</th>
									<td colspan="5"><select class="search_class">
											<option value="defalt">분류</option>
											<option value="product_title">상품 제목</option>
											<option value="product_id">상품아이디</option>
											<option value="qna_title">문의글 제목</option>
											<option value="qna_num">문의글 번호</option>
									</select> <input type="text" class="search_bar"></td>
								</tr>
							</table>
							<div class="review_search_btns">
								<button class="search_btn" type="submit">검색</button>
								<button class="search_btn" type="reset" id="btnReset">초기화</button>
							</div>
						</div>
					</form>

				</div>
				<div class="review_list">
					<div class="list_heading">
						<div class="heading_left">
							<h3>문의글 목록(총 200개)</h3>
						</div>
						<div class="heading_right">
							<button type="button" class="btn_delete">선택 삭제</button>
						</div>
					</div>
					<div class="list_content">
						<div class="table_flame">
							<table class="list_table">
								<tr>
									<th><input type="checkbox" class="review_check" name="checkAll"></th>
									<th>문의 번호</th>
									<th>문의 제목</th>
									<th>문의 작성자</th>
									<th>문의 종류</th>
									<th>상품아이디</th>
									<th>상품이름</th>
									<th>전시 상태</th>
									<th>작성일</th>
									<th>답변 여부</th>
								</tr>
								<tr>
									<td><input type="checkbox" class="review_check" name="check"></td>
									<td>20518562</td>
									<td>상품이 잘못 배송되었습니다.</td>
									<td>강**</td>
									<td>배송</td>
									<td>20152158</td>
									<td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
									<td>비공개</td>
									<td>2022/09/23</td>
									<td>미 답변</td>
								</tr>
								<tr>
									<td><input type="checkbox" class="review_check" name="check"></td>
									<td>20115218</td>
									<td>상품 취소 부탁드립니다.</td>
									<td>함**</td>
									<td>취소</td>
									<td>2005123</td>
									<td>아크릴 단가라 썸머 니트</td>
									<td>공개</td>
									<td>2022/09/17</td>
									<td>미 답변</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</main>

    </div>
</body>
</html>