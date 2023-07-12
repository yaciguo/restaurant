<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link rel='stylesheet' href="<c:url value='/css/checkout.css' />" />
<script src="<c:url value='js/checkout.js' />"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->


<meta name="_contextPath" content="${pageContext.request.contextPath}" />
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>

<body>
	<ul class="nav nav-tabs" id="payment-tabs">
		<li class="nav-item"><a class="payment-link nav-link active"
			data-bs-toggle="tab" href="#tab1">內用</a></li>
		<li class="nav-item"><a class="payment-link nav-link"
			data-bs-toggle="tab" href="#tab2">外帶</a></li>
		<li class="nav-item"><a class="payment-link nav-link"
			data-bs-toggle="tab" href="#tab3">已結帳</a></li>
	</ul>

	<!-- 分頁內容-->
	<div class="tab-content">
		<!-- 標籤一 - 內用-->
		<div class="tab-pane fade show active" id="tab1">
			<table class="payment-table">
				<thead>
					<tr>
						<th id="id-titleCell">結帳單號</th>
						<th id="name-titleCell">桌號</th>
						<th id="meal-titleCell">明細</th>
						<th id="amount-titleCell">金額</th>
					</tr>
				</thead>

				<tbody id="eatInContent"></tbody>
			</table>

			<nav>
				<ul class="pagination justify-content-center mt-4"
					id="eatInPagination"></ul>
			</nav>
		</div>

		<!-- 標籤二 - 外帶 -->
		<div class="tab-pane fade" id="tab2">
			<table class="payment-table">
				<thead>
					<tr>
						<th id="id-titleCell">結帳單號</th>
						<th id="name-titleCell">顧客</th>
						<th id="phone-titleCell">電話</th>
						<th id="meal-titleCell">明細</th>
						<th id="amount-titleCell">金額</th>
					</tr>
				</thead>

				<tbody id="takeOutContent"></tbody>
			</table>

			<nav>
				<ul class="pagination justify-content-center mt-4"
					id="takeOutPagination"></ul>
			</nav>
		</div>
		
		<!-- 標籤三 - 已結帳-->
		<div class="tab-pane fade" id="tab3">
			<table class="payment-table">
				<thead>
					<tr>
						<th id="id-titleCell">結帳單號</th>
						<th id="name-titleCell">顧客</th>
						<th id="time-titleCell">結帳時間</th>
						<th id="amount-titleCell">金額</th>
					</tr>
				</thead>

				<tbody id="paidContent"></tbody>
			</table>

			<nav>
				<ul class="pagination justify-content-center mt-4"
					id="paidPagination"></ul>
			</nav>
		</div>
		
	</div>

	<!-- 互動視窗 - 訂單付款 -->
	<div class="modal" id="payment-modal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">
						<B>訂單明細</B>
					</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body px-2">
					<div class="row">
						<div class="col-6 paymentBody"></div>
						<div class="col-6 calculatorBody d-flex align-items-center">
							<div class="calculator border text-center">
								<input type="text" id="cashInput"
									class="input m-2 text-end w-75 fs-3 d-inline" maxlength="10" readonly>
								<div class="row justify-content-center mx-2">
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('7')">7</div>
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('8')">8</div>
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('9')">9</div>
								</div>
								<div class="row justify-content-center mx-2">
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('4')">4</div>
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('5')">5</div>
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('6')">6</div>
								</div>
								<div class="row justify-content-center mx-2">
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('1')">1</div>
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('2')">2</div>
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('3')">3</div>
								</div>
								<div class="row justify-content-center mx-2">
									<div class="btn w-25 m-2 py-2 btn-secondary"
										onclick="clearInput()">C</div>
									<div class="btn w-25 m-2 py-2 btn-warning"
										onclick="appendToInput('0')">0</div>
									<div class="btn w-25 m-2 py-2 btn-secondary"
										onclick="deleteLastCharacter()">&#8592;</div>
								</div>
								<div>
									<div class="btn w-75 btn-primary m-2 py-2"
										onclick="showConfirm()">結帳</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- 互動視窗 - 確認付款 -->
	<div class="modal" id="comfirm-modal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">
						<B>付款確認</B>
					</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary px-5 py-2 mx-4"
						data-bs-dismiss="modal">取消</button>
					<button type="submit" class="btn btn-primary px-5 py-2 mx-4"
						data-bs-dismiss="modal" onclick="calculate()">確認</button>
				</div>
			</div>
		</div>
	</div>
</body>
