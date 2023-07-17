	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<!-- Js -->
	<link rel='stylesheet' type="text/css" href="<c:url value='/css/order.css' />" />

	<script type="text/javascript" src="<c:url value='/js/order.js'/>"></script>
	<meta name="_contextPath" content="${pageContext.request.contextPath}" />
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<meta name="_csrf" content="${_csrf.token}"/>
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/css/bootstrap.min.css"> -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.0/js/bootstrap.bundle.min.js"></script> -->
	
	
	<body>
			<ul class="nav nav-tabs" id="orders-tabs">
				<!--這邊點選用Jpa繼承page<>，每頁最多20筆-->
				<li class="nav-item"><a id="link1"
					class="orders-link nav-link active" custom-value="1"
					data-bs-toggle="tab" href="#tab1">全部訂單</a></li>
				<li class="nav-item"><a class="orders-link nav-link"
					custom-value="2" data-bs-toggle="tab" href="#tab1">已成立</a></li>
				<li class="nav-item"><a class="orders-link nav-link"
					custom-value="3" data-bs-toggle="tab" href="#tab1">處理中</a></li>
				<li class="nav-item"><a class="orders-link nav-link"
					custom-value="4" data-bs-toggle="tab" href="#tab1">已完成</a></li>
				<li class="nav-item"><a class="orders-link nav-link"
					custom-value="5" data-bs-toggle="tab" href="#tab1">已取消</a></li>
				<li class="nav-item"><a class="orders-link nav-link"
					custom-value="6" data-bs-toggle="tab" href="#tab1">未付款</a></li>
<!-- 				<li> -->
<!-- 					<button type="button" class="btn btn-primary data-expo"  -->
<!-- 					style="height: 60%;">匯出訂單.CSV</button> -->
<!-- 				</li> -->
			</ul>
	
			<!--搜尋-->
			<div id="order-search" style="display: block;">
				<div class="py-2"></div>
	
				<div class="d-flex">
					<div class="flex-item">
						<ul>
							<li class="order-search"><select class="form-select"
								onchange="changePlaceholder()">
									<option>訂單編號</option>
									<option>電話號碼</option>
									<option>顧客姓名</option>
							</select></li>
	
							<li class="order-search"><input type="text"
								class="form-control" id="search-placeholder"
								placeholder="請輸入訂單編號"></li>
							</li>
	
							<li class="order-search">
								<button type="button" class="btn btn-light" id="orderdata-search">搜尋</button>
								<button type="button" id="order-search-clear"
									class="btn btn-light">清除</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
	
			<!--訂單狀態調整-->
			<div id="order-statechange" style="display: none;">
				<div class="py-2"></div>
	
				<div class="d-flex">
					<div class="flex-item">
						<ul>
							<li class="order-statechoose">已選取&nbsp <span
								id="checkedLength"></span> &nbsp筆訂單
							</li>
							<li class="order-statechoose"><select class="form-select">
									<option>更改狀態</option>
<!-- 									<option>刪除</option> -->
									<option>備註修改</option>
							</select></li>
	
							<li class="order-statechoose"><select class="form-select" id="form-select1">
<!-- 									<option>訂單成立</option> -->
									<option value="order_deal">訂單準備中</option>
									<option value="order_finish">訂單完成</option>
									<option value="order_cancel">訂單取消</option>
							</select></li>
	
							<li class="order-statechoose"><input type="text"
								class="form-control" id="form-control1" placeholder="請輸入備註訊息"></li>
	
							<li class="order-statechoose">
								<button type="button" id="order-statechoose-refresh"
									class="btn btn-light">更新</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
	
			<!-- 互動視窗 - 匯出訂單報表 -->
			<div class="modal" id="data-expo" tabindex="-1"
				aria-labelledby="orders-modalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="orders-modalLabel">匯出訂單</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body px-4">
							<div class="orders-detail">
								<input type="radio" name="data-condition"
									class="order-condition-input"> <strong>當前頁面訂單</strong>
							</div>
							<div class="orders-detail">
								<input type="radio" name="data-condition"
									class="order-condition-input" id="expo-other-condition">
								<strong>其他條件</strong><span></span>
								<div id="order-other-condition" style="display: none">
									4564654</div>
							</div>
						</div>
	
						<div class="modal-footer justify-content-center">
							<button type="button" class="btn btn-danger px-5 py-2 mx-4"
								data-bs-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary px-5 py-2 mx-4"
								data-bs-dismiss="modal">確認</button>
						</div>
					</div>
				</div>
			</div>
	
			<!-- 互動視窗 - 確認更新refresh -->
			<div class="modal" id="order-statechoose-confirm" tabindex="-1"
				aria-labelledby="orders-modalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="orders-modalLabel">確認視窗</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body px-4">
							<div class="orders-detail">
								<!--框移除???-->
								<strong>請問是否要執行?</strong>
							</div>
						</div>
						<div class="modal-footer justify-content-center">
							<button type="button" class="btn btn-danger px-5 py-2 mx-4"
								data-bs-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary px-5 py-2 mx-4"
								data-bs-dismiss="modal">確認</button>
						</div>
					</div>
				</div>
			</div>
	
			<!-- 分頁內容-->
			<div class="tab-content">
				<div class="tab-pane fade show active" id="tab1">
					<div class="py-2"></div>
	
					<table class="orders-table">
						<thead>
							<tr>
								<th><input id="order-checkboxAll" class="form-check-input fs-4" type="checkbox"></th>					
								<th>編號</th>
								<th>單別</th>
								<th>顧客名</th>
								<th>取餐時間</th>
								<th>明細</th>
								<th>總金額</th>
								<th>電話</th>
								<th>訂單狀態</th>
								<th>交易狀態</th>
								<th>備註</th>
							</tr>
						</thead>
	
						<tbody id="orderData-tbody">
	
						</tbody>
					</table>
				</div>
			</div>
	
			<!-- 互動視窗 - 訂單明細 -->
			<div class="modal" id="orders-modal" tabindex="-1"
				aria-labelledby="orders-modalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">
					
						<div class="modal-header" >
							<h5 class="modal-title" id="orders-modalLabel">訂單詳細資訊</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
						</div>
						
						<div class="modal-body px-4">
							<div class="row">
								<div class="left col-6">
									<div class="orders-detail">
										<div>
											<strong>訂單明細：</strong>
											<ul class="mb-0">
												<li id="detail-id">訂單編號：<span></span>
												</li>
	
												<li id="detail-type">單別：<span></span>
												</li>
	
												<li id="detail-phone">
													桌號/電話：<span></span>
												</li>
	
												<li id="detail-time">取餐時間：<span></span>
												</li>
	
												<li id="detail-statusO">訂單狀態：<span></span>
												</li>
											</ul>
										</div>
									</div>
	
									<div class="orders-detail">
										<strong>商品明細：</strong>
										<ul class="mb-0">
											<li id="detail-items">品項：<span></span>
											</li>
										</ul>
									</div>
	
								</div>
	
								<div class="right col-6">
									<div class="orders-detail">
										<strong>付款明細：</strong>
										<ul class="mb-0">
											<li id="activity-type">活動類型：<span></span>
											</li>
											<li id="activity-discount">活動折扣：<span></span>
											</li>
											<li id="activity-gift">活動贈品：<span></span>
											</li>
											<li id="detail-price">總金額：<span></span>
											</li>
											<li id="detail-statusP">交易狀態：<span></span>
											</li>
										</ul>
									</div>
									
									<div class="orders-detail">
										<div>
											<strong>訂單紀錄：</strong>
										</div>
	
										<ul class="mb-0" style="padding-left: 32px;">
											<li id="order-establish">
												<div class="d-flex align-items-center mt-3 order-record">
													<i class="fas fa-circle-down"></i> <span class="ms-3">已成立</span><span
														class="ms-3"></span>
												</div>
	
											</li>
	
											<li id="order-dealed">
												<div class="d-flex align-items-center mt-3 order-record">
													<i class="fas fa-circle-down"></i> <span class="ms-3">處理中</span><span
														class="ms-3"></span>
												</div>
	
											</li>
	
											<li id="order-finished">
												<div class="d-flex align-items-center mt-3 order-record">
													<i class="fas fa-circle-down"></i> <span class="ms-3">已完成</span><span
														class="ms-3"></span>
												</div>
	
											</li>
	
											<li id="order-cancel">
												<div class="d-flex align-items-center mt-3 order-record">
													<i class="fas fa-circle-down"></i> <span class="ms-3">已取消</span><span
														class="ms-3"></span>
												</div>
											</li>
										</ul>
	
									</div>
								</div>
							</div>
	
						</div>
	
						<div class="modal-footer justify-content-center">
							<button type="button" class="btn btn-primary px-5 py-2 mx-4" data-bs-dismiss="modal">確認</button>
						</div>
					
					</div>
				</div>
			</div>
	
	
	</body>
