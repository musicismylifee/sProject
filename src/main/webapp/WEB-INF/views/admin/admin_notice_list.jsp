<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_notice_list.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="http://localhost:9000/myshop/resources/js/admin_notice_list.js"></script>
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <title>회원 관리페이지</title>

</head>

<body>
   		<!-- header -->    
		<jsp:include page="/admin_header.do"></jsp:include>

        <main>


			<div class="recent-grid">

				<div class="title_box">
					<h3 class="search_title">공지사항 조건 검색</h3>
				</div>
				<div class="seller_content">
					<div class="list_content">
						<table class="seller_search">
							<tr>
								<th>공지 분류</th>
								<td><label><input type="radio" name="noticetype" value="notice"><span>공지 사항</span></label>
								<label><input type="radio" name="noticetype" value="event"><span>이벤트</span></label>
								</td>
								<th>중요여부체크</th>
								<td><label><input type="radio" name="crucial" value="1"><span>설정</span></label>
								<label><input type="radio" name="crucial" value="0"><span>미 설정</span></label>
								</td>
							</tr>
							<tr>
								<th>게시 현황 분류</th>
								<td><label><input type="radio" name="post_type" value="ready"><span>게시 준비중</span></label>
								<label><input type="radio" name="post_type" value="ing"><span>게시중</span></label>
								<label><input type="radio" name="post_type" value="end"><span>게시 종료</span></label>
								</td>
								<th>작성 날짜</th>
								<td><input type="date" id="nsdate" name="startdate">~ <input type="date" id="nedate" name="enddate"></td>
							</tr>
							<tr>
								<th>검색</th>
								<td><select class="search_class">
										<option value="">검색 분류</option>
										<option value="ntitle">글 제목</option>
										<option value="ncotnet">게시글 내용</option>
								</select> <input type="text" class="search_bar"></td>
							</tr>
						</table>
						<div class="seller_search_btns">
							<button class="search_btn" id="submitbtn" type="button">검색</button>
							<button class="search_btn" id="resetbtn" type="button">초기화</button>
						</div>
					</div>
				</div>
				<div class="seller_list">
					<div class="list_heading">
						<div class="heading_left">
							<h3>공지사항 목록(총 ${totalcount}개)</h3>
						</div>
						<div class="heading_right">
							<button type="button" class="btn_delete">선택 삭제</button>
							<a href="admin_notice_write.do">
								<button type="button">공지사항 등록</button>
							</a>
						</div>
					</div>
					<div class="list_content" id="datalist">
						<div class="table_flame">
							<table class="list_table" style='table-layout:fixed'>
							<colgroup>
									<col width="50">
									<col width="80">
									<col width="110">
									<col width="300">
									<col width="130">
									<col width="200">
									<col width="130">
									<col width="130">
									<col width="130">
								</colgroup>
								<tr>
									<th><input type="checkbox" class="notice_check"
										name="checkAll"></th>
									<th>번호</th>
									<th>분류</th>
									<th>제목</th>
									<th>중요 여부</th>
									<th>첨부 파일 유무</th>
									<th>게시 현황</th>
									<th>게시 시작일</th>
									<th>게시 종료일</th>
								</tr>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td><input type="checkbox" class="notice_check"
											name="check" value="${vo.nid}"></td>
										<td>${vo.rno}</td>
										<td>${vo.ncode }</td>
										<td><a href="admin_notice_update.do?nid=${vo.nid}">${vo.ntitle}</a></td>
										<c:choose>
											<c:when test="${vo.ncrucial == 1 }">
												<td>설정</td>
											</c:when>
											<c:otherwise>
												<td>미 설정</td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${empty vo.nfile}">
												<td>-</td>
											</c:when>
											<c:otherwise>
												<td>${vo.nfile}</td>
											</c:otherwise>
										</c:choose>	
										<c:set var="now" value="<%=new java.util.Date()%>" />
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"
											var="nowDate" />

										<c:choose>
											<c:when
												test="${vo.nsdate <= nowDate && vo.nedate >= nowDate}">
												<td>게시 중</td>
											</c:when>
											<c:when test="${vo.nsdate > nowDate}">
												<td>게시 준비 중</td>
											</c:when>
											<c:otherwise>
												<td>게시 종료</td>
											</c:otherwise>
										</c:choose>
										<!-- <td>-</td> -->
										<td>${vo.nsdate}</td>
										<%-- <td>${vo.nedate}</td> --%>
										<c:choose>
											<c:when test="${vo.nedate == '9999-12-31' }">
												<td>-</td>
											</c:when>
											<c:otherwise>
												<td>${vo.nedate}</td>
											</c:otherwise>
										</c:choose>
									<tr>
								</c:forEach>

							</table>
						</div>
					</div>
				</div>
			</div>
		</main>

    </div>
</body>
</html>