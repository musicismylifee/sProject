<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_header.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="http://localhost:9000/myshop/resources/js/sidebarMenu.js"></script>
</head>
<body>
<input type="checkbox" id="nav-toggle">
    <div class="sidebar">
        <div class="sidebar-brand"> 
            <h2><span class="lab la-accusoft"></span><span>Myshop</span></h2>
        </div>
       
        <div class="sidebar-menu">
            <ul>
                <li>
                    <a href="http://localhost:9000/myshop/admin.do" ><span class="las la-igloo"></span><span>Home</span></a>
                </li>
                
                <li>
                    <a href="http://localhost:9000/myshop/admin_customercare.do"><span class="las la-users"></span><span>사용자 관리</span></a>
                </li>
                <li>
                    <a href="http://localhost:9000/myshop/admin_product_list.do"><span class="las la-shopping-bag"></span><span>상품관리</span></a>
                </li>
                <li  class="menu">
                    <a class="active"><span class="las la-receipt"></span><span>주문관리</span></a>
                    <ul class="sub-menu">
                        <li>
                            <a href="http://localhost:9000/myshop/admin_order_management.do"><span>주문내역</span></a>
                        </li>
                        <li>
                            <a href="http://localhost:9000/myshop/admin_order_cancel_management.do"><span>취소관리</span></a>
                        </li>
                   </ul>
                </li>

                <li  class="menu">
                    <a class="active"><span class="las la-receipt"></span><span>게시판관리</span></a>
                    <ul class="sub-menu">
                        <li>
                            <a href="http://localhost:9000/myshop/admin_notice_list.do"><span>공지사항관리</span></a>
                        </li>
                        <li>
                            <a href="http://localhost:9000/myshop/admin_qna_list.do"><span>QNA관리</span></a>
                        </li>
                        <li>
                            <a href="http://localhost:9000/myshop/admin_review_list.do"><span>리뷰관리</span></a>
                        </li>
                   </ul>
                </li>
                <li>
                    <a href=""><span class="las la-sign-out-alt"></span><span>Logout</span></a>
                </li> 
            </ul>
        </div>
    </div>
    
     <div class="main-content">
        <header>
            <h2>
                <label for="nav-toggle">
                    <span class="las la-bars"></span>
                </label>
                
            </h2>
            
            <div class="search-wrapper">
                <span class="las la-search"></span>
                <input type="search" placeholder="Search here">
            </div>

            <div class="user-wrapper">
                <img src="http://localhost:9000/myshop/resources/images/4dda8b6ed915b478044d8db587d11da7.jpeg" alt="" width="30px" height="30px" display="inline">
                <div>
                    <h4>고범규</h4>
                    <small>사이트 관리 전용</small>
                </div>
            </div>
        </header>
    
</body>
</html>