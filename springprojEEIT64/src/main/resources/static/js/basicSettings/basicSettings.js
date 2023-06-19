const dayOfWeek = { 0: "星期日", 1: "星期一", 2: "星期二", 3: "星期三", 4: "星期四", 5: "星期五", 6: "星期六" }


function setDatepicker(element) {
	var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
	var options = {
		format: 'yyyy-mm-dd',
		// container: container,
		todayHighlight: true,
		autoclose: true,
		orientation: 'top'
	};
	element.datepicker(options);
}


function setTimeDropdown(selector, buttonSelector, interval, startHour, endHour) {
    for (let i = startHour; i < endHour; i++) {
        for (let j = 0; j < (60 / interval); j++) {
            let hourStr = i.toString().padStart(2, '0');
            let minute = (j * interval).toString().padStart(2, '0');
            $(selector).append(`<li><a class="dropdown-item" href="#">${hourStr}:${minute}</a></li>`)
        }
    }
    $(selector).append(`<li><a class="dropdown-item" href="#">24:00</a></li>`)

    $(`${selector} li a`).click(function () {
        $(buttonSelector).html($(this).text());
    });
}



function setStyleBtnHeight() {
    $("button.style-set").each((idx, el) => {
        $(el).height($(el).width())
    })
}

function addOpeningHourDataToTable(data) {
    let prefix = `openhour-${data.id}`
    $("#openhour-tody").append(`
        <tr class="data" id="${prefix}-tr">
            <td class="checkbox-td data ">
                <input class="form-check-input " type="checkbox" value="option1" id="${prefix}-check">
            </td>
            <td class="data">${dayOfWeek[data.dayOfWeek]}</td>
            <td class="data">${data.startTime}</td>
            <td class="data">${data.endTime}</td>
            <td class="td-btn p-1">
                <div class="d-flex">
                    <a class="btn btn-primary btn-sm flex-fill" type="button" id="${prefix}-delbtn">刪除</a>
                </div>
            </td>
            <td class="td-btn p-1">
                <div class="d-flex td-btn">
                    <a class="btn btn-primary btn-sm flex-fill" type="button" data-bs-toggle="modal" data-bs-target="#tdItemModalDiv" id="${prefix}-editbtn">修改</a>
                </div>
            </td>
        </tr>
    `)
}

async function getOpeningHourData() {
    OpeningHourData = await $.ajax({
        type: "get",
        url: contextPath + "/basicSettings.api/getAllOpeningHour"
    })
    $("#openhour-tody").empty();
    OpeningHourData.forEach((data) => {
        addOpeningHourDataToTable(data);
    });
}


$(() => {
    setStyleBtnHeight()
    setTimeDropdown("#start-time-ul", "#dropdownMenuStartTimeBtn", 30, 0, 24);
    setTimeDropdown("#end-time-ul", "#dropdownMenuEndTimeBtn", 30, 0, 24);
    setDatepicker($("#setdate"))



    $("a[href='#basic-setting-div']").click(() => {
    })

    $("a[href='#seat-setting-div']").click(() => {
    })

    $("a[href='#opening-setting-div']").click(() => {
        getOpeningHourData();
    })

    $("#openhour-addbtn").click(() => {
        console.log("新增營業時間")
        $("#modalTitle").html("新增營業時間")
    })

    $("#activity-tabs").click(() => {
        setStyleBtnHeight()
    })
    $(window).resize(() => {
        setStyleBtnHeight()
    })

})