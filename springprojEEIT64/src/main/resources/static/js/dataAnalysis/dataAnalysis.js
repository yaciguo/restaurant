// var contextPath = "<%=request.getContextPath()%>";
// var startdate_input;
// var enddate_input;

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

function setStyleHeight() {
    let divHeight = $("#data-style-div").width()/3-5;
    $("#ChartDiv").css("height",$("#ChartDiv").width()*0.7)

    $("#data-style-div").height(divHeight)
    $("img.data-chart-img").each((idx, el) => {
        $(el).width(divHeight)
        $(el).height(divHeight)
    })
}

function quickDateBtn(startdate_input, enddate_input) {
    let nowDate = new Date(Date.now())
    let thisYear = nowDate.getFullYear()
    let thisMonth = nowDate.getMonth() + 1
    let thisDayOfMonth = new Date(thisYear, thisMonth, 0).getDate();
    let thisDate = nowDate.getDate()
    let thisDay = nowDate.getDay()

    $("#this-year-btn").click(() => {
        startdate_input.datepicker('update', `${thisYear}-01-01`);
        enddate_input.datepicker('update', `${thisYear}-12-31`);
    })
    $("#this-month-btn").click(() => {
        startdate_input.datepicker('update', `${thisYear}-${thisMonth}-01`);
        enddate_input.datepicker('update', `${thisYear}-${thisMonth}-${thisDayOfMonth}`);
    })
    $("#this-week-btn").click(() => {
        let startdate = nowDate - (thisDay * 86400000);
        let enddate = nowDate - 0 + ((6 - thisDay) * 86400000);
        startdate = new Date(startdate);
        enddate = new Date(enddate);
        startdate = `${startdate.getFullYear()}-${startdate.getMonth() + 1}-${startdate.getDate()}`;
        enddate = `${enddate.getFullYear()}-${enddate.getMonth() + 1}-${enddate.getDate()}`;
        startdate_input.datepicker('update', startdate);
        enddate_input.datepicker('update', enddate);
    })
    $("#this-day-btn").click(() => {
        startdate_input.datepicker('update', `${thisYear}-${thisMonth}-${thisDate}`);
        enddate_input.datepicker('update', `${thisYear}-${thisMonth}-${thisDate}`);
    })
}

function setTargerItemsDiv(targetList) {
    $("#target-items-div").empty();
    for (let i = 0; i < targetList.length; i++) {
        let content = `
            <div data-id = "${targetList[i].id}" class="col-3 p-1 border bg-light d-flex justify-content-center align-items-center">
                <label>${targetList[i].name}</label>
            </div>`;
        $("#target-items-div").append(content);
    }
}

async function setTargerModal(){

    function setTargerModalItemsDiv(data, type) {
        const TYPE_ID = type + data.id;
        $("#modal-dialog-body-div").append(`
        <div id="target-modal-${TYPE_ID}" class="${type}-target-div target-item-div">
            <div class="row mb-1">
                <button id="target-modal-${TYPE_ID}-btn" type="button" class="col col-md-3 btn btn-primary">${data.name}</button>
            </div>
            <div id="target-modal-${TYPE_ID}-items" class="row mb-3">
            </div>
        </div>`)

        data.items.forEach((item, idx) => {
            $(`#target-modal-${TYPE_ID}-items`).append(`
            <div class="col-md-3 form-check">
                <input class="form-check-input ${TYPE_ID}-class target-item ${type}-target-item" type="checkbox"
                data-id="${item.id}"
                id="input-${TYPE_ID}-${item.id}">
                <label class="form-check-label" for="input-${TYPE_ID}-${item.id}">${item.name}</label>
            </div>`)
        });

        $(`#target-modal-${TYPE_ID}-btn`).click(() => {
            let isChecked = true;
            $(`input.${TYPE_ID}-class`).each((idx, el) => {
                if ($(el).prop("checked") == true) {
                    isChecked = false;
                }
            })
            $(`input.${TYPE_ID}-class`).each((idx, el) => {
                $(el).prop("checked", isChecked);
            })
            isChecked = true;
        })
    }

    
    $("#modal-dialog-body-div").empty();
    let category = await $.ajax({
        type: "get",
        url: contextPath+"/dataAnalysis.api/getCategory",
        contentType: "application/json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    })
    category.data.forEach((data) => {
        setTargerModalItemsDiv(data, "allCategory");
    })
    let categoryAndDish = await $.ajax({
        type: "get",
        url: contextPath+"/dataAnalysis.api/getCategoryAndDish",
        contentType: "application/json",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    })
    categoryAndDish.data.forEach((data) => {
        setTargerModalItemsDiv(data, "category");
    })
    $("#chart-target-select").change();
}

function getModalTargetCheckedIds(){
    let result = [];
    $(".target-item-div").each(function(){
        if($(this).css("display") != "none"){
            $(this).find("input").each((idx, el)=>{
                let id = $(el).attr("id");
                
                if($(`#${id}`).prop("checked") == true){
                    let obj = {
                        "id" : $(el).attr("data-id"),
                        "name" : $(`label[for="${id}"]`).html()
                    };
                    result.push(obj);    
                }
            })
        }
    })
    return result;
}

async function getData(){
    let condition = {
        "method":parseInt($("#chart-target-select").find(":selected").val()),
        "value_type":parseInt($("#chart-data-select").find(":selected").val()),
        "startDate" : $("#startdate").val(),
        "endDate" : $("#enddate").val()
    };
    
    if(["1", "2"].includes($("#chart-target-select").find(":selected").val())){
        condition.ids = []
        $("#target-items-div div").each((idx, el)=>{
            condition.ids.push(parseInt($(el).attr("data-id")));
        })
    }
    let response = await $.ajax({
        type: "post",
        url: contextPath + "/dataAnalysis.api/getData",
        contentType: "application/json",
        data: JSON.stringify(condition),
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    })
    let chartType = $('input[name="chart-btnradio"]:checked').val();
    let dataTypeName = $("#chart-data-select").find(":selected").html();
    setChart($("#ChartDiv"), chartType, dataTypeName, response.data);
}

function setChart(element, chartType, dataTypeName, data){
    let labels = [];
    let dataValues = [];
    data.forEach((obj)=>{
        labels.push(obj.target);
        dataValues.push(obj.value);
    })
    element.empty();
    element.append('<canvas id="myChart"></canvas>');
    new Chart($("#myChart"), {
        type: chartType,
        data: {
            labels: labels,//['項目A', '項目B', '項目C', '項目D', '項目E', '項目F'],
            datasets: [{
                label: dataTypeName,
                data: dataValues,//[12, 19, 3, 5, 2, 3],
                borderWidth: 1
            }]
        },
        options: {
            maintainAspectRatio: false,
            responsive:true,
            // scales: {
            //     y: {
            //         max: 20,
            //         min: 2,
            //         ticks: {
            //             stepSize: 0.5
            //         },

            //         // maintainAspectRatio: false,
            //         // responsive: true,
            //         // aspectRatio: true
            //         // beginAtZero: true
            //     }
            // }
        }
    });
}

$(function(){
    startdate_input = $('input[name="startdate"]');
    setDatepicker(startdate_input)
    enddate_input = $('input[name="enddate"]');
    setDatepicker(enddate_input)
    output_startdate_input = $('input[name="output-startdate"]');
    setDatepicker(output_startdate_input)
    output_enddate_input = $('input[name="output-enddate"]');
    setDatepicker(output_enddate_input)
    setStyleHeight()
    quickDateBtn(startdate_input, enddate_input);
    setTargerModal();

    $("#modal-target-sure-btn").click(() => {
        let targetList = getModalTargetCheckedIds();
        setTargerItemsDiv(targetList);
        $('#compareItemsDiv').modal('hide');
    })

    $("#modal-target-clear-btn").click(() => {
        $(".target-item-div").each(function(){
            if($(this).css("display") != "none"){
                $(this).find("input").each((idx, el)=>{
                    $(el).prop("checked", false);
                })
            }                    
        })
        $('#compareItemsDiv').modal('hide');
    })

    $("#chart-generation-btn").click(()=>{
        getData();
    })

    $("#chart-target-select").change(function() {
        switch($(this).find(":selected").val()){
            case "1":
                $("#select-target-div").show()
                $(".allCategory-target-div").each((idx, el) => {
                    $(el).show();
                })
                $(".category-target-div").each((idx, el)=>{
                    $(el).hide();
                })
                $("#modal-target-sure-btn").click();
                break;
            case "2":
                $("#select-target-div").show()
                $(".allCategory-target-div").each((idx, el) => {
                    $(el).hide();
                })
                $(".category-target-div").each((idx, el)=>{
                    $(el).show();
                })
                $("#modal-target-sure-btn").click();
                break;
            default:
                $("#select-target-div").hide()
                break;
        }
    })
    $("#chart-target-select").change();
    Chart.defaults.font.size = 30;
    $('#myChart').css('width', '100%');

    $(window).resize(() => {
        setStyleHeight()
    })
})