function setStyleBtnHeight() {
    $("button.style-set").each((idx, el) => {
        $(el).height($(el).width())
    })
}

function setDatepicker(element) {
	var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
	var options = {
		format: 'yyyy-mm-dd',
		container: container,
        startDate: new Date().toString(),
		todayHighlight: true,
		autoclose: true,
		orientation: 'top'
	};
	element.datepicker(options);
}

function setTimeDropdown(selector, buttonSelector, interval, startHour, endHour) {
    let startHourMilliS = new Date(`1970-01-01T${startHour}:00:00+08:00`).getTime();
    let endHourMilliS = new Date(`1970-01-01T${endHour}:00:00+08:00`).getTime();
    let intervalMilliS = new Date(`1970-01-01T00:${interval}:00Z`).getTime();
    $(selector).empty();
    let curr = startHourMilliS;
    while(curr<=endHourMilliS){
        let hourStr = new Date(curr).getHours().toString().padStart(2, '0');
        let minute = new Date(curr).getMinutes().toString().padStart(2, '0');
        $(selector).append(`<li><a class="dropdown-item">${hourStr}:${minute}</a></li>`)
        curr += intervalMilliS;
    }

    $(`${selector} li a`).click(function () {
        $(buttonSelector).html($(this).text());
    });
}

$(() => {
    setStyleBtnHeight()
    setTimeDropdown("#startTimeUl", "#dropdownMenuStartTimeBtn", "30", "00", "24");
    setTimeDropdown("#endTimeUl", "#dropdownMenuEndTimeBtn", "30", "00", "24");
    setDatepicker($("#setStartDate"))
    setDatepicker($("#setEndDate"))

    $("#activity-tabs").click(() => {
        setStyleBtnHeight()
    })

    $(window).resize(() => {
        setStyleBtnHeight()
    })
})