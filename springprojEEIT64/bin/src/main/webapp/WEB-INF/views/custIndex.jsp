<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>webDesign-RS</title>

<!-- Favicons -->
<link href="assets/img/s-logo.png" rel="icon">

<!-- bootstrap5 - 前端框架 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- jquery 框架 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- slick - css輪播圖插件 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- fontAwesome - icon插件 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"  />


<link rel='stylesheet' href="<c:url value='/css/custIndex.css' />" />

</head>

<script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
<df-messenger
  intent="WELCOME"
  chat-title="客服小幫手"
  agent-id="7e5cb99d-89c5-4d61-bbd0-9a3d6d61b9ba"
  language-code="zh-tw"
></df-messenger>

<body>
	<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>

	<!-- 輪播圖 - 廣告看板 -->
	<div class="slider bannerSlider text-center" id="bannerSlider"></div>

	<div class="content">

		<div class="row step-container">
			<div class="col-6 step-item">
				<a href="<c:url value='/booking' />" class="step-box">
					<i class="fa-regular fa-calendar-check"></i>
				</a>
				<p>線上訂位</p>
			</div>
			<div class="col-6 step-item">
				<a href="<c:url value='/menu' />" class="step-box">
					<i class="fa-solid fa-person-walking"></i>
				</a>
				<p>自取點餐</p>
			</div>

		</div>
	</div>

	<!-- 輪播圖 - 熱門商品 -->
	<div class="hot-sell">
		<div class="slider product-slider" id="product-slider">
			<img src="./assets/img/s-banner1.jpg" class="rounded-4">
			<img src="./assets/img/s-banner2.jpg" class="rounded-4">
			<img src="./assets/img/s-banner3.jpg" class="rounded-4">
			<img src="./assets/img/s-banner4.jpg" class="rounded-4">
			<img src="./assets/img/s-banner5.jpg" class="rounded-4">
			<img src="./assets/img/s-banner6.jpg" class="rounded-4">
		</div>
	</div>
</body>


<script>
	$(function() {
		// 讀取 輪播圖
		$.ajax({
		    url: '${pageContext.request.contextPath}/custIndex/queryBanner',
		    type: 'GET',
		    success: function(response) {
	            console.log("--------------ajax-queryBanner");
		    	var bannerSlider = $('#bannerSlider');
		    	for (var i = 0; i < response.length; i++) {
		    	    var banner = response[i];
		    	    var imgElement = $('<img>').attr('src', banner.pic);
		    	    bannerSlider.append(imgElement);
		    	  }

		        initBannerSlider();
		    },
		    error: function(error) {
		      console.log('輪播圖讀取失敗:', error);
		    }
		 });

        // 初始化輪播圖設定
		function initBannerSlider(){
			$('.bannerSlider').slick({
				infinite : true,
				autoplay : true,
				autoplaySpeed : 2500,
				arrows : false,
			});
			
			$('.product-slider').slick({
				infinite : true,
				slidesToShow : 3,
				slidesToScroll : 1,
				autoplay : true,
				autoplaySpeed : 3000,
				arrows : false,
				responsive : [ {
					breakpoint : 576,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 1,
					}
				} ]
			});
		}
	});
</script>

</html>