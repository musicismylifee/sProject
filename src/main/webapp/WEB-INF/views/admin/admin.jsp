<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="https://image-charts.com/chart.js/2.8.0?bkg=white&c={type:'line',data:{labels:['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug'],datasets:[{backgroundColor:'rgba(255,150,150,0.5)',borderColor:'rgb(255,150,150)',data:[-23,64,21,53,-39,-30,28,-10],label:'Dataset',fill:'origin'}]}}"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    
    <title>관리자페이지</title> 
 
    
</head>
<body>
     	<!-- header -->    
		<jsp:include page="/admin_header.do"></jsp:include>

        <main>

            <div class="cards">
                <div class="card-single">
                    <div>
                        <h1>54</h1>
                        <span>회원수</span>
                    </div>
                    <div>
                        <span class="las la-users"></span>
                    </div>
                </div>

                <div class="card-single">
                    <div>
                        <h1>79</h1>
                        <span>상품수</span>
                    </div>
                    <div>
                        <span class="las la-clipboard"></span>
                    </div>
                </div>

                <div class="card-single">
                    <div>
                        <h1>124</h1>
                        <span>주문수</span>
                    </div>
                    <div>
                        <span class="las la-shopping-bag"></span>
                    </div>
                </div>

                <div class="card-single">
                    <div>
                        <h1>$6k</h1>
                        <span>방문자수</span>
                    </div>
                    <div>
                        <span class="las la-door-open"></span>
                    </div>
                </div>
            </div>
            
            <div class="recent-grid">
                <div class="visitor-status">
                    <div class="card">
                        <div class="card-header">
                            <h3>방문자 현황</h3>
                            <div class="float_r text-12 text-right force-padding no-padding-y">
                                <span style="margin-right:15px"><i class="fa fa-circle" style="color: rgba(253, 175, 177, 1)"></i> 페이지뷰</span>
                                <i class="fa fa-circle" style="color: rgba(252, 95, 100,1)"></i> 방문자				
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <div class="holder">
                                
                                <canvas id="stats_chart" width="414" height="207" style="width: 414px; height: 207px;">
                                    <div class="chartjs_tooltip _chartjs_tooltip" style="opacity: 0; left: 27px; top: 75.75px; font-family: Lato; font-size: 14px; font-style: normal; position: absolute; background: rgb(255, 255, 255);">
                                        <div class="chartjs-tooltip-section"><span class="chartjs-tooltip-key" style="background-color:rgba(252, 95, 100,1)"></span>
                                            <span class="chartjs-tooltip-value">1</span>
                                        </div>
                                        <div class="chartjs-tooltip-section">
                                            <span class="chartjs-tooltip-key" style="background-color:rgba(253, 175, 177, 1)"></span>
                                        <span class="chartjs-tooltip-value">1</span>
                                        </div>
                                    </div>
                                    <script src="http://localhost:9000/myshop/resources/js/chart.js"></script>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="visitor-status">
                    <div class="card">
                        <div class="card-header">
                            <h3>일별 매출 통계</h3>
                            <div class="float_r text-12 text-right force-padding no-padding-y">
                                <span style="margin-right:15px"><i class="fa fa-circle" style="color: rgba(253, 175, 177, 1)"></i> 페이지뷰</span>
                                <i class="fa fa-circle" style="color: rgba(252, 95, 100,1)"></i> 방문자				
                            </div>
                        </div>
                        
                        <div class="card-body">
                            <div class="holder">
                                
                                <canvas id="stats_chart" width="414" height="207" style="width: 414px; height: 207px;">
                                    <div class="chartjs_tooltip _chartjs_tooltip" style="opacity: 0; left: 27px; top: 75.75px; font-family: Lato; font-size: 14px; font-style: normal; position: absolute; background: rgb(255, 255, 255);">
                                        <div class="chartjs-tooltip-section"><span class="chartjs-tooltip-key" style="background-color:rgba(252, 95, 100,1)"></span>
                                            <span class="chartjs-tooltip-value">1</span>
                                        </div>
                                        <div class="chartjs-tooltip-section">
                                            <span class="chartjs-tooltip-key" style="background-color:rgba(253, 175, 177, 1)"></span>
                                        <span class="chartjs-tooltip-value">1</span>
                                        </div>
                                    </div>
                                    <script src="http://localhost:9000/myshop/resources/js/chart.js"></script>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="projects">
                    <div class="card">
                        <div class="card-header">
                            <h3>최근 주문</h3>

                            <button>자세히보기<span class="las la-arrow-right">
                            </span></button>
                        </div>

                        <div class="card-body">
                            <table width="100%">
                                <thead>
                                    <tr>
                                        <td>구매자</td>
                                        <td>상품정보</td>
                                        <td>결제금액</td>
                                        <td>상태</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>김범수</td>
                                        <td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
                                        <td>455,000</td>
                                        <td>
                                            <span class="status"></span>
                                            주문취소
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>김범수</td>
                                        <td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
                                        <td>455,000</td>
                                        <td>
                                            <span class="status"></span>
                                            주문취소
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>김범수</td>
                                        <td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
                                        <td>455,000</td>
                                        <td>
                                            <span class="status"></span>
                                            주문취소
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>김범수</td>
                                        <td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
                                        <td>455,000</td>
                                        <td>
                                            <span class="status"></span>
                                            주문취소
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>김범수</td>
                                        <td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
                                        <td>455,000</td>
                                        <td>
                                            <span class="status"></span>
                                            주문취소
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>김범수</td>
                                        <td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
                                        <td>455,000</td>
                                        <td>
                                            <span class="status"></span>
                                            주문취소
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>김범수</td>
                                        <td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
                                        <td>455,000</td>
                                        <td>
                                            <span class="status"></span>
                                            주문취소
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>김범수</td>
                                        <td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
                                        <td>455,000</td>
                                        <td>
                                            <span class="status"></span>
                                            주문취소
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>김범수</td>
                                        <td>22SS 톰브라운 셔츠 히든 옥스퍼트 White</td>
                                        <td>455,000</td>
                                        <td>
                                            <span class="status"></span>
                                            주문취소
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="customers">
                    <div class="card">
                        <div class="card-header">
                            <h3>New customer</h3>

                            <button>자세히 보기<span class="las la-arrow-right">
                            </span></button>
                        </div>

                        <div class="card-body">
                            <div class="customer">
                                <div class="info">
                                    <img src="resources/images/4dda8b6ed915b478044d8db587d11da7.jpeg" alt="" width="40px" height="40px">
                                    <div>
                                        <h4>Lewis S. Cunningham</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                </div>
                            </div>

                            <div class="customer">
                                <div class="info">
                                    <img src="resources/images/4dda8b6ed915b478044d8db587d11da7.jpeg" alt="" width="40px" height="40px">
                                    <div>
                                        <h4>Lewis S. Cunningham</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                </div>
                            </div>

                            <div class="customer">
                                <div class="info">
                                    <img src="resources/images/4dda8b6ed915b478044d8db587d11da7.jpeg" alt="" width="40px" height="40px">
                                    <div>
                                        <h4>Lewis S. Cunningham</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                </div>
                            </div>

                            <div class="customer">
                                <div class="info">
                                    <img src="resources/images/4dda8b6ed915b478044d8db587d11da7.jpeg" alt="" width="40px" height="40px">
                                    <div>
                                        <h4>Lewis S. Cunningham</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                </div>
                            </div>

                            <div class="customer">
                                <div class="info">
                                    <img src="resources/images/4dda8b6ed915b478044d8db587d11da7.jpeg" alt="" width="40px" height="40px">
                                    <div>
                                        <h4>Lewis S. Cunningham</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                </div>
                            </div>

                            <div class="customer">
                                <div class="info">
                                    <img src="resources/images/4dda8b6ed915b478044d8db587d11da7.jpeg" alt="" width="40px" height="40px">
                                    <div>
                                        <h4>Lewis S. Cunningham</h4>
                                        <small>CEO Excerpt</small>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>


            </div>
            
            
        </main>

    </div>


</body>
</html></html>