<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p, span {
  margin: 0;
}

a {
  color: black;
}

.cart__list__detail img {
  display: block;
  width: 80%;
  height: 80px;
  margin: auto;
}

.cart {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
  list-style:none;
}

.cart ul :first-child {
  color: red;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 12px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

.cart__list__detail :nth-child(3) {
  vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
  font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
  position: relative;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 10px;
  border: lightgrey solid 1px;
  padding: 7px;
}
button:hover{
   cursor: pointer;
}

.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6),
.cart__list__detail :nth-child(7) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6),
.cart__list__detail :nth-child(7) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: #333;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
  background-color: #333;
  color: white;
  border: none;
}

table.calculation {
   border: 1px solid #e0e0eb;
   border-collapse: collapse;
   background-color:#f5f5f0;
   width:100%;
   font-size:10pt;
}

table.calculation th {
   border: 1px solid #e0e0eb;
}

table.calculation td {
   border:1px solid #e0e0eb;
   text-align: center;
}

.c_price {
   font-size:20pt;
   font-weight:bold;
}

.checkBox { float:left; width:30px; }
input { width:16px; height:16px; color:black;}
</style>

<script>
   $("#allCheck").click(function(){
      var chk = $("#allCheck").prop("checked");
      if(chk) {
       $(".chBox").prop("checked", true);
      } else {
       $(".chBox").prop("checked", false);
      }
   });
   
   $(".chBox").click(function(){
    $("#allCheck").prop("checked", false);
   });
</script>

</head>
<body>
   <!-- header  -->
   <jsp:include page="/header.do"></jsp:include>
   
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <table class="cart__list">
            <form>
                <thead>
                    <tr>
                        <td><input type="checkbox" name="allCheck" id="allCheck"></td>
   
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td class="td_sale">할인가능금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                        <script>
                       $("#allCheck").click(function(){
                          var chk = $("#allCheck").prop("checked");
                          if(chk) {
                           $(".chBox").prop("checked", true);
                          } else {
                           $(".chBox").prop("checked", false);
                          }
                       });
                        </script>
                <tbody>
                <c:forEach var="vo" items="${list}">
                
                
                    <tr class="cart__list__detail">
                        <td><input type="checkbox" name="chBox" class="chBox" data-cartNum="${vo.bid }"></td>
                        <td>
                           <a href="#"><img src="http://localhost:9000/myshop/resources/upload/${vo.psfile }" alt="이미지"></a>
                        </td>
                        <td><a href="#">${vo.brand}</a>
                            <p>${vo.pname}</p>
                            <span class="price"><fmt:formatNumber value="${vo.price}" type="number"/>원</span>
                        </td>
                        <td class="cart__list__option">
                            <p>상품 주문 수량: ${vo.amt}개</p>
                            <button type="button" class="cart__list__optionbtn" data-cartNum="${vo.bid }">삭제</button>
                        </td>
                        <td><span class="price"><fmt:formatNumber value="${vo.price*vo.amt}" type="number"/>원</span><br>
                            <button class="cart__list__orderbtn">주문하기</button>
                        </td>
                        <td>
                           <span>0원</span>
                        </td>
                        <td><fmt:formatNumber value="${vo.delivery_price}" type="number"/>원</td>
                    </tr>
                        <script>
                        $(".chBox").click(function(){
                           $("#allCheck").prop("checked", false);
                          });
                        </script>
                    <c:set var="total"  value="${total+vo.price*vo.amt}"/>
                    <c:set var="delivery"  value="${delivery+vo.delivery_price}"/>
                    <%-- <c:set var="discount"  value=""/> --%>
                    </c:forEach>
                    <c:set var="payment"  value="${payment+total+delivery}"/>
                 
                    <!-- <tr class="cart__list__detail">
                        <td style="width: 2%;"><input type="checkbox"></td>
                        <td style="width: 13%;"> 
                           <a href="#"><img src="http://localhost:9000/myshop/resources/images/good2.jpg" alt="제품영"></a>
                        </td>
                        <td style="width: 27%;"><a href="#">sketch</a>
                            <p>NYGÅRDSANNA 오가닉 데님 와이드 팬츠</p>
                            <span class=" price">480,000원</span>
                        </td>
                        <td class="cart__list__option" style="width: 27%;">
                            <p>상품 주문 수량: 1개</p>
                            <button class="cart__list__optionbtn">주문조건 추가/변경</button>
                        </td>
                        <td style="width: 15%;"><span class="price">480,000원</span><br>
                            <button class="cart__list__orderbtn">주문하기</button>
                        </td>
                        <td style="width: 8%;">
                           <span>0원</span>
                        </td>
                        <td style="width: 7%;">무료</td>
                    </tr> -->
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">
                           <button class="cart__list__optionbtn" type="button" class="selectDelete_btn">선택상품 삭제</button>
                            <button class="cart__list__optionbtn">선택상품 찜</button>
                        <script>
                   $(".selectDelete_btn").click(function(){
                    var confirm_val = confirm("정말 삭제하시겠습니까?");
                    
                    if(confirm_val) {
                     var checkArr = new Array();
                     
                     $("input[class='chBox']:checked").each(function(){
                      checkArr.push($(this).attr("data-cartNum"));
                     });
                      
                     $.ajax({
                      url : "/shop/deleteCart",
                      type : "post",
                      data : { chbox : checkArr },
                      success : function(){
                       location.href = "/shop/cartList";
                      }
                     });
                    } 
                   });
                  </script>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
        </table>
        <table class="calculation">
           <tr>
              <th>총 상품금액</th>
              <th>총 배송비</th>
              <th>총 할인금액</th>
              <th style="width:600px; padding:22px 0;"><span>결제예정금액</span></th>
           </tr>
           
           <tr style="backgrond-color:#fff;">
              <td style="padding:22px 0;"><span class="c_price"><fmt:formatNumber value="${total}" type="number"/></span>원</td>
              <td><span class="c_price"><fmt:formatNumber value="${delivery}" type="number"/></span>원</td>
              <td><span class="c_price">0</span>원</td>
              <td><span class="c_price"><fmt:formatNumber value="${payment}" type="number"/></span>원</td>
           </tr>
        </table>
        <br>
        <br>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
            <a href="http://localhost:9000/myshop/order_ok.do"><button class="cart__bigorderbtn right">주문하기</button></a>
        </div>
    </section>
    
    <!-- footer -->    
   <jsp:include page="/footer.do"></jsp:include>
</body>
</html>