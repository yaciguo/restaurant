<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>webDesign-RS</title>

<!-- Favicons -->
<link href="assets/img/s-logo.png" rel="icon">

<!-- bootstrap5 - 前端框架 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- jquery 框架 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- fontAwesome - icon插件 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"  />

<link rel='stylesheet' href="<c:url value='/css/question.css' />" />

</head>


<body>
	<!-- 導覽列 -->
	<%@ include file="nav.jsp" %>

	<div class="content d-block">
		<h1 class="text-center py-4">
			<B>常見問題</B>
		</h1>

		<ul class="pb-4">
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">如何進行線上訂位？</div>
				<div class="answer">我們提供線上訂位系統，您可以在我們的網站上選擇日期、時間和人數，並預訂您的座位。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">是否接受預訂外帶或自取服務？</div>
				<div class="answer">是的，我們提供預訂外帶或自取服務。您可以在線上訂購菜單，並選擇自取的日期和時間。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">有提供外送服務嗎？</div>
				<div class="answer">目前我們的餐廳暫時不提供外送服務。但您可以透過線上訂購系統預訂外帶或自取服務。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">是否需要提前預訂座位？</div>
				<div class="answer">雖然預訂座位不是必需的，但我們建議在繁忙時段提前預訂以確保有座位。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">有提供素食飲食需求的選項嗎？</div>
				<div class="answer">是的，我們的菜單中有許多素食和特殊飲食需求的選項。請告知服務人員您的需求，我們將竭誠滿足您的要求。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">前往餐廳用餐，停車是否便利？</div>
				<div class="answer">本餐廳設有停車場供顧客使用，並且附近也有其他停車場選項可供選擇。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">是否接受現金以外付款方式？</div>
				<div class="answer">是的，我們接受除了現金外，多種付款方式，包括
					Visa、Mastercard、LinePay、台灣pay 等。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">餐廳內是否提供無線網路？</div>
				<div class="answer">是的，我們提供免費的無線網路服務給我們的顧客使用。您可以在餐廳內連接到我們的Wi-Fi網絡。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">餐廳是否提供適合兒童的菜單？</div>
				<div class="answer">是的，我們提供適合兒童的菜單。這些菜單包含小朋友喜愛的食物選項，並且份量適合他們的需求。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">餐廳允許帶寵物進入嗎？</div>
				<div class="answer">很抱歉，本餐廳目前不允許寵物進入，這是為了顧及所有顧客的感受。</div>
			</li>
			<li class="qa-set">
				<div class="question" onclick="toggleAnswer(event)">是否提供包廂或私人宴會場地？</div>
				<div class="answer">很抱歉，我們目前沒有包廂或私人宴會場地供顧客使用。我們的餐廳提供舒適的用餐環境，並歡迎您與您的朋友和家人一同用餐。如需訂位或有其他特殊需求，請提前與我們聯繫。
				</div>
			</li>
	</div>

</body>

<script>
	function toggleAnswer(event) {
		const answer = event.target.nextElementSibling;
		answer.style.display = answer.style.display === '' ? 'block' : '';
	}
</script>

</html>