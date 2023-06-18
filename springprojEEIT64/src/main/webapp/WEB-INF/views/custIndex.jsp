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
<link href="./assets/src/plugins/bootstrap5.2/bootstrap.min.css"
	rel="stylesheet">
<script src="./assets/src/plugins/bootstrap5.2/bootstrap.bundle.min.js"></script>

<!-- jquery 框架 -->
<script type="text/javascript"
	src="./assets/src/plugins/jquery/jquery-1.11.0.min.js"></script>

<!-- slick - css輪播圖插件 -->
<link rel="stylesheet"
	href="./assets/src/plugins/slick-slider/slick.css" />
<link rel="stylesheet"
	href="./assets/src/plugins/slick-slider/slick-theme.css" />
<script src="./assets/src/plugins/slick-slider/slick.js"></script>

<!-- fontAwesome - icon插件 -->
<link href="./assets/src/plugins/fontawesome/css/all.min.css"
	rel="stylesheet">


<link rel='stylesheet' href="<c:url value='/css/custIndex.css' />" />

</head>

<body>
	<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>

	<!-- 輪播圖 - 廣告看板 -->
	<div class="slider bannerSlider text-center" id="bannerSlider">
		<img src="./assets/img/3-banner1.jpg">
		<img src="./assets/img/3-banner2.jpg">
		<img src="./assets/img/3-banner3.jpg">
	</div>

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
		// 輪播圖設定
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

	});
</script>

</html>