<%@ page contentType="text/html; charset=UTF-8"%>

<style>
:root {
	--main-color: #96e7f9;
	--sec-color: #FAF0E6;
	--main-radius: 10px;
}

body {
	background-image: url('./assets/img/background.jpg');
}

.navbar {
	background-color: #333;
	color: #fff;
	padding: 10px;
	position: relative;
	max-height: 50px;
}

.navbar-close {
	position: absolute;
	top: 10px;
	right: 20px;
	color: #333;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	display: none;
}

.navbar ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
}

.navbar li {
	margin: 0 30px;
}

.navbar a {
	color: #fff;
	font-weight: bold;
	text-decoration: none;
}

.navbar hr {
	display: none;
}

.navbar-toggler {
	display: none;
}

@media ( max-width : 576px) {
	.navbar-toggler {
		display: block;
		color: #FFF;
	}
	.navbar-collapse {
		display: none;
		color: #333;
		padding: 10px;
		background-color: var(--sec-color);
	}
	.navbar-collapse.show {
		display: block;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100vh;
		overflow-y: auto;
		z-index: 999;
	}
	.navbar-collapse ul {
		flex-direction: column;
		margin-top: 30px;
	}
	.navbar-collapse li {
		margin: 10px;
	}
	.navbar a {
		color: #333;
		font-size: 1.2rem;
	}
	.navbar hr {
		display: block;
	}
}
</style>

<body>
	<!-- 導覽列 -->
	<nav class="navbar">

		<div class="navbar-toggler">
			<i class="fa-solid fa-bars fa-lg"></i>
		</div>

		<div class="navbar-collapse">
			<ul>
				<li><a href="<c:url value='/custIndex' />">首頁</a>
					<hr></li>
				<li><a href="<c:url value='/searchbooking' />">訂位查詢</a>
					<hr></li>
				<li><a href="<c:url value='/searchorder' />">訂單查詢</a>
					<hr></li>
				<li><a href="<c:url value='/question' />">常見問題</a>
					<hr></li>
			</ul>

			<div class="navbar-close">
				<i class="fa-solid fa-xmark fa-2xl"></i>
			</div>

		</div>
	</nav>


</body>

<script>
	$(function() {
		// 導覽列控制設定
		document
				.querySelector('.navbar-toggler')
				.addEventListener(
						'click',
						function() {
							document.querySelector('.navbar-collapse').classList
									.toggle('show');
							document.querySelector('.navbar-close').style.display = 'block';
						});
		document
				.querySelector('.navbar-close')
				.addEventListener(
						'click',
						function() {
							document.querySelector('.navbar-collapse').classList
									.remove('show');
							document.querySelector('.navbar-close').style.display = 'none';
						});
	});
</script>