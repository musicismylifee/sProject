<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Shop</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
	
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
   <style>
    body{min-width:70%;}
    .swiper-slide img{width:100%;}
 	
 	.swiper-button-next, .swiper-button-prev {color:white; width:5%;}
 	
 	.swiper-pagination-bullet { width: 12px; height: 12px; background: transparent; border: 1px solid black; opacity: 0.5; }
 	
 	.swiper-pagination-bullet-active { width: 40px; transition: width .5s; border-radius: 5px; background: black; border: 1px solid transparent; }
 	
 	.slide-btn {
 	border: 1px solid black;
 	border-radius: 5%;
	position: absolute;
	width: 140px;
	height: 40px;
	top: 50%;
	left : 50%;
	transform: translate(-50%, -50%);
	font-size:17px;
	font-weight: bold;
}
	.slide-btn:hover {cursor: pointer; background-color:black;color:white;}
	
	.title { text-align:center; }
	
	.products ul{display:flex; justify-content: center; flex-direction:row; flex-wrap:wrap; list-style:none; margin:10px;}
	
	.goods_img {padding:10px;}
	.goods_img img{width:350px;}
	.goods_record span{display:block; margin:0 5px;}
	.goods_name {font-size:10px;}
	.price {font-weight: bold;}
    </style> 
  </head>

  <body>
<!-- header -->    
<jsp:include page="/header.do"></jsp:include>

</script>
	     <!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="http://localhost:9000/myshop/resources/images/slide1.png" />
          <button button class="slide-btn" type="button">SHOP NOW</button>
        </div>
        <div class="swiper-slide">
          <img src="http://localhost:9000/myshop/resources/images/slide2.png" />
        </div>
        <div class="swiper-slide">
          <img src="http://localhost:9000/myshop/resources/images/slide3.png" />
        </div>
        <div class="swiper-slide">
          <img src="http://localhost:9000/myshop/resources/images/slide4.png" />
        </div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>
	     <script>
      var swiper = new Swiper(".mySwiper", {
    	  effect:'fade',
          spaceBetween: 30,
          centeredSlides: true,
          loop:true,
          autoplay: {
            delay: 9999999,
            disableOnInteraction: false,
          },
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
        });
     
   
    </script>
    
    
    <div class="title">
        <h2>
            <span style="display: ;">NEW ARRIVAL</span>
            <span style="display: none;"><img src="" alt="NEW ARRIVAL"></span>
        </h2>
    </div>
    
    <div class="products">
    	<ul class="products_inner">
	      <li class="goods">
			<div class="goods_img">
				<a href="#">
		        	<img src="http://localhost:9000/myshop/resources/images/good1.jpg">
		        </a>
			</div>
			<div class="goods_record">
				<span class="goods_name"><a href="product_detail.do?pid=${vo.pid}">${vo.pname}</a></span>
				<span class="price">49,000</span>
			</div>
	      </li>
	      <li class="goods">
			<div class="goods_img">
				<a href="#">
		        	<img src="http://localhost:9000/myshop/resources/images/good2.jpg">
		        </a>
			</div>
			<div class="goods_record">
				<span class="goods_name">제품명</span>
				<span class="price">49,000</span>
			</div>
	      </li>
	      <li class="goods">
			<div class="goods_img">
				<a href="#">
		        	<img src="http://localhost:9000/myshop/resources/images/good3.jpg">
		        </a>
			</div>
			<div class="goods_record">
				<span class="goods_name">제품명</span>
				<span class="price">49,000</span>
			</div>
	      </li>
	      <li class="goods">
			<div class="goods_img">
				<a href="#">
		        	<img src="http://localhost:9000/myshop/resources/images/good4.jpg">
		        </a>
			</div>
			<div class="goods_record">
				<span class="goods_name">제품명</span>
				<span class="price">49,000</span>
			</div>
	      </li>
	      <li class="goods">
			<div class="goods_img">
				<a href="#">
		        	<img src="http://localhost:9000/myshop/resources/images/good5.jpg">
		        </a>
			</div>
			<div class="goods_record">
				<span class="goods_name">제품명</span>
				<span class="price">49,000</span>
			</div>
	      </li>
	      <li class="goods">
			<div class="goods_img">
				<a href="#">
		        	<img src="http://localhost:9000/myshop/resources/images/good6.jpg">
		        </a>
			</div>
			<div class="goods_record">
				<span class="goods_name">제품명</span>
				<span class="price">49,000</span>
			</div>
	      </li>
	      <li class="goods">
			<div class="goods_img">
				<a href="#">
		        	<img src="http://localhost:9000/myshop/resources/images/good7.jpg">
		        </a>
			</div>
			<div class="goods_record">
				<span class="goods_name">제품명</span>
				<span class="price">49,000</span>
			</div>
	      </li>
	      <li class="goods">
			<div class="goods_img">
				<a href="#">
		        	<img src="http://localhost:9000/myshop/resources/images/good8.jpg">
		        </a>
			</div>
			<div class="goods_record">
				<span class="goods_name">제품명</span>
				<span class="price">49,000</span>
			</div>
	      </li>
	      
	    </ul>
    </div>
</html>