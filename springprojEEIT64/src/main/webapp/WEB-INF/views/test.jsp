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
$(document).ready(function () {
	$.ajax({  
	        url: '${pageContext.request.contextPath}/custIndex/getActivity',
	        type: "GET",
	        dataType: "json",
	        success: function(response) {
	            activities = response; // 得到返回的分類
	          var activityJsonString = JSON.stringify(activities);

	        // 將 JSON 字串插入到指定的 <div> 元素中
	        $('#activityDiv').text(activityJsonString);
	        
	            
	        },
	        error: function(xhr, status, error) {
	            console.log("Error: " + error);
	        }
	    }); 
})
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