<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage='true'%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<table border='1'>
		<tr>
			<th>id</th>
			<th>餐點</th>
			<th>描述</th>
			<th>單價</th>
			
		</tr>
	<c:forEach var='dish' items='${dishList}'>
		<tr>
			<td>${dish.id} </td>
			<td>${dish.name} </td>
			<td>${dish.description} </td>
			<td>${dish.price} </td>
			
		
		</tr>
	</c:forEach>
	</table>
	<hr>
	
	<a href="<c:url value = '/'/>">回首頁</a>
</div>


</body>
</html>