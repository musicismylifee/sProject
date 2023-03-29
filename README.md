# sProject
스프링 레거시로 진행한 팀 프로젝트 입니다.  
쇼핑몰 프로젝트 입니다.

## Description
* 개발 기간 : 2022.09.05 ~ 2022.10.27
* 참여 인원 : 5명
* 사용 기술
  + JSP, CSS, JS, JQuery
  + Spring 3.9.18, Apache Tomcat 9.0, Mybatis
  + Java, Ajax, Jquery, Git, MVC Pattern
  + Oracle 12g Database
+ * 담당 구현 파트
  + 메인페이지 설계 및 디자인 구성
  + Header 메인 메뉴 디자인
  + 장바구니 페이지 구현 및 DB 작성(장바구니 상품 리스트, 금액 계산)

## Views

* **메인페이지**

![main](https://user-images.githubusercontent.com/106236716/228638057-5d5177da-5e6b-43bd-aed8-fe7a743720e2.PNG)


자바스크립트, CSS를 이용하여 메인페이지 구성 및 swiper라이브러리를 이용하려 슬라이드 구성
  <details>
  <summary> myshop.jsp 코드 보기(css 포함)</summary>
  <div markdown="1">

  ```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <title>Shop</title>
	
    <script src="http://localhost:9000/myshop/resources/js/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	
   
   
   <style>
    body{min-width:70%;}
    .swiper-slide img{width:100%;}
 	
 	.swiper-button-next, .swiper-button-prev {color:black !important; opacity:0.5; width:5% !important;}
 	
 	.swiper-pagination-bullet { width: 12px !important; height: 12px !important; background: transparent !important; border: 1px solid black !important; opacity: 0.5 !important; }
 	
 	.swiper-pagination-bullet-active { width: 40px !important; transition: width .5s; border-radius: 5px !important; background: black !important; border: 1px solid transparent !important; }
 	
 	.slide-btn {
 	border: 1px solid black;
 	border-radius: 5%;
	position: absolute;
	width: 140px;
	height: 40px;
	top: 56.3%;
	left : 50%;
	transform: translate(-50%, -50%);
	font-size:17px;
	font-weight: bold;
}
	.slide-btn:hover {cursor: pointer; background-color:black;color:white;}
	
	.title { text-align:center; }
	
	.products {width:1550px; margin:0 auto;}
	
	.products ul{display:flex; justify-content: center; flex-direction:row; flex-wrap:wrap; list-style:none; margin:10px;}
	
	.goods_img {padding:10px;}
	.goods_img img{width:350px;}
	.goods_record span{display:block; margin:0 5px;}
	.goods_name {font-size:10px;}
	.price {font-weight: bold;}
	
	.main_hole {
		background:url('http://localhost:9000/myshop/resources/images/hole_bg.jpg')50% 50% no-repeat;
		background-attachment:fixed;
		background-size:cover;
		}
	.main_hole .hole_inner {
	    position: relative;
	    width: 100%;
	    height: 100%;
	    background: rgba(0,0,0,0.2);
	}
	
	
    </style> 
  </head>

  <body>
<!-- header -->    
	<jsp:include page="/header.do"/>


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
            delay: 5000,
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
    <div class="main_hole" style="background:url('http://localhost:9000/myshop/resources/images/hole_bg.jpg')50% 50% no-repeat;background-attachment:fixed;background-size:cover;height:540px;">
	<div class="hole_inner">
		<div class="hb_copy" style="color:#fff;">
		    <h2></h2>
		    <p class="desc">
		    </p>
		    <br><div class="btnArea L b_center">
			</div>
		</div>
	</div>
</div>
    
        <div class="title">
        <h2>
            <span style="display: ;">BEST SELLER</span>
            <span style="display: none;"><img src="" alt="BEST SELLER"></span>
        </h2>
    </div>
    
    <div class="products">
    	<ul class="products_inner">
	      <li class="goods">
			<div class="goods_img">
				<a href="#">
		        	<img src="http://localhost:9000/myshop/resources/images/best1.jpg">
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
		        	<img src="http://localhost:9000/myshop/resources/images/best2.jpg">
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
		        	<img src="http://localhost:9000/myshop/resources/images/best3.jpg">
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
		        	<img src="http://localhost:9000/myshop/resources/images/best4.jpg">
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
		        	<img src="http://localhost:9000/myshop/resources/images/best5.jpg">
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
		        	<img src="http://localhost:9000/myshop/resources/images/best6.jpg">
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
		        	<img src="http://localhost:9000/myshop/resources/images/best7.jpg">
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
		        	<img src="http://localhost:9000/myshop/resources/images/best8.jpg">
		        </a>
			</div>
			<div class="goods_record">
				<span class="goods_name">제품명</span>
				<span class="price">49,000</span>
			</div>
	      </li>
	    </ul>
    </div>
    
    <!-- footer -->    
	<jsp:include page="/footer.do"></jsp:include>
</html>
  ```

  </div></details>

* **Header**

![header](https://user-images.githubusercontent.com/106236716/228638253-7d10a2a7-5fc4-4675-8563-65c15bdfebb9.png)

![headerhover](https://user-images.githubusercontent.com/106236716/228638380-b5086b8f-021a-4d3d-a1f4-46c1380dcd0c.png)

+ **메뉴설정, 상품검색 기능**
  1. Mybatis를 이용하여 DB에 등록된 카테고리 정보를 JSTL을 활용해 동적으로 출력
  2. 검색 시 상품의 제목을 비교하여 데이터를 가져오고 JsonView를 설정해  
     Json형태로 데이터를 가져와 검색한 목록들을 출력.

* **장바구니**

![cart](https://user-images.githubusercontent.com/106236716/228638518-849d3969-f51b-46f0-b2b2-202ea0092940.PNG)

+ **상품 추가 및 금액 출력**
  1. 상품 페이지에서 장바구니에 추가시 DB 데이터를 받아 장바구니 페이지에 출력(Ajax)
  2. JSTL을 이용하여 금액을 계산 후 출력

  ## ERD
  ![erd](https://user-images.githubusercontent.com/106236716/228645095-8d36ea40-3725-4622-a419-7ceb694821bf.PNG)
