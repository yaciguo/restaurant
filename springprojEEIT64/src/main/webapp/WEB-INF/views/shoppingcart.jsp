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

    $(".btedit2>input").click(function () {
      console.log(this)
      $(this).parent().parent().remove();
    })

  })
</script>
<script>//提交驗證
  function validateAndRedirect() {
    var form = document.getElementById('myForm');
    if (form.checkValidity()) {
      // 在这里执行验证通过后的跳转逻辑
      window.location.href ='<c:url value='/ordercheck' />' ;
      return false; // 阻止表单的默认提交行为
    } else {
      // 在这里执行验证失败时的逻辑
      form.reportValidity();
      return false; // 阻止表单的默认提交行为
    }
  }
</script>

<body>

<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>
	
  <div class="container">
    <div class="row">
      <header class="col-sm-12" style="margin-top: 20px;">
        <h1 style="font-weight: bolder;">購物車</h1>
      </header>
    </div><br>
    <h5 style="text-align: center">xxxx店 <br />(外帶/內用)</h5>

    <br>
    <form action="" style="" id="myForm" onsubmit="return validateAndRedirect()">
      <!-- 訂單內容 -->
      <div class="row">
        <fieldset class="col-sm-12">
          <legend>訂單內容</legend>
          <table>
            <tr>
              <td class="dish">
                <ul>
                  <li>(菜名)</li>
                  <li>(單價)/(份數)份</li>
                </ul>
              </td>
              <td class="btedit1">
                <ul class="counter">
                  <li id="minus" class="counter1">
                    <input type="button" onclick="minuser()" value="-" style="cursor: pointer" />
                  </li>
                  <li id="countnum" class="counter1">0</li>
                  <li id="plus" class="counter1">
                    <input type="button" onclick="adder()" value="+" style="cursor: pointer" />
                  </li>
                </ul>
              <td class="btedit2">
                <input type="image" src="/images/trash.png" width="20px" />
              </td>
              </td>
            </tr>
            <tr>
              <td class="dish">
                <ul>
                  <li>(菜名)</li>
                  <li>(單價)/(份數)份</li>
                </ul>
              </td>
              <td class="btedit1">
                <ul class="counter">
                  <li id="minus" class="counter1">
                    <input type="button" onclick="minuser()" value="-" style="cursor: pointer" />
                  </li>
                  <li id="countnum" class="counter1">0</li>
                  <li id="plus" class="counter1">
                    <input type="button" onclick="adder()" value="+" style="cursor: pointer" />
                  </li>
                </ul>
              </td>
              <td class="btedit2">
                <input type="image" src="./pic/trash.png" width="20px" />
              </td>
            </tr>
          </table>
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

            <input type="radio" name="userpay" value="1" required />現金
            <!-- <input type="radio" name="userpay" value="2" required />Linepay -->
            <br /><br />
            <span>商品小計:</span>
            <span style="text-align: right;">$(金額)</span><br><br>
            <span>折扣金額:</span>
            <span>$(金額)</span><br><br>
            <span>應付金額:</span>
            <span>$(金額)</span><br><br>

          </fieldset>
        </div>

        <div class="col-sm-4">
          <fieldset>
            <legend>取餐人資料</legend>

            <label for="">姓名</label><br />
            <input name="username" type="text" placeholder="請輸入訂購人" style="width: 90%;" required /><br /><br />
            <label for="">手機</label><br />
            <input name="userphone" type="tel" placeholder="請輸入手機號碼" style="width: 90%;" pattern="[0]{1}[9]{1}[0-9]{8}"
              required />

          </fieldset>
        </div>
      </div>
      <footer>
        <input type="button" value="繼續加點" class="button2" onclick="window.location.href ='<c:url value='/menu' />'" /> <!--上一頁-->
        <input type="submit" value="確認訂單" class="button2" /><!--訂單確認-->
      </footer>
    </form>
  </div>
</body>

</html>