const dayOfWeek = { 7: "星期日", 1: "星期一", 2: "星期二", 3: "星期三", 4: "星期四", 5: "星期五", 6: "星期六" }
let runTrClick = true;
let updateId;
let OpeningHourData;
let sureBtnType;
let deleteIds = [];

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

function setStyleBtnHeight() {
    $("button.style-set").each((idx, el) => {
        $(el).height($(el).width())
    })
}

function addOpeningHourDataToTable(data) {
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
            $(`#${prefix}-check`).get(0).click();
            $("#allCheck").hide();
            $("#removeAllCheck").show();
        }
    })

    $(`#${prefix}-delbtn`).click(function() {
        deleteIds = [data.id];
        toggleModal("delete");
    })

    $(`#${prefix}-editbtn`).click(function() {
        console.log("修改營業時間"); 
        updateId = data.id;
        toggleModal("update");
        $("#dayOfWeekSelect option[hidden]").removeAttr('selected');
        $(`#dayOfWeekSelect option[value="${data.dayOfWeek}"]`).prop("selected", "selected");
        $("#dropdownMenuStartTimeBtn").html(data.startTime),
        $("#dropdownMenuEndTimeBtn").html(data.endTime)
    })
}

async function getOpeningHourData() {
    OpeningHourData = await $.ajax({
        type: "get",
        url: contextPath + "/basicSettings.api/getAllOpeningHour"
    })
    resetOpenhourTody();
}

function resetOpenhourTody(){
    $("#openhourTody").empty();
    OpeningHourData.forEach((data) => {
        addOpeningHourDataToTable(data);
    })
}

function toggleModal(displayMode){
    let toggleGroup;
    switch(displayMode){
        case "add":
            $("#modalTitle").html("新增營業時間")
            toggleGroup = [false, true, true, true, false];
            sureBtnType = "add";
            break;
        case "update":
            $("#modalTitle").html("修改營業時間")
            toggleGroup = [false, true, true, true, false];
            sureBtnType = "update";
            break;
        case "delete":
            $("#modalTitle").html("是否要刪除營業時間?")
            toggleGroup = [false, false, false, false, false];
            sureBtnType = "delete";     
            break;
        case "deleteAll":
            $("#modalTitle").html("是否要刪除選取營業時間?")
            toggleGroup = [false, false, false, false, false];
            sureBtnType = "delete";     
            break;
    }
    $("#modalDateRowDiv").toggle(toggleGroup[0]);
    $("#modalDayRowDiv").toggle(toggleGroup[1]);
    $("#modalStartTimeRowDiv").toggle(toggleGroup[2]);
    $("#modalEndTimeRowDiv").toggle(toggleGroup[3]);
    $("#modalDescriptionRowDiv").toggle(toggleGroup[4]);
}

async function sureBtnClick(){
    let data = {
        "id":null,
        "dayOfWeek":parseInt($("#dayOfWeekSelect").val()),
        "startTime":$("#dropdownMenuStartTimeBtn").html(),
        "endTime":$("#dropdownMenuEndTimeBtn").html()
    };
    let result;
    switch(sureBtnType){
        case "add":
            result = await $.ajax({
                type: "post",
                url: contextPath + "/basicSettings.api/addOpeningHour",
                contentType: "application/json",
                data: JSON.stringify(data)
            })
            break;
        case "update":
            data.id = updateId;
            result = await $.ajax({
                type: "put",
                url: contextPath + "/basicSettings.api/editOpeningHour",
                contentType: "application/json",
                data: JSON.stringify(data)
            })
            break;
        case "delete":
            result = await $.ajax({
                type: "delete",
                url: contextPath + "/basicSettings.api/deleteOpeningHour",
                contentType: "application/json",
                data: JSON.stringify(deleteIds)
            })
            break;

    }
    getOpeningHourData();
    $('#tdItemModalDiv').modal('hide');
}

$(() => {
    setStyleBtnHeight()
    setTimeDropdown("#startTimeUl", "#dropdownMenuStartTimeBtn", "30", "00", "24");
    setTimeDropdown("#endTimeUl", "#dropdownMenuEndTimeBtn", "30", "00", "24");
    setDatepicker($("#setdate"))



    $("a[href='#basic-setting-div']").click(() => {
    })

    $("a[href='#seat-setting-div']").click(() => {
    })

    $("a[href='#opening-setting-div']").click(() => {
        getOpeningHourData();
    })
    $("#sureBtn").click(() => {
        sureBtnClick();
    })


    $("#openhour-addbtn").click(() => {
        console.log("新增營業時間")
        toggleModal("add")

        $("#dayOfWeekSelect option").each(function(el){
            $(el).removeAttr('selected')
        })
        $("#dayOfWeekSelect option[hidden]").prop('selected','selected')
        $("#dropdownMenuStartTimeBtn").html("選取時間"),
        $("#dropdownMenuEndTimeBtn").html("選取時間")
    })

    $("#openhour-deleteAllbtn").click(() => {
        toggleModal("deleteAll");        
        deleteIds = []
        $("#openhourTody tr").each(function(){
            let id = $(this).attr("data-id");
            // $(this).find("input").get(0).attr("checked")
            if($(this).find("input").prop("checked")){
                deleteIds.push(id);
            }
        })

    })

    $("#allCheck").click(function () {
        $("#allCheck").hide();
        $("#removeAllCheck").show();
        $("#openhourTody").find("input[type='checkbox']").each((idx, el) => {
            $(el).prop("checked", true);
        })
    })
    $("#removeAllCheck").click(function () {
        $("#allCheck").show();
        $("#removeAllCheck").hide();
        $("#openhourTody").find("input[type='checkbox']").each((idx, el) => {
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