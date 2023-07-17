<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel='stylesheet' type="text/css" href="<c:url value='/css/activity.css' />" />
<script src="<c:url value='js/activity.js' />"></script>

<meta name="_contextPath" content="${pageContext.request.contextPath}" />
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>

<body>
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
				<span><B>新增輪播圖：</B></span> <input type="file" accept=".jpg, .png"
					id="bannerInput">
			</div>

			<div class="bannerContent"></div>
		</div>
		
		<!-- 標籤二 - 活動設定 -->
		<div class="tab-pane fade" id="tab2">
			<div class="py-4">
				<button type="button" class="btn btn-primary add-activity"
					onclick="openModal(this)">
					<i class="fa-solid fa-plus "></i>
				</button>
			</div>

			<table class="activity-table">
				<thead>
					<tr>
						<th class="cursor-pointer" id="id-titleCell">活動編號</th>
						<th class="cursor-pointer" id="name-titleCell">活動名稱</th>
						<th class="cursor-pointer" id="type-titleCell">活動類型</th>
						<th class="cursor-pointer" id="discount-titleCell">折扣內容</th>
						<th class="cursor-pointer" id="amount-titleCell">達標金額</th>
						<th class="cursor-pointer" id="start-titleCell">活動開始</th>
						<th class="cursor-pointer" id="end-titleCell">活動結束</th>
						<th>刪除</th>
					</tr>
				</thead>
				<tbody id="activityContent"></tbody>
			</table>
			
			<nav>
			  <ul class="pagination justify-content-center mt-4" id="activityPagination"></ul>
			</nav>
		</div>
	</div>

	<!-- 互動視窗 - 活動設定 -->
	<div class="modal" id="activity-modal" tabindex="-1"
		aria-labelledby="activity-modalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<form class="modal-content" id="activity-form">
				<div class="modal-header">
					<h4 class="modal-title" id="activity-modalLabel">
						<B>活動設定</B>
					</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body px-2">
					<div class="activity-detail" id="detail-id">
						<strong>活動編號：</strong> <input type="text" disabled>

					</div>
					<div class="activity-detail" id="detail-name">
						<strong>活動名稱：</strong> <input type="text" required>
					</div>
					<div class="activity-detail d-flex" id="detail-type">
						<strong>活動類型：</strong> <label class="me-1"><input
							type="radio" name="typeRadio" class="form-check-input"
							value="discount"> 折扣</label> <label class="me-1"><input
							type="radio" name="typeRadio" class="form-check-input"
							value="gift"> 贈禮</label>
					</div>
					<div class="activity-detail" id="detail-discount">
						<strong>折扣內容：</strong> <input type="text" class="discount-price">

						<select class="me-2 p-1 discount-gift" id="discount-category"></select>
						<select class="p-1 discount-gift" id="discount-choose"></select>
					</div>
					<div class="activity-detail" id="detail-amount">
						<strong>達標金額：</strong> <input type="text" required>
					</div>
					<div class="activity-detail" id="detail-start">
						<strong>活動開始：</strong> <input type="date" required>
					</div>
					<div class="activity-detail" id="detail-end">
						<strong>活動結束：</strong> <input type="date" required>
					</div>
				</div>
				<div class="modal-footer justify-content-center">
					<button type="button" class="btn btn-secondary px-5 py-2 mx-4"
						data-bs-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary px-5 py-2 mx-4">確認</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 互動視窗 - 刪除活動 -->
	<div class="modal" id="delete-modal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">
						<B></B>
					</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<strong></strong>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary px-5 py-2 mx-4"
						data-bs-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary px-5 py-2 mx-4">確認</button>
				</div>
			</div>
		</div>
	</div>

</body>
