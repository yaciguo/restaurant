<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
%>
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
        <!-- fontAwesome - icon插件 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
      <title>ordercheck</title>
       <script>
        // 在頁面離開時執行
        window.onunload = function () {
          // 使用 window.location.replace 將使用者重定向到同一個頁面
          window.location.replace("<c:url value='/ordercheck' />");
        };
      </script>
     
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
    </style>


    <body>
      <!-- 導覽列 -->
      <%@ include file="nav.jsp" %>
        <header>
          <h1 style="margin-top: 20px;">訂購完成</h1>
        </header>
        <br><br>

        <div class="container">
          <div class="row" style="text-align: center;">
            <h1>感謝您的訂購！</h1>
          </div>
          <!--     <div class="row">  -->
          <!--       <table class="col-sm-12"> -->
          <!--           <tr> -->
          <!--           <th>取餐人</th> -->
          <!--           <td>1</td> -->
          <!--         </tr> -->
          <!--         <tr> -->
          <!--           <th>聯絡電話</th> -->
          <!--           <td>1</td> -->
          <!--         </tr> -->
          <!--         <tr> -->
          <!--           <th>預計取餐時間</th> -->
          <!--           <td>1</td> -->
          <!--         </tr> -->
          <!--         <tr> -->
          <!--           <th>付款方式</th> -->
          <!--           <td>10000000000000</td> -->
          <!--         </tr> -->
          <!--         <tr> -->
          <!--           <th>應付金額</th> -->
          <!--           <td>$</td> -->
          <!--         </tr> -->
          <!--       </table> -->
        </div>

        <footer>
          <button type="button" id="submit">回首頁</button>
        </footer>
        </div>



    </body>
    <script>
      $("#submit").on("click", function () {
        setTimeout(function () {
          window.location.href = "<c:url value='/custIndex' />";
        }, 500);
      })
    </script>

    </html>
