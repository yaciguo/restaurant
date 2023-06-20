<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>ordercheck</title>
</head>
<style>
body {
  margin-right: 10%; 
  margin-left: 10%; 
/*   display: flex; */
/*   justify-content: center; */
}
  header {
    background-color: rgb(239, 164, 84);
    text-align: center;
    color: white;
/*     margin-left: 10%; */
/*     margin-right: 10%; */
    border-radius: 10px;
  }

  .container {
    padding-left: 10%;
    padding-right: 10%;
  }

  table {
    border-spacing: 10px;

    width: 100%;
  }

  th,
  td {
    text-align: left;
  }

  main {
    text-align: center;
    margin-left: 10%;
    margin-right: 10%;
  }

  footer {
    margin-top: 10%;
    text-align: center;
  }

  button {
    border-radius: 10px;
    border: none;
    background-color: rgb(239, 164, 84);
    color: white;
    font-size: larger;
    font-weight: bold;
    padding: 5px 10px;
    margin: 5%;
  }

  button:hover {
    /* 懸停時的樣式 */
    opacity: 0.8;
    cursor: pointer;
  }

  .modal-header h3 {
    font-size: 30px;

    /* 置中 */
    position: absolute;
    top: 12%;
    left: 50%;
    transform: translate(-50%, -50%);
  }

  #loginModal {
    backdrop: static
  }

  /* #btcheck {
      padding-left: 30%;
      padding-right: 30%;
      text-align: center;
      width: 90%;
      margin-top: -5%;
    } */
</style>
<body>
<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>
  <header>
    <h1 style="margin-top: 20px;">訂單確認</h1>
  </header>
  <div class="container">
    <div class="row">
      <table class="col-sm-12">
        <tr>
          <th>訂購門市</th>
          <td>1</td>
        </tr>
        <tr>
          <th>取餐人</th>
          <td>1</td>
        </tr>
        <tr>
          <th>聯絡電話</th>
          <td>1</td>
        </tr>
        <tr>
          <th>預計取餐時間</th>
          <td>1</td>
        </tr>
        <tr>
          <th>付款方式</th>
          <td>10000000000000</td>
        </tr>
        <tr>
          <th>應付金額</th>
          <td>$</td>
        </tr>
      </table>
    </div>

    <footer>
      <button onclick="window.location.href ='<c:url value='/shoppingcart' />'">上一步</button>
      <button type="button" data-bs-toggle="modal" data-bs-target="#loginModal" id="submit">送出訂單</button>
    </footer>
  </div>

  <!--跳出視窗內容-->
  <div class="modal fade" id="loginModal" aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h3>訂單送出</h3>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <!--body-->
        <div class="modal-body">
          <div id="text" style="text-align: center;">
            訂單已送出 <br /><br />
            感謝訂購!
          </div>
        </div>
        <div class="modal-footer"></div>
        <!-- <div id="btcheck">
            <button id="bt2" style="display: inline-block">查看訂位</button>
          </div> -->
      </div>
    </div>
  </div>

</body>
<script>
  $("#submit").on("click", function () {
    setTimeout(function () {
      window.location.href = '<c:url value='/custIndex' />';
    }, 3000);
  })
</script>
</html>