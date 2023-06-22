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
    <title>shoppingcart</title>
    <link rel="stylesheet" href="<c:url value='/css/shoppingcart.css' />">

</head>

<script>
  $(function () {
    //載入local===============================
    var data = JSON.parse(localStorage.getItem('CART'));
    console.log(data)
    let totalPrice = 0;
    let content = ''
    data.forEach(function (obj, index) {
    	content += '<tr class="tableRow">' +
        '<td id="td2" style="width: 50%;">' + obj.name + '</td>' +
        '<td id="td5" style="width: 20%;">$ ' + obj.price + '</td>' +
        '<td class="units" style="width: 20%;">' +
        '<div class="number">' + obj.numberOfUnits + '</div>' +
        '</td>' +
        '</tr>';

      let objTotal = obj.price * obj.numberOfUnits
      totalPrice += objTotal
      console.log(obj.name)

    })
    $(".store").append(content)
    console.log(totalPrice)
    $(".totalPrice").append(totalPrice)

  })
</script>
<!--修改內容==================================-->
<script>


  //提交驗證
  function validateAndRedirect() {
    var form = document.getElementById('myForm');
    if (form.checkValidity()) {
      // 在这里执行验证後訂單內容
      localStorage.clear();
      window.location.href ='<c:url value='/ordercheck' />';
      return false; // 阻止表单的默认提交行为
    } else {
      // 在这里执行验证失败时的逻辑
      form.reportValidity();
      return false; // 阻止表单的默认提交行为
    }
  }

</script>
<!--修改內容==================================-->


<body>
<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>
  <div class="container">
    <div class="row">
      <header class="col-sm-12" style="margin-top: 20px;">
        <h1 style="font-weight: bolder;">訂單結帳</h1>
      </header>
    </div><br>
    <h5 style="text-align: center">xxxx店 <br />(外帶/內用)</h5>

    <br>
    <form action="" style="" id="myForm" onsubmit="return validateAndRedirect()">
      <!-- 訂單內容 -->
      <div class="row">

        <fieldset class="col-sm-12">
          <legend>訂單內容</legend>
          <!--新增=============================-->
          <div>
            <table class="store" style="width: 100%;">
              <tr>
                <th style="width: 50%;">餐點名稱</th>
                <th style="width: 20%;">單價</th>
                <th style="width: 20%;">數量</th>
              </tr>

            </table>

          </div>

        </fieldset>
      </div><br>

      <div class="row">
        <div class="col-sm-4">
          <fieldset>
            <legend>餐點備註</legend>

            <textarea name="note" id="note" cols="20" rows="8" style="width: 98%" placeholder="請輸入餐點備註">
                </textarea>

          </fieldset>
        </div>

        <div class="col-sm-4">
          <fieldset>
            <legend>付款方式</legend>

            <input type="radio" name="userpay" value="1" checked />現金
            <!-- <input type="radio" name="userpay" value="2" required />Linepay -->
            <br /><br />
            <span>商品小計:</span>
            <span class="totalPrice" style="text-align: right;">$</span><br><br>
            <span>折扣金額:</span>
            <span>$(0)</span><br><br>
            <span>應付金額:</span>
            <span class="totalPrice">$</span><br><br>

          </fieldset>
        </div>

        <div class="col-sm-4">
          <fieldset>
            <legend>取餐資料</legend>

            <label for="">姓名:</label><br />
            <input id="name" name="username" type="text" placeholder="請輸入訂購人" style="width: 90%;"
              required /><br /><br />
            <label for="">手機:</label><br />
            <input id="tel" name="userphone" type="tel" placeholder="請輸入手機號碼" style="width: 90%;"
              pattern="[0]{1}[9]{1}[0-9]{8}" required /><br/><br/>
            <label>取餐時間:</label><br/>
            <select name="selectTime" required>
                        <option value="">請選擇時間</option>
                        <option value="1200">12:00</option>
                        <option value="1230">12:30</option>
                        <option value="1300">13:00</option>
                        <option value="1330">13:30</option>
                        <option value="1400">14:00</option>
                        
             </select>

          </fieldset>
        </div>
      </div>
      <footer>
        <input type="button" value="繼續加點" class="button2" onclick="window.location.href ='<c:url value='/menu' />'" /> <!--上一頁-->
        <input type="submit" value="提交訂單" class="button2" /><!--訂單確認-->
      </footer>
    </form>
  </div>
</body>



</html>

