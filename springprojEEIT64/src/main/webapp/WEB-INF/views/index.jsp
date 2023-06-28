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
		<h2>分頁導覽</h2>
		<p>先長這樣，等大家.jsp都上去會拿掉</p>
		<hr>
		<a href="<c:url value='/readBookdata' />"> index </a>
		<br>
		<a href="<c:url value='/custIndex' />"> 消費者首頁 </a>
		<br>
		<a href="<c:url value='/question' />"> 常見問題 </a>
		<br> <br>

		<a href="<c:url value='/osLogin' />"> 後台 登入頁 </a>
		<br>
		<a href="<c:url value='/basicSettings' />"> 後台-基本設定 </a>
		<br>
<<<<<<< HEAD
		<a href="<c:url value='/activity' />"> 後台-活動頁 </a>
=======
		<a href="<c:url value='/queryActivity' />"> 後台-活動頁 </a>
>>>>>>> origin/sara
		<br> <br>
	</div>

	<div align='left'>
		<div style="border: 2px solid #000;">
			<p style="color: red">nav - 消費者公版</p>
			在檔案body裡面加上<br>
			<p style="color: blue">&lt;&#37;&#64; include
				file=&#34;nav.jsp&#34; &#37;&gt;</p>
			(可以參考custIndex.jsp #43行) <br>
		</div>
		<br>
		<div style="border: 2px solid #000;">
			<p style="color: red">sideNav - 店家公版</p>

			<p>step1. 在檔案上方引入插件(如果原本有用就略過)</p>
			<p style="color: blue">
				&lt;!-- bootstrap5 - 前端框架 --&gt; <br>&lt;link
				href="./assets/src/plugins/bootstrap5.2/bootstrap.min.css"
				rel="stylesheet"&gt; <br>&lt;script
				src="./assets/src/plugins/bootstrap5.2/bootstrap.bundle.min.js"&gt;&lt;/script&gt;

				<br>&lt;!-- jquery 框架 --&gt; <br>&lt;script
				type="text/javascript"
				src="./assets/src/plugins/jquery/jquery-1.11.0.min.js"&gt;&lt;/script&gt;

				<br>&lt;!-- fontAwesome - icon插件 --&gt; <br>&lt;link
				href="./assets/src/plugins/fontawesome/css/all.min.css"
				rel="stylesheet"&gt;
			</p>
			(可以參考activity.jsp #16~27行) <br>


			<p>step2. 在檔案body裡面加上</p>
			<p style="color: blue">&lt;&#37;&#64; include
				file=&#34;activity.jsp&#34; &#37;&gt;</p>
			(可以參考activity.jsp #35行) <br>

			<p>step3. 在css裡面加上</p>
			<p style="color: blue">.main-content { min-width: 580px; margin:
				20px 20px 20px calc(60px + 20px); padding: 15px; transition:
				margin-left 0.3s ease-in-out; background-color: #FFF; border-radius:
				var(--main-radius); } .main-content.active { margin-left: 180px; }</p>
			(可以參考activity.css #7~14行) <br>

			<p>step4. 建一個main-content的DIV將程式放進去</p>
			(可以參考activity.css #38行)

		</div>
	</div>
	<hr>
	Context Path: ${pageContext.request.contextPath}
	<br>

</body>
</html>