
//==========================新增產品
function showModal() {
	let modal = document.getElementById("myModal");
	modal.style.display = "block"; // 顯示視窗
}

//取消
function fdcancel() {
	let modal = document.getElementById("myModal");
	modal.style.display = "none"; // 隱藏視窗
}
//確認
function fdsave() {
	let inputText = document.getElementById("textInput").value;
	console.log("用戶輸入的内容是：" + inputText);
	let modal = document.getElementById("myModal");
	modal.style.display = "none"; //隱藏視窗
}
//X關閉
function closeModal() {
	let modal = document.getElementById("myModal");
	modal.style.display = "none";
}
//==========================/新增產品

//==========================新增種類到下拉選單
//function confirm() {
//	let inputText = document.getElementById("textInput").value;
//	let typeSelect = document.getElementById("type");
//
//	// 創建一個新的選項
//	let newOption = document.createElement("option");
//	newOption.text = inputText;
//	newOption.value = inputText;
//
//	// 新選項添加到列表裡
//	typeSelect.add(newOption);
//	let modal = document.getElementById("myModal");
//	modal.style.display = "none";
//}
//
//function openModal() {
//	let modal = document.getElementById("myModal");
//	modal.style.display = "block";
//}
//
//
//function closeModal() {
//	let modal = document.getElementById("myModal");
//	modal.style.display = "none";
//}
//==========================/新增種類到下拉選單

//==========================新增產品種類
function addCategory() {
	let inputText = document.getElementById("textInput").value;
	let categoryList = document.getElementById("categoryList");
	let li = document.createElement("li");
	li.value = inputText;
	categoryList.appendChild(li);

	// 将新的选项添加到下拉选单中
	let select = document.getElementById("type");
	let option = document.createElement("option");
	option.value = inputText;
	select.appendChild(option);
	closeModal();
}
//==========================/新增產品種類
//==========================新增產品
 $(document).ready(function() {
    // 監聽下拉選單的選擇事件
    $(".dropdown-item").on("click", function() {
      // 取得選擇的 categoryId
      var categoryId = $(this).data("categoryId");
      // 傳遞 categoryId 給後端處理
      // 這裡可以使用AJAX發送HTTP請求到後端，將categoryId作為參數傳遞
      // 然後在後端進行資料庫查詢，獲取屬於乾麵類的資料，再回傳結果給前端
      // 以下僅為示意
      window.location.href = "/dishes?categoryId=" + categoryId;
    });
  });
//==========================/新增產品