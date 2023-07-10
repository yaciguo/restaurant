var jsonofDetails = { orderDetails: [] };//一個有od的json
$(document).ready(function(){
    //載入local===============================
    var data = JSON.parse(localStorage.getItem('CART'));
    
    console.log(data)
    let totalPrice = 0;
    let content = ''
    data.forEach(function (obj, index) {
    	content += '<tr class="tableRow">' +
        '<td id="td2" style="width: 50%;">' + obj.name + '</td>' +
        '<td id="td5" style="width: 20%;">$ ' + obj.price + '</td>' +
        '<td class="units" style="width: 20%;">' +
        '<div class="number">' + obj.numberOfUnits + '</div>' +
        '</td>' +
        '</tr>';

      let objTotal = obj.price * obj.numberOfUnits
      totalPrice += objTotal
      console.log(obj.name)
      
      //將商品添加到odjason中=============================
      for (var i = 0; i < obj.numberOfUnits; i++) {
    	  jsonofDetails.orderDetails.push(obj.id); // 将id值重复添加到orderDetails数组中
	  }
    })
      console.log(jsonofDetails)
    
    
    
    $(".store").append(content)
    console.log(totalPrice)
    $(".totalPrice").text("$" + totalPrice);
    $("#totalAmount").val(totalPrice)
    console.log($("#totalAmount").val())
    //test==================================================
    var jsonData = {};
  })

//<!--修改內容==================================-->


  //提交驗證
  function validateAndRedirect() {
	  event.preventDefault();
	//將物件裝進json中
	var orderDetails = jsonofDetails.orderDetails;
	var orderDetailsArray = [];
	for (var i = 0; i < orderDetails.length; i++) {
		  orderDetailsArray.push(parseInt(orderDetails[i], 10));
		}
	
	var jsonData = {
		  	  "orderStatus": "order_establish",
		  	  "orderDetails": orderDetailsArray,
			  "amount":document.getElementById("totalAmount").value,
			  "FK_Activity_Id": null,
			  "type": "O",
			  "customer": document.getElementById("customer").value,
			  "phone": document.getElementById("phone").value,
			  "pickTime": document.getElementById("pickTime").value,
			  "note":document.getElementById("note").value,
			  	  
		  	};
		    
		  	console.log(jsonData);
  	 // 创建 XMLHttpRequest 对象并发送 JSON 数据到后端
	  var xhr = new XMLHttpRequest();
	  xhr.open("POST", "/restaurant/custIndex/newOrder", true);
	  xhr.setRequestHeader("Content-Type", "application/json");
	  xhr.send(JSON.stringify(jsonData));
	  xhr.onreadystatechange = function() {
		// 伺服器請求完成
		if (xhr.readyState === XMLHttpRequest.DONE) {			
			      if (xhr.status === 200) {                  
			        var responseJson = JSON.parse(xhr.responseText);
		            console.log(responseJson); // 将 JSON 数据打印到控制台		            
		            if (responseJson.success === "新增成功") {
		            	// 重定向到订单确认页面
                        setTimeout(function() {
                            localStorage.clear(); 
                            window.location.href = "<c:url value='/ordercheck' />";
                        }, 800); // 延时800毫秒后跳转
		            }		            
			      } else {
			        // 处理错误
			        console.error("錯誤：" + xhr.status);			        
			      }
			    }
	  }
  }