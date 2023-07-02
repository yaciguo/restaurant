<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>takeout</title>
    <link rel="stylesheet" href="/CSS/takeoutck.css">
    <!-- Favicons -->
    <link href="assets/img/s-logo.png" rel="icon">
    <!-- fontAwesome - icon插件 -->
    <link href="./assets/src/plugins/fontawesome/css/all.min.css"
    rel="stylesheet">
</head>
<script>
    var temp=0;  //暫存被運算數
  
  var strOper=null;  //暫存運算符號
  
  var valueM=0;  //m+ m- mc mr 暫存使用
  //數字鍵與小數點
  function numBtn(str) {
      //避免填入運算後的數字的後面
  
      if (strOper==null) {
          document.getElementById("box").value = str;
          strOper=0;
          return;
      };
  
     if (document.getElementById("box").value==0) { 
          document.getElementById("box").value = str;
      } else {
      document.getElementById("box").value += str;
      }
  
  }
  
  //運算符號
  function operBtn(str) {
    // 不按等号的连续运算
    equal();
    
    if (document.getElementById("box").value !== "0") {
        valueA = document.getElementById("box").value;
    }
    
    strOper = str;
    document.getElementById("box").value = "0";
}
  
  //等於
  
  function equal(){   
      switch (strOper){
          case '+':
              document.getElementById("box").value=parseFloat(valueA)+parseFloat(document.getElementById("box").value);
              break;
          case '-':
              document.getElementById("box").value=parseFloat(valueA)-parseFloat(document.getElementById("box").value);
              break;
          case '*':
              document.getElementById("box").value=parseFloat(valueA)*parseFloat(document.getElementById("box").value);
              break;
          case '/':
              document.getElementById("box").value=parseFloat(valueA)/parseFloat(document.getElementById("box").value);
              break;
          default:
              break;
      }
  
      //防呆用
      temp=null;
      strOper=null;
  }
  
  //M鍵
  function buttonM(str){
  
      switch  (str) {
          case 'M+':
              valueM += parseFloat(document.getElementById("box").value);
              break;
          case 'M-':
              valueM -= parseFloat(document.getElementById("box").value);
              break;
          case 'MC':
              temp=0;
              strOper=0;
              valueM=0;
              document.getElementById("box").value = '0';
              break;
          case 'MR':
              document.getElementById("box").value  =  parseFloat(valueM);
              //防呆用
  
              temp=null;
              strOper=null;
              break;
          default:
              break;
      }
  }
  </script>
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
    <h2>結帳管理</h2>
    <p id="current-time"></p>
    <script>
      function getCurrentTime() {
        let timestamp = Math.floor(Date.now() / 1000); // 取得當下的時間戳記
        let date = new Date(timestamp * 1000);
        let dataValues = [
          date.getFullYear(),
          date.getMonth() + 1,
          date.getDate(),
          date.getHours(),
          date.getMinutes(),
          date.getSeconds(),
        ]; 
        // 將時間值組合成字串
        let currentTimeString = dataValues[0] + '/' + dataValues[1] + '/' + dataValues[2] + ' ' + dataValues[3] + ':' + dataValues[4] + ':' + dataValues[5];       
        // 在網頁上顯示當下時間
        document.getElementById('current-time').textContent = '現在時間：' + currentTimeString;}
        // 初次載入頁面時顯示當下時間
         getCurrentTime();
        // 每秒更新一次當下時間
        setInterval(getCurrentTime, 1000);
      </script>
    <div class="checkout-group" >
        <input type="radio" autocomplete="off">
        <label for="inside" >內用現金結帳</label>
        <input type="radio" autocomplete="off"  checked>
        <label for="outside">外帶現金結帳</label>
    </div>
    <div id="ck" class="checkvw">
        <div class="modalck">
          <p>訂購者電話：</p>
          <p>收銀員：</p>
          <p>顯示產品細項：</p>
          <div class="detilvw">帶入訂單的內容</div>
          <div class="listvw"><p align="left">應收：</p><p align="left">實收：</p><p align="left">找錢：</p></div>
          <div class="button-onclick">
            <button class="modal-button" onclick="cancel()">返回</button>
            <button class="modal-button" onclick="confirm()">確認</button>
        </div>
       
        <table border=1 class="computer">
          <tr>
              <td align="center" colspan="6"> 
                  <input align="right" type="text" value="0" id="box"  />
              </td>
          </tr>
          <tr>
              <td >    <input id="mAdd" type="button" value="M+" onClick="buttonM('M+')">    </td>
              <td >    <input id="mMinus" type="button" value="M-" onClick="buttonM('M-')">   </td>
              <td >    <input id="mC" type="button" value="MC" onClick="buttonM('MC')">       </td>
              <td >    <input id="mR" type="button" value="MR" onClick="buttonM('MR')">       </td>
          </tr>
          <tr align="center">
              <td>    <input  type="button" value="7" onClick="numBtn('7')">  </td>
              <td>    <input  type="button" value="8" onClick="numBtn('8')">  </td>
              <td>    <input  type="button" value="9" onClick="numBtn('9')">  </td>
              <td>    <input  type="button" value="+" onClick="operBtn('+')"> </td>
          </tr>    
          <tr align="center">
              <td>    <input  type="button" value="4" onClick="numBtn('4')">  </td>
              <td>    <input  type="button" value="5" onClick="numBtn('5')">  </td>
              <td>    <input  type="button" value="6" onClick="numBtn('6')">  </td>
              <td>    <input  type="button" value="-" onClick="operBtn('-')"> </td>
          </tr>    
          <tr align="center">
              <td>    <input  type="button" value="1" onClick="numBtn('1')">  </td>
              <td>    <input  type="button" value="2" onClick="numBtn('2')">  </td>
              <td>    <input  type="button" value="3" onClick="numBtn('3')">  </td>
              <td>    <input  type="button" value="*" onClick="operBtn('*')"> </td>
          </tr>    
          <tr align="center">
              <td>    <input  type="button" value="0" onClick="numBtn('0')">  </td>
              <td>    <input  type="button" value="." onClick="numBtn('.')">  </td>
              <td>    <input  type="button" value="=" onClick="equal()">      </td>
              <td>    <input  type="button" value="/" onClick="operBtn('/')"> </td>
          </tr>
        </table>
         </div>
      </div>
    </div>
    <br><br>
    <input type="text" id="phoneInput" onkeydown="checkEnter(event)" placeholder="電話搜尋">
   
</div>
<script>

        function showphone() {
                let checkvw = document.getElementById("ck");
                checkvw.style.display = "block"; // 显示弹窗
        }

        function checkEnter(event) {
        if (event.keyCode === 13) { // 检查是否按下回车键（keyCode 为 13）
            let phoneInput = document.getElementById("phoneInput");
            let phoneNumber = phoneInput.value.trim(); // 获取输入的电话号码，并去除首尾的空格

            // 正则表达式验证电话号码的格式
            let phoneRegex = /^\d{10}$/; // 假设电话号码为10位数字
            if (phoneRegex.test(phoneNumber)) {
                showphone(); // 调用显示弹窗的函数
            } else {
                alert("請輸入正確的電話號碼格式！");
            }
        }
    }
        function cancel() {
            let checkvw = document.getElementById("ck");
            checkvw.style.display = "none"; // 隐藏弹窗
        }
    
        function confirm() {     
            let checkvw = document.getElementById("ck");
            checkvw.style.display = "none"; // 隐藏弹窗
        }
   </script>
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
</body>
</html>