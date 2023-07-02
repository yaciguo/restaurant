
async function getFdTableData(){
    openingHourData = await $.ajax({
        type: "get",
        url: contextPath + "/basicSettings.api/getAllOpeningHour"
    })
}

$(() => {
    $("a[href='#seat-setting-div']").click(() => {
        getFdTableData();
        // getAllClosingTimeData();
    })
})