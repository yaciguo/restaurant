<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

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

<body class="">
<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>
    <div class="container">
        <!-- 輪播 -->
        <div class="row">

        </div>
        <!--  -->
        <div class="row" id="container-intro">
            <div class="col-sm-3">
               <div>xxx店</div><br>
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
             
            <div class="col-sm-4">
            	<br>&nbsp;
            	<input id="restInfo" type="button" value="餐廳資訊"
            	onclick="restInfo()"/>
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
    <script type="text/javascript" src="<c:url value='/js/menu.js' />"></script>
    
</body>

<script>
$(document).ready(function () {
	let contextPath='${pageContext.request.contextPath}';
	initializeMenu(contextPath);
})

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
    
    function updateDateTime() {
        var now = new Date();

        // 获取星期
        var daysOfWeek = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
        var dayOfWeek = daysOfWeek[now.getDay()];

        // 获取时间
        var time = now.toLocaleTimeString();

        // 将日期、星期和时间显示在网页上
        document.getElementById('dayOfWeek').textContent = dayOfWeek;
        document.getElementById('time').textContent = time;
    }

    // 页面加载完成后调用 displayDateTime() 函数
    window.onload = function () {
        updateDateTime(); // 立即更新时间
        setInterval(updateDateTime, 1000); // 每秒钟更新一次时间
    };
</script>
</html>