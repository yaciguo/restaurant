<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
   <!-- Boostrap 導入程式 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
  <title>test</title>
</head>
<script type="text/javascript">
$('#pNumber, #date').change(function () {
    alert(1)
    var selectedPNumber = $('#pNumber').val();
    var selectedDate = $('#date').val();

    $.ajax({
      url: '${pageContext.request.contextPath}/custIndex/availableTimes',
      type: 'GET',
      data: { pNumber: selectedPNumber, date: selectedDate },
      dataType: 'json',
      success: function (data) {
        // 在這里處理從後端獲取的可用時間數據
        console.log(data);
        // 获取可预订的时间列表// 假设data.availableTimes是一个List<String>类型
        var times = data.availableTimes;
        // 清空时间选项
        $('#startTime').empty();
        // 在时间选项中添加可选项
        for (var i = 0; i < times.length; i++) {
          var time = times[i];
          $('#startTime').append('<option value="' + time + '">' + time + '</option>');
        }


      },
      error: function (xhr, textStatus, errorThrown) {
        // 处理错误情况
        console.log(errorThrown);
      }
    });
  });
</script>

<body>
<!-- 導覽列 -->
	<div class="container">

	<div class="row">
	<div id="activityDiv"></div>

    </div>
    </div>
  
</body>



</html>