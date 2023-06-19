<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
    :root {
        --main-color: #1d1f26;
        --sec-color: #FAF0E6;
        --main-radius: 10px;
    }

    .sidebar {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        z-index: 100;
        padding: 20px 0;
        width: 60px;
        text-align: center;
        transition: all 0.3s ease-in-out;
        background-color: var(--main-color);
        overflow-y: auto;
        overflow: hidden;
    }

    .sidebar.active {
        width: 180px;
    }

    .nav li {
        height: 65px;
        display: flex;
        align-items: center;
    }

    .nav-link {
        color: var(--sec-color);
        display: flex;
        align-items: center;
    }

    .nav-title {
        opacity: 0;
        margin-left: 15px;
        white-space: nowrap;
        letter-spacing: 2.5px;
    }

    .nav-title.active {
        opacity: 1;
        transition: opacity 0.7s ease-in-out;
    }

    .topbar {
        padding: 20px 40px 20px 20px;

        margin-left: 60px;
        background-color: #FFF;
    }

    .topbar.active {
        margin-left: 180px;
    }

    .topbar a {
        color: var(--main-color);
    }
</style>

<body>
    <!-- 左側 導覽列 -->
    <nav id="sidebar" class="sidebar">
        <img src="./assets/img/logo.png">

        <ul class="nav flex-column" style="list-style: none;padding: 30px 0;">
            <li><a href="/basicSettings.jsp" class="nav-link side-nav active">
                    <i class="fa-solid fa-house fa-xl"></i>
                    <span class="nav-title">餐廳管理</span>
                </a></li>
            <!-- <li><a href="#member" class="nav-link side-nav">
                    <i class="fa-regular fa-address-card fa-xl"></i>
                    <span class="nav-title">會員管理</span>
                </a></li> -->
            <li><a href="/table.jsp" class="nav-link side-nav">
                    <i class="fa-solid fa-couch fa-lg"></i>
                    <span class="nav-title">桌位管理</span>
                </a></li>
            <li><a href="product.jsp" class="nav-link side-nav">
                    <i class="fa-solid fa-book-open-reader fa-xl"></i>
                    <span class="nav-title">商品管理</span>
                </a></li>
            <li><a href="orders.jsp" class="nav-link side-nav">
                    <i class="fa-solid fa-list-ul fa-xl"></i>
                    <span class="nav-title">訂單管理</span>
                </a></li>
            <li><a href="activity.jsp" class="nav-link side-nav">
                    <i class="fa-solid fa-gift fa-xl"></i>
                    <span class="nav-title">活動管理</span>
                </a></li>
            <li><a href="checkbox.jsp" class="nav-link side-nav">
                    <i class="fa-solid fa-sack-dollar fa-xl"></i>
                    <span class="nav-title">結帳管理</span>
                </a></li>
            <li><a href="/dataAnalysis.jsp" class="nav-link side-nav">
                    <i class="fa-solid fa-chart-column fa-xl"></i>
                    <span class="nav-title">數據管理</span>
                </a></li>
            <!-- <li><a href="#mail" class="nav-link side-nav">
                    <i class="fa-regular fa-comment-dots fa-xl"></i>
                    <span class="nav-title">客服管理</span>
                </a> -->
        </ul>
    </nav>

    <!-- 上方 導覽列 -->
    <nav id="topbar" class="topbar d-flex justify-content-between">
        <!-- 導覽列開關按鈕 -->

        <a href="#">
            <i class="fa-solid fa-bars fa-2xl mx-2" id="sidebar-Toggle" style="cursor: pointer;"></i>
        </a>

        <span class="page-title fa-solid fa-xl" style="display: contents;"></span>

        <a href="#logout">
            <i class="fa-solid fa-right-to-bracket fa-xl">
                <span>登出</span></i>
        </a>
    </nav>
</body>


<script>
    $(function () {
        // 導覽列控制設定
        document.getElementById('sidebar-Toggle').addEventListener('click', function () {
            document.getElementById('sidebar').classList.toggle('active');
            document.getElementById('topbar').classList.toggle('active');
            document.getElementById('main-content').classList.toggle('active');
            document.querySelectorAll('.nav-title').forEach(function (title) {
                title.classList.toggle('active');
            });
        });


        // 控制上方導覽列顯示相對應頁面標題
        var sideNavs = document.getElementsByClassName('side-nav');
        var pageTitle = document.querySelector('.page-title');
        for (var i = 0; i < sideNavs.length; i++) {
            sideNavs[i].addEventListener('click', function (e) {
                var navTitle = this.querySelector('.nav-title').textContent;
                pageTitle.textContent = navTitle;
            });
        }
    });

</script>