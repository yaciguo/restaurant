<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
// 	var jsonData = {
//   	  "orderStatus": "order_establish",
//   	  "orderDetails": jsonofDetails.orderDetails,
// 	  "amount":document.getElementById("totalAmount").value,
// 	  "FK_Activity_Id": "",
// 	  "type": "O",
// 	  "customer": document.getElementById("customer").value,
// 	  "phone": document.getElementById("phone").value,
// 	  "leaveTime": null,
// 	  "pickTime": document.getElementById("pickTime").value,
// 	  "note":document.getElementById("note").value,
	  
  	  
//   	};
    
//   	console.log(jsonData);
//========================================================================    

  })
</script>
<!--修改內容==================================-->
<script>

  //提交驗證
  function validateAndRedirect() {
	//將物件裝進json中
	
	var jsonData = {
		  	  "orderStatus": "order_establish",
		  	  "orderDetails": jsonofDetails.orderDetails,
			  "amount":document.getElementById("totalAmount").value,
			  "FK_Activity_Id": "",
			  "type": "O",
			  "customer": document.getElementById("customer").value,
			  "phone": document.getElementById("phone").value,
			  "leaveTime": null,
			  "pickTime": document.getElementById("pickTime").value,
			  "note":document.getElementById("note").value,
			  	  
		  	};
		    
		  	console.log(jsonData);
  	 // 创建 XMLHttpRequest 对象并发送 JSON 数据到后端
	  var xhr = new XMLHttpRequest();
	  xhr.open("POST", "<c:url value='/newOrder' />", true);
	  xhr.setRequestHeader("Content-Type", "application/json");
	  xhr.send(JSON.stringify(jsonData));
	  xhr.onreadystatechange = function() {
		// 伺服器請求完成
		    if (xhr.readyState === XMLHttpRequest.DONE) {
		      if (xhr.status === 200) {
		        // 处理响应
//	 	        console.log(xhr.responseText);
		        var responseJson = JSON.parse(xhr.responseText);
	            console.log(responseJson); // 将 JSON 数据打印到控制台
	            if (responseJson.success === "新增成功") {
	                // 重定向到 bookingcheck.jsp	                
	         		setTimeout(function() {
    	    		localStorage.clear();
    	    		window.location.href = '<c:url value='/ordercheck' />';
    	  			}, 800); // 延遲 1000 毫秒（1 秒）後跳轉
	            }
		      } else {
			        // 处理错误
			        console.error("发生错误：" + xhr.status);
//		 	        alert("no")
			        
			      }	  
	  		}
	  };
  	 
  	 
	  
//     var form = document.getElementById('myForm');
//     if (form.checkValidity()) {
//       // 在这里执行验证後訂單內容
//       localStorage.clear();
//       setTimeout(function() {
//     	    localStorage.clear();
//     	    window.location.href = '<c:url value='/ordercheck' />';
//     	  }, 800); // 延遲 1000 毫秒（1 秒）後跳轉
     
//       return false; // 阻止表单的默认提交行为
//     } else {
//       // 在这里执行验证失败时的逻辑
//       form.reportValidity();
//       return false; // 阻止表单的默认提交行为
//     }
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

    <form:form action="/newOrder"  modelAttribute="orderForm" id="myForm" 
    onsubmit="return validateAndRedirect()" method="POST" >
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
                <form:textarea path="note" id="note" rows="8" cols="20" style="width: 98%" 
                placeholder="請輸入餐點備註"></form:textarea>
                <form:errors path="note" cssClass="error" />
			
          </fieldset>
        </div>

        <div class="col-sm-4">
          <fieldset>
<!--             <legend>付款方式</legend> -->
<%--             <form:radiobutton path="userpay" value="現金" label="現金" checked="true" /> --%>
            <!-- <input type="radio" name="userpay" value="2" required />Linepay -->
            <br /><br />
            <span>商品小計:</span>
            <span class="totalPrice" style="text-align: right;">$</span><br><br>
            <span>折扣金額:</span>
            <span>$(0)</span><br><br>
            <span>應付金額:</span>
            <span class="totalPrice"></span><br><br>
            
            <!-- 添加隱藏字段 -->
		    <form:hidden path="activityBean" id="discountAmount" value="0" />
		    <form:hidden path="amount" id="totalAmount" value="" />

          </fieldset>
        </div>

        <div class="col-sm-4">
          <fieldset>
            <legend>取餐資料</legend>

            <label for="">姓名:</label><br />
            <form:input path="customer" id="customer" type="text" placeholder="請輸入訂購人" 
            	style="width: 90%;" required="true" /><br /><br />
            
            <label for="">手機:</label><br />
            <form:input path="phone" id="phone" type="tel" placeholder="請輸入手機號碼" style="width: 90%;" 
            	pattern="[0]{1}[9]{1}[0-9]{8}" required="true" /><br /><br />
  
            <label>取餐時間:</label><br/>
	            <form:select path="pickTime" id="pickTime" required="true">
				  <form:option value="">請選擇時間</form:option>
				  <form:option value="12:00:00" label="12:00" />
				  <form:option value="12:30:00" label="12:30" />
				  <form:option value="13:00:00" label="13:00" />
				  <form:option value="13:30:00" label="13:30" />
				  <form:option value="14:00:00" label="14:00" />
				  <form:option value="14:30:00" label="14:30" />
				  <form:option value="15:00:00" label="15:00" />
				  <form:option value="15:30:00" label="15:30" />
				  <form:option value="16:00:00" label="16:00" />
				  <form:option value="16:30:00" label="16:30" />
				  <form:option value="17:00:00" label="17:00" />
				  <form:option value="17:30:00" label="17:30" />
				  <form:option value="18:00:00" label="18:00" />
				</form:select>
	       
          </fieldset>
        </div>
      </div>
      <footer>
        <input type="button" value="繼續加點" class="button2" onclick="window.location.href ='<c:url value='/menu' />'" /> <!--上一頁-->
        <input type="submit" value="提交訂單" class="button2" /><!--訂單確認-->
      </footer>
    </form:form>
  </div>
</body>



</html>

