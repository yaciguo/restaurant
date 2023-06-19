<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>searchorder</title>
</head>
<style>
  body {
    margin-right: 10%;
    margin-left: 10%;
  }

  header {
    /* display: flex;
      justify-content: center; */
    text-align: center;
    color: white;
    background-color: rgb(239, 164, 84);
    border-radius: 10px;
  }

  /* form {
    width: 100%;
  } */

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
    /* margin-right: 20px; */
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
  <div class="container">
    <div>
      <header>
        <h1>訂單查詢</h1>
      </header>
    </div>
    <br />

    <div class="form-container">
      <div class="form1">
        <form:form action="">
          <fieldset>
            <legend>取餐資料</legend>
            <label for="">姓名</label><br />
            <input name="username" type="text" placeholder="請輸入訂購人" required /><br /><br />
            <label for="">手機</label><br />
            <input name="userphone" type="tel" placeholder="請輸入手機(格式0912345678)" pattern="[0]{1}[9]{1}[0-9]{8}"
              required />
            <br /><br />
            <input type="submit" value="查詢" />
          </fieldset>
        </form:form>
      </div>
      <div class="form2">
        <form:form action="">
          <fieldset>
            <legend>訂單記錄</legend>
            <table>
              <div>
                <tr>
                  <th>成立時間</th>
                  <td>(yyyy/mm/dd hh:mm)</td>
                </tr>
                <tr>
                  <th>付款方式</th>
                  <td>(現金)</td>
                </tr>
                <tr>
                  <th>金額</th>
                  <td>$(999)</td>
                </tr>
                <tr>
                  <th>明細</th>
                  <td>(商品名)</td>
                </tr>
              </div>

              <!-- <div>
                <tr>
                  <td>(商品名)</td>
                  <td>(數量)</td>
                  <td>(金額)</td>
                </tr>
              </div> -->
            </table>
          </fieldset>
        </form:form>
      </div>

    </div>
  </div>
</body>

</html>