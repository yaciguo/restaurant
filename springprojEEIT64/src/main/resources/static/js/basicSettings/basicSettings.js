const dayOfWeek = { 0: "星期日", 1: "星期一", 2: "星期二", 3: "星期三", 4: "星期四", 5: "星期五", 6: "星期六" }
let runTrClick = true;

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

    let startHourMilliS = new Date(`1970-01-01T${startHour}:00:00Z`).getTime();
    let endHourMilliS = new Date(`1970-01-01T${endHour}:00:00Z`).getTime();
    let intervalMilliS = new Date(`1970-01-01T00:${interval}:00Z`).getTime();
    $(selector).empty();
    let curr = startHourMilliS;
    while(curr<endHourMilliS){
        let hourStr = new Date(curr).getHours().toString().padStart(2, '0');
        let minute = new Date(curr).getMinutes().toString().padStart(2, '0');
        $(selector).append(`<li><a class="dropdown-item">${hourStr}:${minute}</a></li>`)
        curr += intervalMilliS;
    }

    // for (let i = startHour; i < endHour; i++) {
    //     for (let j = 0; j < (60 / interval); j++) {
    //         let hourStr = i.toString().padStart(2, '0');
    //         let minute = (j * interval).toString().padStart(2, '0');
    //     }
    // }
    $(selector).append(`<li><a class="dropdown-item">24:00</a></li>`)

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
                <input class="form-check-input " type="checkbox" id="${prefix}-check">
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
    
    $(`#${prefix}-tr a[type='button']`).add(`#${prefix}-tr input[type="checkbox"]`).each((idx, el) => {
        $(el).mouseenter(function () {
            runTrClick = false;
        })
        $(el).mouseleave(function () {
            runTrClick = true;
        })
    })

    $(`#${prefix}-tr`).click(function () {
        if (runTrClick) {
            $(`#${prefix}-check`).get(0).click();
            $("#allCheck").hide();
            $("#removeAllCheck").show();
        }
    })
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

function toggleModal(displayMode){
    let toggleGroup;
    if(displayMode == "add"){
        toggleGroup = [false, true, true, true, false];
    }
    $("#modalDateRowDiv").toggle(toggleGroup[0]);
    $("#modalDayRowDiv").toggle(toggleGroup[1]);
    $("#modalStartTimeRowDiv").toggle(toggleGroup[2]);
    $("#modalEndTimeRowDiv").toggle(toggleGroup[3]);
    $("#modalDescriptionRowDiv").toggle(toggleGroup[4]);
}

$(() => {
    setStyleBtnHeight()
    setTimeDropdown("#start-time-ul", "#dropdownMenuStartTimeBtn", "30", "00", "24");
    setTimeDropdown("#end-time-ul", "#dropdownMenuEndTimeBtn", "30", "00", "24");
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
        toggleModal("add")
        $("#modalTitle").html("新增營業時間")
    })

    $("#allCheck").click(function () {
        $("#allCheck").hide();
        $("#removeAllCheck").show();
        $("#openhour-tody").find("input[type='checkbox']").each((idx, el) => {
            $(el).prop("checked", true);
        })
    })
    $("#removeAllCheck").click(function () {
        $("#allCheck").show();
        $("#removeAllCheck").hide();
        $("#openhour-tody").find("input[type='checkbox']").each((idx, el) => {
            $(el).prop("checked", false);
        })
    })

    $("#activity-tabs").click(() => {
        setStyleBtnHeight()
    })
    $(window).resize(() => {
        setStyleBtnHeight()
    })

})