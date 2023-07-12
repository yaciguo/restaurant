<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel='stylesheet' href="<c:url value='/css/table.css' />" />

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" -->
<!-- 	crossorigin="anonymous" /> -->
<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" -->
<!-- 	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" -->
<!-- 	crossorigin="anonymous"></script> -->

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<%-- <meta name="_csrf" content="${_csrf.token}" /> --%>
<%-- <meta name="_csrf_header" content="${_csrf.headerName}" /> --%>

<title>table</title>

<!-- Favicons -->
<!-- <link href="assets/img/s-logo.png" rel="icon"> -->

<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" -->
<!-- 	crossorigin="anonymous"> -->

<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" -->
<!-- 	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" -->
<!-- 	crossorigin="anonymous" referrerpolicy="no-referrer" /> -->

<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" -->
<!-- 	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" -->
<!-- 	crossorigin="anonymous"> -->
	
<!-- </script> -->

<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js" -->
<!-- 	integrity="sha512-nhY06wKras39lb9lRO76J4397CH1XpRSLfLJSftTeo3+q2vP7PaebILH9TqH+GRpnOhfAGjuYMVmVTOZJ+682w==" -->
<!-- 	crossorigin="anonymous" referrerpolicy="no-referrer"> -->
	
<!-- </script> -->
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> --%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>


<!-- bootstrap5 - 前端框架 -->
<!-- <link -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" -->
<!-- 	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" -->
<!-- 	crossorigin="anonymous"> -->

<!-- jquery 框架 -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" -->
<!-- 	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" -->
<!-- 	crossorigin="anonymous"></script> -->

<!-- fontAwesome - icon插件 -->
<!-- css都要有rel="stylesheet" js就不用 -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"> -->

<!-- 引入 Bootstrap CSS -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->

<!-- 引入 Bootstrap JavaScript -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script> -->

<!-- <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/tempusdominus-bootstrap-4@5.1.2/js/tempusdominus-bootstrap-4.min.js"></script> -->

<!-- <script type="text/javascript" -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" /> -->

</head>

<body>
	<!-- 主要內容區域 -->
	<div id="main-content" class="main-content">
		<br> <br>

		<!-- 將時間跟日期放在畫面中同一行 -->
		<!-- 				<div class="row"> -->
		<div class="col-auto d-flex justify-content-center align-items-center">
			<label for="startdate" style="width: 130px" >訂位日期：</label> 
			<input	class="form-control" id="startdate" name="startdate"
				placeholder='yyyy-mm-dd' type="text" style="width: 150px" />
		</div>
		<br>
		<div class="col-auto d-flex justify-content-center align-items-center">
			<label for="pNumber" style="width: 172px">訂位時間:</label>
			<select	id="selectTime" onchange="selectTime()">
				<option value="" label="請選擇時間" />
				<option value="1" label="12:00" />
				<option value="2" label="13:00" />
				<option value="3" label="14:00" />
				<option value="4" label="15:00" />
				<option value="5" label="16:00" />
				<option value="6" label="17:00" />
				<option value="7" label="18:00" />
			</select>
		</div>

		<section class="container">
			<div class="tab-content">
				<div class="row">
					<div class="col-2">
						<div class="box">1桌</div>
					</div>
					<div class="col-2">
						<div class="box" onclick="ordertable()" id="table2">2桌</div>
					</div>
					<div class="col-2">
						<div class="box">3桌</div>
					</div>
					<div class="col-2">
						<div class="box">4桌</div>
					</div>
					<div class="col-2">
						<div class="box">5桌</div>
					</div>
				</div>
				<div class="row">
					<div class="col-2">
						<div class="box">6桌</div>
					</div>
					<div class="col-2">
						<div class="box" id="table7" onclick="callIntable()">
							<span class="guests-seven">7桌</span>
						</div>
					</div>
					<div class="col-2">
						<div class="box">8桌</div>
					</div>
					<div class="col-2">
						<div class="box" id="table9" onclick="showIntable()">
							<span class="guests-count"> 9桌</span>
						</div>
					</div>
					<div class="col-2">
						<div class="box">10桌</div>
					</div>
				</div>
			</div>
		</section>

		<!----------------- 桌位藍色 訂單資訊 ---------------->
		<div id="ordertable" class="bluetable">
			<span class="close" onclick="closeorder()">&times;</span>
			<h2>訂位詳細資訊</h2>
			<form id="orderForm">
				<label for="orderDate">訂位日期：</label> <input type="text"
					id="orderDate" name="orderDate" value="2023-07-19" readonly><br>
				<label for="orderTime">訂位時間：</label> <input type="text"
					id="orderTime" name="orderTime" value="12:00" readonly><br>
				<label for="orderName">訂位者姓名：</label> <input type="text"
					id="orderName" name="orderName" value="賴雅慧" readonly><br>
				<label for="orderGender">性別：</label> <input type="text"
					id="orderGender" name="orderGender" value="小姐" readonly><br>
				<label for="orderPhone">電話：</label> <input type="text"
					id="orderPhone" name="orderPhone" value="0978090605" readonly><br>
				<label for="orderGuests">訂位人數：</label> <input type="text"
					id="orderGuests" name="orderGuests" value="3人" readonly><br>
			</form>
			<!-- 修改按鈕 -->
			<button type="button" class="btn btn-primary" onclick="enableEdit()">修改</button>
			<!-- 刪除按鈕 -->
			<button type="button" class="btn btn-danger" onclick="deleteOrder()">刪除</button>
			<!-- 確認按鈕 -->
			<button type="button" class="btn btn-success"
				onclick="confirmOrder()">確認</button>
		</div>
		<!----------------- 桌位藍色 訂單資訊 ---------------->


		<!-- 現場候位-輸入人數 可執行 -->
		<!-- 		<div id="intable" class="test2"> -->
		<!-- 			<div class="modal-content"> -->
		<!-- 				<span class="close" onclick="closewait()">&times;</span>  -->
		<!-- 				<label for="guestsInput">人數：</label> <br> -->
		<!-- 				<input type="number" id="guestsInput" name="guestsInput">  -->
		<!-- 				<select path="pNumber" id="guestsInput" > -->
		<!-- 					<option value="" label="請選擇人數" /> -->
		<!-- 					<option value="1" label="1" /> -->
		<!-- 					<option value="2" label="2" /> -->
		<!-- 					<option value="3" label="3" /> -->
		<!-- 					<option value="4" label="4" /> -->
		<!-- 				</select> -->
		<!-- 				<button onclick="confirmwait()">確認</button> -->
		<!-- 			</div> -->
		<!-- 		</div> -->

		<!-------------- 現場候位與電話預約9桌--------------->
		<div id="intable" class="test2" style="display: none">
			<div class="te2" style="display: flex">
				<div class="left-panel2">
					<!-- 左邊的內容 -->
					<div class="modal-content2">
						<div style="margin-right: 20px" class="close"
							onclick="closewait()">&times;</div>
						<br>
						<h5>現場候位：</h5><br>
							<!-- 					<label for="guestsInput">人數：</label>  -->
							<select id="guestsInput">
								<option value="" label="請選擇人數"></option>
								<option value="1" label="1"></option>
								<option value="2" label="2"></option>
								<option value="3" label="3"></option>
								<option value="4" label="4"></option>
							</select> <br><br>
							<button onclick="confirmwait()">確認</button>
					</div>
				</div>
				<br>
				<div class="right-panel2">
					<!-- 右邊的內容 -->
					<div class="modal-content right-panel"
						style="border: 1px solid rgba(0, 0, 0, 0);">
						<div style="padding-left: 180px" class="close"
							onclick="closewait()">&times;</div>
						<h5>來電預約：</h5><br>
						<label for="dateInput">預約日期：</label> <input type="date"
							id="dateInput"> <br>
						<label for="timeInput">預約時間：</label> <select id="pNumber">
							<option value="" label="請選擇時間" />
							<option value="1" label="12:00" />
							<option value="2" label="13:00" />
							<option value="3" label="14:00" />
							<option value="4" label="15:00" />
							<option value="5" label="16:00" />
							<option value="6" label="17:00" />
							<option value="7" label="18:00" />
						</select><br> 
						<label for="nameInput">姓名：</label> 
						<input type="text"id="nameInput" readonly> <br> 
						<label for="genderInput">性別：</label> 						
						<label for="maleInput"><input type="radio" id="maleInput"	class="gender" value="M"> 先生</label>						
						<label for="femaleInput"><input type="radio" id="femaleInput" class="gender" value="F">小姐</label> <br> 					
						<label for="phoneInput">手機：</label> 
						<input type="tel" id="phoneInput" placeholder="請輸入09xxxxxxxx" pattern="[0]{1}[9]{1}[0-9]{8}">
						<br>
						<button onclick="confirmwait()">確認</button>
					</div>
				</div>
			</div>
		</div>
		<!-------------- 現場候位與電話預約9桌--------------->
		<!-------------- 現場候位與電話預約7桌--------------->
		<div id="calltable" class="test3" style="display: none">
			<div class="te3" style="display: flex">
				<div class="left-panel3">
					<!-- 左邊的內容 -->
					<div class="modal-content left-panel" style=" border: 1px solid rgba(0, 0, 0, 0);  border-radius: 1.3rem;">
						<div style="margin-left: 170px" class="close"
							onclick="callclose()">&times;</div>
						<br>
						<h5>現場候位：</h5><br>
<!-- 							<label for="guestsInput">人數：</label>  -->
							<select	id="guestsInput">
								<option value="" label="請選擇人數"></option>
								<option value="1" label="1"></option>
								<option value="2" label="2"></option>
								<option value="3" label="3"></option>
								<option value="4" label="4"></option>
							</select> <br><br>
							<button onclick="callwait()">確認</button>
					</div>
				</div>
				<br>
				<div class="right-panel3">
					<!-- 右邊的內容 -->
					<div class="modal-content right-panel"
						style="border: 1px solid rgba(0, 0, 0, 0);">
						<div style="padding-left: 165px" class="close"
							onclick="callclose()">&times;</div>
						<h5>來電預約：</h5><br><br>
						<label for="dateInput">預約日期：</label> <input type="date"
							id="dateInput"> <br> 
							<label for="timeInput3">預約時間：</label> 
							<select	id="pNumber3">
							<option value="" label="請選擇時間" />
							<option value="1" label="12:00" />
							<option value="2" label="13:00" />
							<option value="3" label="14:00" />
							<option value="4" label="15:00" />
							<option value="5" label="16:00" />
							<option value="6" label="17:00" />
							<option value="7" label="18:00" />
						</select> <br> 
						<label for="nameInput">姓名：</label> 
						<input type="text"	id="nameInput"> <br> 
							<label for="genderInput">性別：</label>						
						<label for="maleInput"><input type="radio" id="maleInput" name="gender" value="M">先生</label> 						
						<label for="femaleInput"><input type="radio"	id="femaleInput" name="gender" value="F"> 小姐</label> <br> 
						<label for="phoneInput">手機：</label>
						<input type="tel" id="phoneInput" placeholder="請輸入09xxxxxxxx"
							pattern="[0]{1}[9]{1}[0-9]{8}"> <br>
						<button onclick="callwait()">確認</button>
					</div>
				</div>
			</div>
		</div>
		<!-------------- 現場候位與電話預約7桌--------------->

	</div>
	<!-- /主要內容區域 -->
</body>
<script type="text/javascript" src="<c:url value='/js/table/table.js'/>"></script>
</html>