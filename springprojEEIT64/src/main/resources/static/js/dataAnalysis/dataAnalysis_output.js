
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

    setTable(response.data);

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
}

function displayTable(){
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
        }
    })

    let radioTarget = $('input[name="page-data-radio"]:checked').val()
    $(".method-tr").hide();
    $(`.method-${radioTarget}-tr`).show();

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
        $(el).click(()=>{
            displayTable()
        })
    })
})