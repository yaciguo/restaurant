var downloadData = {};


async function getAllData(){
    $("#table-generation-btn").prop('disabled', true);

    let condition = {
        "startDate" : $("#output-startdate").val(),
        "endDate" : $("#output-enddate").val()
    };
    let response = await $.ajax({
        type: "post",
        url: contextPath + "/dataAnalysis.api/getAllData",
        contentType: "application/json",
        data: JSON.stringify(condition),
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        }
    })

    downloadData = response.data;
    setTable(downloadData);

    $("#table-generation-btn").prop('disabled', false);
}

function setTable(data){
    $("#output-data-tbody").empty();
    let startDate = $("#output-startdate").val();
    let endDate = $("#output-enddate").val();
    for(let key of Object.keys(data)){
        let methodData = data[key];
        for(let trData of methodData){
            $("#output-data-tbody").append(`
                <tr class="data method-${key}-tr method-tr">
                    <td class="table_Time">${startDate}</td>
                    <td class="table_Time">${endDate}</td>
                    <td class="targetItem target-class">${trData.target}</td>
                    <td class="data Quantity-class">${trData.Quantity}</td>
                    <td class="data Sales_Price-class">${trData.Sales_Price}</td>
                    <td class="data Sales_Price_Proportion-class">${trData.Sales_Price_Proportion}</td>
                    <td class="data Profit-class">${trData.Profit}</td>
                    <td class="data Count_Orders-class">${trData.Count_Orders}</td>
                    <td class="data Cost-class">${trData.Cost}</td>
                </tr>
            `);
        }
    }

    displayTable()
}

function displayTable(){
    let targetList = [
        'Category',
        'Dish',
        'Year',
        'Month',
        'Day'
    ]

    $(".output-value-checkbox").each((idx, el) =>{
        let val = $(el).val();
        if($(el).prop("checked")){
            $(`.${val}-class`).show();            
        }else{
            $(`.${val}-class`).hide();
        }
    })

    $(".output-target-checkbox").each((idx, el) =>{
        let val = $(el).val();
        if($(el).prop("checked")){
            $(`.method-${val}-tr`).show();
            $(`#page-${val}-div`).show();
        }else{
            $(`.method-${val}-tr`).hide();
            $(`#page-${val}-div`).hide();
            if($(`input[name="page-data-radio"][value="${val}"]:checked`).is(":hidden")){
                for(let target of targetList){
                    if(!$(`input[name="page-data-radio"][value="${target}"]`).is(":hidden")){
                        $(`input[name="page-data-radio"][value="${target}"]`).prop("checked",true);
                        break;
                    }
                }
            }
        }
    })

    let radioTarget = $('input[name="page-data-radio"]:checked').val()
    $(".method-tr").hide();
    $(`.method-${radioTarget}-tr`).show();

    if($(".output-target-checkbox:checked").length==1){
        $(".output-target-checkbox:checked").prop('disabled', true);
    }else if($(".output-target-checkbox:checked").length>1){
        $(".output-target-checkbox:disabled").prop('disabled', false);
    }

    if($(".output-value-checkbox:checked").length==1){
        $(".output-value-checkbox:checked").prop('disabled', true);
    }else if($(".output-value-checkbox:checked").length>1){
        $(".output-value-checkbox:disabled").prop('disabled', false);
    }
}

function convertToCSV(data, valHeader) {
    let csv = '';
    csv += '開始時間,結束時間,對比項目';
    const valText_ch = {
        'Quantity':'銷售數量',
        'Sales_Price':'銷售額',
        'Sales_Price_Proportion':'銷售佔比',
        'Profit':'利潤',
        'Count_Orders':'訂單數',
        'Cost':'成本'
    }
    for(let i of valHeader){
        csv += ','+valText_ch[i];
    }
    csv += '\n';

    let startDate = $("#output-startdate").val();
    let endDate = $("#output-enddate").val();

    for(let rowData of data){
        let row = `${startDate},${endDate},${rowData.target}`;

        for(let i of valHeader){
            row +=','+rowData[i];
        }
        csv += row + '\n';
    }

    return csv;
}

function downloadCSV() {
    let valHeaderIdx = [];
    $(".output-value-checkbox:checked").each((idx, el)=>{
        valHeaderIdx.push($(el).val());
    })
    let targetList = []
    $(".output-target-checkbox:checked").each((idx, el)=>{
        targetList.push($(el).val());
    })
    for(let target of targetList){
        let csv = convertToCSV(downloadData[target], valHeaderIdx);
        let blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
        let url = URL.createObjectURL(blob);
        let link = $("<a id='temp-a'></a>");
        link.attr("href", url);
        link.attr("download", `data_${target}.csv`);
        link.css("visibility", "hidden");
        
        $("body").append(link);
        link.get(0).click();
        link.remove();
    }
}

$(()=>{
    $('a[href="#data-output-div"]').click(()=>{
        if($('#output-startdate').val() == ""){
            $('input[name="output-startdate"]').datepicker('setDate', $("#startdate").val());
        }
        if($('#output-enddate').val() == ""){
            $('input[name="output-enddate"]').datepicker('setDate', $("#enddate").val());
        }
    })

    $("#table-generation-btn").click( () => {
        getAllData();
    });

    $('input[type="checkbox"]').add('input[name="page-data-radio"]').each((idx, el)=>{
        $(el).change(()=>{
            displayTable()
        })
    })

    $("#csv-download-btn").on("click", downloadCSV);
})