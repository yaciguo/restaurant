<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="/CSS/table.css">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    <link href="./assets/src/plugins/bootstrap5.2/bootstrap.min.css"			
    rel="stylesheet">
    <script src="./assets/src/plugins/bootstrap5.2/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="./assets/src/plugins/jquery/jquery-1.11.0.min.js"></script>
    <link rel="stylesheet" href="http://java.sun.com/jsp/jstl/core">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="./assets/src/plugins/fontawesome/css/all.min.css" rel="stylesheet">
    <!-- Favicons -->
    <link href="https://example.com/assets/img/s-logo.png" rel="icon">

    <!-- jquery 框架 -->
     <script type="text/javascript"
        src="./assets/src/plugins/jquery/jquery-1.11.0.min.js"></script>

    <!-- fontAwesome - icon插件 -->
    <link href="https://example.com/assets/src/plugins/fontawesome/css/all.min.css"
        rel="stylesheet">
    <title>table</title>
</head>
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
    
    <div id="main-content" class="main-content">
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
                    <i class="fa-regular fa-address-card fa-xl"></i>
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
                    <i class="fa-solid fa-gift fa-xl"></i>
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
  
    <h2>桌位管理</h2>
    <div class="btn-group" role="group" >
        <input type="radio" autocomplete="off" checked>
        <label for="btnradio1" >訂位</label>

        <input type="radio" autocomplete="off">
        <label for="btnradio2">候位</label>
    </div>
    <input type="text" name="findphone" id="fphone" placeholder="請輸入電話查詢">
    <section class="container">
        <div class="box">1桌</div>
        <div class="box">2桌</div>
        <div class="box">3桌</div>
        <div class="box">4桌</div>       
        <div class="box">5桌</div>
        <div class="box">6桌</div>
        <div class="box">7桌</div>
        <div class="box">8桌</div>
    </section>
</div>
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
</html>