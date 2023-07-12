<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title id="sidenav-title">webDesign-RS</title>

<!-- Favicons -->
<link href="assets/img/s-logo.png" rel="icon">

<!-- bootstrap5 - 前端框架 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- jquery 框架 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fontAwesome - icon插件 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

	
<!-- 日期選擇器 -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!-- chart -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>


<style>
:root {
	--main-color: #1d1f26;
	--sec-color: #FAF0E6;
	--main-radius: 10px;
}

.main-content {
	min-width: 580px;
	margin: 20px 20px 20px calc(60px + 20px);
	padding: 15px;
	transition: margin-left 0.3s ease-in-out;
	background-color: #FFF;
	border-radius: var(--main-radius);
}

.main-content.active {
	margin-left: 180px;
}

.sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	z-index: 100;
	padding: 20px 0;
	width: 60px;
	text-align: center;
	transition: all 0.3s ease-in-out;
	background-color: var(--main-color);
	overflow-y: auto;
	overflow: hidden;
}

.sidebar.active {
	width: 180px;
}

.nav li {
	height: 65px;
	display: flex;
	align-items: center;
}

.nav-link {
	color: var(--sec-color);
	display: flex;
	align-items: center;
}

.nav-title {
	opacity: 0;
	margin-left: 15px;
	white-space: nowrap;
	letter-spacing: 2.5px;
}

.nav-title.active {
	opacity: 1;
	transition: opacity 0.7s ease-in-out;
}

.topbar {
	padding: 20px 40px 20px 20px;
	margin-left: 60px;
	background-color: #FFF;
}

.topbar.active {
	margin-left: 180px;
}

.topbar a {
	color: var(--main-color);
}
</style>

<body>
	<!-- 左側 導覽列 -->
	<nav id="sidebar" class="sidebar">
		<img id="sideNav-shopLogo-img" src="${pageContext.request.contextPath}/assets/img/logo.png">

		<ul class="nav flex-column" style="list-style: none; padding: 30px 0;">
			<li><a href="<c:url value='/basicSettings' />"
				class="nav-link side-nav active"> <i
					class="fa-solid fa-house fa-xl"></i> <span class="nav-title">餐廳管理</span>
			</a></li>
			<!-- <li><a href="#member" class="nav-link side-nav">
                    <i class="fa-regular fa-address-card fa-xl"></i>
                    <span class="nav-title">會員管理</span>
                </a></li> -->
			<li><a href="<c:url value='/table' />" class="nav-link side-nav">
					<i class="fa-solid fa-couch fa-lg"></i> <span class="nav-title">桌位管理</span>
			</a></li>
			<li><a href="<c:url value='/product' />"
				class="nav-link side-nav"> <i
					class="fa-solid fa-book-open-reader fa-xl"></i> <span
					class="nav-title">商品管理</span>
			</a></li>
			<li><a href="<c:url value='/orders' />"
				class="nav-link side-nav"> <i class="fa-solid fa-list-ul fa-xl"></i>
					<span class="nav-title">訂單管理</span>
			</a></li>
			<li><a href="<c:url value='/activity' />"
				class="nav-link side-nav"> <i class="fa-solid fa-gift fa-xl"></i>
					<span class="nav-title">活動管理</span>
			</a></li>
			<li><a href="<c:url value='/checkout' />"
				class="nav-link side-nav"> <i
					class="fa-solid fa-sack-dollar fa-xl"></i> <span class="nav-title">結帳管理</span>
			</a></li>
			<li><a href="<c:url value='/dataAnalysis' />"
				class="nav-link side-nav"> <i
					class="fa-solid fa-chart-column fa-xl"></i> <span class="nav-title">數據管理</span>
			</a></li>
			<!-- <li><a href="#mail" class="nav-link side-nav">
                    <i class="fa-regular fa-comment-dots fa-xl"></i>
                    <span class="nav-title">客服管理</span>
                </a> -->
		</ul>
	</nav>

	<!-- 上方 導覽列 -->
	<nav id="topbar" class="topbar d-flex justify-content-between">
	
		<!-- 側邊導覽列開關按鈕 -->
		<a href="#"> <i class="fa-solid fa-bars fa-2xl mx-2"
			id="sidebar-Toggle" style="cursor: pointer;"></i>
			
		</a> <span class="page-title fa-solid fa-xl" style="display: contents;"></span>

		<i class="fa-solid fa-right-to-bracket fa-xl" onclick="logout()">
			<span>登出</span>
		</i>
	</nav>

	<!-- 主要內容區域 - 各分頁 -->
	<div id="main-content" class="main-content"></div>
	
</body>


<script>
	$(function() {
		loadPage("/restaurant/order","訂單管理")
		getAndSetAllSettings();

		// 導覽列控制設定
		$('#sidebar-Toggle').on('click', function () {
	        $('#sidebar').toggleClass('active');
	        $('#topbar').toggleClass('active');
	        $('#main-content').toggleClass('active');
	        $('.nav-title').toggleClass('active');
	    });

	    // 控制上方導覽列顯示相對應頁面標題
		$('.side-nav').on('click', function(e) {
			e.preventDefault();

			var navTitle = $(this).find('.nav-title').text();
			// $('.page-title').text(navTitle);

			var href = $(this).attr('href');
			if (href) {
				loadPage(href,navTitle);
			}
		});
	});
	
	// 載入頁面內容
	function loadPage(url,navTitle) {
		$.ajax({
			url : url,
			method : 'GET',
			success : function(response) {
				$('#main-content').html(response);
				$('.page-title').text(navTitle);
			},
			error : function(error) {
				console.log('載入頁面失敗:', error);
			}
		});
	}

	function logout() {
		$.ajax({
			url : '${pageContext.request.contextPath}/logout',
			type : 'POST',
			async : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
			},
			success : function(response) {
				console.log("--------------ajax-logout");
				location.reload();
			},
			error : function(error) {
				console.log('登出失敗:', error);
			}
		});
	}

	function getAndSetAllSettings(){
		console.log("${pageContext.request.contextPath}/basicSettings.api/getBasicSettings")
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath}/basicSettings.api/getBasicSettings",
			async : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
			},
			success : function(response) {
				console.log(response);
				$("#sidenav-title").html(response.data.shopName);
				$("#sideNav-shopLogo-img").attr("src", response.data.logoImg);
				$("#sideNav-shopLogo-img").css("width","100%");
			},
			error : function(error) {
				console.log('資料獲取失敗:', error);
			}
		})
	}
</script>

</html>