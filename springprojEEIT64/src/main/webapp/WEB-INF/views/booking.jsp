<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
	<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>booking</title> 
  <script type="text/javascript" src="<c:url value='/js/booking.js' />"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fontAwesome - icon插件 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

</head>
<style>
body {
  margin-right: 15%;
  margin-left: 15%;

  justify-content: center;
}
fieldset {
  background-color: rgb(241, 237, 230);
  border-radius: 10px;
  border: 1px solid #ccc;
  padding: 15px;
}

legend {
  font-size: 20px;
  font-weight: bold;
  color: orange;
  border-bottom: 1px solid #ccc;
}

footer {
  margin-top: 2%;
  text-align: center;
}
.button2 {
  border-radius: 10px;
  border: none;
  background-color: rgb(239, 164, 84);
  color: white;
  font-size: larger;
  font-weight: bold;
  padding: 5px 10px;
  /* margin: 2%; */
}
.button2:hover {
  /* 懸停時的樣式 */
  opacity: 0.8;
  cursor: pointer;
}

</style>
<script>

//获取人数下拉列表元素==================test===========================================
$('#pNumber').change(function () {
  var selectedPNumber = $(this).val();
  var selectedDate = $('#date').val();

  $.ajax({
    url: '${pageContext.request.contextPath}/custIndex/availableTimes',
    type: 'GET',
    data:{ pNumber: selectedPNumber, date: selectedDate },
    dataType: 'json',
    success: function (data) {
      // 在這里處理從後端獲取的可用日期和時間數據
      console.log(data);
   // 清空时间选项
      $('#startTime').empty();
      
      // 根据返回的可用桌子ID数组生成时间选项
      for (var i = 0; i < data.availableTableIds.length; i++) {
        var tableId = data.availableTableIds[i];
        
        // 在时间选项中添加可选项
        $('#startTime').append('<option value="' + tableId + '">' + tableId + '</option>');
      }
      
      
      
    },
    error: function (xhr, textStatus, errorThrown) {
      // 处理错误情况
      console.log(errorThrown);
    }
  });
});

//================================上面test====================================================



function validateAndRedirect() {
	
	var jsonData = {};
	jsonData.startTime = document.getElementById("startTime").value;
	jsonData.date = new Date(document.getElementById("date").value).toISOString().split("T")[0]; // 获取ISO格式的日期字符串
	jsonData.pNumber = document.getElementById("pNumber").value;
	jsonData.name = document.getElementById("name").value;
	jsonData.phone = document.getElementById("phone").value;
	jsonData.email = document.getElementById("email").value;
	jsonData.note = document.getElementById("note").value;
	jsonData.gender = document.querySelector('input[name="gender"]:checked').value;
	console.log(jsonData)
	  // 创建 XMLHttpRequest 对象并发送 JSON 数据到后端
	  var xhr = new XMLHttpRequest();
	  xhr.open("POST", "${pageContext.request.contextPath}/custIndex/newbooking", true);
	  xhr.setRequestHeader("Content-Type", "application/json");
	  xhr.send(JSON.stringify(jsonData));
	  xhr.onreadystatechange = function() {
		  // 伺服器請求完成
	    if (xhr.readyState === XMLHttpRequest.DONE) {
	      if (xhr.status === 200) {
	        // 处理响应
// 	        console.log(xhr.responseText);
	        var responseJson = JSON.parse(xhr.responseText);
            console.log(responseJson); // 将 JSON 数据打印到控制台           
            if (responseJson.success) {
//             	console.log(responseJson.success)
            	setTimeout(function() {
            		 // 重定向到 bookingcheck.jsp，并将成功信息和桌子号码作为URL参数传递
            		window.location.href = "/restaurant/bookingcheck"
                }, 500); 
            }else if (responseJson.hasOwnProperty('error')) {
            	console.log(responseJson);
                // 显示错误的提示信息
                alert(responseJson.error);
            }
            
	      } else {
	        // 处理错误
	        console.error("發生錯誤：" + xhr.status);
// 	        alert("no")
	        
	      }
	    }
	  };
  
	  // 阻止表单的默认提交行为
// 	  alert("no")
	  return false;
	}
</script>

<body>
		<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>
	
  <div class="title-intro">
    <h1>xxxx店</h1>
    <div class="row">
      <div>
        餐廳地址: 台中市南屯區公益路二段42號			
        <a href="<c:url value='https://goo.gl/maps/tYQZqHMS9LfWwVoE9' />" target="_blank"><img src="<c:url value='/images/mapicon.png' />" alt=""
            style="width: 30px" /></a>
      </div>
      <div>餐廳電話: (04)23891234</div>
      <hr />
    </div>
    <div><h4>訂位須知:</h4>
    1. 只能預訂未來七天內的日期，選擇日期時確保在可預訂的日期範圍內。<br>
	2. 週六我們不營業，因此無法接受週六的訂位。<br>
	3. 營業時間為11:00 至 14:00 及 16:00 至 20:00，請在這個時間範圍內進行選擇。<br>
	4. 若訂位人數超過四人，請聯絡我們的客服專線進行訂位，電話：(04)23891234。<br><br>
	謝謝您的合作，期待為您提供美味的餐點！  
    </div>
  </div>
  <br />
  <div>
    <form:form id="myForm" 
    	onsubmit="return validateAndRedirect()" modelAttribute="newbooking">
      <div class="fieldset-container">
        <fieldset class="fieldsetdata">
          <legend>訂位資料</legend>
          <label for="pNumber">人數:</label>
          <form:select path="pNumber" id="pNumber" required="true">
	        <form:option value="" label="請選擇人數" />
	        <form:option value="1" label="1" />
	        <form:option value="2" label="2" />
	        <form:option value="3" label="3" />
	        <form:option value="4" label="4" />
		  </form:select>&emsp;&emsp;

			<%
			Date today = new Date();
			Date tomorrow = new Date();
			tomorrow.setTime(today.getTime() + (24 * 60 * 60 * 1000)); // 加一天
			
			Date sevenDaysLater = new Date();
			sevenDaysLater.setTime(today.getTime() + (7 * 24 * 60 * 60 * 1000)); // 加七天
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			%>

          <label for="date">日期:</label>
          <form:input path="date" id="date" type="date" required="true" pattern="yyyy-MM-dd"
          	min="<%= dateFormat.format(tomorrow) %>" max="<%= dateFormat.format(sevenDaysLater) %>" 
          	onchange="enableTimeOptions()"/>	
			<form:errors path="date" cssClass="error" />
<!-- 			<button onclick="printSelectedDate()">印日期</button> -->
<!-- 			<script> -->
<!--  				function printSelectedDate() { -->
<!--  				  var dateInput = document.getElementById("date"); -->
<!--  				  var selectedDate = dateInput.value; -->
<!--  				  console.log("选取的日期为：" + selectedDate); -->
<!--  				} -->
<!-- 			</script> -->

        
		   &emsp;&emsp;       
          <label for="startTime">時間:</label>
            <form:select path="startTime" id="startTime" required="true" disabled="true">    
              <form:option value="" label="請選擇時間" />
      		  <form:option value="11:00:00" label="11:00" />
      		  <form:option value="12:00:00" label="12:00" />
			  <form:option value="13:00:00" label="13:00" />
<%-- 			  <form:option value="14:00:00" label="14:00" /> --%>
<%-- 			  <form:option value="15:00:00" label="15:00" /> --%>
			  <form:option value="16:00:00" label="16:00" />
			  <form:option value="17:00:00" label="17:00" />
			  <form:option value="18:00:00" label="18:00" />
			  <form:option value="19:00:00" label="19:00" />
			 
          	</form:select>
          	<form:errors path="startTime" cssClass="error" />
<!--           	先選日期才能選時間 -->
          	<script>
	          	function enableTimeOptions() {
	          	    var dateInput = document.getElementById("date");
	          	    var selectedDate = dateInput.value;
	          	    
	          	    var startTimeSelect = document.getElementById("startTime");
	
	          	    // 获取选定日期的星期几（0表示星期日，1表示星期一，以此类推）
	          	    var dayOfWeek = new Date(selectedDate).getDay();
	
	          	    // 如果是星期六（dayOfWeek为6），则禁用时间选项
	          	    if (dayOfWeek === 6) {
			            startTimeSelect.disabled = true; // 禁用时间选项
			            alert("週六未營業，請改選其他日期"); // 显示提醒消息
			        	}else {
			            startTimeSelect.disabled = false; // 启用时间选项
			        }
	          	}
	          	
	          	
			</script>
          <br /><br />
          <hr />
          
          <label for="name">姓名:</label>
          <form:input path="name" id="name" type="text" placeholder="請輸入訂位人" required="true" />
     	 	<form:radiobutton path="gender" name="gender" value="M" required="true" label="先生" />
            <form:radiobutton path="gender" name="gender" value="F" required="true" label="小姐" />
            <form:errors path="name" cssClass="error" />
            <form:errors path="gender" cssClass="error" />        
<!--           <input required name="name" id="name" type="text" placeholder="請輸入訂位人" />           -->
<!--           <input type="radio" name="gender" value="M" required /> 先生 -->
<!--           <input type="radio" name="gender" value="F" required /> 小姐 -->
          <br /><br />
          <label for="phone">手機:</label>
          	<form:input path="phone" type="tel" id="phone" placeholder="請輸入09xxxxxxxx" pattern="[0]{1}[9]{1}[0-9]{8}" required="true" /><br /><br />
			<form:errors path="phone" cssClass="error" />
<!--           <input name="phone" type="tel" id="phone" placeholder="請輸入09xxxxxxxx" pattern="[0]{1}[9]{1}[0-9]{8}" required /><br /><br /> -->
          <label for="email">E-mail:</label>
          	<form:input path="email" type="email" id="email" placeholder="請輸入電子郵件" />
          	<form:errors path="email" cssClass="error" />   
<!--           <input type="email" name="email" id="email" placeholder="請輸入電子郵件" /> -->         
        </fieldset>
      </div>
      <div>
        <fieldset class="fieldsetdata">
          <legend>備註</legend>
           <form:textarea path="note" id="note" cols="30" rows="10" style="width: 99%" placeholder="請輸入訂位備註"></form:textarea>
			<form:errors path="note" cssClass="error" />
<!--           <textarea name="note" id="note" cols="30" rows="10" style="width: 99%" placeholder="請輸入訂位備註"></textarea> -->
        </fieldset>
      </div>

      <footer>
        <input type="submit" value="送出訂位" class="button2" />
      </footer>
    </form:form>
  </div>
</body>


</html>