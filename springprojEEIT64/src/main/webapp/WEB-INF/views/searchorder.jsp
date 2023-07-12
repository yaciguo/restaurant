<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
      <!DOCTYPE html>
      <html>

      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <!-- Boostrap 導入程式 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
          crossorigin="anonymous"></script>
          <!-- fontAwesome - icon插件 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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

        th {
          text-align: left;
          width: 50%;
        }

        /*    td { */
        /*     text-align: left; */
        /*     width: 80%; */
        /*   } */
      </style>


      <body>
        <!-- 導覽列 -->
          <%@ include file="nav.jsp" %>
           		<header style="margin-top: 20px;">
                  <h1>訂單查詢</h1>
                </header>
        <div class="container">
            <div class="row">
              <div class="col-sm-12">
               
              </div>
            </div><br />
            <div class="row">
              <div class="col-sm-4">
                <form:form action="${pageContext.request.contextPath}/searchorders" method="POST">
                  <fieldset>
                    <legend>取餐資料</legend>
                    <label for="">姓名</label><br />
                    <input name="customer" type="text" placeholder="請輸入訂購人" style="width: 90%;"
                      value="${param.customer}" required /><br /><br />
                    <label for="">手機</label><br />
                    <input name="phone" type="tel" placeholder="請輸入手機(格式0912345678)" style="width: 90%;"
                      pattern="[0]{1}[9]{1}[0-9]{8}" value="${param.phone}" required />
                    <br /><br />
                    <input type="hidden" name="viewName" value="searchorder" />
                    <input type="submit" value="查詢" />
                  </fieldset>
                </form:form>
              </div>
              <div class="col-sm-8">
                <form:form action="">
                  <fieldset>
                    <legend>訂單記錄</legend>
                    <table>
                      <c:if test="${not empty orderList}">
                        <c:forEach var="order" items="${orderList}">
                          <tr>
                            <th>成立時間</th>
                            <td>2023-07-12</td>
                          </tr>
                          <tr>
                            <th>應付金額</th>
                            <td>${order.amount}</td>
                          </tr>
                          <tr>
                            <th>折扣金額</th>
                            <td>${empty order.activityBean ? 0 : order.activityBean.discount}</td>
                          </tr>

                          <tr>
                            <th>活動名稱</th>
                            <td>${order.activityBean.name}
                              <c:if test="${order.activityBean.type eq 'gift'}">
                                （贈品：${order.activityBean.dishBean.name}）
                              </c:if>
                            </td>
                          </tr>

                          <tr>
                            <th>預約取餐時間</th>
                            <td>${order.pickTime}</td>
                          </tr>

                          <tr>
                            <th>訂單狀態</th>
                            <td class="status">
                              <script>
                                //置換成中文名稱js寫在body外，EL抓不到
                                var statusMap = {
                                  "order_establish": "訂單成立",
                                  "order_deal": "訂單處理中",
                                  "order_finish": "訂單完成",
                                  "order_cancel": "訂單取消"
                                };
                                var statusString = statusMap["${order.orderStatus}"] || "${order.orderStatus}";
                                document.write(statusString);
                              </script>
                            </td>

                            <%-- <td class="status">${order.orderStatus}</td> --%>
                          </tr>

                          <tr>
                            <th>訂單明細</th>
                            <td>
                              <table>
                                <c:forEach var="detail" items="${order.orderDetailBean}">
                                  <tr>
                                    <td>${detail.dish.name}</td>
                                    <td>${detail.quantity}</td>
                                  </tr>
                                </c:forEach>
                              </table>
                            </td>
                          </tr>

                          <tr>
                            <th>備註</th>
                            <td>${order.note}</td>
                          </tr>
                          <!-- 添加订单明细 -->



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
                    <c:if test="${empty orderList}">
                      <p style="font-size: 30px; text-align: center">${noDataMessage}</p>
                    </c:if>
                  </fieldset>
                </form:form>
              </div>

            </div>
        </div>

      </body>
      <script type="text/javascript">
        //若查無資料清空input欄位
        window.onload = function () {
          var noDataMessage = '${noDataMessage}';
          if (noDataMessage) {
            setTimeout(function () {
              document.querySelector('input[name="customer"]').value = '';
              document.querySelector('input[name="phone"]').value = '';
            }, 300);
          }
        };

        // 當使用者離開頁面時清空 input 欄位的值
        window.onbeforeunload = function () {
          document.querySelector('input[name="customer"]').value = '';
          document.querySelector('input[name="phone"]').value = '';
        };


      </script>

      <script>
        // $(document).ready(function() {
        //     var statusMap = {
        //         "order_establish": "訂單成立",
        //         "order_deal": "訂單處理中",
        //         "order_finish": "訂單完成",
        //         "order_cancel": "訂單取消"
        //     };

        //     var statusString = statusMap["${order.orderStatus}"] || "${order.orderStatus}";
        //     $("#status").html(statusString);
        // });





      </script>

      </html>