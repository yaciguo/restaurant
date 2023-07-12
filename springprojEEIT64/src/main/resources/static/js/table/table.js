function setDatepicker(element) {
	var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
	var options = {
		format: 'yyyy-mm-dd',
		container: container,
		todayHighlight: true,
		autoclose: true,
		orientation: 'top'
	};
	element.datepicker(options);
}

$(document).ready(function() {
  var startdate_input = $('input[name="startdate"]');
  setDatepicker(startdate_input);
});

//===========================================以下連線給後端
//日期時間傳送到後端進行篩選
// 監聽日期輸入框的值變化事件
document.getElementById("startdate").addEventListener("change", function() {
  filterData();
});

// 監聽時間選擇框的值變化事件
document.getElementById("selectTime").addEventListener("change", function() {
  filterData();
});

// 篩選資料函式
function filterData() {
  // 獲取日期和時間的值
  var startDate = document.getElementById("startdate").value;
  var selectedTime = document.getElementById("selectTime").value;

  // 使用Ajax發送請求到後端
  $.ajax({
    url: contextPath+"/filter",
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify({
      startDate: startDate,
      selectedTime: selectedTime
    }),
    success: function() {
      // 在此處理後端回傳的資料
      console.log('success測試成功:');
    },
    error: function(error) {
      // 處理錯誤
      console.log(error);
    }
  });
}



//==================================假功能
//選擇時間後 桌位變成藍色
function selectTime() {
  var twotableElement = document.querySelector("#table2");
  if (twotableElement) {
    twotableElement.classList.add("blue-bg");
  }
}


//點開藍色桌位視窗
function ordertable() {
	// 獲取視窗元素
	var ordertableWindow = document.getElementById("ordertable");
	// 顯示視窗
	ordertableWindow.style.display = "block";
	// 設定訂位資訊內容
	document.getElementById("orderDate").value = "訂位日期：2023-07-19";
	document.getElementById("orderTime").value = "訂位時間：12:00";
	document.getElementById("orderName").value = "訂位者姓名：賴雅慧";
	document.getElementById("orderGender").value = "性別：小姐";
	document.getElementById("orderPhone").value = "電話：0978090605";
	document.getElementById("orderGuests").value = "訂位人數：3人";
}

//XX關閉
function closeorder() {
	// 獲取視窗元素
	var ordertableWindow = document.getElementById("ordertable");
	// 隱藏視窗
	ordertableWindow.style.display = "none";
}


//進行資料修改
function enableEdit() {
	document.getElementById("orderDate").readOnly = false;
	document.getElementById("orderTime").readOnly = false;
	document.getElementById("orderName").readOnly = false;
	document.getElementById("orderGender").readOnly = false;
	document.getElementById("orderPhone").readOnly = false;
	document.getElementById("orderGuests").readOnly = false;
	
}

//確認後無法修改 未來增加確認後送到資料庫
function confirmOrder() {
	document.getElementById("orderDate").readOnly = true;
	document.getElementById("orderTime").readOnly = true;
	document.getElementById("orderName").readOnly = true;
	document.getElementById("orderGender").readOnly = true;
	document.getElementById("orderPhone").readOnly = true;
	document.getElementById("orderGuests").readOnly = true;
	
	// 獲取視窗元素
	var ordertableWindow = document.getElementById("ordertable");
	// 隱藏視窗
	ordertableWindow.style.display = "none";
}

//刪除桌位並恢復到灰色
function deleteOrder() {
	// 清空訂單資訊
	document.getElementById("orderDate").value = "";
	document.getElementById("orderTime").value = "";
	document.getElementById("orderName").value = "";
	document.getElementById("orderGender").value = "";
	document.getElementById("orderPhone").value = "";
	document.getElementById("orderGuests").value = "";

	// 修改桌位類別
	var blueTableElement = document.querySelector(".box.blue-bg");
	if (blueTableElement) {
		blueTableElement.classList.remove("blue-bg");
		blueTableElement.classList.add("grey-bg");
	}
	// 關閉視窗
	closeorder();
}

/////////////////////////////////////////////////////2桌
/////////////////////////////////////////////////////9桌

function showIntable() {
	// 獲取視窗元素
	var intableWindow = document.getElementById("intable");
	// 顯示視窗
	intableWindow.style.display = "block";
}



//輸入幾人按確認後，十字架會出現人數
function confirmwait() {
	var guestsInput = document.getElementById("guestsInput");
	var numGuests = guestsInput.value;

	var tableElement = document.querySelector("#table9");
	console.log("1")
	if (tableElement) {
		var guestsCountElement = tableElement.querySelector(".guests-count");
		if (guestsCountElement) {
			guestsCountElement.innerText = numGuests + "人";
		}
		tableElement.classList.add("yellow-bg");
	}

	closewait();
}

//XX關閉
function closewait() {
	// 獲取視窗元素
	var test2 = document.getElementById("intable");
	// 隱藏視窗
	test2.style.display = "none";
}
/////////////////////////////////////////////////////9桌
/////////////////////////////////////////////////////7桌

function callIntable() {
	// 獲取視窗元素
	var intableWindow = document.getElementById("calltable");
	// 顯示視窗
	intableWindow.style.display = "block";
}
//按確認
function callwait() {
  var dateInput = document.getElementById('dateInput').value;
  var pNumber3 = document.getElementById('pNumber3').value;
  var nameInput = document.getElementById('nameInput').value;
  var maleInput = document.getElementById('maleInput').checked;
  var femaleInput = document.getElementById('femaleInput').checked;
  var phoneInput = document.getElementById('phoneInput').value;

  var seventableElement = document.querySelector("#table7");
  if (seventableElement) {
    seventableElement.style.backgroundColor = 'skyblue';
    }
  callclose();
}


//XX關閉
function callclose() {
	var calltableElement = document.querySelector("#calltable");	
    calltableElement.style.display = "none";
  }


/////////////////////////////////////////////////////7桌