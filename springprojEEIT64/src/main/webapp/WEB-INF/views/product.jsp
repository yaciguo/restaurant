<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="_contextPath" content="${pageContext.request.contextPath}" />
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>

<link rel='stylesheet' href="<c:url value='/css/product.css' />" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<title>product</title>

<!-- Favicons -->
<link href="assets/img/s-logo.png" rel="icon">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous">
	
</script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js"
	integrity="sha512-nhY06wKras39lb9lRO76J4397CH1XpRSLfLJSftTeo3+q2vP7PaebILH9TqH+GRpnOhfAGjuYMVmVTOZJ+682w=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
	
</script>

<!-- bootstrap5 - 前端框架 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<!-- jquery 框架 -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>

<!-- fontAwesome - icon插件 -->
<!-- css都要有rel="stylesheet" js就不用 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>
	<!-- 左側導覽列 -->
	<%@ include file="sideNav.jsp"%>
	<!-- 主要內容區域 -->
	<div id="main-content" class="main-content">
		<!-- 上方列按鈕-->
		<button type="button" class="btn btn-primary add-type"
			onclick="addtype()">新增餐點種類</button>
		<button type="button" class="btn btn-primary add-activity"
			onclick="addfd()">新增餐點</button>
		<!-- 上方列按鈕-->
		<br> <br>
		<!-- 餐點總表-->
		<!-- 產品總表格 -->
		<div class="tab-pane fade show active" id="tab1">
			<table class="table-product">
				<thead>
					<tr class="text-center">
						<td colspan="8">餐點總表</td>
					</tr>
					<tr class="text-center">
						<td>餐點編號</td>
						<!-- 						<td>Check</td> -->
						<td>餐點名稱</td>
						<td>餐點價格</td>
						<td>餐點成本</td>
						<td>餐點描述</td>
						<td>餐點狀態</td>
					</tr>
				</thead>
				<!-- 之後資料庫取得資料並將其存放在json中，再建立新的表格列 -->
				<!-- 不用foreach 前端接收後端 Controller 一樣用ajax-->
				<c:forEach var="item" items="${list.content}">
					<tr class="tr-title">
						<td>${item.id}</td>
						<td>${item.name}</td>
						<!-- <td>${item.price}</td> -->
						<td>${item.cost}</td>
						<td>${item.description}</td>
						<td>${item.status}</td>
						<%-- 						<td><c:forEach var="activity" items="${item.activityBean}"> --%>
						<%--        	 					${activity.name}</c:forEach></td> --%>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!-- 互動視窗 - 活動設定 -->
		<!-- 修改新增產品彈跳視窗-->
		<div class="modal" id="myModal" tabindex="-1"
			aria-labelledby="addp-modalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<form class="modal-content" id="addp-form">
					<div class="modal-header">
						<h4 class="modal-title" id="addp-modalLabel">
							<B>新增餐點</B>
						</h4>
						<span class="close" onclick=" closeModal()">&times;</span>
					</div>
					<div class="modal-body px-2">
						<div class="addproduct-detail">
							<select id="category-select" required="required">								
							</select>
						</div>
						<!-- <div class="py-4">
							<span><B>新增餐點圖：</B></span> <input type="file" accept=".jpg, .png"
								id="fdpictureInput">
						</div> -->
						<div class="addproduct-detail">
							<strong>餐點名稱：</strong> <input type="text" id="add-name" required>
						</div>
						<div class="addproduct-detail">
							<strong>餐點價格：</strong> <input type="text" id="add-price" required>
						</div>
						<div class="addproduct-detail">
							<strong>餐點成本：</strong><input type="text" id="add-cost" required>
						</div>
						<div class="addproduct-detail">
							<strong>餐點描述：</strong> <input type="text" id="add-description"
								required>
						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-secondary px-5 py-2 mx-4"
							data-bs-dismiss="modal" onclick="fdcancel()">取消</button>
						<button type="submit" class="btn btn-primary px-5 py-2 mx-4"
							onclick="addProduct()" id="addp">確認</button>
					</div>
				</form>
			</div>
		</div>
		<!-- 修改新增產品彈跳視窗-->
		<!-- 新增產品彈跳視窗-->
		<div class="modal" id="myType" tabindex="-1"
			aria-labelledby="mixproduct-modalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<form class="modal-content" id="addproduct-form">
					<div class="modal-header">
						<h4 class="modal-title" id="addproduct-modalLabel">
							<B>新增產品種類</B>
						</h4>
						<span class="close" onclick=" closetype()">&times;</span>
					</div>
					<div class="modal-body px-2">
						<div class="fdtype">
							<strong>輸入產品種類：</strong> <input type="text" id="type-name"
								required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary px-5 py-2 mx-4"
							data-bs-dismiss="modal" onclick="tpyecancel()">取消</button>
						<button type="submit" class="btn btn-primary px-5 py-2 mx-4"
							onclick="typesave(event)">確認</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 主要內容區域 -->

	<input type="hidden" id="contextPath"
		value="${pageContext.request.contextPath}" />

</body>

<script type="text/javascript"
	src="<c:url value='/js/product/product.js'/>"></script>
</html>
