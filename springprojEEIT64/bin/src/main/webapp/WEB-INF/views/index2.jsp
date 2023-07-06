<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href="<c:url value='/css/styles.css' />" />
<meta charset="UTF-8">
<title>Spring Boot</title>
</head>
<body>
<div align='center'>
    <h2>Spring Boot 範例</h2>
    <hr>
    <a href="<c:url value='/hello' />"> Hello </a><br>
     
    <a href="<c:url value='/dishes' />" >查詢餐點</a><br>
    <a href="<c:url value='/dishes' />" >查詢餐點2</a><br>
    <img src="<c:url value='/images/kitty.jpg'/>"/>

    
 </div>  
 <hr>
 Context Path: ${pageContext.request.contextPath}<br> 
  
</body>
</html>