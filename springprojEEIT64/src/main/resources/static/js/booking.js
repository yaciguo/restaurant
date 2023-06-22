//function checkSelectedDate(input) {
//    var selectedDate = new Date(input.value);
//    var selectedDay = selectedDate.getDay();
//
//    if (selectedDay === 6) { // 如果是周六，清空輸入欄位的值
//      input.value = '';
//      alert('週六未營業');
//    }
//  }
  
  function checkSelectedDate(input) {
    var selectedDate = new Date(input.value);
    var selectedDay = selectedDate.getDay();
    var timeSelect = document.getElementById('time');

    if (selectedDay === 6) {
      input.value = '';
      alert('週六未營業');
      timeSelect.disabled = true;
      timeSelect.value = '';
    } else {
      input.setCustomValidity('');
      timeSelect.disabled = false;
    }
  }