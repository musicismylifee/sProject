<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_customercare.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="http://localhost:9000/myshop/resources/js/sidebarMenu.js"></script>
    <title>회원 관리페이지</title> 
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
                    <a href="" ><span class="las la-igloo"></span><span>Home</span></a>
                </li>
                
                <li class="menu">
                    <a class="active"><span class="las la-users"></span><span>사용자 관리</span></a>
                    <ul class="sub-menu">
                        <li>
                            <a href="http://127.0.0.1:5500/adminCustomerCare.html"><span>사용자 목록</span></a>
                        </li>
                        <li>
                            <a href="http://127.0.0.1:5500/adminMessage.html"><span>메시지 보내기</span></a>
                        </li>
                        <li>
                            <a href="#None"><span>메일 발송 설정</span></a>
                        </li>
                        <li>
                            <a href="#None"><span>SMS발송 설정</span></a>
                        </li>
                    </ul>
                </li>
 
                <li>
                    <a href=""><span class="las la-shopping-bag"></span><span>상품관리</span></a>
                </li>
                <li>
                    <a href=""><span class="las la-receipt"></span><span>주문관리</span></a>
                </li>
                <li>
                    <a href=""><span class="las la-user-circle"></span><span>관리자 정보수정</span></a>
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
                <img src="4dda8b6ed915b478044d8db587d11da7.jpeg" alt="" width="30px" height="30px" display="inline">
                <div>
                    <h4>고범규</h4>
                    <small>사이트 관리 전용</small>
                </div>
            </div>
        </header>

        <main>

            
            <div class="recent-grid">
                <div class="customercares">
                    <div class="card">
                        <div class="card-body">
                            <ul>
                                <li>
                                    <a href="" class="active"><span>전체 사용자 2,700</span></a>
                                </li>
                                <li>
                                    <a href=""><span>운영-xx팀</span></a>
                                </li>
                                <li>
                                    <a href=""><span>운영-xx팀</span></a>
                                </li>
                                <li>
                                    <a href=""><span>쇼핑 - Basic</span></a>
                                </li>
                                <li>
                                    <a href=""><span>쇼핑 - VIP</span></a>
                                </li>
                                <li>
                                    <a href=""><span>쇼핑 - VVIP</span></a>
                                </li> 
                                <li>
                                    <a href=""><span>새 그룹 만들기 </span></a>
                                </li> 
                            </ul>
                        </div>
                    </div>                      
                </div>

                <div class="projects">
                    <div class="card">
                        <div class="card-header">
                            <h3>전체 사용자</h3>
                            <div class="search-wrapper">
                                <span class="las la-search"></span>
                                <input type="search" placeholder="사용자 입력">
                            </div>
                        </div>

                        <div class="card-body">
                            <table width="100%">
                                <thead>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이름</td>
                                        <td>아이디</td>
                                        <td>이메일</td>
                                        <td>쇼핑등급</td>
                                        <td>적립금</td>
                                        <td>글/댓글/구매평/문의</td>
                                        <td>누적금액</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr>
                                   <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>고범규</td>
                                        <td>soul1902</td>
                                        <td>soul1902@naver.com</td>
                                        <td>Basic</td>
                                        <td>2,500p</td>
                                        <td>0/0/0/0</td>    
                                        <td>5회 2,450,214원</td>                                        
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            
        </main>

    </div>
</body>
</html>