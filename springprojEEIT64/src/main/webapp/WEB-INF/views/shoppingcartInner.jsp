<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <!-- fontAwesome - icon插件 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        <%-- <script type="text/javascript" src="<c:url value='/js/shoppingcart.js' />"></script> --%>

      </head>

      <script>
        var orderDetails = [];
        var jsonofDetails = { orderDetails };//一個有od的json
        var data = [];
        $(document).ready(function () {
          //載入local===============================
          data = JSON.parse(localStorage.getItem('CART')) || [];
          console.log(data)

          // 檢查 localStorage 是否為空若為空就重新載入消費者首頁
          if (data === null || data.length === 0) {
            setTimeout(function () {
              window.location.href = "<c:url value='/custIndex' />";
            }, 500);
          }


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


          //test==================================================
          var jsonData = {};


          //===================================撈活動資料進來========================
          $.ajax({
            url: '${pageContext.request.contextPath}/custIndex/getActivity',
            type: "GET",
            dataType: "json",
            success: function (response) {
              activities = response; // 得到返回的分類
              // var totalAmount = totalPrice;
              var activityJsonString = JSON.stringify(activities);
              //=========================增加0701===================================
              var maxDiscountAmount = 0;
              var selectedActivityIndex = -1;
              // 遍歷活動資料進行折扣計算
              for (var i = 0; i < activities.length; i++) {
                var activity = activities[i];

                // 判斷活動是否在有效期內
                var startDate = new Date(activity.startDate);
                var endDate = new Date(activity.endDate);
                var currentDate = new Date();


                if (currentDate >= startDate && currentDate <= endDate) {
                  // 滿足活動有效期限
                  var discountAmount = 0;

                  if (totalPrice >= activity.amount) {
                    // 滿足滿額條件，計算折扣金額
                    discountAmount = activity.discount;
                    if (discountAmount > maxDiscountAmount) {
                      maxDiscountAmount = discountAmount;
                      // 取得選擇的活動名稱
                      // selectedActivityName = activity.name;
                      selectedActivityIndex = i;
                    }
                  }
                }
              }
              // 將折扣金額應用於總金額
              if (selectedActivityIndex === -1) {
                // 若未找到符合條件的活動，清空選擇的活動相關資訊
                $("#activityName").text("");
                $("#selectedActivityId").val("");
              } else {
                // 將折扣金額和活動名稱顯示出來中
                // 取得選擇的活動名稱及id
                var selectedActivity = activities[selectedActivityIndex];
                var selectedActivityName = activities[selectedActivityIndex].name;
                var selectedActivityId = activities[selectedActivityIndex].id.toString();
                // 將折扣金額和活動名稱顯示在不可編輯的<span>元素中
                $("#activityName").text(selectedActivityName);
                $("#selectedActivityId").val(selectedActivityId);
                // $("#discountAmount").text(maxDiscountAmount);


              }


              //=========================增加0701=====================================
              // 將 JSON 字串插入到指定的 <div> 元素中
              // $('#activityDiv').text(activityJsonString);

              // 進行購物車相關操作====================================
              if (selectedActivityIndex !== -1) {
                var selectedActivity = activities[selectedActivityIndex];
                // 檢查活動類型是否為 "gift"
                if (selectedActivity.type === "gift") {
                  // 獲取活動送的 dish
                  var giftDish = selectedActivity.dishBean;
                  console.log(giftDish);

                  var modifiedGiftDish = {
                    id: giftDish.id,
                    name: giftDish.name,
                    categoryBean: giftDish.categoryBean,
                    price: giftDish.price,
                    cost: giftDish.cost,
                    picture: giftDish.picture,
                    description: giftDish.description,
                    status: giftDish.status,
                    numberOfUnits: 1  // 設置預設數量為 1
                  };
                  // // 檢查購物車中是否已存在相同的 dishId
                  var existingItemIndex = -1;
                  for (var i = 0; i < data.length; i++) {
                    if (data[i].id === modifiedGiftDish.id) {
                      existingItemIndex = i;
                      break;
                    }
                  }

                  // 將 贈送的dish 添加到頁面顯現
                  var giftRow =
                    '<tr class="giftRow">' +
                    '<td colspan="3">' + '<hr>' +
                    '<span style="font-size: 20px; font-weight: bold;">贈品</span>' +
                    '</td>' +
                    '</tr>' +
                    '<tr class="giftRow">' +
                    '<td style="width: 50%;">' + modifiedGiftDish.name + '</td>' +
                    '<td style="width: 20%">$' + modifiedGiftDish.price + '</td>' +
                    '<td class="units" style="width: 20%">' +
                    '<div class="number">' + modifiedGiftDish.numberOfUnits + '</div>' +
                    '</td>' +
                    '</tr>'
                    ;

                  $(".store").append(giftRow);

                  // 將 dish 添加到購物車資料中

                  if (existingItemIndex !== -1) {
                    // 已存在相同的 dishId，合併物件並更新 numberOfUnits
                    var existingItem = data[existingItemIndex];
                    existingItem.numberOfUnits += modifiedGiftDish.numberOfUnits;
                  } else {
                    // 購物車中不存在相同的 dishId，將新的 modifiedGiftDish 加入購物車
                    data.push(modifiedGiftDish);
                  }
                  // localStorage.setItem('CART', JSON.stringify(data));
                  console.log(data)
                  orderDetails.push(modifiedGiftDish.id);
                  totalPrice += modifiedGiftDish.price

                }
              }


              console.log(maxDiscountAmount)
              // 計算總金額並更新顯示
              console.log(totalPrice)

              $(".totalPrice").text("$" + totalPrice);
              var discountedTotalAmount = totalPrice - maxDiscountAmount;
              $(".totalAmount").text("$" + discountedTotalAmount);
              $("#totalAmount").val(discountedTotalAmount);
              $("#discount").text("$" + maxDiscountAmount);
              console.log(discountedTotalAmount)


            },
            error: function (xhr, status, error) {
              console.log("Error: " + error);
            }

          });

          console.log(data)

        })

        <!--修改內容==================================-->


        //提交驗證
        function validateAndRedirect() {
          event.preventDefault();
          //按下才把locoal更新
          localStorage.setItem('CART', JSON.stringify(data));
          //將物件裝進json中         
          var orderDetails = jsonofDetails.orderDetails;
          var orderDetailsArray = [];
          for (var i = 0; i < orderDetails.length; i++) {
            orderDetailsArray.push(parseInt(orderDetails[i], 10));
          }

          var jsonData = {
            "orderStatus": "order_establish",
            "orderDetails": orderDetailsArray,
            "amount": document.getElementById("totalAmount").value,
            "FK_Activity_Id": document.getElementById("selectedActivityId").value,
            "type": "I",
            "customer": "5",
//             "phone": document.getElementById("phone").value,
//             "pickTime": document.getElementById("pickTime").value,
            "note": document.getElementById("note").value,

          };

          console.log(jsonData);
          // 创建 XMLHttpRequest 对象并发送 JSON 数据到后端===================
          $.ajax({
            url: '${pageContext.request.contextPath}/custIndex/newOrderInner',
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(jsonData),
            success: function (responseJson) {
              console.log(responseJson.success)
              //              console.log(responseJson); // 将 JSON 数据打印到控制台
              if (responseJson.success === "新增成功") {
                // 重定向到订单确认页面
                setTimeout(function () {
                  localStorage.clear();
                  window.location.href = "<c:url value='/ordercheck' />";
                }, 800); // 延时800毫秒后跳转
              }

            },
            error: function (xhr, status, error) {
              console.error("錯誤：" + xhr.status);
              if (xhr.responseJSON && xhr.responseJSON.error) {
                alert(xhr.responseJSON.error); // 使用警告框顯示錯誤訊息
                location.reload(); // 自動重新載入頁面
              } else {
                alert("發生未知錯誤，無法提交訂單"); // 使用警告框顯示未知錯誤訊息
              }

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
            <h3 style="text-align: center ;font-weight: bold;">墨竹亭-公益店 (5桌)</h3>
            <!-- (外帶/內用) -->
            <br>

            <form id="myForm" onsubmit="return validateAndRedirect()">
              <!-- 訂單內容 -->
              <div class="row">
	              <div class="col-sm-12">
	
	                <fieldset  style="display: flex; flex-direction: column;">
	                  <legend>訂單內容</legend>
	                  <!--新增=============================-->
	                  <div style="flex-grow: 1; overflow-y: auto;">
	                    <table class="store" style="width: 100%;">
	                      <tr>
	                        <th style="width: 50%;">餐點名稱</th>
	                        <th style="width: 20%;">單價</th>
	                        <th style="width: 20%;">數量</th>
	                      </tr>
	
	
	                    </table>
	
	                  </div>
                  </div>

                </fieldset>
              </div><br>

              <div class="row" >
                <div class="col-sm-6">
                  <fieldset >
                    <legend>餐點備註</legend>
                    <textarea id="note" rows="8" cols="20" style="width: 98%" placeholder="請輸入餐點備註"></textarea>
                  </fieldset>
                </div>
                <div class="col-sm-6">
                  <fieldset>
                    <legend>訂單金額</legend>
                    <span>商品小計:</span>
                    <span class="totalPrice" style="text-align: right;"></span><br><br>
                    <span>折扣金額:</span>
                    <span id="discount"></span>
                    <div>
                      <span>(活動名稱: <span id="activityName"></span>)</span><br>
                    </div><br>
                    <span>應付金額:</span>
                    <span class="totalAmount"></span><br><br>
                    <!-- 添加隱藏字段 -->
                    <input type="hidden" value="" id="selectedActivityId" />
                    <input type="hidden" value="" id="totalAmount" />
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
          window.location.href = "<c:url value='/menuInner' />";
        }

        //時間設定============================================

//         var pickTimeSelect = document.getElementById('pickTime');
        var currentTime = new Date();
        var currentHour = currentTime.getHours();
        var currentMinute = currentTime.getMinutes();

        //檢查是否為星期日不讓user選擇取餐時間=====
        var daysOfWeek = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
        var currentDayOfWeek = daysOfWeek[currentTime.getDay()];
        if (currentDayOfWeek === '星期日') {
          alert('今日星期日無營業');
//           for (var i = 0; i < pickTimeSelect.options.length; i++) {
//             pickTimeSelect.options[i].disabled = true;
//           }

        }


        // 禁止選擇過去的時間和相差不到10分鐘的時間內用關掉===============================
//         for (var i = 0; i < pickTimeSelect.options.length; i++) {
//           var optionValue = pickTimeSelect.options[i].value;
//           var optionTimeParts = optionValue.split(':');
//           var optionHour = parseInt(optionTimeParts[0]);
//           var optionMinute = parseInt(optionTimeParts[1]);

//           if (optionHour < currentHour || (optionHour === currentHour && optionMinute < currentMinute)) {
//             pickTimeSelect.options[i].disabled = true;
//           } else {
//             var timeDifference = (optionHour * 60 + optionMinute) - (currentHour * 60 + currentMinute);
//             if (timeDifference <= 10) {
//               pickTimeSelect.options[i].disabled = true;
//             }
//           }
//         }


      </script>


      </html>