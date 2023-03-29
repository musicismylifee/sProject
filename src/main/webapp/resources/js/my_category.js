$(document).ready(function(){
	
	$(".cate1").change(function() {
	 	
		let cateCode = $(this).val();
				
			
		$.ajax({
			url:"cateListAjax.do?cateCode=" + cateCode,
			success: function(result){ 
				let dataset = JSON.parse(result);
				var output = "<option class='cate22' value='default'>선택</option>";
				for(vo of dataset.list) {
					output += "<option  class='cate22' value='"+ vo.category_id + "'>"+ vo.category_nm + "</option>"
					
				}
				$(".cate22").remove();
				$(".cate2").append(output);
					
							
			}
			
		});
			
	});
	
	$(".cate2").change(function() {
	 	
		let cateCode = $(this).val();
				
			
		$.ajax({
			url:"cateListAjax.do?cateCode=" + cateCode,
			success: function(result){ 
				let dataset = JSON.parse(result);
				var output = "<option class='cate33' value='default'>선택</option>";
				for(vo of dataset.list) {
					output += "<option  class='cate33' value='"+ vo.category_id + "'>"+ vo.category_nm + "</option>"
					
				}
				$(".cate33").remove();
				$(".cate3").append(output);
					
							
			}
			
		});
			
	});
				
});