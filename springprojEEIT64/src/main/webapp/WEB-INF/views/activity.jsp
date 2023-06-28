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
<<<<<<< HEAD
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- jquery 框架 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- fontAwesome - icon插件 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"  />
=======
<link href="./assets/src/plugins/bootstrap5.2/bootstrap.min.css"
	rel="stylesheet">
<script src="./assets/src/plugins/bootstrap5.2/bootstrap.bundle.min.js"></script>

<!-- jquery 框架 -->
<script type="text/javascript"
	src="./assets/src/plugins/jquery/jquery-1.11.0.min.js"></script>

<!-- fontAwesome - icon插件 -->
<link href="./assets/src/plugins/fontawesome/css/all.min.css"
	rel="stylesheet">
>>>>>>> origin/sara

<link rel='stylesheet' href="<c:url value='/css/activity.css' />" />

</head>

<body>
	<!-- 左側導覽列 -->
<<<<<<< HEAD
	<%@ include file="sideNav.jsp"%>
=======
	<%@ include file="sideNav.jsp" %>
>>>>>>> origin/sara

	<!-- 主要內容區域 -->
	<div id="main-content" class="main-content">
		<ul class="nav nav-tabs" id="activity-tabs">
			<li class="nav-item"><a class="activity-link nav-link active"
<<<<<<< HEAD
				data-bs-toggle="tab" href="#tab1">廣告看板</a></li>
			<li class="nav-item"><a class="activity-link nav-link"
				data-bs-toggle="tab" href="#tab2">活動設定</a></li>
=======
					data-bs-toggle="tab" href="#tab1">廣告看板</a></li>
			<li class="nav-item"><a class="activity-link nav-link"
					data-bs-toggle="tab" href="#tab2">活動設定</a></li>
>>>>>>> origin/sara
		</ul>

		<!-- 分頁內容-->
		<div class="tab-content">

			<!-- 標籤一 - 廣告看板-->
			<div class="tab-pane fade show active" id="tab1">
				<div class="py-4">
<<<<<<< HEAD
					<span><B>新增輪播圖：</B></span> <input type="file" accept=".jpg, .png"
						id="bannerInput">
				</div>

				<div class="bannerContent"></div>
			</div>
			
=======
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

>>>>>>> origin/sara
			<!-- 標籤二 - 活動設定 -->
			<div class="tab-pane fade" id="tab2">
				<div class="py-4">
					<button type="button" class="btn btn-primary add-activity"
<<<<<<< HEAD
						onclick="openModal(this)">
=======
						data-bs-toggle="modal" data-bs-target="#activity-modal">
>>>>>>> origin/sara
						<i class="fa-solid fa-plus "></i>
					</button>
				</div>

				<table class="activity-table">
					<thead>
						<tr>
<<<<<<< HEAD
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
					<tbody id="activityBody"></tbody>
				</table>
				
				<nav>
				  <ul class="pagination justify-content-center mt-4" id="activityPagination">
<!-- 				    <li class="page-item"><a class="page-link" href="#">&laquo;</a></li> -->
<!-- 				    <li class="page-item"><a class="page-link" onclick="loadActivityData(1)">1</a></li> -->
<!-- 				    <li class="page-item"><a class="page-link" onclick="loadActivityData(2)">2</a></li> -->
<!-- 				    <li class="page-item"><a class="page-link" onclick="loadActivityData(3)">3</a></li> -->
<!-- 				    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li> -->
				  </ul>
				</nav>
=======
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
>>>>>>> origin/sara
			</div>
		</div>

		<!-- 互動視窗 - 活動設定 -->
		<div class="modal" id="activity-modal" tabindex="-1"
			aria-labelledby="activity-modalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
<<<<<<< HEAD
				<form class="modal-content" id="activity-form">
=======
				<div class="modal-content">
>>>>>>> origin/sara
					<div class="modal-header">
						<h4 class="modal-title" id="activity-modalLabel">
							<B>活動設定</B>
						</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
<<<<<<< HEAD
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
=======
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
>>>>>>> origin/sara
						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-secondary px-5 py-2 mx-4"
							data-bs-dismiss="modal">取消</button>
<<<<<<< HEAD
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
=======
						<button type="button" class="btn btn-primary px-5 py-2 mx-4"
							data-bs-dismiss="modal">確認</button>
>>>>>>> origin/sara
					</div>
				</div>
			</div>
		</div>

	</div>

</body>


<script>
	$(function() {
<<<<<<< HEAD
		loadBannerData();
		
		// 監聽 上傳輪播圖圖片
		$('#bannerInput').on('change', function(event) {
			var file = event.target.files[0];

			if (file) {
				var reader = new FileReader();
				reader.readAsDataURL(file);

				reader.onload = function() {
					sendBannerData(reader.result)
				};
			}
		});
		
		
		// 監聽 活動連結 失去焦點時
		$('.bannerContent').on('blur', '.activity-text', function () {
	        var bannerIdValue = $(this).closest('.activity-banner').data('id');
	        var urlValue = $(this).val();
	        
	        // 有效網址判斷
	        var urlPattern = /^(https?:\/\/)?([\w.]+)\.([a-z]{2,6}\.?)(\/[\w.]*)*\/?$/i;
	
	        if (urlValue != '') {
	            if (urlPattern.test(urlValue)) {
	            	sendBannerUrl(bannerIdValue, urlValue);
	            } else {
	            	$(this).siblings('.error-message').text('請輸入正確的網址，https://').show();
	            }
	        } else{
	        	$(this).siblings('.error-message').text('').hide();
	        }
	    });

		$(".activity-table th").on("click", function() {
		  var columnName = $(this).text();
		  
		  var sortDirection = "asc";
		  if ($(this).hasClass("sorted")) {
		    sortDirection = $(this).hasClass("asc") ? "desc" : "asc";
		  }

		  $.ajax({
		    url: '${pageContext.request.contextPath}/resortActivity',
		    type: "GET",
		    data: {
		      sortColumn: columnName,
		      sortDirection: sortDirection
		    },
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        },
		    success: function(response) {
		    	generateActivityTable(response);
		    	
		    	$(".activity-table th").removeClass("sorted asc desc");
				$(this).addClass("sorted " + sortDirection);
		    },
		    error: function(xhr, status, error) {
		      console.error("活動排序失敗:" + error);
		    }
		  });
		});
		
		// 活動類型 預設折扣 -> 不顯示贈禮
		$('.discount-gift').hide();
		$('.discount-price').attr('required', 'required');
		// 監聽 活動類型 的 change 事件
		$('input[name="typeRadio"]').change(function() {
			var selectedValue = $(this).val();
			if (selectedValue === "discount") {
				$('.discount-price').show();
				$('.discount-price').attr('required', 'required');
				$('.discount-gift').hide();
			} else if (selectedValue === "gift") {
				$('.discount-gift').show();
				$('.discount-price').hide();
				$('.discount-price').removeAttr('required');

				var cIdValue = $('#discount-category option:selected').attr('data-id');
				var dIdValue = $('#discount-category option:selected').attr('data-dishId');

				if ($('#discount-category').val() == "") {
					loadCategoryData();
				} else {
					loadCategoryData(cIdValue, dIdValue);
				}
			}
		});

		// 監聽 折扣內容的餐點類別 change 事件
		$('#discount-category').change(function() {
			var categoryId = $(this).find('option:selected').data('id');

			loadDishInCategoryData(categoryId);
		});

		// 監聽 折扣內容的餐點選擇 change 事件
		$('#discount-choose').change(function() {

			var id = $('#discount-choose option:selected').attr('data-id');
			$('#discount-category option:selected').attr('data-dishId', id);
		});

		// 監聽 互動視窗 - 刪除活動 的 確認按鈕 點擊事件
	    $('#delete-modal button[type="submit"]').on('click', function () {
	    	var target = $(this).parent().siblings('.modal-header').attr('data-id');

	    	if (target == 'banner'){
	    		deleteBanner($('#delete-modal').data('banner-id'));
	    	} else {
	    		deleteActivity($('#delete-modal').data('activity-id'));
	    	}
	    });

		// 控制輸入框 活動開始/結束 
		var startDateInput = $('#detail-start input');
		var endDateInput = $('#detail-end input');

		startDateInput.on('change', validateOptionForEndDate);

		startDateInput.on('click', function() {
			var startDate = new Date(startDateInput.val());
			var current = new Date().toISOString().split('T')[0];
			var minDate;

			if (isNaN(startDate)) {
				minDate = current;
			} else {
				minDate = (startDate < current) ? startDate : current;
			}

			startDateInput.prop('min', minDate);
		});

		endDateInput.on('click', function() {
			var startDate = new Date(startDateInput.val());
			var current = new Date().toISOString().split('T')[0];
			var minDate;

			if (isNaN(startDate)) {
				minDate = current;
			} else {
				minDate = startDate.toISOString().split('T')[0];
			}

			startDate.setDate(startDate.getDate() + 1);
			endDateInput.prop('min', minDate);
		});

		// 活動結束日期必須在活動開始日期之後
		function validateOptionForEndDate() {
			var startDate = new Date(startDateInput.val());
			var endDate = new Date(endDateInput.val());
			if (endDate < startDate) {
				endDateInput.val(startDateInput.val());
			}
		}

		// 監聽 Bootstrap Tabs 切換事件
		$('#activity-tabs').on('shown.bs.tab', function(e) {
			var targetTab = $(e.target).attr('href');
			if (targetTab === '#tab2') {
				loadActivityData();
				loadCategoryData();
			}else{
				loadBannerData();
			}
		});

		// 監聽 確認新增活動 事件
		$('#activity-form').on('submit', function(e) {
			e.preventDefault();
			sendActivityData();
		});
	});
	
	// 讀取 輪播圖資料
	function loadBannerData(){
		$.ajax({
			url : '${pageContext.request.contextPath}/queryBanner',
			type : 'GET',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        },
			success : function(response) {
				console.log("--------------ajax-Banner");
				$('#bannerContent').empty();
				
				var htmlContent = '';
				for (var i = 0; i < response.length; i++) {
					var banner = response[i];
					htmlContent += '<div class="activity-banner py-4" data-id="' + banner.id + '">';
					htmlContent += '<B>廣告' + (i+1) + '</B>';
					htmlContent += '<div class="row mt-4 ms-1 d-flex align-items-center">';
				    htmlContent += '<img class="col-4" src="' + banner.pic + '">';
					htmlContent += '<div class="col-7 d-block">';
					htmlContent += '<span><B>活動連結：</B></span>';
					htmlContent += '<input type="text" class="activity-text" value="' + (banner.url ? banner.url : '') + '">';
					htmlContent += '<p class="error-message text-danger"></p>';
					htmlContent += '</div>';
					htmlContent += '<i class="fa-solid fa-trash col-1 text-center" onclick="deleteBannerAlert(event)"></i>';
					htmlContent += '</div></div>';
				    
				    $('.bannerContent').html(htmlContent);
				}
			},
			error : function(error) {
				console.log('輪播圖讀取失敗:', error);
			}
		})
	};
	
	// 讀取產品類別資料
	function loadCategoryData(selectedId, dishId) {
		$.ajax({
			url : '${pageContext.request.contextPath}/queryCategory',
			type : 'GET',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        },
			success : function(response) {
				console.log("--------------ajax-Category");

				var choosedId = $('#discount-category option:selected').attr('data-dishId');

				$('#discount-category').empty();

				for (var i = response.length - 1; i >= 0; i--) {
					var category = response[i];
					var option = $('<option></option>').text(category.name).attr('data-id', category.id);

					if (selectedId == category.id) {
						option.prop('selected', true);

						if (choosedId) {
							option.attr('data-dishId', choosedId);
						}
					}

					$('#discount-category').append(option);
				}

				if (selectedId == null) {
					loadDishInCategoryData($('#discount-category option:selected').attr('data-id'));
				} else {
					loadDishInCategoryData(selectedId, dishId);
				}
			},
			error : function(error) {
				console.log('類別讀取失敗:', error);
			}
		});
	}

	// 讀取類別中品項資料
	function loadDishInCategoryData(cid, did) {
		$.ajax({
			url : '${pageContext.request.contextPath}/queryDish?categoryId=' + cid,
			type : 'GET',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        },
			success : function(response) {
				console.log("--------------ajax-Dish");
				$('#discount-choose').empty();

				for (var i = 0; i < response.length; i++) {
					var dish = response[i];
					var option = $('<option></option>').text(dish.name).attr('data-id', dish.id);

					if (did == dish.id) {
						option.prop('selected', true);
					}

					$('#discount-choose').append(option);
				}

				var id = $('#discount-choose option:selected').attr('data-id');
				$('#discount-category option:selected').attr('data-dishId', id);
			},
			error : function(error) {
				console.log('品項讀取失敗:', error);
			}
		});
	}

	// 讀取所有活動資料
	function loadActivityData(pageId) {
		var pid = (pageId === undefined) ? 1 : pageId;
		
		$.ajax({
			url : '${pageContext.request.contextPath}/queryActivity?pageNumber=' + pid,
			type : 'GET',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        },
			success : function(response) {
				console.log("--------------ajax-Activity"+response.number);
				console.log(response);
				var currentPage = response.number + 1;
				generateActivityTable(response.content);
				generatePagination(response.totalPages,currentPage);
			},
			error : function(error) {
				console.log('活動讀取失敗:', error);
			}
		});
	}
	
	// 動態生成表格內容
	function generateActivityTable(response){
		$('#activityBody').empty();
		
		var htmlContent = '';
		for (var i = 0; i < response.length; i++) {
			var bean = response[i];
			htmlContent += '<tr onclick="openModal(this)">';
			htmlContent += '<td id="id-cell">' + bean.id + '</td>';
			htmlContent += '<td id="name-cell">' + bean.name + '</td>';
	
			var activityType = bean.type;
			if (activityType == "discount") {
				htmlContent += '<td id="type-cell" value="' + bean.type + '">折扣</td>';
				htmlContent += '<td id="discount-cell">' + bean.discount + '</td>';
			} else {
				htmlContent += '<td id="type-cell" value="' + bean.type + '">贈禮</td>';
				htmlContent += '<td id="discount-cell" data-category="' + bean.dishBean.categoryBean.name + '" data-cId="' + bean.dishBean.categoryBean.id + '" data-dId="' + bean.dishBean.id + '">'
						+ bean.dishBean.name + '</td>';
			}
	
			htmlContent += '<td id="amount-cell">' + bean.amount + '</td>';
			htmlContent += '<td id="start-cell">' + bean.startDate + '</td>';
			htmlContent += '<td id="end-cell">' + bean.endDate + '</td>';
			htmlContent += '<td><i class="fa-solid fa-trash" onclick="deleteActivityAlert(event); event.stopPropagation();"></i></td>';
			htmlContent += '</tr>';
		};
		
		$('#activityBody').html(htmlContent);
	}
	
	// 動態生成分頁導覽列內容
	function generatePagination(totalPages, currentPage){
		$('#activityPagination').empty();

		var htmlContent = '';
		htmlContent += '<li class="page-item"><a class="page-link" onclick="changePage(\'prev\', ' + totalPages + ', ' + currentPage + ')">&laquo;</a></li>';
		for (var i = 1; i <= totalPages; i++) {
	        if (i == currentPage) {
	            htmlContent += '<li class="page-item active"><a class="page-link" onclick="loadActivityData(' + i + ')">' + i + '</a></li>';
	        } else {
	            htmlContent += '<li class="page-item"><a class="page-link" onclick="loadActivityData(' + i + ')">' + i + '</a></li>';
	        }
	    }
		htmlContent+='<li class="page-item"><a class="page-link" onclick="changePage(\'next\', ' + totalPages + ', ' + currentPage + ')">&raquo;</a></li>';
		
		$('#activityPagination').html(htmlContent);
	}
	
	// 按鈕觸發換頁
	function changePage(option,totalPages, currentPage){
		var newPage;
		if (option === 'prev') {
		  newPage = Math.max(currentPage - 1, 1);
		} else {
		  newPage = Math.min(currentPage + 1, totalPages);
		}
		
		if (newPage == currentPage){
			return
		}
		
		loadActivityData(newPage);
	}
	
	// 開啟互動視窗 - 刪除輪播圖 
	function deleteBannerAlert(event) {
		var modal = $('#delete-modal');
		modal.find('.modal-header').attr('data-id', 'banner');
		modal.find('.modal-title B').html('刪除廣告');
		
		var bannerName = $(event.target).parent().parent().find('B').html();
		var strongElement = modal.find('.modal-body strong');
		strongElement.html('確定刪除 <span style="color: red">' + bannerName + '</span> ?');

		var bannerId = $(event.target).parent().parent().attr('data-id');
		modal.data('banner-id', bannerId);
		
		var modalInstance = new bootstrap.Modal(modal);
		modalInstance.show();
	}
	
	// 開啟互動視窗 - 刪除活動 
	function deleteActivityAlert(event) {
		var modal = $('#delete-modal');
		modal.find('.modal-header').attr('data-id', 'activity');
		modal.find('.modal-title B').html('刪除活動');
		
		var nameCell = $(event.target).closest('tr').find('#name-cell').text();
		var strongElement = modal.find('.modal-body strong');
		strongElement.html('確定刪除 <span style="color: red">' + nameCell + '</span> 活動?');

		var activityId = $(event.target).closest('tr').find('#id-cell').text();
		modal.data('activity-id', activityId);

		var modalInstance = new bootstrap.Modal(modal);
		modalInstance.show();
	}

	// 開啟互動視窗 - 活動設定
	function openModal(row) {
		var modal = $('#activity-modal');
		modal.find('#discount-category').val('');

		if (row.tagName === "BUTTON") {
			modal.find('#detail-id').hide();
			modal.find('input[type="text"]').val('');
			modal.find('input[type="radio"]').prop('checked', false).first().prop('checked', true);
			modal.find('.discount-price').show();
			modal.find('.discount-gift').hide();
			modal.find('#discount-category').prop('selectedIndex', 0);
			modal.find('#discount-choose').prop('selectedIndex', 0);
			modal.find('input[type="date"]').val('');

		} else {
			modal.find('#detail-id').show();
			var activityId = $(row).find('#id-cell').text();
			var activityName = $(row).find('#name-cell').text();
			var activityType = $(row).find('#type-cell').attr('value');
			var activityDiscount = $(row).find('#discount-cell').text();
			var activityAmount = $(row).find('#amount-cell').text();
			var activityStart = $(row).find('#start-cell').text();
			var activityEnd = $(row).find('#end-cell').text();

			modal.find('#detail-id input').val(activityId);
			modal.find('#detail-name input').val(activityName);

			var typeOptions = modal.find('#detail-type label');
			typeOptions.each(function() {
				var optionRadio = $(this).find('input[type="radio"]');
				optionRadio.prop('checked', false);
				if (activityType === optionRadio.val()) {
					optionRadio.prop('checked', true);
				}
			});

			if (activityType === "discount") {
				$('.discount-price').show();
				$('.discount-price').attr('required', 'required');
				$('.discount-gift').hide();
				modal.find('#detail-discount input').val(activityDiscount);
			} else {
				var categoryValue = $(row).find("#discount-cell").attr("data-category");
				var cIdValue = $(row).find("#discount-cell").attr("data-cId");
				var dIdValue = $(row).find("#discount-cell").attr("data-dId");

				$('.discount-gift').show();
				$('.discount-price').hide();
				$('.discount-price').removeAttr('required');

				loadDishInCategoryData(cIdValue, dIdValue)

				$("#discount-category option").each(function(e) {
					if ($(this).val() === categoryValue) {
						$(this).prop("selected", true)
							.attr('data-dishId',$(row).find("#discount-cell")
							.attr("data-dId"));
					}
				});

			}

			modal.find('#detail-amount input').val(activityAmount);
			modal.find('#detail-start input').val(activityStart);
			modal.find('#detail-end input').val(activityEnd);
		}
=======
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
>>>>>>> origin/sara

		var modalInstance = new bootstrap.Modal(modal);
		modalInstance.show();
	}
<<<<<<< HEAD

	// 新增輪播圖
	function sendBannerData(base64Image) {
		$.ajax({
			url : '${pageContext.request.contextPath}/saveBannerImg',
			type : 'POST',
			data: JSON.stringify({ imageBase64: base64Image }),
			contentType : 'application/json',
			beforeSend: function(xhr) {
		        xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
		    },
			success : function(response) {
				loadBannerData();
				$('#bannerInput').val('');
			},
			error : function(error) {
				console.log('輪播圖保存失敗:', error);
			}
		});
	}
	
	// 更新輪播圖 活動連結
	function sendBannerUrl(bid, url) {
		var requestData = {
		        id: bid,
		        url: url
		    };
		
	    var errorMessage = $('.bannerContent').find('[data-id="' + bid + '"]').find('.error-message');
	    errorMessage.text('儲存連結中...').show();
	    
		$.ajax({
			url : '${pageContext.request.contextPath}/updateBannerUrl',
			type : 'POST',
			data: JSON.stringify(requestData),
			contentType : 'application/json',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        },
			success : function(response) {
				setTimeout(function () {
	                errorMessage.hide();
	            }, 1000); 
			},
			error : function(error) {
				console.log('活動連結保存失敗:', error);
			}
		});
	}
	
	// 新增活動
	function sendActivityData() {
		var activityId = ($('#detail-id input').val() !== '') ? $('#detail-id input').val() : '0';

		var activityName = $('#detail-name input').val();
		var activityType = $('input[name="typeRadio"]:checked').val();

		var activityDiscount;
		var activityDishId;
		if (activityType == "discount") {
			activityDiscount = $('#detail-discount input').val();
			activityDishId = "NULL";
		} else {
			activityDiscount = "0";
			activityDishId = $("#discount-choose option:selected").attr("data-id");
		}

		var activityAmount = $('#detail-amount input').val();
		var activityStart = new Date($('#detail-start input').val());
		var activityEnd = new Date($('#detail-end input').val());

		var activityData = {
			id : activityId,
			name : activityName,
			type : activityType,
			discount : activityDiscount,
			amount : activityAmount,
			start : activityStart,
			end : activityEnd,
			dishId : activityDishId,
		};

		$.ajax({
			url : '${pageContext.request.contextPath}/saveActivity',
			type : 'POST',
			data : JSON.stringify(activityData),
			contentType : 'application/json',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        },
			success : function(response) {
				$('#activity-modal').modal('hide');
				loadActivityData();
			},
			error : function(error) {
				console.log('活動保存失敗:', error);
			}
		});
	}
	
	// 刪除輪播圖
	function deleteBanner(id) {
	    $.ajax({
	        url: '${pageContext.request.contextPath}/deleteBanner?bId=' + id,
	        type: 'DELETE',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        },
	        success: function (response) {
	            console.log("--------------ajax-deleteBanner");
	            $('#delete-modal').modal('hide');
	    		loadBannerData();
	        },
	        error: function (error) {
	            console.log('輪播圖刪除失敗:', error);
	        }
	    });
	}
	
	// 刪除活動
	function deleteActivity(id) {
	    $.ajax({
	        url: '${pageContext.request.contextPath}/deleteActivity?activityId=' + id,
	        type: 'DELETE',
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
	        },
	        success: function (response) {
	            console.log("--------------ajax-deleteActivity");
	            $('#delete-modal').modal('hide');
	            loadActivityData();
	        },
	        error: function (error) {
	            console.log('輪播圖刪除失敗:', error);
	        }
	    });
	}
	
	
=======
>>>>>>> origin/sara
</script>

</html>