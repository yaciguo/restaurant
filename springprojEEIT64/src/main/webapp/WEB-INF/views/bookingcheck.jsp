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
    <h1 style="margin-top: 20px;">訂位成功</h1>
  </header>
  <div class="container">
    <div class="row"> 
      <table class="col-sm-12">
        <tr>
          <th>訂位姓名</th>
          <td>xxx</td>
        </tr>
        <tr>
          <th>訂位人數</th>
          <td>1</td>
        </tr>
        <tr>
          <th>聯絡電話</th>
          <td>0919208005</td>
        </tr>
        <tr>
          <th>訂位日期</th>
          <td>1</td>
        </tr>
        <tr>
          <th>訂位時間</th>
          <td>12:00</td>
        </tr>
        <tr>
          <th>備註</th>
          <td></td>
        </tr>
      </table>
    </div>

    <footer>
      <button type="button" data-bs-toggle="modal" data-bs-target="#loginModal" id="submit">回首頁</button>
    </footer>
  </div>

  

</body>
<script>
  $("#submit").on("click", function () {
    setTimeout(function () {
      window.location.href = '<c:url value='/custIndex' />';
    }, 1000);
  })
</script>
</html>