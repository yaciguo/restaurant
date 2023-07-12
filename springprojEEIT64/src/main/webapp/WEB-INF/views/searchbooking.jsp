<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jquery 框架 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <!-- Boostrap 導入程式 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
          crossorigin="anonymous"></script>
          <!-- fontAwesome - icon插件 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
        <title>searchbooking</title>
      </head>
      <style>
        body {
          margin-right: 10%;
          margin-left: 10%;
          /* display: flex; */
          /* justify-content: center; */
          /*     width: 60%; */
        }

        header {
          /* display: flex;
      justify-content: center; */
          text-align: center;
          color: white;
          background-color: rgb(239, 164, 84);
          border-radius: 10px;
        }

        /*   form { */
        /*     width: 40%; */
        /*   } */

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

        /*   .form-container { */
        /*     display: flex; */
        /*     justify-content: space-between; */
        /*   } */

        /*   .form1 { */
        /*     width: 40%; */
        /*     margin-right: 20px; */
        /*   } */

        /*   .form2 { */
        /*     width: 60%; */
        /*   } */

        th {
          text-align: left;
          width: 50%;
        }
      </style>

      <body>
        <!-- 導覽列 -->
          <%@ include file="nav.jsp" %>
          <header style="margin-top: 20px;">
                  <h1>訂位查詢</h1>
                </header>
        <div class="container">
            <div class="row">
              <div class="col-sm-12">
                
              </div>
            </div>
            <br />
            <div class="row">
              <div class="col-sm-4">
                <form:form action="${pageContext.request.contextPath}/reservation" method="POST">
                  <fieldset>
                    <legend>訂位資料</legend>
                    <label>姓名</label><br />
                    <input name="name" type="text" placeholder="請輸入訂位人" style="width: 90%;" required
                      value="${param.name}" /><br /><br />
                    <label>手機</label><br />
                    <input name="phone" type="tel" placeholder="請輸入手機(格式0912345678)" style="width: 90%;"
                      pattern="[0]{1}[9]{1}[0-9]{8}" value="${param.phone}" required />
                    <br /><br />
                    <input type="submit" value="查詢" />
                  </fieldset>
                </form:form>
              </div>
              <div class="col-sm-8">
                <form:form action="">
                  <fieldset>
                    <legend>訂位記錄</legend>
                    <table>
                      <c:if test="${not empty reservationList}">
                        <c:forEach var="reservation" items="${reservationList}">
                          <tr>
                            <th>成立時間</th>
                            <td>${reservation.submitTime}</td>
                          </tr>
                          <tr>
                            <th>訂位人數</th>
                            <td>${reservation.pNumber} 位</td>
                          </tr>
                          <tr>
                            <th>訂位日期</th>
                            <td>${reservation.date}</td>
                          </tr>
                          <tr>
                            <th>用餐時間</th>
                            <td>${reservation.startTime}</td>
                          </tr>
                          <tr>
                            <th>E-mail</th>
                            <td>${reservation.email}</td>
                          </tr>
                          <tr>
                            <th>備註</th>
                            <td>${reservation.note}</td>
                          </tr>
                          <!-- 添加分隔线 -->
                          <c:if test="${not status.last}">
                            <tr>
                              <td colspan="2">
                                <hr />
                              </td>
                            </tr>
                          </c:if>
                        </c:forEach>

                      </c:if>
                    </table>
                    <c:if test="${empty reservationList}">
                      <p style="font-size: 30px; text-align: center">${noDataMessage}</p>
                    </c:if>
                  </fieldset>
                </form:form>
              </div>
            </div>
        </div>
      </body>

      <script>
        //若查無資料清空input欄位
        window.onload = function () {
          var noDataMessage = '${noDataMessage}';
          if (noDataMessage) {
            setTimeout(function () {
              document.querySelector('input[name="name"]').value = '';
              document.querySelector('input[name="phone"]').value = '';
            }, 300);
          }

          // 當使用者離開頁面時清空 input 欄位的值
          window.onbeforeunload = function () {
            document.querySelector('input[name="name"]').value = '';
            document.querySelector('input[name="phone"]').value = '';
          };

        };

      </script>

      </html>
