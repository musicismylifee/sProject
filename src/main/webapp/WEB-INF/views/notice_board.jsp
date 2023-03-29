<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
	<link rel="stylesheet"  href="http://localhost:9000/myshop/resources/css/am-pagination.css">
	<script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
	<script src="http://localhost:9000/myshop/resources/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		
		//페이징 리스트 출력
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: '${dbCount}',	// total rows	
		    page: '${rpage}',		// initial page		
		    pageSize: '${pageSize}',	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		//페이징 번호 클릭 시 이벤트 처리
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/myshop/notice_board.do?rpage="+e.page);         
	    });
		
		//검색기능
		/* $(".search").keyup(function(key){
			if(key.keyCode==13){
				alert("엔터");
			}
		}); */
		
 	});
</script> 
<style>

body { padding: 50px; display: flex; justify-content: center; align-items: center; flex-direction: column;}
form {position: relative; /* width:1080px; */}
table { border-collapse: collapse; }
th {border-top:1px solid gray; border-bottom:1px solid gray;padding:10px; padding:10px;}
td {padding:15px; font-size: .9rem; color: #222; text-align: center; border-bottom:1px solid lightgray;}
tr:last-child td{border: none;}
.title{ text-align : left;}
select{
	width: 150px;padding: 9px 8px; border: 1px solid lightgray; outline: none; margin-right:10px;
}
a{text-decoration: none; color:black;}
.search-wrapper{ border: 1px solid lightgray; padding:0 8px; display:flex; align-items:center;}
input {width : 200px; padding: 10px 8px; border:none; outline: none;}

.searchArea{display:flex; justify-content: center; align-items: center;margin:10px;}
.shop_img{width:1080px;}

</style>
</head>
<body>
<jsp:include page="/header.do"/>
	
    <form name="noticeboardForm" action="notice_search_check.do" method="post">
    <p><img src="http://localhost:9000/myshop/resources/images/abc.jpg" class="shop_img"></p>
        <table width="100%">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </tr>
                <c:forEach var="vo"  items="${list}">
                <tr>
                    <td>${vo.rno }</td>
                    <c:choose>
						<c:when test="${vo.ncrucial != 0 }">
							<td class="title"><a href="notic_content.do?nid=${vo.nid}" style="color:red;font-weight:bold">[중요] ${vo.ntitle }</a></td>
						</c:when>
						<c:otherwise>
							<td class="title"><a href="notic_content.do?nid=${vo.nid}">${vo.ntitle }</a></td>
						</c:otherwise>
					</c:choose>	
         <%--            <c:if test="${vo.ncrucial != 0 }">
	                    <td class="title"><a href="notic_content.do?nid=${vo.nid}" style="color:red">${vo.ntitle }</a></td>
                    </c:if> --%>
                    <td>MUSTIT</td>
                    <td>${vo.nsdate}</td>
                </tr>
                </c:forEach>
              <!--   <tr>
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
                </tr> -->
                <tr>
					<td colspan="4"><div id="ampaginationsm"></div></td>
				</tr>
        </table>
      	<div class="searchArea">	
	        <select id="search" name="searchtype">
		        <option value="ntitle">제목</option>
		        <option value="ncontent">내용</option>
	        </select>
	        <div class="search-wrapper">
                <input type="search" name="text">
				<span class="las la-search" display="inline-block" padding="20px"></span>
            </div>
        </div>   
    </form>
 <jsp:include page="/footer.do"></jsp:include>
</body>
</html>