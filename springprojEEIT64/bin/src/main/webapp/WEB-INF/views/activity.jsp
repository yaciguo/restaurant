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
	<%@ include file="sideNav.jsp"%>

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
					<button type="button" class="btn btn-primary add-activity" onclick="openModal(this)">
						<i class="fa-solid fa-plus "></i>
					</button>
				</div>

				<table class="activity-table">
					<thead>
						<tr>
							<th id="id-titleCell">活動編號</th>
							<th id="name-titleCell">活動名稱</th>
							<th id="type-titleCell">活動類型</th>
							<th id="discount-titleCell">折扣內容</th>
							<th id="amount-titleCell">達標金額</th>
							<th id="start-titleCell">活動開始</th>
							<th id="end-titleCell">活動結束</th>
							<th>刪除</th>
						</tr>
					</thead>
					<tbody id="activityBody">
<%-- 						<c:forEach var="bean" items="${allActivity}"> --%>
<!-- 							<tr onclick="openModal(this)"> -->
<%-- 								<td id="id-cell">${bean.id}</td> --%>
<%-- 								<td id="name-cell">${bean.name}</td> --%>
<%-- 								<td id="type-cell">${bean.type}</td> --%>
<%-- 								<td id="discount-cell">${bean.discount}</td> --%>
<%-- 								<td id="amount-cell">${bean.amount}</td> --%>
<%-- 								<td id="start-cell">${bean.startDate}</td> --%>
<%-- 								<td id="end-cell">${bean.endDate}</td> --%>
<!-- 								<td><i class="fa-solid fa-trash"></i></td> -->
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
					</tbody>
				</table>
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
							<strong>活動編號：</strong>
							<input type="text" disabled>
							
						</div>
						<div class="activity-detail" id="detail-name">
							<strong>活動名稱：</strong>
							<input type="text" required>
						</div>
                        <div class="activity-detail d-flex" id="detail-type">
                            <strong>活動類型：</strong>
                            <label class="me-1"><input type="radio" name="typeRadio" class="form-check-input" value="discount"> 折扣</label>
                            <label class="me-1"><input type="radio" name="typeRadio" class="form-check-input" value="gift"> 贈禮</label>
                        </div>
						<div class="activity-detail" id="detail-discount">
                            <strong>折扣內容：</strong>
                            <input type="text" class="discount-price">

                            <select class="me-2 p-1 discount-gift" id="discount-category">
<!--                                 <option value="sides">小菜</option> -->
<!--                                 <option value="drinks" selected>飲料</option> -->
<!--                                 <option value="desserts">甜點</option> -->
                            </select>
                            <select class="p-1 discount-gift" id="discount-choose">
<!--                                 <option value="blacktea">紅茶</option> -->
<!--                                 <option value="greentea">綠茶</option> -->
<!--                                 <option value="milktea">奶茶</option> -->
<!--                                 <option value="coffee">咖啡</option> -->
                            </select>
                        </div>
						<div class="activity-detail" id="detail-amount">
							<strong>達標金額：</strong>
							<input type="text" required>
						</div>
						<div class="activity-detail" id="detail-start">
							<strong>活動開始：</strong>
							<input type="date" required>
						</div>
						<div class="activity-detail" id="detail-end">
							<strong>活動結束：</strong>
							<input type="date" required>
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
                        <h4 class="modal-title"><B>刪除活動</B></h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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

	</div>

</body>


<script>
	$(function() {
		
        // 活動類型 預設折扣 -> 不顯示贈禮
        $('.discount-gift').hide();
        $('.discount-price').attr('required', 'required');
        // 監聽 活動類型 的 change 事件
        $('input[name="typeRadio"]').change(function () {
            $('.discount-price').val('');
            $('#discount-choose').val('');
            
            var selectedValue = $(this).val();
            if (selectedValue === "discount") {
                $('.discount-price').show();
                $('.discount-price').attr('required', 'required');
                $('.discount-gift').hide();
            } else if (selectedValue === "gift") {
            	loadCategoryData();
                $('.discount-gift').show();
                $('.discount-price').hide();
                $('.discount-price').removeAttr('required');
            }
        });
        
     	// 監聽 折扣內容的餐點類別 change 事件
        $('#discount-category').change(function() {
            var categoryId = $(this).find('option:selected').data('id');

            loadDishInCategoryData(categoryId);
        });

		// 控制輸入框 活動開始/結束 
        var startDateInput = $('#detail-start input');
        var endDateInput = $('#detail-end input');

        startDateInput.on('change', validateOptionForEndDate);

        startDateInput.on('click', function () {
            var startDate = new Date(startDateInput.val());
            var current = new Date().toISOString().split('T')[0];
            var minDate;

            if (isNaN(startDate)) {
                minDate = current;
            } else {
                minDate = (startDate < current) ? startDate : current;
                console.log("else"+startDate +" / "+ current)
            }

            startDateInput.prop('min', minDate);
        });

        endDateInput.on('click', function () {
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
	    $('#activity-tabs').on('shown.bs.tab', function (e) {
	        var targetTab = $(e.target).attr('href');
	        if (targetTab === '#tab2') {
	            loadActivityData();
	        }
	    });
	    
	 	// 監聽 確認新增活動 事件
	    $('#activity-form').on('submit', function (e) {
	    	e.preventDefault();
	    	sendActivityData();
	    });
	    
	 
    });
	
	// 讀取產品類別資料
	function loadCategoryData(selectedId){
		$.ajax({
            url: '${pageContext.request.contextPath}/queryCategory',
            type: 'GET',
            success: function (response) {
	            console.log("--------------ajax-Category");
	            $('#discount-category').empty();
	            
	            for (var i = response.length-1; i >= 0 ; i--) {
	                var category = response[i];
	                var option = $('<option></option>')
					                .text(category.name)
					                .attr('data-id', category.id);
	                $('#discount-category').append(option);
	            }

                console.log($('#discount-category option:selected').attr('data-id'));
                
                if(selectedId==null){
    	            loadDishInCategoryData($('#discount-category option:selected').attr('data-id'));
           
                }else{

    	            loadDishInCategoryData(selectedId);
                }
				
            },
            error: function (error) {
                console.log('活動讀取失敗:', error);
            }
        });
    }
	
	// 讀取類別中品項資料
	function loadDishInCategoryData(cid){
		$.ajax({
            url: '${pageContext.request.contextPath}/queryDish?categoryId='+cid,
            type: 'GET',
            success: function (response) {
	            console.log("--------------ajax-Dish "+cid);
	            $('#discount-choose').empty();
	            for (var i = 0; i <response.length ; i++) {
	                var dish = response[i];
	                var option = $('<option></option>')
					                .text(dish.name)
					                .attr('data-id', dish.id);
	                
	                
	                $('#discount-choose').append(option);
	            }
				
            },
            error: function (error) {
                console.log('品項讀取失敗:', error);
            }
        });
    }
	
	
	// 讀取所有活動資料
	function loadActivityData() {
        $.ajax({
            url: '${pageContext.request.contextPath}/queryActivity',
            type: 'GET',
            success: function (response) {
	            console.log("--------------ajax-Activity");
                $('#activityBody').empty();

                // 動態生成表格內容
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
//                         htmlContent += '<td id="discount-cell">' + bean.dishBean.name + '</td>';
                        htmlContent += '<td id="discount-cell" data-category="' + bean.dishBean.categoryBean.name + '" data-cId="' + bean.dishBean.categoryBean.id + '">' + bean.dishBean.name + '</td>';

                    }
                    
                    htmlContent += '<td id="amount-cell">' + bean.amount + '</td>';
                    htmlContent += '<td id="start-cell">' + bean.startDate + '</td>';
                    htmlContent += '<td id="end-cell">' + bean.endDate + '</td>';
                    htmlContent += '<td><i class="fa-solid fa-trash" onclick="deleteActivity(event); event.stopPropagation();"></i></td>';
                    htmlContent += '</tr>';
                };

                // 更新 activityBody 的內容
                $('#activityBody').html(htmlContent);

            },
            error: function (error) {
                console.log('活動讀取失敗:', error);
            }
        });
    }


    // 開啟互動視窗 - 刪除活動 
    function deleteActivity(event) {
        var modal =  $('#delete-modal');
        
        var nameCell = $(event.target).closest('tr').find('#name-cell').text();
        var strongElement = modal.find('.modal-body strong');
        strongElement.html('確定刪除 <span style="color: red">' + nameCell + '</span> 活動?');

        var modalInstance = new bootstrap.Modal(modal);
        modalInstance.show();
    }

    // 開啟互動視窗 - 活動設定
function openModal(row) {
        var modal = $('#activity-modal');

        if (row.tagName === "BUTTON") {
            modal.find('#detail-id').hide();
            modal.find('input[type="text"]').val('');
            modal.find('input[type="radio"]').prop('checked', false).first().prop('checked', true);
            modal.find('.discount-price').show();
            modal.find('.discount-gift').hide();
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
            typeOptions.each(function () {
                var optionRadio = $(this).find('input[type="radio"]');
                optionRadio.prop('checked', false);
                if (activityType === optionRadio.val()) {
                    optionRadio.prop('checked', true);
                }
            });
            console.log($(row))
            if (activityType === "discount") {
                $('.discount-price').show();
                $('.discount-price').attr('required', 'required');
                $('.discount-gift').hide();
                modal.find('#detail-discount input').val(activityDiscount);
            } else {
                var categoryValue = $(row).find("#discount-cell").attr("data-category");
                var cIdValue = $(row).find("#discount-cell").attr("data-cId");
                loadCategoryData(cIdValue);
                $(document).ajaxComplete(function(event, xhr, settings) {
                	  if (settings.url === '${pageContext.request.contextPath}/queryCategory' && xhr.status === 200) {
                	    // 在指定的 AJAX 請求回傳成功後執行的程式碼
                	    $('.discount-gift').show();
                	    $('.discount-price').hide();
                	    $('.discount-price').removeAttr('required');

                	    
                
                console.log("categoryValue: "+categoryValue+"DatacId: "+cIdValue);
                console.log("--------");
                $("#discount-category option").each(function () {
                    
//                     console.log("$(this): "+$(this)+" val: "+$(this).val())
                    if ($(this).val() === categoryValue) {
                        $(this).prop("selected", true);
                    }
                });

                	  }
                if (settings.url === ('${pageContext.request.contextPath}/queryDish?categoryId='+cIdValue) && xhr.status === 200) {
                console.log(activityDiscount);
                console.log($("#discount-choose option"));
                // 比對 activityDiscount 和 discount-choose 選項
                $("#discount-choose option").each(function () {
                    if ($(this).val() === activityDiscount) {
                        $(this).prop("selected", true);
                    }
                });
                	  }
            	});
            }


            // modal.find('#detail-discount input').val(activityDiscount);
            modal.find('#detail-amount input').val(activityAmount);
            modal.find('#detail-start input').val(activityStart);
            modal.find('#detail-end input').val(activityEnd);
        }
	
	    var modalInstance = new bootstrap.Modal(modal);
	    modalInstance.show();
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


        console.log('活動編號:', activityId);
        console.log('活動名稱:', activityName);
        console.log('活動類型:', activityType);
        console.log('折扣內容:', activityDiscount);
        console.log('達標金額:', activityAmount);
        console.log('活動開始:', activityStart);
        console.log('活動結束:', activityEnd);
        console.log('贈禮品項ID:', activityDishId);
        
        var activityData = {
            id: activityId,
            name: activityName,
            type: activityType,
            discount: activityDiscount,
            amount: activityAmount,
            start: activityStart,
            end: activityEnd,
            dishId: activityDishId,
        };

        // 發送 POST 請求
        $.ajax({
            url: '${pageContext.request.contextPath}/saveActivity',
            type: 'POST',
            data: JSON.stringify(activityData),
            contentType: 'application/json',
            success: function (response) {
                console.log('活動保存成功');
                $('#activity-modal').modal('hide');
                loadActivityData();
            },
            error: function (error) {
                console.log('活動保存失敗:', error);
            }
        });
    }
</script>

</html>