<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- Boostrap 導入程式 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
  <title>searchbooking</title>
	</head>
		<style>
  body {
    margin-right: 20%;
    margin-left: 20%;
    /* display: flex; */
    /* justify-content: center; */
/*     width: 60%; */
  }

  header {
    /* display: flex;
      justify-content: center; */
    text-align: center;
    color: white;
    background-color: rgb(239, 164, 84);
    border-radius: 10px;
  }

/*   form { */
/*     width: 40%; */
/*   } */

  fieldset {
    background-color: rgb(241, 237, 230);
    border-radius: 10px;
    border: 1px solid #ccc;
    padding: 15px;
  }

  legend {
    font-size: 20px;
    font-weight: bold;
    color: orange;
    border-bottom: 1px solid #ccc;
  }

/*   .form-container { */
/*     display: flex; */
/*     justify-content: space-between; */
/*   } */

/*   .form1 { */
/*     width: 40%; */
/*     margin-right: 20px; */
/*   } */

/*   .form2 { */
/*     width: 60%; */
/*   } */

  th {
    text-align: left;
    width: 50%;
  }
</style>

<body>
<!-- 導覽列 -->
<div class="container">
	<%@ include file="nav.jsp" %>
  <div class="row">
  	<div class="col-sm-12">
	    <header>
	      <h1>訂位查詢</h1>
	    </header>
    </div>
  </div>
  <br />
  <div class="row">
	  <div class="col-sm-4">
	    <form:form action="" >
	      <fieldset>
	        <legend>訂位資料</legend>
	        <label for="">姓名</label><br />
	         <input name="username" type="text" placeholder="請輸入訂位人" style="width: 90%;" required /><br /><br />
            <label for="">手機</label><br />
            <input name="userphone" type="tel" placeholder="請輸入手機(格式0912345678)" style="width: 90%;" 
            pattern="[0]{1}[9]{1}[0-9]{8}" required />
	        <br /><br />
	        <input type="submit" value="查詢" />
	      </fieldset>
	    </form:form >
	    </div>
	    <div class="col-sm-8">
		    <form:form action="">
		      <fieldset>
		        <legend>訂位記錄</legend>
		        <table>
		          <div>
		            <tr>
		              <th>成立時間</th>
		              <td>(yyyy/mm/dd hh:mm)</td>
		            </tr>
		            <tr>
		              <th>訂位人數</th>
		              <td>() 位</td>
		            </tr>
		            <tr>
		              <th>訂位日期</th>
		              <td>xxx</td>
		            </tr>
		            <tr>
		              <th>訂位時間</th>
		              <td>12:00</td>
		            </tr>
		          </div>
		        </table>
		      </fieldset>
		    </form:form>
  	</div>
  </div>
 </div>
</body>

</html>