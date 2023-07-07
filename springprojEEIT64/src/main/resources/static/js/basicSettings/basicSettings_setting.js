var fdTableData;
var seat_updateId;
var seat_sureBtnType;


async function getFdTableData(){
    fdTableData = await $.ajax({
        type: "get",
        url: contextPath + "/basicSettings.api/getAllFdTable",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    })
    resetSeatData();
}

function resetSeatData(){
    if(fdTableData.code == 2000){
        $("#seatButtonDiv").empty();
        for(let data of fdTableData.data){
            setFdTableButton(data);
        }
    }
    setStyleBtnHeight();
}

function setFdTableButton(data){
    let prefix = `seatBtn-${data.tableId}`;
    $("#seatButtonDiv").append(`
        <div class="col col-2 d-flex m-0 p-2">
            <button type="button" id="${prefix}-btn"
                class="style-set btn btn-primary flex-fill p-0" data-bs-toggle="modal"
                data-bs-target="#seatSettingModalDiv">
                <div class="flex-fill h-100 seat-btn">
                    <span class="seat-num">桌號：<span>${data.tableId}</span></span>
                    <span class="seat-people ">座位人數：<span>${data.capacity}</span></span>
                </div>
            </button>
        </div>
    `);
    $(`#${prefix}-btn`).click(function () {
        seat_updateId = data.tableId;
        toggleSeatModal("updateSeat");
        $("#tableId-input").val(data.tableId);
        $("#capacity-input").val(data.capacity);
    })
}


function toggleSeatModal(displayMode){
    let toggleGroup;
    switch (displayMode) {
        case "updateSeat":
            $("#seatModalTitle").html("修改桌位");
            toggleGroup = [true, true];            
            break;
        case "addSeat":
            $("#seatModalTitle").html("新增桌位");
            toggleGroup = [false, false];
            break;
    }

    seat_sureBtnType = displayMode;
    $("#tableId-input").attr("readonly",toggleGroup[0]);
    $("#seatRemoveBtn").toggle(toggleGroup[1]);
}

async function seat_sureBtnClick() {
    console.log(123)
    let data = {
        "tableId": parseInt($("#tableId-input").val()),
        "capacity": parseInt($("#capacity-input").val())
    };
    console.log(seat_sureBtnType)
    switch (seat_sureBtnType) {
        case "updateSeat":
            result = await $.ajax({
                type: "put",
                url: contextPath + "/basicSettings.api/editFdTable",
                contentType: "application/json",
                data: JSON.stringify(data),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            })
            console.log(result);
            break;
        case "addSeat":
            result = await $.ajax({
                type: "post",
                url: contextPath + "/basicSettings.api/addFdTable",
                contentType: "application/json",
                data: JSON.stringify(data),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                }
            })
            console.log(result);
            break;
    }
    getFdTableData();
    $('#seatSettingModalDiv').modal('hide');
}

async function seat_removeBtnClick() {
    result = await $.ajax({
        type: "delete",
        url: contextPath + "/basicSettings.api/deleteFdTable",
        contentType: "application/json",
        data: JSON.stringify([parseInt($("#tableId-input").val())]),
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    })
    console.log(result);
    getFdTableData();
    $('#seatSettingModalDiv').modal('hide');
}

$(() => {
    getFdTableData();
    $("a[href='#seat-setting-div']").click(() => {
        getFdTableData();
    })
    
    $("#seat-addbtn").click(function () { 
        toggleSeatModal('addSeat');
        $("#tableId-input").val('');
        $("#capacity-input").val('');
    });

    $("#seatRemoveBtn").click(() => {
        seat_removeBtnClick();
    });

    $("#seatSureBtn").click(() => {
        seat_sureBtnClick();
    });
})