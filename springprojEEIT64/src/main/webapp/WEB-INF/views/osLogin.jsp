<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>webDesign-OS</title>

<!-- Favicons -->
<link href="assets/img/s-logo.png" rel="icon">

<!-- bootstrap5 - 前端框架 -->
<link href="./assets/src/plugins/bootstrap5.2/bootstrap.min.css"
	rel="stylesheet">
<script src="./assets/src/plugins/bootstrap5.2/bootstrap.bundle.min.js"></script>

<!-- jquery 框架 -->
<script type="text/javascript"
	src="./assets/src/plugins/jquery/jquery-1.11.0.min.js"></script>

<!-- fontAwesome - icon插件 -->
<link href="./assets/src/plugins/fontawesome/css/all.min.css"
	rel="stylesheet">

<link rel='stylesheet' href="<c:url value='/css/osLogin.css' />" />

</head>

<body>
	<div class="login-container px-5 py-2">
		<div class="login-header pt-5">
			<h1 class="login-title">
				<b>後 台 管 理 系 統</b>
			</h1>
		</div>

		<div class="login-body mt-4">
			<div class="input-group" id="account">
				<i class="fa-solid fa-user col-2"></i>
				<input type="account" class="form-control" style="border: none"
					placeholder="請輸入帳號" required>
			</div>

			<div class="input-group" id="password">
				<i class="fa-solid fa-key col-2"></i>
				<input type="password" class="form-control" style="border: none"
					placeholder="請輸入密碼" required>
			</div>

			<button type="submit" class="btn btn-primary mt-5 mb-3 px-5 py-2"
				onclick="clickLogin()">登入</button>

		</div>
	</div>
</body>


<script>
	function clickLogin() {
		console.log('clickLogin')
	}
</script>

</html>