var contextPath = document.getElementById('contextPath').value;
//==========================新增產品確認與取消按鈕
function fdmix() {
	let modal = document.getElementById("myModal");
	modal.style.display = "block"; // 新增產品顯示視窗
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

//==========================新增產品視窗設定

function addProduct() {
//	var productId = ($('#add-id input').val() || '0').trim();
	var productName = $('#add-name input').val();
	var productPrice = $('#add-price input').val();
	var productCost = $('#add-cost input').val();
	var productDescription = $('#add-description input').val();
	var categoryId = $("#categoryId").val();
	console.log('第六句測試成功:');

	// 檢查 productId 是否為空或只包含空白字元
	if (!productId) {
		console.log('產品編號不可為空！');
		return; // 中止函式執行或執行其他處理
	}

//	const dropdownItems = document.querySelectorAll('.dropdown-item');
//	const dropdownButton = document.querySelector('.dropdown-toggle');
	//  	let categoryId = null;

	var productData = {
		id: productId,
		name: productName,
		price: productPrice,
		cost: productCost,
		description: productDescription,
		categoryId : categoryId,
	};
	console.log('第七句測試成功:');
	console.log('${pageContext.request.contextPath}');
	$.ajax({
		url: contextPath + '/addProduct',
		//		url : '${pageContext.request.contextPath}/addProduct',
		type: 'POST',
		data: JSON.stringify(productData),
		contentType: 'application/json',
				beforeSend: function(xhr) {
					xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
				},
		success: function() {
			//			productData();
			//				$('#addp').val('');
			console.log('success測試成功:');
		},
		error: function(xhr, error) {
			console.log('產品保存失敗:');
			console.log('狀態碼:', xhr.status);
			console.log('錯誤訊息:', error);
		}
	});

	//	// 監聽 確認新增活動 事件
	//		$('#activity-form').on('submit', function(e) {
	//			e.preventDefault();
	//			productData();
	//		});
}

//===========================/新增產品視窗設定
//==========================篩選
const dropdownItems = document.querySelectorAll('.dropdown-item');
const dropdownButton = document.querySelector('.dropdown-toggle');

dropdownItems.forEach(item => {
	item.addEventListener('click', function(event) {
		event.preventDefault();
		const categoryId = this.getAttribute('data-category-id');
		const categoryName = this.innerText;

		// 更新下拉選單按鈕文字
		dropdownButton.innerText = categoryName;

		// 向後端發送筛選請求...
	});
});

//==========================/篩選
//===========================上傳圖片
var csrfToken = "${_csrf.token}";
var xhr = new XMLHttpRequest();
var csrfHeader = "${_csrf.headerName}";
// 監聽 選擇圖片
$('#fdpictureInput').on('change', function(event) {
	var file = event.target.files[0];

	if (file) {
		var reader = new FileReader();
		reader.readAsDataURL(file);

		reader.onload = function() {
			sendPictureData(reader.result);
		};
	}
});

function sendPictureData(base64Image) {
	$.ajax({
		url: '/savePictureImg ',
		type: 'POST',
		data: JSON.stringify({ imageBase64: base64Image }),
		contentType: 'application/json',
		headers: {
			'${_csrf.headerName}': '${_csrf.token}'
		},
		success: function(response) {
			loadPictureData();
			$('.addproduct-detail #fdpictureInput').val('');
		},
		error: function(error) {
			console.log('圖片上傳失敗:', error);
		}
	});
}

//後端展示給前端
function loadPictureData() {
	$.ajax({
		url: '${pageContext.request.contextPath}/queryDish',
		type: 'GET',
		beforeSend: function(xhr) {
			xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
		},
		success: function(response) {
			console.log("--------------ajax-Picture");
			$('.fdprictureContent').empty();

			var htmlContent = '';
			for (var i = 0; i < response.length; i++) {
				var banner = response[i];
				htmlContent += '<div class="activity-Picture addPicture" data-id="' + picture.id + '">';
				htmlContent += '<B>新增圖片' + (i + 1) + '</B>';
				htmlContent += '<div class="row mt-4 ms-1 d-flex align-items-center">';
				htmlContent += '<img class="col-4" src="' + picture.pic + '">';
				htmlContent += '<div class="col-7 d-block">';
				htmlContent += '<span><B>新增餐點：</B></span>';
				htmlContent += '<input type="text" class="activity-text" value="' + (picture.url ? picture.url : '') + '">';
				htmlContent += '<p class="error-message text-danger"></p>';
				htmlContent += '</div>';
				htmlContent += '<i class="fa-solid fa-trash col-1 text-center" onclick="deletePictureAlert(event)"></i>';
				htmlContent += '</div></div>';
			}

			$('.fdprictureContent').html(htmlContent);
		},
		error: function(error) {
			console.log('圖片讀取失敗:', error);
		}
	});
}



//===========================/上傳圖片
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
