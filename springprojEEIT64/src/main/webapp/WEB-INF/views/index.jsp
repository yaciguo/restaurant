<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<link rel='stylesheet' href="<c:url value='/css/styles.css' />" />

			<a href="<c:url value='/osLogin' />"> 後台 登入頁 </a>
			<br>
			<a href="<c:url value='/basicSettings' />"> 後台-基本設定 </a>
			<br>
			<a href="<c:url value='/activity' />"> 後台-活動頁 </a>
			<br>
			<a href="<c:url value='/checkout' />"> 後台-結帳頁 </a>
			<br> <br>
			</div>

		<body>
			<div align='center'>
				<h2>分頁導覽</h2>
				<p>先長這樣，等大家.jsp都上去會拿掉</p>
				<hr>
				<a href="<c:url value='/readBookdata' />"> index </a>
				<br>
				<a href="<c:url value='/custIndex' />"> 消費者首頁 </a>
				<br>
				<a href="<c:url value='/menuInner5' />"> 內用點餐 </a>
				<br>
				<a href="<c:url value='/question' />"> 常見問題 </a>
				<br> <br>

			</div>
			</div>
			<hr>
			Context Path: ${pageContext.request.contextPath}
			<br>

		</body>

		</html>
