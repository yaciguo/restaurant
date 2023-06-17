<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>booking</title>

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
    <div>(訂位須知)</div>
  </div>
  <br />
  <div>
    <form:form action="">
      <div class="fieldset-container">
        <fieldset class="fieldsetdata">
          <legend>訂位資料</legend>
          <label for="">人數</label>
          <select name="pNumber" id="" required>
            <option value="">請選擇人數</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
          </select>&emsp;&emsp;

          <label for="">日期</label>
          <input type="date" name="date" required />&emsp;&emsp;

          <label for="">時間</label>
          <select name="time" id="" required>
            <option value="">請選擇時間</option>
            <option value="00:00">12:00</option>
            <option value="00:30">12:30</option>
            <option value="01:00">13:00</option>
            <option value="01:30">13:30</option>
            <option value="01:30">14:00</option>
          </select>
          <br /><br />
          <hr />
          <label for="">姓名</label>
          <input required name="username" type="text" placeholder="請輸入訂位人" />
          <input type="radio" name="gender" value="M" required /> 先生
          <input type="radio" name="gender" value="F" required /> 小姐
          <br /><br />
          <label for="">手機</label>
          <input name="userphone" type="tel" placeholder="請輸入09xxxxxxxx" pattern="[0]{1}[9]{1}[0-9]{8}" required />
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