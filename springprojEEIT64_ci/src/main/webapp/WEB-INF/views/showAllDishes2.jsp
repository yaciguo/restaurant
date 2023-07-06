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
    <title>menu</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css' />">

</head>
<!-- <script type="text/javascript" src="/js/menu2.js"></script> -->
<script>
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: "smooth"
        });
    }

</script>
<body class="">
<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>
    <div class="container">
        <!-- 輪播 -->
        <div class="row">

        </div>
        <!--  -->
        <div class="row" id="container-intro">
            <div class="col-sm-4">
                <div>xxx店</div>
                <div>(外帶/內用桌號)</div>
            </div>

            <div class="col-sm-5">
                <div> (帶入當日營業時間)</div>
                <!--選單-->
                <div>
                    <label>取餐時間：</label>
                    <select name="selectTime" required>
                        <option value="">請選擇時間</option>
                        <option value="00:00">12:00</option>
                        <option value="00:30">12:30</option>
                        <option value="01:00">13:00</option>
                        <option value="01:30">13:30</option>
                        <option value="01:30">14:00</option>
                        <option value="01:30">14:30</option>
                        <option value="01:30">15:00</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-3">
                <button style="font-size: 30px; color: white; ">餐廳資訊</button>
            </div>
        </div><br>
        <!--分類區-->
        <div class="row">
            <div class="box"><a href="#row1"><button class="btsort">全部</button></a></div>
            <div class="box"><a href="#row2"><button class="btsort">麵類</button></a></div>
            <div class="box"><a href="#row3"><button class="btsort">湯品</button></a></div>
            <div class="box"><a href="#row4"><button class="btsort">飲料</button></a></div>
        </div>
        <hr>
        <!--菜單區-->
        <div class="row">
            <div>
                <table id="tableContainer">

                </table>
            </div>
        </div>

    </div>

    <!--購物車按鈕-->
    <div class="container2">
        <div class="shopping">
            <img id="cart" src="/images/cart.png" style="width: 70px;">
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
    <script type="text/javascript" src="/js/menu2.js"></script>
</body>
<script>

    function validateAndRedirect(event) {
        // 检查 cart[] 是否为空
        if (cart.length === 0) {
            alert("購物車為空");
            event.preventDefault(); // 取消事件的默认行为
        } else {
            // 在这里执行跳转逻辑
            window.location.href = "<c:url value='/shoppingcart' />";
        }
    }
</script>
</html>