var dayOfWeek = { 0: "星期日", 1: "星期一", 2: "星期二", 3: "星期三", 4: "星期四", 5: "星期五", 6: "星期六" }
var runTrClick = true;
var updateId;
var openingHourData;
var closingTimeData;
var sureBtnType;
var deleteIds = [];
// var token = $("meta[name='_csrf']").attr("content");
// var header = $("meta[name='_csrf_header']").attr("content");


async function getOpeningHourData() {
    openingHourData = await $.ajax({
        type: "get",
        url: contextPath + "/basicSettings.api/getAllOpeningHour"
    })
    resetOpenhourTody();
}

function resetOpenhourTody() {
    $("#openhourTody").empty();
    openingHourData.forEach((data) => {
        addOpeningHourDataToTody(data);
    })
}

function addOpeningHourDataToTody(data) {
    let prefix = `openhour-${data.id}`
    $("#openhourTody").append(`
        <tr class="data" id="${prefix}-tr" data-id='${data.id}'>
            <td class="checkbox-td data " >
                <input class="form-check-input " type="checkbox" id="${prefix}-check">
            </td>
            <td class="data">${dayOfWeek[data.dayOfWeek]}</td>
            <td class="data">${data.startTime}</td>
            <td class="data">${data.endTime}</td>
            <td class="td-btn p-1">
                <div class="d-flex">
                    <a class="btn btn-primary btn-sm flex-fill" type="button" data-bs-toggle="modal" data-bs-target="#tdItemModalDiv" id="${prefix}-delbtn">刪除</a>
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
            $(`#${prefix}-check`).prop("checked", $(`#${prefix}-check`).prop("checked") ? false : true)
        }
        $("#openhour-allCheck").toggle($("#openhourTody").find("input:checked").length == 0);
        $("#openhour-removeAllCheck").toggle($("#openhourTody").find("input:checked").length > 0);
    })

    $(`#${prefix}-delbtn`).click(function () {
        deleteIds = [data.id];
        toggleModal("delete");
    })

    $(`#${prefix}-editbtn`).click(function () {
        console.log("修改營業時間");
        updateId = data.id;
        toggleModal("update");
        $("#dayOfWeekSelect option[hidden]").removeAttr('selected');
        $(`#dayOfWeekSelect option[value="${data.dayOfWeek}"]`).prop("selected", "selected");
        $("#dropdownMenuStartTimeBtn").html(data.startTime);
        $("#dropdownMenuEndTimeBtn").html(data.endTime);
    })
}


async function getAllClosingTimeData() {
    closingTimeData = await $.ajax({
        type: "get",
        url: contextPath + "/basicSettings.api/getAllClosingTime"
    })
    resetClosingTimeTody();
}

function resetClosingTimeTody() {
    let keys = Object.keys(closingTimeData);
    if (keys.includes("error")) {
        console.log(closingTimeData["error"]);
    } else {
        $("#closeTimeNewTbody").empty();
        $("#closeTimeOldTbody").empty();
        closingTimeData["now"].forEach(function (data) {
            setNowClosingTimeTody(data);
        })
        closingTimeData["old"].forEach(function (data) {
            setOldClosingTimeTody(data);
        })
    }
}

function setNowClosingTimeTody(data) {
    let prefix = `closingTime-${data.id}`
    $("#closeTimeNewTbody").append(`
    <tr class="data" id= "${prefix}-tr" data-id='${data.id}'>
        <td class="checkbox-td data ">
            <input class="form-check-input "
                type="checkbox" id="${prefix}-check">
        </td>
        ${getClosingTimeTdStr(data)}
        <td class="rest-btn-td p-1">
            <div class="d-flex">
                <a class="btn btn-primary btn-sm flex-fill"
                    type="button" data-bs-toggle="modal"
                    data-bs-target="#tdItemModalDiv" id="${prefix}-delbtn">刪除</a>
            </div>
        </td>
        <td class="rest-btn-td p-1">
            <div class="d-flex td-btn">
                <a class="btn btn-primary btn-sm flex-fill"
                    type="button" data-bs-toggle="modal"
                    data-bs-target="#tdItemModalDiv" id="${prefix}-editbtn">修改</a>
            </div>
        </td>
    </tr>`);

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
            $(`#${prefix}-check`).prop("checked", $(`#${prefix}-check`).prop("checked") ? false : true)
        }
        $("#closetime-allCheck").toggle($("#closeTimeNewTbody").find("input:checked").length == 0);
        $("#closetime-removeAllCheck").toggle($("#closeTimeNewTbody").find("input:checked").length > 0);
    })

    $(`#${prefix}-delbtn`).click(function () {
        deleteIds = [data.id];
        toggleModal("deleteclosetime");
    })

    $(`#${prefix}-editbtn`).click(function () {
        console.log("修改營業時間");
        updateId = data.id;
        toggleModal("updateclosetime");
        $("#setStartDate").val(data.start.date);
        $("#dropdownMenuStartTimeBtn").html(data.start.time);
        $("#setEndDate").val(data.end.date);
        $("#dropdownMenuEndTimeBtn").html(data.end.time);
        $("#description-textarea").val(data.description === null ? "" : data.description);
    })
}

function setOldClosingTimeTody(data) {
    $("#closeTimeOldTbody").append(`
    <tr class="data">
        ${getClosingTimeTdStr(data)}
    </tr>`);
}

function getClosingTimeTdStr(data) {
    let start = data.start;
    let end = data.end;
    let dateStr = `
        <div>${start.date}</div>
        <div class="intervalTime"></div>
        <div>${end.date}</div>`
    let dayStr = `
        <div>${start.day}</div>
        <div class="intervalTime">></div>
        <div>${end.day}</div>`;
    let timeStr = `
        <div>${start.time}</div>
        <div class="intervalTime"> </div>
        <div>${end.time}</div>`;
    let str = `
        <td class="rest-day-td">${dateStr}</td>
        <td class="rest-weekDay-td">${dayStr}</td>
        <td class="rest-time-td">${timeStr}</td>
        <td class="data text-wrap">${data.description === null ? "無" : data.description}</td>`
    return str;
}

function toggleModal(displayMode) {
    let toggleGroup;
    switch (displayMode) {
        case "add":
            $("#modalTitle").html("新增營業時間")
            toggleGroup = [true, false, true, false, true, false];
            sureBtnType = "add";
            break;
        case "update":
            $("#modalTitle").html("修改營業時間")
            toggleGroup = [true, false, true, false, true, false];
            sureBtnType = "update";
            break;
        case "delete":
            $("#modalTitle").html("是否要刪除營業時間?")
            toggleGroup = [false, false, false, false, false, false];
            sureBtnType = "delete";
            break;
        case "deleteAll":
            $("#modalTitle").html("是否要刪除選取營業時間?")
            toggleGroup = [false, false, false, false, false, false];
            sureBtnType = "delete";
            break;
        case "addCloseTime":
            $("#modalTitle").html("新增休假時間")
            toggleGroup = [false, true, true, true, true, true];
            sureBtnType = "addCloseTime";
            break;
        case "updateclosetime":
            $("#modalTitle").html("修改休假時間")
            toggleGroup = [false, true, true, true, true, true];
            sureBtnType = "updateclosetime";
            break;
        case "deleteclosetime":
            $("#modalTitle").html("是否要刪除休假時間?")
            toggleGroup = [false, false, false, false, false, false];
            sureBtnType = "deleteclosetime";
            break;
        case "deleteAllclosetime":
            $("#modalTitle").html("是否要刪除選取休假時間?")
            toggleGroup = [false, false, false, false, false, false];
            sureBtnType = "deleteAllclosetime";
            break;

    }
    $("#modalDayRowDiv").toggle(toggleGroup[0]);
    $("#modalStartDateRowDiv").toggle(toggleGroup[1]);
    $("#modalStartTimeRowDiv").toggle(toggleGroup[2]);
    $("#modalEndDateRowDiv").toggle(toggleGroup[3]);
    $("#modalEndTimeRowDiv").toggle(toggleGroup[4]);
    $("#modalDescriptionRowDiv").toggle(toggleGroup[5]);
}

async function sureBtnClick() {
    let startDate = $("#setStartDate").val();
    let endDate = $("#setEndDate").val();
    let startTime = $("#dropdownMenuStartTimeBtn").html();
    let endTime = $("#dropdownMenuEndTimeBtn").html();
    let data = {
        "id": null,
        "dayOfWeek": parseInt($("#dayOfWeekSelect").val()),
        "startTime": startTime,
        "endTime": endTime
    };
    let closeTimeData = {
        "id": null,
        "startDate": `${startDate} ${startTime}:00`,
        "endDate": `${endDate} ${endTime}:00`,
        "description": $("#description-textarea").val() ? $("#description-textarea").val() : null
    }
    let result;
    switch (sureBtnType) {
        case "add":
            result = await $.ajax({
                type: "post",
                url: contextPath + "/basicSettings.api/addOpeningHour",
                contentType: "application/json",
                data: JSON.stringify(data),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            })
            break;
        case "update":
            data.id = updateId;
            console.log(data)
            result = await $.ajax({
                type: "put",
                url: contextPath + "/basicSettings.api/editOpeningHour",
                contentType: "application/json",
                data: JSON.stringify(data),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            })
            console.log(result)
            break;
        case "delete":
            console.log(header, token)
            result = await $.ajax({
                type: "delete",
                url: contextPath + "/basicSettings.api/deleteOpeningHour",
                contentType: "application/json",
                data: JSON.stringify(deleteIds),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            })
            break;
        case "addCloseTime":
            result = await $.ajax({
                type: "post",
                url: contextPath + "/basicSettings.api/addClosingTime",
                contentType: "application/json",
                data: JSON.stringify(closeTimeData),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            })
            break;
        case "deleteclosetime":
            result = await $.ajax({
                type: "delete",
                url: contextPath + "/basicSettings.api/deleteClosingTime",
                contentType: "application/json",
                data: JSON.stringify(deleteIds),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            })
            break;
        case "updateclosetime":
            closeTimeData.id = updateId;
            result = await $.ajax({
                type: "put",
                url: contextPath + "/basicSettings.api/editClosingTime",
                contentType: "application/json",
                data: JSON.stringify(closeTimeData),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            })
            break;
        case "deleteAllclosetime":
            result = await $.ajax({
                type: "delete",
                url: contextPath + "/basicSettings.api/deleteClosingTime",
                contentType: "application/json",
                data: JSON.stringify(deleteIds),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            })
            break;
    }

    getAllClosingTimeData()
    getOpeningHourData();
    $('#tdItemModalDiv').modal('hide');
}

$(() => {
    $("a[href='#opening-setting-div']").click(() => {
        getOpeningHourData();
        getAllClosingTimeData();
    })

    $("#sureBtn").click(() => {
        sureBtnClick();
    })

    $("#openhour-addbtn").click(() => {
        console.log("新增營業時間")
        toggleModal("add")

        $("#dayOfWeekSelect option").each(function (el) {
            $(el).removeAttr('selected')
        })
        $("#dayOfWeekSelect option[hidden]").prop('selected', 'selected');
        $("#dropdownMenuStartTimeBtn").html("選取時間");
        $("#dropdownMenuEndTimeBtn").html("選取時間");
    })

    $("#openhour-deleteAllbtn").click(() => {
        toggleModal("deleteAll");
        deleteIds = []
        $("#openhourTody tr").each(function () {
            let id = $(this).attr("data-id");
            if ($(this).find("input").prop("checked")) {
                deleteIds.push(id);
            }
        })
    })

    $("#openhour-allCheck").click(function () {
        $("#openhour-allCheck").hide();
        $("#openhour-removeAllCheck").show();
        $("#openhourTody").find("input[type='checkbox']").each((idx, el) => {
            $(el).prop("checked", true);
        })
    })
    $("#openhour-removeAllCheck").click(function () {
        $("#openhour-allCheck").show();
        $("#openhour-removeAllCheck").hide();
        $("#openhourTody").find("input[type='checkbox']").each((idx, el) => {
            $(el).prop("checked", false);
        })
    })

    $("#closetime-allCheck").click(function () {
        $("#closetime-allCheck").hide();
        $("#closetime-removeAllCheck").show();
        $("#closeTimeNewTbody").find("input[type='checkbox']").each((idx, el) => {
            $(el).prop("checked", true);
        })
    })
    $("#closetime-removeAllCheck").click(function () {
        $("#closetime-allCheck").show();
        $("#closetime-removeAllCheck").hide();
        $("#closeTimeNewTbody").find("input[type='checkbox']").each((idx, el) => {
            $(el).prop("checked", false);
        })
    })

    $("#closetime-deleteAllbtn").click(() => {
        toggleModal("deleteAllclosetime");
        deleteIds = []
        $("#closeTimeNewTbody tr").each(function () {
            let id = $(this).attr("data-id");
            if ($(this).find("input").prop("checked")) {
                deleteIds.push(id);
            }
        })
    })

    $("#closetime-addbtn").click(function () {
        toggleModal("addCloseTime");
        $("#dropdownMenuStartTimeBtn").html("選取時間");
        $("#dropdownMenuEndTimeBtn").html("選取時間");
        $("#setStartDate").val('選取日期');
        $("#setEndDate").val('選取日期');
        $("#description-textarea").val('');
    })
})