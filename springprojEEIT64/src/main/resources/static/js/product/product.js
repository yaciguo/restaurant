var contextPath = document.getElementById('contextPath').value;
var contextPath;
var csrfHeaderName ;
var csrfToken;

//==========================新增產品確認與取消按鈕
function addfd() {
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
//要放在function外，因js是由上往下讀取
var dropdownItems = document.querySelectorAll('.dropdown-item');
var dropdownButton = document.querySelector('.dropdown-toggle');
//==========================新增產品視窗設定

function addProduct() {
	console.log("1");
	//dishBean設定id會自動生成，因此不用加id
	var productName = $('#add-name').val();
	var productPrice = $('#add-price').val();
	var productCost = $('#add-cost').val();
	var productDescription = $('#add-description').val();
	var FK_categoryId = $('#FK_categoryId').val();
	var fileInput = $('#fdpictureInput')[0];
	var file = fileInput.files[0];
	var reader = new FileReader();
	reader.onloadend = function() {
		console.log("2");
		var base64Image = reader.result;
		console.log("3");

		var productData = {
			name: productName,
			price: productPrice,
			cost: productCost,
			description: productDescription,
			FK_categoryId: "8",
			imageBase64: base64Image,
		};
		console.log('${pageContext.request.contextPath}');
		console.log(productData);
		console.log(fdpictureInput);
		console.log("========================")
		// $.ajax({
		// 	url: contextPath + '/addProduct',
		// 	//		url : '${pageContext.request.contextPath}/addProduct',
		// 	type: 'POST',
		// 	data: JSON.stringify(productData),
		// 	contentType: 'application/json',
		// 	beforeSend: function(xhr) {
		// 		xhr.setRequestHeader(csrfHeaderName, csrfToken);
		// 	},
		// 	success: function() {
		// 		//productData();
		// 		// alert('新增成功！');
		// 		console.log('success測試成功:');
		// 	},
		// 	error: function(xhr, error) {
		// 		// alert('新增失敗！');
		// 		console.log('產品保存失敗:');
		// 		console.log('狀態碼:', xhr.status);
		// 		console.log('錯誤訊息:', error);
		// 	}
		// });
		$('#add-name').val("");
		$('#add-price').val("");
		$('#add-cost').val("");
		$('#add-description').val("");
		$('#fdpictureInput').val("");
		$("#myModal").modal('hide');
		closeModal()

	};
	reader.readAsDataURL(file);
}	
//===========================/新增產品視窗設定
//===========================上傳圖片
//var csrfToken = "${_csrf.token}";
//var xhr = new XMLHttpRequest();
//var csrfHeader = "${_csrf.headerName}";

function sendPictureData(base64Image) {
	$.ajax({
		url: contextPath + '/addProduct',
		type: 'POST',
		data: JSON.stringify({ imageBase64: base64Image }),
		contentType: 'application/json',
		beforeSend: function(xhr) {
			xhr.setRequestHeader(csrfHeaderName, csrfToken);
		},
		success: function(response) {
			loadPictureData();
			$('#fdpictureInput').val('');
		},
		error: function(error) {
			console.log('上傳失敗:', error);
		}
	});
}

//$('#fdpictureInput').on('change', function(event) {
//	var file = event.target.files[0];
//
//	if (file) {
//		var reader = new FileReader();
//		reader.readAsDataURL(file);
//
//		reader.onload = function() {
//			sendPictureData(reader.result);
//		};
//	}
//});

//===========================/上傳圖片
//==========================篩選

dropdownItems.forEach(item => {
	item.addEventListener('click', function(event) {
		event.preventDefault();
		const FK_categoryId = this.getAttribute('data-category-id');
		const categoryName = this.innerText;

		// 更新下拉選單按鈕文字
		dropdownButton.innerText = categoryName;

		// 向後端發送筛選請求...
	});
});

//==========================/篩選
//==========================新增種類到下拉選單

//開啟新增種類視窗
function addtype() {
	let modal = document.getElementById("myType");
	modal.style.display = "block";
}


function tpyecancel() {
	let modal = document.getElementById("myType");
	modal.style.display = "none";
}

//取消
function tpyecancel() {
	let modal = document.getElementById("myType");
	modal.style.display = "none"; // 隱藏視窗
}
//確認
function typesave() {
	let inputText = document.getElementById("textInput").value;
	console.log("用戶輸入的内容是：" + inputText);
	let modal = document.getElementById("myType");
	modal.style.display = "none"; //隱藏視窗
}
//X關閉
function closetype() {
	let modal = document.getElementById("myType");
	modal.style.display = "none";
}
//==========================/新增種類到下拉選單

//==========================新增產品種類到後端

function typesave(event) {
	event.preventDefault();
	// 獲取輸入值
	const typeNameInput = document.querySelector('#type-name');
	const typeName = typeNameInput.value;
	console.log("1");
	// 組織表單數據，使用 const 創建的變數是一個常量，其值在初始化後不能再被修改。
	const typeData = {
		name: typeName
	};
	console.log(typeData);
	// $.ajax({
	// 	url: contextPath + '/addType', // 替換為後端 API 的 URL
	// 	type: 'POST',
	// 	data: JSON.stringify(typeData),
	// 	contentType: 'application/json',
	// 	beforeSend: function(xhr) {
	// 		xhr.setRequestHeader(csrfHeaderName, csrfToken);
	// 	},
	// 	success: function() {
	// 		console.log('success測試成功:');
	// 	},
	// 	error: function(xhr, status, error) {
	// 		console.log('產品保存失敗:');
	// 		console.log('狀態碼:', xhr.status);
	// 		console.log('錯誤訊息:', error);
	// 	}
	// });
	let modal = document.getElementById("myType");
	modal.style.display = "none";
}

//==========================/新增產品種類


//==========================下拉式選單接收新增種類

$(()=>{
	
	contextPath = $("meta[name='_contextPath']").attr("content"); 
	csrfHeaderName = $("meta[name='_csrf_header']").attr("content");
	csrfToken = $("meta[name='_csrf']").attr("content"); 
	$.ajax({
		url: contextPath + '/getCategories', // 替換為後端 API 的 URL
		type: 'GET',
		success: function(response) {
			// 獲取下拉式選單元素
			const selectElement = document.getElementById('category-select');
	
			// 迭代每個類別，創建選項並添加到下拉式選單中
			response.forEach(function(category) {
				const option = document.createElement('option');
				option.value = category.id.toString();
				option.text = category.name;
				selectElement.appendChild(option);
			});
		},
		error: function(xhr, status, error) {
			console.log('獲取類別失敗:');
			console.log('狀態碼:', xhr.status);
			console.log('錯誤訊息:', error);
		}
	});
})
//==========================/下拉式選單接收新增種類