<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_order_cancel_management.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <title>관리자 주문관리 페이지</title> 
</head>
<body>
   		<!-- header -->    
		<jsp:include page="/admin_header.do"></jsp:include>
        <main>

            
            <div class="recent-grid">
                <div class="customercares">
                    <div class="card-header">
                        <h3>취소관리</h3>
                    </div>
                    <nav class="tabmenu">

                            <input type="radio" name="tab" id="tab1" checked>
                            <label for="tab1">신규취소</label>
                            <span>|</span>
                            <input type="radio" name="tab" id="tab2" checked>
                            <label for="tab2">취소요청</label>
                            <span>|</span>
                            <input type="radio" name="tab" id="tab3" checked>
                            <label for="tab3">취소처리중</label>
                            <span>|</span>
                            <input type="radio" name="tab" id="tab4" checked>
                            <label for="tab4">취소처리실패</label>
                            <span>|</span>
                            <input type="radio" name="tab" id="tab5" checked>
                            <label for="tab5">취소완료</label>

                            <div class="card-body" id="cont1">
                                <nav class="tab_type1">
                                    <ul>
                                    <li><a href="#a">취소승인</a></li>
                                    <li><a href="#a" class="on">취소거절</a></li>
                                    <li><a href="#a">재수집 요청</a></li>
                                    <li><a href="#a">기타 취소처리</a></li>
                                    </ul>
                                </nav> 
                                <table width="100%">
                                    <thead>
                                        <tr>
                                           
                                            <td><input type="checkbox">주문번호/시각</td>
                                            <td>주문상품</td>
                                            <td>상품금액</td>
                                            <td>수량</td>
                                            <td>상태</td>
                                            <td>운송장 번호</td>
                                            <td>배송</td>
                                            <td>배송정보</td>
                                            <td>결제내역</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                            <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                            <td>30,000</td>
                                            <td>1</td>
                                            <td>입금대기</td>
                                            <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                            <td>배송없음<div>무료</div></td>
                                            <td>관리자메모</td>
                                            <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                            <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                            <td>30,000</td>
                                            <td>1</td>
                                            <td>결제완료</td>
                                            <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                            <td>배송없음<div>무료</div></td>
                                            <td>관리자메모</td>
                                            <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                            <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                            <td>30,000</td>
                                            <td>1</td>
                                            <td>입금대기</td>
                                            <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                            <td>배송없음<div>무료</div></td>
                                            <td>관리자메모</td>
                                            <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                            <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                            <td>30,000</td>
                                            <td>1</td>
                                            <td>입금대기</td>
                                            <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                            <td>배송없음<div>무료</div></td>
                                            <td>관리자메모</td>
                                            <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                            <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                            <td>30,000</td>
                                            <td>1</td>
                                            <td>입금대기</td>
                                            <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                            <td>배송없음<div>무료</div></td>
                                            <td>관리자메모</td>
                                            <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                        </tr>
                                        <tr>
                                            <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                            <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                            <td>30,000</td>
                                            <td>1</td>
                                            <td>입금대기</td>
                                            <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                            <td>배송없음<div>무료</div></td>
                                            <td>관리자메모</td>
                                            <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                        </tr>
                                    </tbody>
                                </table> 
                            </div>

                        <div class="card-body" id="cont2">
                            <nav class="tab_type1">
                                <ul>
                                <li><a href="#a">취소승인</a></li>
                                <li><a href="#a" class="on">취소거절</a></li>
                                <li><a href="#a">재수집 요청</a></li>
                                <li><a href="#a">기타 취소처리</a></li>
                                </ul>
                            </nav> 
                            <table width="100%">
                                <thead>
                                    <tr>
                                       
                                        <td><input type="checkbox">주문번호/시각</td>
                                        <td>주문상품</td>
                                        <td>상품금액</td>
                                        <td>수량</td>
                                        <td>상태</td>
                                        <td>운송장 번호</td>
                                        <td>배송</td>
                                        <td>배송정보</td>
                                        <td>결제내역</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                </tbody>
                            </table> 
                        </div>
                        <div class="card-body" id="cont3">
                            <nav class="tab_type1">
                                <ul>
                                <li><a href="#a">취소승인</a></li>
                                <li><a href="#a" class="on">취소거절</a></li>
                                <li><a href="#a">재수집 요청</a></li>
                                <li><a href="#a">기타 취소처리</a></li>
                                </ul>
                            </nav> 
                            <table width="100%">
                                <thead>
                                    <tr>
                                       
                                        <td><input type="checkbox">주문번호/시각</td>
                                        <td>주문상품</td>
                                        <td>상품금액</td>
                                        <td>수량</td>
                                        <td>상태</td>
                                        <td>운송장 번호</td>
                                        <td>배송</td>
                                        <td>배송정보</td>
                                        <td>결제내역</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                </tbody>
                            </table> 
                        </div>

                        <div class="card-body" id="cont4">
                            <nav class="tab_type1">
                                <ul>
                                <li><a href="#a">취소승인</a></li>
                                <li><a href="#a" class="on">취소거절</a></li>
                                <li><a href="#a">재수집 요청</a></li>
                                <li><a href="#a">기타 취소처리</a></li>
                                </ul>
                            </nav> 
                            <table width="100%">
                                <thead>
                                    <tr>
                                       
                                        <td><input type="checkbox">주문번호/시각</td>
                                        <td>주문상품</td>
                                        <td>상품금액</td>
                                        <td>수량</td>
                                        <td>상태</td>
                                        <td>운송장 번호</td>
                                        <td>배송</td>
                                        <td>배송정보</td>
                                        <td>결제내역</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>신규배송</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                </tbody>
                            </table> 
                        </div>
                        <div class="card-body" id="cont5">
                            <nav class="tab_type1">
                                <ul>
                                <li><a href="#a">취소승인</a></li>
                                <li><a href="#a" class="on">취소거절</a></li>
                                <li><a href="#a">재수집 요청</a></li>
                                <li><a href="#a">기타 취소처리</a></li>
                                </ul>
                            </nav> 
                            <table width="100%">
                                <thead>
                                    <tr>
                                       
                                        <td><input type="checkbox">주문번호/시각</td>
                                        <td>주문상품</td>
                                        <td>상품금액</td>
                                        <td>수량</td>
                                        <td>상태</td>
                                        <td>운송장 번호</td>
                                        <td>배송</td>
                                        <td>배송정보</td>
                                        <td>결제내역</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>배송중</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>배송중</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                </tbody>
                            </table> 
                        </div>

                        <div class="card-body" id="cont6">
                            <nav class="tab_type1">
                                <ul>
                                <li><a href="#a">취소승인</a></li>
                                <li><a href="#a" class="on">취소거절</a></li>
                                <li><a href="#a">재수집 요청</a></li>
                                <li><a href="#a">기타 취소처리</a></li>
                                </ul>
                            </nav>  
                            <table width="100%">
                                <thead>
                                    <tr>
                                       
                                        <td><input type="checkbox">주문번호/시각</td>
                                        <td>주문상품</td>
                                        <td>상품금액</td>
                                        <td>수량</td>
                                        <td>상태</td>
                                        <td>운송장 번호</td>
                                        <td>배송</td>
                                        <td>배송정보</td>
                                        <td>결제내역</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox">20191029515977<div>2019-10-29 09:23</div></td>
                                        <td><img src="" alt="">2019102902059<div>두께:12mm</div><div>색상:오렌지</div></td>
                                        <td>30,000</td>
                                        <td>1</td>
                                        <td>입금대기</td>
                                        <td><select name="" id=""><option value="">우체국택배</option></select><input type="text"></td>
                                        <td>배송없음<div>무료</div></td>
                                        <td>관리자메모</td>
                                        <td><div><span>총 결제금액</span><span>30,000원</span></div><div><span>소계</span><span>30,000원</span></div><div><span>결제방법</span><span>무통장 입금</span></div></td>                                 
                                    </tr>
                                </tbody>
                            </table> 
                        </div>
                    </nav>
                </div>
            </div>
            
            
        </main>

    </div>
</body>
</html>