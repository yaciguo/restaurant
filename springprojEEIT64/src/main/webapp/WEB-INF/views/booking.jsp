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
  <script type="text/javascript" src="/js/booking.js"></script>

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
  //提交驗證
  function validateAndRedirect() {
    var form = document.getElementById('myForm');
    if (form.checkValidity()) {
    	window.location.href = "/bookingcheck";
      return false; // 阻止表单的默认提交行为
    } else {
      // 在这里执行验证失败时的逻辑
      form.reportValidity();
      return false; // 阻止表单的默认提交行为
    }
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
        <a href="https://goo.gl/maps/tYQZqHMS9LfWwVoE9" target="_blank"><img src="./pic/mapicon.png" alt=""
            style="width: 30px" /></a>
      </div>
      <div>餐廳電話: (04)23891234</div>
      <hr />
    </div>
    <div><h4>訂位須知:</h4>
    1. 只能預訂未來七天內的日期。請選擇日期時確保在可預訂的日期範圍內。<br>
	2. 週六我們不營業，因此無法接受週六的訂位。<br>
	3. 訂位時間為中午 12:00 至下午 6:00，請在這個時間範圍內進行選擇。<br>
	4. 若訂位人數超過四人，請聯絡我們的客服專線進行訂位，電話：(04)23891234。<br><br>
	謝謝您的合作，期待為您提供美味的餐點！  
    </div>
  </div>
  <br />
  <div>
    <form:form action="" id="myForm" method="Get" onsubmit="return validateAndRedirect()">
      <div class="fieldset-container">
        <fieldset class="fieldsetdata">
          <legend>訂位資料</legend>
          <label for="">人數:</label>
          <select name="pNumber" id="" required>
            <option value="">請選擇人數</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
          </select>&emsp;&emsp;

			<%
			Date today = new Date();
			Date tomorrow = new Date();
			tomorrow.setTime(today.getTime() + (24 * 60 * 60 * 1000)); // 加一天
			
			Date sevenDaysLater = new Date();
			sevenDaysLater.setTime(today.getTime() + (7 * 24 * 60 * 60 * 1000)); // 加七天
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			%>

          <label for="">日期:</label>
          <input type="date" name="date" id="date" 
          min="<%= dateFormat.format(tomorrow) %>" max="<%= dateFormat.format(sevenDaysLater) %>"
          oninput="checkSelectedDate(this)" required />&emsp;&emsp;
        
		          

          <label for="">時間:</label>
          <select name="time" id="time" disabled required>
            <option value="">請選擇時間</option>
            <option value="12:00">12:00</option>
            <option value="13:00">13:00</option>
            <option value="14:00">14:00</option>
            <option value="15:00">15:00</option>
            <option value="16:00">16:00</option>
            <option value="17:00">17:00</option>
            <option value="18:00">18:00</option>
          </select>
          <br /><br />
          <hr />
          <label for="">姓名:</label>
          <input required name="username" type="text" placeholder="請輸入訂位人" />
          <input type="radio" name="gender" value="M" required /> 先生
          <input type="radio" name="gender" value="F" required /> 小姐
          <br /><br />
          <label for="">手機:</label>
          <input name="userphone" type="tel" placeholder="請輸入09xxxxxxxx" pattern="[0]{1}[9]{1}[0-9]{8}" required /><br /><br />
          <label for="email">E-mail:</label>
          <input type="email" name="email" id="email" placeholder="請輸入電子郵件" />
          
        </fieldset>
      </div>
      <div>
        <fieldset class="fieldsetdata">
          <legend>備註</legend>
          <textarea name="note" id="note" cols="30" rows="10" style="width: 99%" placeholder="請輸入訂位備註"></textarea>
        </fieldset>
      </div>

      <footer>
        <input type="submit" value="送出訂位" class="button2" />
      </footer>
    </form:form>
  </div>
</body>


</html>