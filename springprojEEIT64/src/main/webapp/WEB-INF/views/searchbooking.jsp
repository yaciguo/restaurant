<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>searchbooking</title>
	</head>
		<style>
  body {
    margin-right: 20%;
    margin-left: 20%;
    /* display: flex; */
    /* justify-content: center; */
    width: 60%;
  }

  header {
    /* display: flex;
      justify-content: center; */
    text-align: center;
    color: white;
    background-color: rgb(239, 164, 84);
    border-radius: 10px;
  }

  form {
    width: 40%;
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

  .form-container {
    display: flex;
    justify-content: space-between;
  }

  .form1 {
    width: 40%;
    margin-right: 20px;
  }

  .form2 {
    width: 60%;
  }

  th {
    text-align: left;
    width: 50%;
  }
</style>

<body>
<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>

  <div>
    <header>
      <h1>訂位查詢</h1>
    </header>
  </div>
  <br />
  <div class="form-container">
    <form:form action="" class="form1">
      <fieldset>
        <legend>訂位資料</legend>
        <label for="">姓名</label><br />
        <input name="username" type="text" placeholder="請輸入訂位人" required /><br /><br />
        <label for="">手機</label><br />
        <input name="userphone" type="tel" placeholder="請輸入手機(格式0912345678)" pattern="[0]{1}[9]{1}[0-9]{8}" required />
        <br /><br />
        <input type="submit" value="查詢" />
      </fieldset>
    </form:form >
    <form:form action="" class="form2">
      <fieldset>
        <legend>訂位記錄</legend>
        <table>
          <div>
            <tr>
              <th>成立時間</th>
              <td>(yyyy/mm/dd hh:mm)</td>
            </tr>
            <tr>
              <th>訂位人數</th>
              <td>() 位</td>
            </tr>
            <tr>
              <th>訂位日期</th>
              <td>xxx</td>
            </tr>
            <tr>
              <th>訂位時間</th>
              <td>12:00</td>
            </tr>
          </div>
        </table>
      </fieldset>
    </form:form>
  </div>
</body>

</html>