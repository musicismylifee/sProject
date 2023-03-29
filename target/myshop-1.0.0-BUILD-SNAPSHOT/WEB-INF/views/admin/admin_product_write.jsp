<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="http://localhost:9000/myshop/resources/css/admin_product_write.css">
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="http://localhost:9000/myshop/resources/js/sidebarMenu.js"></script>
 
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
                            <a href="www.naver.com"><span>사용자 목록</span></a>
                        </li>
                        <li>
                            <a href="#None"><span>메시지 보내기</span></a>
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
                <img src="http://localhost:9000/myshop/resources/images/4dda8b6ed915b478044d8db587d11da7.jpeg" alt="" width="30px" height="30px" display="inline">
                <div>
                    <h4>고범규</h4>
                    <small>사이트 관리 전용</small>
                </div>
            </div>
        </header>

        <main>


			<div class="recent-grid">
				<div class="title_box">
					<h3 class="title">상품등록<span>*</span></h3>
				</div>
                <form name="addProductForm" action="product_write_check.do" method="post"
                		enctype="multipart/form-data">
				    <div class="product_content">
						<div class="list_content">
							<table class="product_list_content">
								<tr>
									
									<th>카테고리<span>*</span></th>
									<td colspan="3">
									<div class="cate_wrap_list">
										<div class="cate_wrap">
											<span class="category_name">대분류</span>
											<select class="cate1">
											
											</select>
										</div>
										<div class="cate_wrap">
											<span class="category_name">중분류</span>
											<select class="cate2">

											</select>
										</div>
										<div class="cate_wrap">
											<span class="category_name">소분류</span>
											<select class="cate3">

											</select>
										</div> 
									</div>
								
										<input type="text" class="rating" name="rating">
										<input type="text" class="psize" name="psize">
									</td>
								</tr>
                                <tr>
                                    <th>상품명<span>*</span></th>
                                    <td><input type="text" class="pname" name="pname" id="pname" placeholder="숫자만 입력"></td>
                                </tr>
                                <tr>
                                    <th>상품소개<span>*</span></th>
                                    <td><input type="text" class="pdetail" name="pdetail"></td>
                                </tr>
                                <tr>
                                    <th>브랜드명<span>*</span></th>
                                    <td><input type="text" class="brand" name="brand"></td>
                                </tr>
								<tr>
									<th>카테고리<span>*</span></th>
									<td><input type="text" class="category_id" id="" name="" placeholder="카테고리입력"></td>
								</tr>
                                <tr>
                                    <th>재고수량<span>*</span></th>
                                    <td><input type="text" class="quantity" name="quantity" placeholder="숫자만 입력"></td>
                                </tr>
                                <tr>
                                    <th>상품가격<span>*</span></th>
                                    <td><input type="text" class="price" name="price"></td>
                                </tr>
                                <tr>
                                    <th>배송비<span>*</span></th>
                                    <td><input type="text" class="delivery_price" name="delivery_price"></td>
                                </tr>
                                <tr>
                                    <th>등록코드<span>*</span></th>
                                    <td></td>
                                </tr>
                                <!-- <tr>
                                    <th>대표이미지<span>*</span></th>
                                    <td><label class="product_img" for="pfile"><span class="xi-plus-thin xi-4x"></span></label><input type="file"  name="pfile" id="pfile"></td>
                                </tr>
                                <tr>
                                    <th>추가이미지<span>*</span></th>
                                    <td><label class="product_img" for="psfile"><span class="xi-plus-thin xi-4x"></span></label><input type="file"  name="psfile" id="psfile"></td>
                                </tr> -->
                                <tr>
                                    <th>이미지 추가/추가이미지<span>*</span></th>
                                    <td><input type="file" name="file1" style="display:block;"></td>
                                </tr>
                                <tr>
                                    <th>이미지 추가/추가이미지<span>*</span></th>
                                   <!--  <td><input type="file" name="file1" style="display:block;"></td> -->
                                </tr>
							</table>
							<div class="addProductbtns">
								<button class="product_btn" type="submit">등록</button>
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

<script>
/*	 자바 필터를 이용한 카테고리 로직  DB level 추가 해야한다.
 $function() {
		const category = JSON.parse('${category}');
		
		const mainCategory = category.filter(it -> it.level === 1);
		const middleCategory = category.filter(it -> it.level === 2);
		const subCategory = category filter(it -> it.level === 3);
	} */ 
	 //데이터 확인
	/*	$(document).ready(function(){
		console.log('${getCategoryList}');
	}); */
	
	/** 카테고리 배열 초기화 메서드 */
	/* 카테고리 */
	let getCategoryList = JSON.parse('${getCategoryList}');

	let category1Arr = new Array();
	let category2Arr = new Array();
	let category3Arr = new Array();
	
	let cate1Obj = new Object();
	let cate2Obj = new Object();
	let cate3Obj = new Object();
	
	let cateSelect1 = $(".cate1");
	let cateSelect2 = $(".cate2");
	let cateSelect3 = $(".cate3");

	function makeCateArray(obj,array,getCategoryList, level){
		
		for(let i = 0; i < getCategoryList.length; i++) {
			if(getCategoryList[i].level === level) {
				obj = new Object();
				
				obj.category_nm = getCategoryList[i].category_nm;
				obj.category_id = getCategoryList[i].category_id;
				obj.group_id = getCategoryList[i].group_id;
				obj.category_parent_id = getCategoryList[i].category_parent_id;
				obj.category_dept = getCategoryList[i].category_dept;
				obj.level = getCategoryList[i].level;
				obj.lf = getCategoryList[i].lf;
				
				array.push(obj);
			}
		}
	}
	/* 배열 초기화 */
	makeCateArray(cate1Obj,category1Arr,getCategoryList,1);
	makeCateArray(cate2Obj,category2Arr,getCategoryList,2);
	makeCateArray(cate3Obj,category3Arr,getCategoryList,3);

	/* $(document).ready(function(){
		console.log(category1Arr);
		console.log(category2Arr);
		console.log(category3Arr);
	}); */
	
	/* $(document).ready(function(){
		
		alert(JSON.stringify(category3Arr ));
	}); */
	/* 대분류 옵션태그 */	
	for(let i = 0; i < category1Arr.length; i++) {
		cateSelect1.append("<option value='"+category1Arr[i].category_id+"'>" + category1Arr[i].category_nm + "</option>");
	}
	
	/* 중분류 옵션태그 */
	$(cateSelect1).on("change", function(){
		let selectVal1 = $(this).find("option:selected").val();
		cateSelect2.children().remove();
		cateSelect3.children().remove();
		cateSelect2.append("<option value='none'>선택</option>");
		cateSelect3.append("<option value='none'>선택</option>");
		
		for(let i = 0; i < category2Arr.length; i++) {
				
			//alert(JSON.stringify(category2Arr));
				//alert(JSON.stringify(selectVal1));
				//alert(JSON.stringify(category2Arr[i].level));
				console.log(category2Arr);
				//alert(JSON.stringify(selectVal2[i].category_parent_id));
				if(selectVal1 == 1 && category2Arr[1].group_id){
				cateSelect2.append("<option value='"+category2Arr[1].category_id+"'>" + category2Arr[1].category_nm + "</option>");
				}else if(selectVal1 == 2) {
				cateSelect2.append("<option value='"+category2Arr[i].category_id+"'>" + category2Arr[i].category_nm + "</option>");
				}
				else if(selectVal1 == 3) {
				cateSelect2.append("<option value='"+category2Arr[i].category_id+"'>" + category2Arr[i].category_nm + "</option>");
				}
				else if(selectVal1 == 4) {
				cateSelect2.append("<option value='"+category2Arr[i].category_id+"'>" + category2Arr[i].category_nm + "</option>");
				}
		}
	});
	/* 소분류 태그 */
	$(cateSelect2).on("change", function(){
		let selectVal2 = $(this).find("option:selected").val();
		
		cateSelect3.children().remove();
		cateSelect3.append("<option value='none'>선택</option>");
		
		for(let i = 0; i < category3Arr.length; i++) {
				alert(JSON.stringify(category3Arr));
			if(selectVal2 === category3Arr[i].category_id) {
				cateSelect3.append("<option value='"+ category3Arr[i].category_id +"'>" +category3Arr[i].category_nm + "</option>");
			}
		}
	});
			
	
	//카테고리 Ajax방식으로 다시 하는 
	
	
	
	
			
</script>
</html>