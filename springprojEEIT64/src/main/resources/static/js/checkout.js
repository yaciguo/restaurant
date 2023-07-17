var contextPath;
var csrfHeaderName ;
var csrfToken;

$(function () {
	contextPath = $("meta[name='_contextPath']").attr("content"); 
	csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
	csrfToken = $("meta[name='_csrf']").attr("content"); 
	
    loadUnpaidData("eatIn");

	// 監聽 Bootstrap Tabs 切換事件
	$('#payment-tabs').on('shown.bs.tab', function(e) {
		var targetTab = $(e.target).attr('href');
		if (targetTab === '#tab1') {
			loadUnpaidData("eatIn");
		}else if (targetTab === '#tab2'){
			loadUnpaidData("takeOut");
		}else if (targetTab === '#tab3'){
			loadPaidData("paid");
		}
	});
});

// 讀取所有未付款訂單
function loadUnpaidData(type, pageId) {
	console.log("--------loadUnpaidData----")
	var pid = (pageId === undefined) ? 1 : pageId;
	
	$.ajax({
		url: contextPath + '/queryUnpaid?pageNumber=' + pid + '&orderType=' + type,
	    type: 'GET',
	    beforeSend: function(xhr) {
	        xhr.setRequestHeader(csrfHeaderName, csrfToken);
	    },
	    success: function(response) {
	        console.log("--------------ajax-queryUnpaid " + response.number);
	        console.log(response);
	        console.log(response.content);
	        var currentPage = response.number + 1;
	        generatePaymentTable(response.content, type);
	        generatePagination(type, response.totalPages, currentPage);
	    },
	    error: function(error) {
	        console.log('未付款訂單讀取失敗:', error);
	    }
	});
}

// 讀取已付款訂單
function loadPaidData(type, pageId) {
	var pid = (pageId === undefined) ? 1 : pageId;
	
	$.ajax({
		url: contextPath + '/queryPaid?pageNumber=' + pid + '&orderType=' + type,
	    type: 'GET',
	    beforeSend: function(xhr) {
	        xhr.setRequestHeader(csrfHeaderName, csrfToken);
	    },
	    success: function(response) {
	        console.log("--------------ajax-queryUnpaid " + response.number);
	        console.log(response);
	        console.log(response.content);
	        var currentPage = response.number + 1;
	        generatePaymentTable(response.content, type);
	        generatePagination(type, response.totalPages, currentPage);
	    },
	    error: function(error) {
	        console.log('未付款訂單讀取失敗:', error);
	    }
	});
}
 
// 動態生成表格內容
function generatePaymentTable(response, type) {
    var target;
    console.log(type)
    if (type == "eatIn") {
        target = $('#eatInContent');
    } else if (type == "takeOut"){
        target = $('#takeOutContent');
    } else if (type == 'paid'){
		target = $('#paidContent');
	}
    target.empty();

    var htmlContent = '';
    for (var i = 0; i < response.length; i++) {
    	var result = response[i];
    	
        htmlContent += '<tr onclick="paymentAlert(this, \'' + type + '\')">';
        htmlContent += '<td id="id-cell">' + result.id + '</td>';
        htmlContent += '<td id="name-cell">' + result.order.customer + '</td>';

        var paymentType = result.order.type;
        // 資料表欄位oders.type = I/O (內用/外帶)
        if (type != 'paid' && paymentType == "O") {
            htmlContent += '<td id="phone-cell">' + result.order.phone + '</td>';
        }

        var detailBean = result.order.orderDetailBean;
        var orderDetailContent = '';
        for (var j = 0; j < detailBean.length; j++) {
        	var bean = detailBean[j];
            orderDetailContent += bean.dish.name + "x" + bean.quantity+ ", " ;
        }
        if (type != 'paid') {
       		htmlContent += '<td id="meal-cell">' + orderDetailContent + '</td>';
        }else{
	        htmlContent += '<input type="hidden" id="detailHidden" value="' + orderDetailContent + '">';
		}
		
        if (type == 'paid')  {
			var dateTime = new Date(result.payTime);
			var month = (dateTime.getMonth() + 1).toString().padStart(2, '0');
			var date = dateTime.getDate().toString().padStart(2, '0');
			var hours = dateTime.getHours().toString().padStart(2, '0');
			var minutes = dateTime.getMinutes().toString().padStart(2, '0');
			var formattedDateTime = `${month}/${date}-${hours}:${minutes}`;
				
			htmlContent += '<td id="time-cell">' + formattedDateTime + '</td>';
		}
        
        htmlContent += '<td id="amount-cell">' + result.order.amount + '</td>';
        htmlContent += '</tr>';
    };

    target.html(htmlContent);
}
	
// 動態生成分頁導覽列內容
function generatePagination(type, totalPages, currentPage){
	console.log
    var target;
    if (type == "eatIn") {
        target = $('#eatInPagination');
    } else if (type == "takeOut"){
        target = $('#takeOutPagination');
    }else if (type === 'paid'){
		target = $('#paidPagination');
	}

    target.empty();
    
    console.log(totalPages)
    if(totalPages ==0 ){
		return
	}
	
	var htmlContent = '';
	htmlContent += '<li class="page-item"><a class="page-link" onclick="changePage(\'' + type + '\', \'prev\', ' + totalPages + ', ' + currentPage + ')">&laquo;</a></li>';
	
	var startPage = Math.max(1, currentPage - 2);
	var endPage = Math.min(totalPages, currentPage + 2);
	
	if (endPage - startPage < 4) {
	  endPage = Math.min(totalPages, startPage + 4);
	}
	
	
	for (var i = startPage; i <= endPage; i++) {
	    if (i === currentPage) {
	        htmlContent += `<li class="page-item active"><a class="page-link" onclick="${(type === 'paid') ? `loadPaidData('paid', ${i})` : `loadUnpaidData('${type}', ${i})`}">${i}</a></li>`;
	    } else {
	        htmlContent += `<li class="page-item"><a class="page-link" onclick="${(type === 'paid') ? `loadPaidData('paid', ${i})` : `loadUnpaidData('${type}', ${i})`}">${i}</a></li>`;
	    }
	}
	
	htmlContent += '<li class="page-item"><a class="page-link" onclick="changePage(\'' + type + '\', \'next\', ' + totalPages + ', ' + currentPage + ')">&raquo;</a></li>';
	
	target.html(htmlContent);
}
	
// 按鈕觸發換頁
function changePage(type, option, totalPages, currentPage){
	var newPage;
	if (option === 'prev') {
	  newPage = Math.max(currentPage - 1, 1);
	} else {
	  newPage = Math.min(currentPage + 1, totalPages);
	}
	
	if (newPage == currentPage){
		return
	}
	
	if(type == "paid"){
		loadPaidData(type, newPage);
	}else{
		loadUnpaidData(type, newPage);
	}
	
}
 
// 開啟 訂單明細&結帳
function paymentAlert(event, type) {
    var pModal = $('#payment-modal');
    var pBody = $('.paymentBody');

    $("#cashInput").val('0');
    
    var htmlContent = '';
    var title = $(event).closest('table').find('th');
    var col = $(event).find('td')
    var colText = [];
    col.each(function () {
        colText.push($(this).text());
    })
    
	var meal = $(event).find('#detailHidden').val();
	if(type == "paid"){
		colText.push(meal);
	}
	
	for (var index = 0; index < colText.length; index++){
		if (title[index]){
	        var titleId = title[index].id;
	        var titleText = title[index].textContent;
        }

        htmlContent += '<div class="payment-detail">';
        htmlContent += '<strong>' + titleText + '：</strong>';
        
		if (titleId === "id-titleCell") {
			pBody.attr('data-id', colText[index]);
		}
		
		if (titleId === "amount-titleCell") {
			pBody.attr('data-amount', colText[index]);
		}

        if (titleId === "meal-titleCell") {
            htmlContent += '<textarea rows="4" class="w-100" disabled>' + colText[index] + '</textarea>';
        } else {
            htmlContent += '<input type="text" style="width: 100%;" disabled value="' + colText[index] + ' " >';
        }
         
        if (type == "paid" && index == title.length - 1){
			titleText ="明細";
			titleId = "meal-titleCell";
		}

        htmlContent += '</div>';
    };
    
    pBody.html(htmlContent);
    
	if (type == "paid") {
		$('.calculatorBody').removeClass('d-flex');
	    $('.calculatorBody').hide();

	    $('.paymentBody').removeClass('col-6');
	} else {
		$('.calculatorBody').addClass('d-flex');
		$('.paymentBody').addClass('col-6');
	}

    var modalInstance = new bootstrap.Modal(pModal);
    modalInstance.show();
}

// 計算機 - 輸入添加一字元
function appendToInput(value) {
    var cashInput = $("#cashInput");
    var currentValue = cashInput.val();

    if (currentValue.length >= 10) {
        return;
    }

    if (currentValue === "0") {
        cashInput.val(value);
    } else {
        cashInput.val(currentValue + value);
    }
}

// 計算機 - 刪除一字元
function deleteLastCharacter() {
	var cashInput = $("#cashInput");
    var currentValue = cashInput.val();
    var newValue = currentValue.slice(0, -1);

    if (newValue.length === 0) {
        cashInput.val("0");
    } else {
        cashInput.val(newValue);
    }
}

// 計算機 - 刪除全部字元
function clearInput() {
    $("#cashInput").val("0");
}

// 點擊結帳 - 出現核對框
function showConfirm() {
    var total = $('.paymentBody').attr('data-amount');
    var received = $("#cashInput").val();
    var coin = 0;
    
    if(parseInt(total) > parseInt(received)){
    	 $('#cashInput').addClass('inputInvalid');
         $('#cashInput').on('animationend', function() {
       	 	$(this).removeClass('inputInvalid');
       	 });
    	return
    }else{
    	coin = received - total;
   	 	$('#cashInput').removeClass('inputInvalid');
    }
    
    var cModal = $("#comfirm-modal");
    var cBody = $('#comfirm-modal .modal-body');
    
    cBody.html('<strong>收款金額為：' + received + '，需找零：<span class="text-danger">' + coin + '</span></strong>');
    
    $('#payment-modal').hide();
    $('.modal-backdrop').hide();
    
    var myModal = new bootstrap.Modal(cModal);
    myModal.show();
}
    
// 付款 - 結單
function calculate() {
    var paymentId = $('.paymentBody').attr('data-id');
    var activeNavItem = $('.nav-tabs .nav-item .nav-link.active').text();

     $.ajax({
     	url: contextPath + '/updateCheckoutBean?paymentId=' + paymentId,
         type: 'PUT',
	    beforeSend: function(xhr) {
	        xhr.setRequestHeader(csrfHeaderName, csrfToken);
	    },
	    success: function() {
	    	console.log('-----付款成功-----');
	    	if(activeNavItem == "外帶"){
				loadUnpaidData("takeOut");
			}else if (activeNavItem == "內用"){
				loadUnpaidData("eatIn");
			}
		},
	    error: function(error) {
	        console.log('付款失敗:', error);
	    }
	});
           
}
