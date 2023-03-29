$(document).ready(function(){
		
		//유효성체크  
		$("#product_btn").click(function(){
				
				if($(".cate1").val() == "default") {
					alert("카테고리를 선택해주세요");
					return false; 
				}else if($(".cate2").val()=="default"){
					alert("카테고리를 선택해주세요");
					return false;
				}else if($(".cate3").val()=="default"){
					alert("카테고리를 선택해주세요");
					return false;
				}else if($(".pname").val()==""){
					alert("상품명을 입력해주세요");
					return false;
				}else if($(".pdetail").val()==""){
					alert("상품소개를 입력해주세요");
					return false;
				}else if($(".price").val()==""){
					alert("상품가격을 입력해주세요");
					return false;
				}else if($(".quantity").val()==""){
					alert("재고수량을 입력해주세요");
					return false;
				}else if($(".psize").val()==""){
					alert("사이즈 입력해주세요");
					return false;
				}else if($(".brand").val()==""){
					alert("브랜드를 입력해주세요");
					return false;
				}else if($(".delivery_price").val()==""){
					alert("배송비를 입력해주세요");
					return false;
				}else if($(".file1").val()==""){
					alert("파일을 첨부해주세요");
					return false;
				}else {
					addProductForm.submit();
				}
				
		});
		
		
		
	
	
	
	});