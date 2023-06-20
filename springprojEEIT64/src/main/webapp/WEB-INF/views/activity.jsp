<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>webDesign-OS</title>

<!-- Favicons -->
<link href="assets/img/s-logo.png" rel="icon">

<!-- bootstrap5 - 前端框架 -->
<link href="./assets/src/plugins/bootstrap5.2/bootstrap.min.css"
	rel="stylesheet">
<script src="./assets/src/plugins/bootstrap5.2/bootstrap.bundle.min.js"></script>

<!-- jquery 框架 -->
<script type="text/javascript"
	src="./assets/src/plugins/jquery/jquery-1.11.0.min.js"></script>

<!-- fontAwesome - icon插件 -->
<link href="./assets/src/plugins/fontawesome/css/all.min.css"
	rel="stylesheet">

<link rel='stylesheet' href="<c:url value='/css/activity.css' />" />

</head>

<body>
	<!-- 左側導覽列 -->
	<%@ include file="sideNav.jsp" %>

	<!-- 主要內容區域 -->
	<div id="main-content" class="main-content">
		<ul class="nav nav-tabs" id="activity-tabs">
			<li class="nav-item"><a class="activity-link nav-link active"
					data-bs-toggle="tab" href="#tab1">廣告看板</a></li>
			<li class="nav-item"><a class="activity-link nav-link"
					data-bs-toggle="tab" href="#tab2">活動設定</a></li>
		</ul>

		<!-- 分頁內容-->
		<div class="tab-content">

			<!-- 標籤一 - 廣告看板-->
			<div class="tab-pane fade show active" id="tab1">
				<div class="py-4">
					<span><B>新增輪播圖：</B></span>
					<input type="file" accept=".jpg, .png">
				</div>

				<div class="activity-banner py-4">
					<B>廣告一</B>
					<div class="row mt-4 ms-1 d-flex align-items-center">
						<img src="./assets/img/3-banner1.jpg" class="col-4">
						<div class="col-7 d-block">
							<span><B>活動連結：</B></span>
							<input type="text" class="activity-text">
						</div>
						<i class="fa-solid fa-trash col-1 text-center"></i>
					</div>
				</div>

				<div class="activity-banner py-4">
					<B>廣告二</B>
					<div class="row mt-4 ms-1 d-flex align-items-center">
						<img src="./assets/img/3-banner2.jpg" class="col-4">
						<div class="col-7 d-block">
							<span><B>活動連結：</B></span>
							<input type="text" class="activity-text">
						</div>
						<i class="fa-solid fa-trash col-1 text-center"></i>
					</div>
				</div>
			</div>

			<!-- 標籤二 - 活動設定 -->
			<div class="tab-pane fade" id="tab2">
				<div class="py-4">
					<button type="button" class="btn btn-primary add-activity"
						data-bs-toggle="modal" data-bs-target="#activity-modal">
						<i class="fa-solid fa-plus "></i>
					</button>
				</div>

				<table class="activity-table">
					<thead>
						<tr>
							<th id="id-titleCell">活動編號</th>
							<th id="name-titleCell">活動名稱</th>
							<th id="type-titleCell">活動類型</th>
							<th id="discount-titleCell">活動折扣</th>
							<th id="amount-titleCell">達標金額</th>
							<th id="start-titleCell">活動開始</th>
							<th id="end-titleCell">活動結束</th>
							<th>功能</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="bean" items="${allActivity}">
						<tr onclick="openModal(this)">
							<td id="id-cell">${bean.id}</td>
							<td id="name-cell">${bean.name}</td>
							<td id="type-cell">${bean.type}</td>
							<td id="discount-cell">${bean.discount}</td>
							<td id="amount-cell">${bean.amount}</td>
							<td id="start-cell">${bean.startDate}</td>
							<td id="end-cell">${bean.endDate}</td>
							<td><i class="fa-solid fa-trash"></i></td>
						</tr>
	  </c:forEach>
<!-- 						<tr onclick="openModal(this)"> -->
<!-- 							<td id="id-cell">1</td> -->
<!-- 							<td id="name-cell">夏日促銷</td> -->
<!-- 							<td id="type-cell">折扣</td> -->
<!-- 							<td id="discount-cell">50</td> -->
<!-- 							<td id="amount-cell">200</td> -->
<!-- 							<td id="start-cell">2023-06-01</td> -->
<!-- 							<td id="end-cell">2023-06-30</td> -->
<!-- 							<td><i class="fa-solid fa-trash"></i></td> -->
<!-- 						</tr> -->
<!-- 						<tr onclick="openModal(this)"> -->
<!-- 							<td id="id-cell">2</td> -->
<!-- 							<td id="name-cell">周年特惠</td> -->
<!-- 							<td id="type-cell">贈禮</td> -->
<!-- 							<td id="discount-cell">紅茶</td> -->
<!-- 							<td id="amount-cell">500</td> -->
<!-- 							<td id="start-cell">2023-12-01</td> -->
<!-- 							<td id="end-cell">2023-12-31</td> -->
<!-- 							<td><i class="fa-solid fa-trash"></i></td> -->
<!-- 						</tr> -->
					</tbody>
				</table>
			</div>
		</div>

		<!-- 互動視窗 - 活動設定 -->
		<div class="modal" id="activity-modal" tabindex="-1"
			aria-labelledby="activity-modalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="activity-modalLabel">
							<B>活動設定</B>
						</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body px-4">
						<div class="activity-detail" id="detail-id">
							<strong>活動編號：</strong>
							<input type="text">
						</div>
						<div class="activity-detail" id="detail-name">
							<strong>活動名稱：</strong>
							<input type="text">
						</div>
						<div class="activity-detail" id="detail-type">
							<strong>活動類型：</strong> <select>
								<option value="discount">折扣</option>
								<option value="bonus">贈禮</option>
							</select>
						</div>
						<div class="activity-detail" id="detail-items">
							<strong>參與品項：</strong> <label><input type="checkbox"
									value="select-all" id="select-all">全部</label> <label><input
									type="checkbox" value="麵食">麵食</label> <label><input
									type="checkbox" value="dumplings">餃子</label> <label><input
									type="checkbox" value="sides">小菜</label> <label><input
									type="checkbox" value="drinks">飲料</label> <label><input
									type="checkbox" value="desserts">甜點</label>
						</div>
						<div class="activity-detail" id="detail-amount">
							<strong>達標金額：</strong>
							<input type="text">
						</div>
						<div class="activity-detail" id="detail-start">
							<strong>活動開始：</strong>
							<input type="date">
						</div>
						<div class="activity-detail" id="detail-end">
							<strong>活動結束：</strong>
							<input type="date">
						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-secondary px-5 py-2 mx-4"
							data-bs-dismiss="modal">取消</button>
						<button type="button" class="btn btn-primary px-5 py-2 mx-4"
							data-bs-dismiss="modal">確認</button>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>


<script>
	$(function() {
		// 控制參與品項中checkbox
		document.getElementById("select-all").addEventListener(
				"change",
				function() {
					// 選取label中的checkbox
					var checkboxes = document
							.querySelectorAll("label input[type='checkbox']");

					for (var i = 1; i < checkboxes.length; i++) {
						checkboxes[i].checked = this.checked;
					}
				});

	});

	// 開啟活動設定互動視窗
	function openModal(row) {
		var activityId = row.querySelector('#id-cell').textContent;
		var activityName = row.querySelector('#name-cell').textContent;
		var activityType = row.querySelector('#type-cell').textContent;
		var activityItems = row.querySelector('#items-cell').textContent;
		var activityAmount = row.querySelector('#amount-cell').textContent;
		var activityStart = row.querySelector('#start-cell').textContent;
		var activityEnd = row.querySelector('#end-cell').textContent;

		var modal = document.getElementById('activity-modal');
		modal.querySelector('#detail-id input').value = activityId;
		modal.querySelector('#detail-name input').value = activityName;

		var detailOptions = document
				.querySelectorAll('#detail-type select option');
		detailOptions.forEach(function(option) {
			if (activityType == option.textContent) {
				option.setAttribute('selected', '');
			}
		});

		var detailLabels = document.querySelectorAll('#detail-items label');
		detailLabels.forEach(function(label) {
			var checkbox = label.querySelector('input[type="checkbox"]');
			if (activityItems.includes(label.textContent)) {
				checkbox.checked = true;
			}
		});

		modal.querySelector('#detail-amount input').value = activityAmount;
		modal.querySelector('#detail-start input').value = activityStart;
		modal.querySelector('#detail-end input').value = activityEnd;

		var modalInstance = new bootstrap.Modal(modal);
		modalInstance.show();
	}
</script>

</html>