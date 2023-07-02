<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>checkout</title>
     <link rel="stylesheet" href="/css/checkout.css">


      <!-- bootstrap5 - 前端框架 -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- jquery 框架 -->
    <script
    src="https://code.jquery.com/jquery-1.12.4.min.js"
    integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
    crossorigin="anonymous"></script>
    
    <!-- fontAwesome - icon插件 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<script>
  var temp=0;  //暫存被運算數

var strOper=0;  //暫存運算符號

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
function operBtn(str){
    //不按等號的連續運算
    equal();
    valueA=document.getElementById("box").value;
    strOper=str;
    document.getElementById("box").value=0;
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
<body>
   
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
        document.getElementById('current-time').textContent = '現在時間：' + currentTimeString;
      }
      // 初次載入頁面時顯示當下時間
      getCurrentTime();
      // 每秒更新一次當下時間
      setInterval(getCurrentTime, 1000);
      </script> 
    <div id="main-content" class="main-content">
    <div class="checkout-group" >
        <input type="radio" autocomplete="off" checked>
        <label for="inside" >內用現金結帳</label>
        <input type="radio" autocomplete="off">
        <label for="outside">外帶現金結帳</label>
    </div>
    <br><br>
    <div>
      <button class="table" id="Tmember">1桌</button>
      <button class="table" id="Tmember">2桌</button>
      <button class="table" id="Tmember">3桌</button>
      <button class="table" id="Tmember">4桌</button>
      <br><br>
      <button class="table" id="Tmember">5桌</button>
      <button class="table" id="Tmember">6桌</button>
      <button class="table" id="Tmember">7桌</button>
      <button class="table" id="Tmember">8桌</button>
      <br><br>    
    </div>
    <input id="btncheck" type="button" onclick="showCheck()" value="結帳" />
  
    <div id="ck" class="checkvw">
        <div class="modalck">
          <p>桌號：</p>
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
</div>
    <script>
      function showCheck() {
        let checkvw = document.getElementById("ck");
        checkvw.style.display = "block"; // 显示弹窗
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
</body>
</html>
