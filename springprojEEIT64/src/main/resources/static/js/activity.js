var contextPath;
var csrfHeaderName ;
var csrfToken;
var csrfToken;

$(function() {
	contextPath = $("meta[name='_contextPath']").attr("content"); 
	csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
	csrfToken = $("meta[name='_csrf']").attr("content"); 
	
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
	    url: contextPath + '/resortActivity',
	    type: "GET",
	    data: {
	      sortColumn: columnName,
	      sortDirection: sortDirection
	    },
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
        },
	    success: function(response) {
	    	generateActivityTable(response);
	    	
	    	$(".activity-table th").removeClass("sorted asc desc");
			$(this).addClass("sorted " + sortDirection);
	    },
	    error: function(error) {
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
		url : contextPath + '/queryBanner',
		type : 'GET',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
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
		url : contextPath + '/queryCategory',
		type : 'GET',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
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
		url : contextPath + '/queryDish?categoryId=' + cid,
		type : 'GET',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
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
		url : contextPath + '/queryActivity?pageNumber=' + pid,
		type : 'GET',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
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
	$('#activityContent').empty();
	
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
	
	$('#activityContent').html(htmlContent);
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

			$("#discount-category option").each(function() {
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

	var modalInstance = new bootstrap.Modal(modal);
	modalInstance.show();
}

// 新增輪播圖
function sendBannerData(base64Image) {
	$.ajax({
		url : contextPath + '/saveBannerImg',
		type : 'POST',
		data: JSON.stringify({ imageBase64: base64Image }),
		contentType : 'application/json',
		beforeSend: function(xhr) {
	        xhr.setRequestHeader(csrfHeaderName, csrfToken);
	    },
		success : function() {
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
		url : contextPath + '/updateBannerUrl',
		type : 'POST',
		data: JSON.stringify(requestData),
		contentType : 'application/json',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
        },
		success : function() {
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
		url : contextPath + '/saveActivity',
		type : 'POST',
		data : JSON.stringify(activityData),
		contentType : 'application/json',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
        },
		success : function() {
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
        url: contextPath + '/deleteBanner?bId=' + id,
        type: 'DELETE',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
        },
        success: function () {
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
        url: contextPath + '/deleteActivity?activityId=' + id,
        type: 'DELETE',
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfToken);
        },
        success: function () {
            console.log("--------------ajax-deleteActivity");
            $('#delete-modal').modal('hide');
            loadActivityData();
        },
        error: function (error) {
            console.log('輪播圖刪除失敗:', error);
        }
    });
}

