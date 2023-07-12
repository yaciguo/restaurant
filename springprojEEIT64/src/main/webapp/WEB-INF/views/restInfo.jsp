<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="zh-Hant-TW">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
            <!-- Boostrap 導入程式 -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
                crossorigin="anonymous"></script>
                <!-- fontAwesome - icon插件 -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
            <title>restInfo</title>
        </head>
        <script type="text/javascript">
            $(document).ready(function () {
                //======================================資料庫抓============================	
                $.ajax({
                    url: "/restaurant/custIndex/getAllOpeningHour",
                    type: "GET",
                    dataType: "json",
                    success: function (response) {
                        var tbody = $("tbody");
                        var thead = $("thead");
                        var table = $("table");

                        tbody.empty();
                        var dayOfWeekMap = {
                            1: "星期一",
                            2: "星期二",
                            3: "星期三",
                            4: "星期四",
                            5: "星期五",
                            6: "星期六",
                            7: "星期日"
                        };

                        const filledDays = [];

                        response.forEach(data => {
                            const row = $("<tr>");

                            // 创建并填充星期几单元格
                            const dayOfWeekCell = $("<td>").text(dayOfWeekMap[data.dayOfWeek]);
                            row.append(dayOfWeekCell);

                            // 检查当前星期几是否已经存在于已填充的星期几中
                            if (filledDays.includes(data.dayOfWeek)) {
                                // 如果已存在，则将星期几单元格内容设为空白
                                dayOfWeekCell.text("");
                            } else {
                                // 如果不存在，则将当前星期几添加到已填充的星期几中
                                filledDays.push(data.dayOfWeek);
                            }

                            // 创建并填充开始營業时间单元格
                            const startTimeCell = $("<td>").text(data.startTime);
                            row.append(startTimeCell);

                            // 创建并填充結束營業時間单元格
                            const endTimeCell = $("<td>").text(data.endTime);
                            row.append(endTimeCell);

                            // 将行添加到tbody
                            tbody.append(row);


                        });
                        // 创建星期日未营业的行
                        var sundayRow = $("<tr>");
                        sundayRow.append($("<td>").text("星期日"));
                        sundayRow.append($("<td>").text("公休日").attr("colspan", 2));
                        tbody.append(sundayRow);

                        // 将表头和表体添加到表格中
                        $("table").append(thead);
                        $("table").append(tbody);

                        $("#tableContainer").append(table);

                    },
                    error: function (xhr, status, error) {
                        console.log("Error: " + error);
                    }
                });

                $("#pp").click(function () {
                    window.location.href = "<c:url value='/menu' />";
                })
            })




        </script>
        <style>
            body {
                margin-right: 10%;
                margin-left: 10%;
            }

            header {

                text-align: center;
                color: white;
                background-color: rgb(239, 164, 84);
                border-radius: 10px;
                position: relative
            }

            header div {
                text-align: left;
                display: inline-block;
                position: absolute;
                left: 10px;
                top: -1px;
                font-size: xx-large;
                width: 40px;
                cursor: pointer;
                font-weight: bolder;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            tr {
                width: 100%;
            }

            thead {
                background-color: #f9f9f9;
                font-size: larger;
            }

            table th,
            table td {
                padding: 8px;
                text-align: left;
            }

            /* 交替行样式 */
            table tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            /* 鼠标悬停样式 */
            table tbody tr:hover {
                background-color: #e9e9e9;
            }

            /* 示例特定样式 */
            table th:first-child,
            table td:first-child {
                font-weight: bold;
            }

            table th:nth-child(2),
            table td:nth-child(2) {
                width: 300px;
            }

            table th:nth-child(3),
            table td:nth-child(3) {
                width: 300px;
            }
        </style>

        <body>
            <!-- 導覽列 -->
            <%@ include file="nav.jsp" %>

                <div class="container">
                    <div class="row">
                        <header class="col-sm-12">
                            <div id="pp">
                                &lt;</div>
                            <h2 style="display: inline-block;">餐廳資訊</h2>
                        </header>
                    </div><br>
                    <div class="row">
                        <div id="tableContainer" class="col-sm-12">
                            <table id="openingHoursTable">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>開始營業時間</th>
                                        <th>結束營業時間</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </body>

  </html>