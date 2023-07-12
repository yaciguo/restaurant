var contextPath;
var csrfHeaderName ;
var csrfToken;


	$(function(){	
		contextPath = document.querySelector('meta[name="_contextPath"]').getAttribute('content');
		csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
		csrfToken = $("meta[name='_csrf']").attr("content"); 
		
		//進入加載
		var orderIndex = contextPath + '/orders/orderStatus/1';
		initialize(orderIndex);		
		
		
		// 按下訂單狀態欄加載不同數據
	    $("#orders-tabs").on("click", ".orders-link", function() {
	        var typeId = $(this).attr("custom-value");
	        var urlAddress = contextPath + '/orders/orderStatus/' + typeId;
	        initialize(urlAddress);	
	    });  
	
		// 搜尋按鈕 (先判斷選單)
		$("#orderdata-search").click(function(){
	        var typeId = $("#search-placeholder").val();
	        if (typeId != "" ){
		        var type =  $(".form-select").val()|| "訂單編號";
		        
		        switch (type){
			        case  "訂單編號" :
			        	var urlAddress = contextPath + '/orders/orderId/' + typeId;
			        	break;     
			        case  "電話號碼" :
						var urlAddress = contextPath + '/orders/orderPhone/?phone=' + typeId;
			        	break;
			        
			        case  "顧客姓名" :
				        var urlAddress = contextPath + '/orders/customer/?customer=' + typeId;
				        console.log(encodeURIComponent(typeId));
				        break;
			    }  
		        initialize(urlAddress);				
			} 
		})

		//更新
		$('#order-statechoose-refresh').click(async function() {
		  var selectedOrders = [];
		  $('.orders-table tbody tr').each(function() {
		    const checkbox = $(this).find('input[type="checkbox"]');
		    if (checkbox.prop('checked')) {
		      var id = $(this).find('td:nth-child(2)').text();
		      var orderStatus = $('#form-select1 option:selected').val();
		      var note = $('#form-control1').val();
		      selectedOrders.push({ "id": id, "orderStatus": orderStatus, "note": note });
			  
		      var requestUrl = contextPath + '/orders/orderId';
		      var requestUrl2 = contextPath + '/orders/orderId/' + id;
				
		      $.ajax({
		        url: requestUrl,
		        type: 'PUT',
		        contentType: 'application/json',
		        data: JSON.stringify(selectedOrders),
		        beforeSend: function(xhr) {
		          xhr.setRequestHeader(csrfHeaderName, csrfToken);
		        },
		        success: function(response) {
		          console.log("OK");
		          $('#modal-title').html('<span class="modal-icon text-success"><i class="fas fa-check-circle"></i></span> 訂單記錄更新成功');
		          $('#success-modal').modal('show');
		          initialize(requestUrl2);
		        },
		        error: function(error) {
		          console.log("Not OK");
		          $('#modal-title').html('<span class="modal-icon text-danger"><i class="fas fa-times-circle"></i></span> 訂單記錄更新失敗');
		          $('#success-modal').modal('show');
		          initialize(orderIndex);
		        }
		      });
		    }
		  });
		});
		     
		//清除button
		$("#order-search-clear").click(function() {
			var content =  $("#search-placeholder").val();
			if (content != ""){
				$("#search-placeholder").val("");
				initialize(orderIndex);	
			}	
		})
		
		// 引入導覽列控制
		$("#toolBar").load("./side-nav.html");
	
		//checkboxAll全選/全不選
		$("#order-checkboxAll").click(function() {
			if (this.checked === true) {
				$("#order-statechange").slideDown();
			} else {
				$("#order-statechange").slideUp();
			}
			$(".order-checkbox").prop("checked", this.checked);
		
			var checkedLength = $(".order-checkbox:checked").length;
			$("#checkedLength").html(checkedLength);
		})
	
		//checkbox
		$("#orderData-tbody").on("click", ".order-checkbox", function() {
			var flag = true;
			if ($(".order-checkbox:not(:checked)").length > 0) {
				flag = false;
			}
			$("#order-checkboxAll").prop("checked", flag);
		
			var checkedLength = $(".order-checkbox:checked").length;
			$("#checkedLength").html(checkedLength);
		
			if (checkedLength > 0) {
				$("#order-statechange").slideDown();
			} else {
				$("#order-statechange").slideUp();
			}
		})	
		
			    
		//匯出訂單
		$(".data-expo").click(function() {
			var modal = document.getElementById('data-expo');
			var modalInstance = new bootstrap.Modal(modal);
			modalInstance.show();
		});
		
		//顯示其他條件
		$(".order-condition-input").click(function() {
			var checkedValue = $("#expo-other-condition:checked").val();
			if (checkedValue == 'on') {
				$("#order-other-condition").css("display", "block");
			} else
				$("#order-other-condition").css("display", "none");
		})
	
	})
	
	// 改變placeholder()
	function changePlaceholder(selected) {
		var myselect = $(".form-select").val();
		$('#search-placeholder').attr('placeholder', '請輸入' + myselect);	
	}

		//初始
		function initialize(urlAddress) {
		  console.log(urlAddress);
		
		  $.ajax({
		    url: urlAddress,
		    type: 'GET',
		    dataType: 'json',
		    beforeSend: function(xhr) {
		      xhr.setRequestHeader(csrfHeaderName, csrfToken);
		    },
		    success: function(data) {
		      let tableHtml = '';
		      let tbody = $("#orderData-tbody");
		      tbody.empty();
		
		      if (data.numberOfElements > 0) {
		        for (var i = 0; i < data['content'].length; i++) {
		          var orderData = data['content'][i];

		          // 判斷備註
		          var orderNote = '';
		          if (orderData.note == 'null'){
					  orderNote = '';
				  }else {
					  orderNote = orderData.note ;
				  }
				  		          		
		          // 判斷單別、電話/桌號
		          var orderType = '';
		          var orderDataPhone = '';
		          if (orderData.type == 'I') {
		            orderType = '內用';
		            orderCustomer = orderData.customer + '號桌';
		          } else if (orderData.type == 'O') {
		            orderType = '外帶';
		            orderCustomer = orderData.customer;
		          }
				  if (orderData.phone == null) {
		          	orderDataPhone = '';
		          }else {
					  orderDataPhone = orderData.phone;
				  }
		          
		          // 活動
		          var activityBeandiscount = '';
		          var activityBeandishBeanname = '';
		          var activityBeanType = '';
		
		          if (orderData.activityBean != null) {
		            if (orderData.activityBean.type == 'discount') {
		              activityBeanType = '折扣';
		            } else if (orderData.activityBean.type == 'gift') {
		              activityBeanType = '贈品';
		            }
		          } else {
		            activityBeanType = '';
		            activityBeandiscount = '';
		            activityBeandishBeanname = '';
		          }
		
		          // 訂單明細
		          var orderDetailsHtml = '';
		          orderData.orderDetailBean.forEach(function(detail) {
		            orderDetailsHtml += detail.dish.name + ' - ' + detail.quantity;
		          });
		
		          // 交易狀態
		          var payStatus = '';
		          if (orderData.checkoutBean != null && orderData.checkoutBean.payStatus != null) {
		            if (orderData.checkoutBean.payStatus == 'Y') {
		              payStatus = '已付款';
		            } else {
		              payStatus = '未付款';
		            }
		          } else {
		            payStatus = '未付款';
		          }
		
		          // 訂單狀態
		          var orderStatus = '';
		          if (orderData.orderRecordBean) {
		            if (orderData.orderRecordBean.orderCancel != null) {
		              orderStatus = '已取消';
		            } else if (orderData.orderRecordBean.orderFinish != null) {
		              orderStatus = '已完成';
		            } else if (orderData.orderRecordBean.orderDeal != null) {
		              orderStatus = '處理中';
		            } else if (orderData.orderRecordBean.orderEstablish != null) {
		              orderStatus = '已成立';
		            } else {
		              orderStatus = '此筆訂單有問題';
		            }
		          }
		
		          tableHtml += `
		            <tr onclick="openModal(this)">
		              <td id="choose-cell">
		                <input class="order-checkbox form-check-input fs-4" type="checkbox">
		              </td>
		              <td id="id-cell">${orderData.id}</td>
		              <td id="type-cell">${orderType}</td>
		              <td id="phone-cell">${orderCustomer}</td>
		              <td id="time-cell">${orderData.pickTime}</td>
		              <td id="items-cell" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-left: 10px; max-width: 175px;">${orderDetailsHtml}</td>
		              <td id="price-cell">${orderData.amount}</td>
		              <td id="picktime-cell">${orderDataPhone}</td>
		              <td id="statusO-cell">${orderStatus}</td>
		              <td id="statusP-cell">${payStatus}</td>
		              <td id="note-cell">${orderNote}</td>
		              <td id="activitytype-cell" style="display:none">${activityBeanType}</td>
		              <td id="activitydiscount-cell" style="display:none">${activityBeandiscount}</td>
		              <td id="activitygift-cell" style="display:none">${activityBeandishBeanname}</td>
		            </tr>`;
		        }
		      } else {
		        tableHtml += `<tr><td colspan="10" id="id-cell">目前無相對應資料</td></tr>`;
		      }
		      tbody.append(tableHtml);
		
		      // 分页部分
		      let pageHtml = '';
		      let pagebody = $("#paidPagination");
		      pagebody.empty();
		
		      console.log(urlAddress);
		
		      if (data['totalPages'] > 1) {
		        const maxPagesToShow = 10; // 最多显示的页码数量
		        const currentPage = data.number + 1;
		        const totalPages = data.totalPages;
		
		        let startPage = 1;
		        let endPage = totalPages;
		
		        if (totalPages > maxPagesToShow) {
		          const middlePages = Math.floor(maxPagesToShow / 2);
		          if (currentPage <= middlePages) {
		            endPage = maxPagesToShow;
		          } else if (currentPage >= totalPages - middlePages) {
		            startPage = totalPages - maxPagesToShow + 1;
		          } else {
		            startPage = currentPage - middlePages;
		            endPage = currentPage + middlePages;
		          }
		        }
		
		        const firstPageUrl = new URL(urlAddress, window.location.origin);
		        firstPageUrl.searchParams.delete('pageNumber');
		        firstPageUrl.searchParams.set('pageNumber', 0);
		
		        const lastPageUrl = new URL(urlAddress, window.location.origin);
		        lastPageUrl.searchParams.delete('pageNumber');
		        lastPageUrl.searchParams.set('pageNumber', totalPages - 1);
		
		        pageHtml += `
		          <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
		            <a class="page-link" href="#" onclick="event.preventDefault(); initialize('${firstPageUrl.href}')">&laquo;</a>
		          </li>
		        `;
		
		        for (let i = startPage; i <= endPage; i++) {
		          const url = new URL(urlAddress, window.location.origin);
		          url.searchParams.delete('pageNumber');
		          url.searchParams.set('pageNumber', i - 1);
		          const newUrlAddress = url.href;
		          pageHtml += `
		            <li class="page-item ${i === currentPage ? 'active' : ''}">
		              <a class="page-link" href="#" onclick="event.preventDefault(); initialize('${newUrlAddress}')">${i}</a>
		            </li>
		          `;
		        }
		
		        pageHtml += `
		          <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">
		            <a class="page-link" href="#" onclick="event.preventDefault(); initialize('${lastPageUrl.href}')">&raquo;</a>
		          </li>
		        `;
		      } else {
		        pageHtml += `
		          <li class="page-item disabled">
		            <span class="page-link">&laquo;</span>
		          </li>
		          <li class="page-item active">
		            <span class="page-link">1</span>
		          </li>
		          <li class="page-item disabled">
		            <span class="page-link">&raquo;</span>
		          </li>
		        `;
		      }
		
		      pagebody.html(pageHtml);
		    },
		    error: function(error) {
		      console.log(error);
		    }
		  });
		}




	//按下訂單產生互動視窗     
	function openModal(row) {
		var orderId = row.querySelector('#id-cell').textContent;
		var orderType = row.querySelector('#type-cell').textContent;
		var orderPhone = row.querySelector('#phone-cell').textContent;
		var orderTime = row.querySelector('#time-cell').textContent;
		var orderItems = row.querySelector('#items-cell').textContent;
		var orderPrice = row.querySelector('#price-cell').textContent;
		var picktime = row.querySelector('#picktime-cell').textContent;
		
		var orderStatus = row.querySelector('#statusO-cell').textContent;
		var paymentStatus = row.querySelector('#statusP-cell').textContent;
		var activitytype = row.querySelector('#activitytype-cell').textContent;
		var activitydiscount = row.querySelector('#activitydiscount-cell').textContent;
		var activitygift = row.querySelector('#activitygift-cell').textContent;

		var modal = document.getElementById('orders-modal');
		modal.querySelector('#detail-id span').textContent = orderId;
		modal.querySelector('#detail-type span').textContent = orderType;
		modal.querySelector('#detail-phone span').textContent = orderPhone;
		modal.querySelector('#detail-time span').textContent = orderTime;
		modal.querySelector('#detail-items span').textContent = orderItems;
		modal.querySelector('#detail-price span').textContent = orderPrice;
//		modal.querySelector('#pick-time span').textContent = picktime;
		modal.querySelector('#detail-statusO span').textContent = orderStatus;
		modal.querySelector('#detail-statusP span').textContent = paymentStatus;
		modal.querySelector('#activity-type span').textContent = activitytype;
		modal.querySelector('#activity-discount span').textContent = activitydiscount;
		modal.querySelector('#activity-gift span').textContent = activitygift;
		
		if (!$(event.target).is(".form-check-input") && !$(event.target).is("#choose-cell")) {
			var modalInstance = new bootstrap.Modal(modal);
			modalInstance.show();
	
			//活動
			$('#activity-type').css("display", "none");
			$('#activity-discount').css("display", "none");
			$('#activity-gift').css("display", "none");
			
			if (activitytype != "" && activitytype != null) {
				if (activitytype == '折扣'){
					$('#activity-type').css("display", "block");
					$('#activity-discount').css("display", "block");
					$('#activity-gift').css("display", "none");
				}else if (activitytype == '贈品'){
					$('#activity-type').css("display", "block");
					$('#activity-discount').css("display", "none");
					$('#activity-gift').css("display", "block");
				}
			}else {
				$('#activity-type').css("display", "none");
				$('#activity-discount').css("display", "none");
				$('#activity-gift').css("display", "none");
			}		
					
			//訂單紀錄歷程
			$("#order-establish").css("display", "block");
			$("#order-dealed").css("display", "none");
			$("#order-finished").css("display", "none");
			$("#order-cancel").css("display", "none");
	
			if (orderStatus == "已完成") {
				$("#order-dealed").css("display", "block");
				$("#order-finished").css("display", "block");
			} else if (orderStatus == "處理中") {
				$("#order-dealed").css("display", "block");
			} else if (orderStatus == "已取消") {
				$("#order-cancel").css("display", "block");
			}
			
			if (orderStatus == "已完成") {
				$("#order-dealed").css("display", "block");
				$("#order-finished").css("display", "block");
			} else if (orderStatus == "處理中") {
				$("#order-dealed").css("display", "block");
			} else if (orderStatus == "已取消") {
				$("#order-cancel").css("display", "block");
			}
		
		}
	}
