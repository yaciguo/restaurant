  
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