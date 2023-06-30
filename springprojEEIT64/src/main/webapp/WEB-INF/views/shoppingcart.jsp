<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <!-- Boostrap 導入程式 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
    <title>shoppingcart</title>
    <link rel="stylesheet" href="<c:url value='/css/shoppingcart.css' />">
<%--     <script type="text/javascript" src="<c:url value='/js/shoppingcart.js' />"></script> --%>

</head>

<script>
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
    
    
	//===================================撈活動資料進來========================
		$.ajax({  
	        url: '${pageContext.request.contextPath}/custIndex/getActivity',
	        type: "GET",
	        dataType: "json",
	        success: function(response) {
	            activities = response; // 得到返回的分類
	          var activityJsonString = JSON.stringify(activities);

	        // 將 JSON 字串插入到指定的 <div> 元素中
	        $('#activityDiv').text(activityJsonString);
	        
	            
	        },
	        error: function(xhr, status, error) {
	            console.log("Error: " + error);
	        }
	    }); 
    
  })

<!--修改內容==================================-->


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
  	 // 创建 XMLHttpRequest 对象并发送 JSON 数据到后端===================
  		 $.ajax({
         url: '${pageContext.request.contextPath}/custIndex/newOrder',
         type: "POST",
         contentType: "application/json",
         data: JSON.stringify(jsonData),
         success: function(responseJson) {
          console.log("success")
//              console.log(responseJson); // 将 JSON 数据打印到控制台
//              if (responseJson.success === "新增成功") {
                 // 重定向到订单确认页面
                 setTimeout(function() {
                     localStorage.clear();
                     window.location.href = "<c:url value='/ordercheck' />";
                 }, 800); // 延时800毫秒后跳转
//              }
         },
         error: function(xhr, status, error) {
             console.error("錯誤：" + xhr.status);
         }
     });
  		 
// 	  var xhr = new XMLHttpRequest();=========================
// 	  xhr.open("POST", window.location.pathname + "/custIndex/newOrder", true);
// 	  xhr.setRequestHeader("Content-Type", "application/json");
// 	  xhr.send(JSON.stringify(jsonData));
// 	  xhr.onreadystatechange = function() {
// 		// 伺服器請求完成
// 		if (xhr.readyState === XMLHttpRequest.DONE) {			
// 			      if (xhr.status === 200) {                  
// 			        var responseJson = JSON.parse(xhr.responseText);
// 		            console.log(responseJson); // 将 JSON 数据打印到控制台		            
// 		            if (responseJson.success === "新增成功") {
// 		            	// 重定向到订单确认页面
//                         setTimeout(function() {
//                             localStorage.clear(); 
//                             window.location.href = "<c:url value='/ordercheck' />";
//                         }, 800); // 延时800毫秒后跳转
// 		            }		            
// 			      } else {
// 			        // 处理错误
// 			        console.error("錯誤：" + xhr.status);			        
// 			      }
// 			    }
// 	  }=======================================================================

  	
	
  }

</script>
<!--修改內容==================================-->


<body>
<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>
  <div class="container">
    <div class="row">
      <header class="col-sm-12" style="margin-top: 20px;">
        <h1 style="font-weight: bolder;">訂單結帳</h1>
      </header>
    </div><br>
    <h5 style="text-align: center">xxxx店 <br />(外帶/內用)</h5>

    <br>

    <form id="myForm" onsubmit="return validateAndRedirect()">
      <!-- 訂單內容 -->
        <div class="row">

        <fieldset class="col-sm-12">
          <legend>訂單內容</legend>
          <!--新增=============================-->
          <div>
            <table class="store" style="width: 100%;">
              <tr>
                <th style="width: 50%;">餐點名稱</th>
                <th style="width: 20%;">單價</th>
                <th style="width: 20%;">數量</th>
              </tr>

            </table>

          </div>

        </fieldset>
      </div><br>

      <div class="row">
        <div class="col-sm-4">
          <fieldset>                     
            <legend>餐點備註</legend>
                <textarea id="note" rows="8" cols="20" style="width: 98%" placeholder="請輸入餐點備註"></textarea>			
          </fieldset>
        </div>

        <div class="col-sm-4">
          <fieldset>
            <legend>訂單金額</legend>
            <span>商品小計:</span>
            <span class="totalPrice" style="text-align: right;">$</span><br><br>
            <span>折扣金額:</span>
            <span>$(0)</span><br><br>
            <span>應付金額:</span>
            <span class="totalPrice"></span><br><br>          
            <!-- 添加隱藏字段 -->
            <input type="hidden" id="discountAmount" value="0" />
			<input type="hidden" id="totalAmount" value="" />
          </fieldset>
        </div>

        <div class="col-sm-4">
          <fieldset>
            <legend>取餐資料</legend>
            <label for="">姓名:</label><br />
            <input id="customer" type="text" placeholder="請輸入訂購人" style="width: 90%;" required="required" /><br /><br />
            
            <label for="">手機:</label><br />
            <input id="phone" type="tel" placeholder="請輸入手機號碼" style="width: 90%;" 
       			pattern="[0]{1}[9]{1}[0-9]{8}" required="required" /><br /><br />
  
            <label>取餐時間:</label><br/>
	            <select id="pickTime" required="required">
				    <option value="">請選擇時間</option>
				    <option value="12:00:00">12:00</option>
				    <option value="12:30:00">12:30</option>
				    <option value="13:00:00">13:00</option>
				    <option value="13:30:00">13:30</option>
				    <option value="14:00:00">14:00</option>
				    <option value="14:30:00">14:30</option>
				    <option value="15:00:00">15:00</option>
				    <option value="15:30:00">15:30</option>
				    <option value="16:00:00">16:00</option>
				    <option value="16:30:00">16:30</option>
				    <option value="17:00:00">17:00</option>
				    <option value="17:30:00">17:30</option>
				    <option value="18:00:00">18:00</option>
				</select>
	       
          </fieldset>
        </div>
      </div>
      <footer>
        <input type="button" value="繼續加點" class="button2" onclick="menuPage()" /> <!--上一頁-->
        <input type="submit" value="提交訂單" class="button2" /><!--訂單確認-->
      </footer>
    </form>
    
    <div id="activityDiv"></div>
  </div>
</body>
  <script>
        function menuPage() {
          window.location.href = "<c:url value='/menu' />";
        }
  </script>


</html>

