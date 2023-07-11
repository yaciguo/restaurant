async function getAllSettings(){
    let settings = await $.ajax({
        type: "get",
        url: contextPath + "/basicSettings.api/getBasicSettings",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    })
    setSettings(settings.data);
}

function setSettings(data){
    $("#shopName-input").val(data.shopName);
    $("#image-preview").attr("src", data.logoImg);
}

function saveSetting(target){
    let data;
    switch(target){
        case "shopName":
            data = {
                "setName" : "shopName",
                "setValue": $("#shopName-input").val()
            }
            $("#sidenav-title").html(data.setValue);
            sendSettings(data);
            break;
        case "logoImg":
            let base64String;
            let fileInput = $("#upload-logo-btn");
            let file =  fileInput[0].files[0];
            const reader = new FileReader();
            reader.onload = function(event) {
                base64String = event.target.result;
                $("#image-preview").attr("src", base64String);
                data = {
                    "setName" : "logoImg",
                    "setValue": base64String
                }
                $("#sideNav-shopLogo-img").attr("src", data.setValue);
                sendSettings(data);
            };
            reader.readAsDataURL(file);
            break;
    }
}

async function sendSettings(data){
    let result = await $.ajax({
        type: "post",
        url: contextPath + "/basicSettings.api/editBasicSettings",
        contentType: "application/json",
        data: JSON.stringify(data),
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    })
    console.log(result)
}

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

$(function () {
    getAllSettings();
    setStyleBtnHeight();
    setTimeDropdown("#startTimeUl", "#dropdownMenuStartTimeBtn", "30", "00", "24");
    setTimeDropdown("#endTimeUl", "#dropdownMenuEndTimeBtn", "30", "00", "24");
    setDatepicker($("#setStartDate"));
    setDatepicker($("#setEndDate"));

    $("#activity-tabs").click(() => {
        setStyleBtnHeight()
    })

    $("#save-shopName-btn").click(()=>{
        saveSetting("shopName")
    })

    $("#upload-logo-btn").change(()=>{
        saveSetting("logoImg")
    })

    $(window).resize(() => {
        setStyleBtnHeight()
    })
})