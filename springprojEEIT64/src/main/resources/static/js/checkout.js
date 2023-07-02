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
		if (targetTab === '#tab2') {
			loadUnpaidData("takeOut");
		}else{
			loadUnpaidData("eatIn");
		}
	});
});

// 讀取所有未付款訂單
function loadUnpaidData(type, pageId) {
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
 
// 動態生成表格內容
function generatePaymentTable(response, type) {
    var target;
    if (type == "eatIn") {
        target = $('#eatInContent');
    } else {
        target = $('#takeOutContent');
    }
    target.empty();

    var htmlContent = '';
    for (var i = 0; i < response.length; i++) {
    	var result = response[i];
        htmlContent += '<tr onclick="paymentAlert(this)">';
        htmlContent += '<td id="id-cell">' + result.id + '</td>';
        htmlContent += '<td id="name-cell">' + result.order.customer + '</td>';

        var paymentType = result.order.type;
        // 資料表欄位oders.type = I/O (內用/外帶)
        if (paymentType == "O") {
            htmlContent += '<td id="phone-cell">' + result.order.phone + '</td>';
        }

        var detailBean = result.order.orderDetailBean;
        var orderDetailContent = '';
        for (var j = 0; j < detailBean.length; j++) {
        	var bean = detailBean[j];
            orderDetailContent += bean.dish.name + "x" + bean.quantity+ ", " ;
        }
        htmlContent += '<td id="meal-cell">' + orderDetailContent + '</td>';
        
        htmlContent += '<td id="amount-cell">' + result.order.amount + '</td>';
        htmlContent += '</tr>';
    };

    target.html(htmlContent);
}
	
// 動態生成分頁導覽列內容
function generatePagination(type, totalPages, currentPage){
    var target;
    if (type == "eatIn") {
        target = $('#eatInPagination');
    } else {
        target = $('#takeOutPagination');
    }
    target.empty();
    
	var htmlContent = '';
	htmlContent += '<li class="page-item"><a class="page-link" onclick="changePage(\'prev\', ' + totalPages + ', ' + currentPage + ')">&laquo;</a></li>';
	for (var i = 1; i <= totalPages; i++) {
        if (i == currentPage) {
        	htmlContent += '<li class="page-item active"><a class="page-link" onclick="loadUnpaidData(\'' + type + '\', ' + i + ')">' + i + '</a></li>';
        } else {
            htmlContent += '<li class="page-item"><a class="page-link" onclick="loadUnpaidData(\'' + type + '\', ' + i + ')">' + i + '</a></li>';
        }
    }
	htmlContent+='<li class="page-item"><a class="page-link" onclick="changePage(\'next\', ' + totalPages + ', ' + currentPage + ')">&raquo;</a></li>';
	
	target.html(htmlContent);
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
	
	loadUnpaidData(newPage);
}
 
// 開啟 訂單明細&結帳
function paymentAlert(event) {
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

    title.each(function (index) {
        var titleId = $(this).attr('id');
        var titleText = $(this).text();

		if (titleId === "id-titleCell") {
			pBody.attr('data-id', colText[index]);
		}
		if (titleId === "amount-titleCell") {
			pBody.attr('data-amount', colText[index]);
		}
		
        htmlContent += '<div class="payment-detail">';
        htmlContent += '<strong>' + titleText + '：</strong>';

        if (titleId === "meal-titleCell") {
            htmlContent += '<textarea rows="4" class="w-100" disabled>' + colText[index] + '</textarea>';
        } else {
            htmlContent += '<input type="text" style="width: 100%;" disabled value="' + colText[index] + ' " >';
        }

        htmlContent += '</div>';

    });
    pBody.html(htmlContent);

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
    console.log("-------calculate------")
    var cashInput = $("#cashInput");
    
    var paymentId = $('.paymentBody').attr('data-id');
    
//         $.ajax({
//         	url: contextPath + '/updateCheckoutBean?paymentId=' + paymentId,
//             type: 'PUT',
// 		    beforeSend: function(xhr) {
// 		        xhr.setRequestHeader(csrfHeaderName, csrfToken);
// 		    },
// 		    success: function(response) {
// 		    	console.log('-----付款成功-----');
// 				loadUnpaidData();
// 		    },
// 		    error: function(error) {
// 		        console.log('付款失敗:', error);
// 		    }
// 		});
           
}
