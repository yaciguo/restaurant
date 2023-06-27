<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW" xmlns:th="http://www.thymeleaf.org">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>webDesign-OS</title>

<!-- Favicons -->
<link href="assets/img/s-logo.png" rel="icon">

<!-- bootstrap5 - 前端框架 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- jquery 框架 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- fontAwesome - icon插件 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"  />


<link rel='stylesheet' href='${pageContext.request.contextPath}/css/osLogin.css' />

</head>

<body>
	<form action="${pageContext.request.contextPath}/osLogin" method="post" class="login-container px-5 py-2">
		<div class="login-header pt-5">
			<h1 class="login-title">
				<b>後 台 管 理 系 統</b>
			</h1>
		</div>

		<div class="login-body mt-4">
			<div class="input-group" id="account">
				<i class="fa-solid fa-user col-2"></i>
				<input type="text" class="form-control" name="username" value="admin" style="border: none"
					placeholder="請輸入帳號" required>
			</div>

			<div class="input-group" id="password">
				<i class="fa-solid fa-key col-2"></i>
				<input type="password" class="form-control" name="password" value="123"  style="border: none"
					placeholder="請輸入密碼" required>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<button type="submit" class="btn btn-primary mt-5 mb-3 px-5 py-2">登入</button>

		</div>
	</form>
</body>


<script>
// 	function clickLogin() {
// 		console.log('clickLogin')
// 	}
</script>

</html>