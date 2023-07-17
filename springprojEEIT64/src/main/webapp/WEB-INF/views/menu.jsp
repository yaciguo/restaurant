<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

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
            <title>menu</title>
            <link rel="stylesheet" href="<c:url value='/css/menu.css' />">

        </head>

        <body class="">
            
                <div class="container">
                    <!-- 輪播 -->
                    <div class="row">
                    <!-- 導覽列 -->
            			<%@ include file="nav.jsp" %>
                    </div>
                    <!--  -->
                    <div class="row" id="container-intro">
                        <div class="col-sm-4">
                            <div>墨竹亭(公益店)</div><br>
                            <div>(外帶)</div>
                        </div>

                        <div class="col-sm-5">
                            <div>
                                <span id="dayOfWeek"></span>
                                <span id="time"></span><br>
                                <span>今日營業時段:</span>
                                <div id="openingHoursDiv">
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3">
                            <br>&nbsp;
                            <input id="restInfo" type="button" value="餐廳資訊" onclick="restInfo()" />
                            <!--                 <button style="font-size: 30px; color: white">餐廳資訊</button> -->
                        </div>
                    </div><br>

                    <!--分類區=======================-->

                    <div class="row" id="categoryButtons">
                        <div class="col-sm-12">

                        </div>
                    </div>
                    <hr>

                    <!--菜單區-->
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="tableContainer">

                            </table>
                        </div>
                    </div>

                </div>

                <!--購物車按鈕-->
                <div class="container2">
                    <div class="shopping">
                        <img id="cart" src="<c:url value='/images/cart.png' />" style="width: 70px;">
                        <span class="quantity">0</span>
                    </div>
                    <div class="list"></div>
                </div>
                <button onclick="scrollToTop()" id="top">回到頁首</button>


                <div class="card">
                    <h2 style="color: aliceblue;">&emsp;購物車
                        <button class="closeShopping" style="float: right; color: aliceblue;">x</button>
                    </h2 style="border-bottom: 1px solid black;">
                    <!-- <ul class="listCard">
        </ul> -->
                    <table class="inCard"></table>
                    <div class="checkOut">
                        <div class="total">0</div>
                        <div class="" onclick="validateAndRedirect(event)">結帳</div>
                    </div>
                </div>
                <!-- <script type="text/javascript" src="<c:url value='/js/menu.js' />"></script> -->

        </body>

        <script>
            //test================================0702==================
            // $(document).ready(function () {
            //     let contextPath = '${pageContext.request.contextPath}';
            //     initializeMenu(contextPath);
            // })

            function scrollToTop() {
                window.scrollTo({
                    top: 0,
                    behavior: "smooth"
                });
            }


            function validateAndRedirect(event) {
                // 检查 cart[] 是否为空
                if (cart.length === 0) {
                    alert("購物車為空");
                    event.preventDefault(); // 取消事件的默认行为
                } else {
                    window.location.href = "<c:url value='/shoppingcart' />";
                }
            }

            function restInfo() {
                window.location.href = "<c:url value='/restInfo' />";
            }



            var isAlertDisplayed = false; // 跟蹤警告視窗是否已經彈出
            function updateDateTime() {
                var now = new Date();

                // 獲取星期
                var daysOfWeek = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
                var dayOfWeek = daysOfWeek[now.getDay()];

                // 時間
                var time = now.toLocaleTimeString();

                // 將日期、星期和時間顯示在網頁上
                document.getElementById('dayOfWeek').textContent = dayOfWeek;
                document.getElementById('time').textContent = time;

                // 檢查是否為星期日並顯示警告訊息
                if (dayOfWeek === '星期日' && !isAlertDisplayed) {
                    // 星期日，且警告視窗未彈出，顯示警告訊息
                    alert('今日星期日無營業');
                    isAlertDisplayed = true; // 將警告視窗已彈出的標記設置為true
                } else {
                    // TODO: 在這裡添加其他操作的程式碼
                }
            }


            // 頁面加載完成後調用 displayDateTime() 函數
            window.onload = function () {
                updateDateTime(); // 立即更新時間
                setInterval(updateDateTime, 1000); // 每秒鐘更新一次時間
            };

        </script>
        <script>
            //=======================0702test==================================
            let products = [];
            let categories = [];
            //jquery
            $(document).ready(function () {
                //==================================營業時間=====================
                $.ajax({
                    url: "${pageContext.request.contextPath}/custIndex/getOpeningHoursForToday",
                    type: "GET",
                    dataType: "json",
                    success: function (data) {
                        var openingHours = data;
                        var openingHoursDiv = $("#openingHoursDiv");

                        if (openingHours.length > 0) {

                            for (var i = 0; i < openingHours.length; i++) {
                                var openingHour = openingHours[i];
                                var startTime = openingHour.startTime;
                                var endTime = openingHour.endTime;
                                var openingHourStr = startTime + ' - ' + endTime + " " + " " + " ";
                                var openingHourElement = $("<p>").text(openingHourStr);
                                openingHoursDiv.append(openingHourElement);
                            }
                        } else {
                            var noOpeningHourElement = $("<p>").text("今日無營業");
                            openingHoursDiv.append(noOpeningHourElement);
                        }
                    },
                    error: function () {
                        console.log("error");
                    }
                });

                //======================================資料庫抓分類============================	
                $.ajax({
                    url: '${pageContext.request.contextPath}/custIndex/showCategories',
                    type: "GET",
                    dataType: "json",
                    success: function (response) {
                        categories = response; // 得到返回的分類
                        renderCategoryList();
                        bindCategoryClickEvent(); // click分類按鈕

                    },
                    error: function (xhr, status, error) {
                        console.log("Error: " + error);
                    }
                });



                function renderCategoryList() {
                    var categoryButtonsContainer = document.getElementById("categoryButtons");

                    // ===================將每個分類創一個按鈕=========================
                    categories.forEach(function (category) {
                        var box = document.createElement("div");
                        box.classList.add("box");

                        var button = document.createElement("button");
                        button.classList.add("btsort");
                        button.innerText = category;

                        box.appendChild(button);
                        categoryButtonsContainer.appendChild(box);
                    });
                }

                function bindCategoryClickEvent() {
                    $(".btsort").on("click", function () {
                        // 获取按钮的文本内容作为类别
                        var category = $(this).text();

                        // 根据标识符查找对应的 <tr> 元素
                        var targetRow = $("tr.categoryRow").filter(function () {
                            return $(this).find("td").text() === category;
                        });

                        // 检查目标元素是否存在
                        if (targetRow.length > 0) {
                            // 执行滚动到目标元素的操作
                            $("html, body").animate({
                                scrollTop: targetRow.offset().top
                            }, 200);
                        }
                    });
                }



                //================================================
                $("#cart").click(function () {
                    $("body").addClass('active');
                })
                $(".closeShopping").click(function () {
                    $("body").removeClass('active');
                })


                //======================================================================================
                //引入json=== 抓到/dishes2====================================================
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "/restaurant/custIndex/dishes2", true);
                xhr.send()
                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        products = JSON.parse(xhr.responseText);
                        $("#tableContainer").html("")
                        let content = ''
                        let currentCategory = '' //追蹤該類別
                        products.forEach(function (obj, index) {

                            let categoryName = obj.categoryBean.name;
                            if (categoryName !== currentCategory) {
                                content += "<tr class='categoryRow'>" +
                                    "<td colspan='5'><span>" + categoryName + "</span></td>" +
                                    "</tr>";
                                currentCategory = categoryName; // 更新当前类别
                            }
                            //"<c:url value='/images/cart.png' />"
//                             console.log(obj.picture)
                            
                            let base64Image  = obj.picture; 
                            let statusText = obj.status === 'Y' ? '' : '售完';
                            // 檢查是否為售完商品，若是則設定 disabled 屬性
                            let addButton = obj.status === 'Y' ? "<button class='add' onclick='addToCard(" + index + ")'>+</button>"
                                : "<button class='add' disabled style='background-color: gray;'>+</button>";

                            let rowClass = obj.status === 'Y' ? '' : 'soldOutBackground noHover';

                            content += "<tr class='tableRow " + categoryName + " " + rowClass + "'>" +
                                "<td id='td1' style='width: 8%;'><img src='" + base64Image  + "' style='width: 160px;'></td>" +
                                "<td id='td6' style='width: 9%;'>" + (obj.status === 'Y' ? statusText : "<span class='tdStatus'>" + statusText + "</span>") + "</td>" +
                                "<td id='td2' style='width: 10%;font-size: 23px;font-weight:900;'>" + obj.name + "</td>" +
                                "<td id='td5' style='width: 25%;font-size: 18px'>" + obj.description + "</td>" +
                                "<td id='td3' style='width: 10%;font-size: 23px;font-weight:900;'>$ " + obj.price + "</td>" +
                                "<td id='td4' style='width: 7%;'>" + addButton +
                                "</td>" +
                                "<tr>";



                        })
                        $("#tableContainer").append(content)
                    }
                }


            });

            //===================================================
            //add cart
            // cart array
            let cart = JSON.parse(localStorage.getItem("CART")) || [];
            updateCart();



            function addToCard(index) {
                if (cart.some((item) => item.id === index + 1)) {
                    changeNumberOfUnits("plus", index + 1)
                } else {
                    let item = products.find((obj) => obj.id === index + 1);
                    cart.push({
                        ...item,
                        numberOfUnits: 1,
                    });
                }

                updateCart();

            }
            // update cart
            function updateCart() {
                renderCartItems();
                renderSubtotal();

                // save cart to local storage
                localStorage.setItem("CART", JSON.stringify(cart));

            }

            function renderSubtotal() {
                let totalPrice = 0,
                    totalItems = 0;
                cart.forEach((item) => {
                    totalPrice += item.price * item.numberOfUnits;
                    totalItems += item.numberOfUnits;
                });

                $(".total").html(totalPrice)
                $(".quantity").html(totalItems)
            }

            function renderCartItems() {
                $(".inCard").html("")
                let content = ""
                cart.forEach((item) => {
                    content += "<tr class='cart-item' style='color:white;'>" +
                        "<td class='item-info'>" +
                        "<button style='display: inline-block;' class='btn delete' onclick='removeItemFromCart(" + item.id + ")'>x</button>" +
                        "<h4 style='display: inline-block;'>" + item.name + "</h4>" +
                        "</td>" +
                        "<td class='unit-price'>" +
                        "<small>$</small>" + item.price +
                        "</td>" +
                        "<td class='units'>" +
                        "<button class='btn minus' onclick='changeNumberOfUnits(\"minus\", " + item.id + ")'>-</button>" +
                        "<div class='number'>" + item.numberOfUnits + "</div>" +
                        "<button class='btn plus' onclick='changeNumberOfUnits(\"plus\", " + item.id + ")'>+</button>" +
                        "</td>" +
                        "</tr>";
                })
                $(".inCard").append(content)

                //印cart
                console.log(cart)


            }

            function removeItemFromCart(id) {
                cart = cart.filter((item) => item.id !== id);

                updateCart();
            }

            function changeNumberOfUnits(action, id) {
                cart = cart.map((item) => {
                    let numberOfUnits = item.numberOfUnits
                    if (item.id == id) {
                        if (action == "minus" && numberOfUnits > 1) {
                            numberOfUnits--

                        } else if (action == "plus") {
                            numberOfUnits++
                        }
                    }

                    return {
                        ...item,
                        numberOfUnits: numberOfUnits

                    };

                })
                updateCart();

            }



        //=======================0702test=============================
        </script>

        </html>
