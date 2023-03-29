<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_product_write.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
	<script src="http://localhost:9000/myshop/resources/js/my_category_update.js"></script>
	
    <title>회원 관리페이지</title> 
	
</head>

<body>
    
    	<!-- header -->    
		<jsp:include page="/admin_header.do"></jsp:include>

        <main>


			<div class="recent-grid">
				<div class="title_box">
					<h3 class="title">상품수정<span>*</span></h3>
				</div>
                <form name="updateProductForm" action="admin_product_update_check.do" method="post"
                		enctype="multipart/form-data">
				    <div class="product_content">
						<div class="list_content">
						<input type="hidden" id="pid" name="pid" value="${vo.pid}">
						<input type="hidden" id="pfile" name="pfile" value="${vo.pfile}">
						<input type="hidden" id="psfile" name="psfile" value="${vo.psfile}">
						<input type="hidden" class="rating" name="rating"id="rating">
							<table class="product_list_content">
								<tr>
									<th>카테고리<span>*</span></th>
									<td colspan="3">
									<div class="cate_wrap_list">
										<div class="cate_wrap">
											<span class="category_name">대분류</span>
											<select  class="cate1">
												<option value="default">선택</option>
											<c:forEach var="cateCode" items="${list}" >
												<option  class="cate11"value="${cateCode.category_id}">${cateCode.category_nm}</option>
											</c:forEach>
											</select>
										</div>
										<div class="cate_wrap">
											<span class="category_name">중분류</span>
											<select class="cate2">
											</select>
										</div>
										<div class="cate_wrap">
											<span class="category_name">소분류</span>
											<select class="cate3" name="category_id">
											</select>
										</div> 
										
									</div>
									</td>
								</tr>
                                <tr>
                                    <th>상품명<span>*</span></th>
                                    <td><input type="text" class="pname" name="pname" id="pname" value="${vo.pname}"></td>
                                </tr>
                                <tr>
                                    <th>상품소개<span>*</span></th>
                                    <td><input type="text" class="pdetail" name="pdetail" value="${vo.pdetail}"></td>
                                </tr>
                                <tr>
                                    <th>상품가격<span>*</span></th>
                                    <td><input type="text" class="price" name="price" value="${vo.price}"></td>
                                </tr>
                                <tr>
                                    <th>재고수량<span>*</span></th>
                                    <td><input type="text" class="quantity" name="quantity" placeholder="숫자만 입력" value="${vo.quantity}"></td>
                                </tr>
                                <tr>
                                    <th>사이즈<span>*</span></th>
									<td><input type="text" class="psize" name="psize" value="${vo.psize}"></td>
                                </tr>
                                <tr>
                                    <th>브랜드명<span>*</span></th>
                                    <td><input type="text" class="brand" name="brand" value="${vo.brand}"></td>
                                </tr>
								
                               
                                <tr>
                                    <th>배송비<span>*</span></th>
                                    <td><input type="text" class="delivery_price" name="delivery_price" value="${vo.delivery_price}"></td>
                                </tr>
                              
                               <!--  <tr>
                                    <th>대표이미지<span>*</span></th>
                                    <td><label class="product_img" for="file1"><span class="xi-plus-thin xi-4x"></span></label><input type="file"  multiple="multiple"   name="file1" id="file1"></td>
                                </tr>
                                <tr>
                                    <th>추가이미지<span>*</span></th>
                                    <td><label class="product_img" for="fil1"><span class="xi-plus-thin xi-4x"></span></label><input type="file"  multiple="multiple"  name="file1" id="file1"></td>
                                </tr>  -->
                                <tr>
                                    <th>이미지 추가/추가이미지<span>*</span></th>
                                    <td><input type="file" multiple="multiple" name="file1" style="display:block;" value="${vo.psfile}"></td>
                                </tr>
							</table>
							<div class="updateProductbtns">
								<button class="product_btn" id="product_btn" type="submit">수정완료</button>
								<button class="product_btn" type="reset" id="btnReset">다시작성</button>
                                <a href="admin_product_list.do">
                             	   <button class="product_btn" type="button">뒤로가기</button>
                            	</a>
                            </div>
						</div>
                    </div>
                </form>
			</div>
		</main>

    </div>
</body>
</html>