<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=., initial-scale=1.0">
    <title>Document</title>
    <!-- bootstrap -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> -->
    
    <!-- jquery -->
    <!-- <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script> -->

    <!-- Include Date Range Picker -->
    <!-- <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" /> -->

    <!-- chart -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->

    <!-- fontAwesome - icon插件 -->
    <link href="./assets/src/plugins/fontawesome/css/all.min.css" rel="stylesheet">

</head>

<style>
    body {
        background-color: #EEE;
    }

    .main-content {
        min-width: 580px;
        margin: 20px 20px 20px calc(60px + 20px);
        padding: 15px;
        transition: margin-left 0.3s ease-in-out;
        background-color: #FFF;
        border-radius: var(--main-radius);
    }

    div.scheduler-border {
        border: 1px groove #444444 !important;
        box-shadow: 0px 0px 0px 0px #000;
    }

    .text-on-pannel {
        background: #fff none repeat scroll 0 0;
        height: auto;
        margin-left: 20px;
        padding: 3px 5px;
        position: absolute;
        margin-top: -49px;
        border: 1px solid #444444;
        border-radius: 8px;
    }

    .panel {
        /* for text on pannel */
        margin-top: 0px;
    }

    .panel-body {
        padding-top: 30px;
    }

    .but-width {
        display: table;
        width: 100%;
    }

    .hr-width {
        display: table;
        width: 10%;
    }

    .btn-label {
        width: 30%;
        font-size: 25px;
        display: flex;
        align-items: center;
    }

    h5,
    input {
        display: flex;
        text-align: center;
        align-items: center;
    }
    td:first-child,
    th:first-child {
        border-radius: 10px 0 0 10px;
    }

    td:last-child,
    th:last-child {
        border-radius: 0 10px 10px 0;
    }

    .faq-body::-webkit-scrollbar {
        background-color: rgba(0, 0, 0, 0.4);
        border-radius: 10rem;
        position: absolute;
        width: 15px;
    }

    .faq-body::-webkit-scrollbar-thumb {
        background-color: rgba(0, 0, 0, 0.4);
        border-radius: 10rem;
        border: 1px solid #fff;
    }


    .faq-body::-webkit-scrollbar-track-piece:start {
        background: transparent;
    }

    .faq-body::-webkit-scrollbar-track-piece:end {
        background: transparent;
    }

    tbody.data {
        margin-right: -15px;
        display: block;
        height: 400px;
        overflow-y: scroll;
    }
    thead.data,
    tbody tr.data {
        display: table;
        width: 100%;
        table-layout: fixed;
        /* even columns width , fix width of table too*/
    }
    
    li {  
        padding-top: 2px;
        list-style: none;
    }

    .li-link {
        font-size: 1.25rem;
        font-weight: bold;
        letter-spacing: 2px;
        color: var(--main-color) !important;
    }

</style>
<script>
</script>

<body>
    <!-- 主要內容區域 -->

    <ul class="nav nav-tabs" id="activity-tabs">
        <li class="nav-item"><a class="activity-link nav-link active li-link" data-bs-toggle="tab"
                href="#data-chart-div">數據視圖</a></li>
        <li class="nav-item"><a class="activity-link nav-link li-link" data-bs-toggle="tab"
                href="#data-output-div">下載CSV檔案</a></li>
    </ul>

    <!-- 分頁內容-->
    <div class="tab-content">
        <div id="data-chart-div" class="container-fluid tab-pane fade show active">
            <div class="row g-2 pt-3">
                <div class="col offset-md-1 col-md-3 me-4">
                    <div class="row g-2 panel scheduler-border">
                        <div class="col px-3 panel-body" id="chart-conditions-div">
                            <h5 class="text-on-pannel"><strong class="text-uppercase"> 生成圖表 </strong></h5>
                            <div class="col">
                                <div class="row g-2 panel scheduler-border mb-2">
                                    <div class="col px-3 panel-body">
                                        <h5 class="text-on-pannel"><strong class="text-uppercase"> 圖表模式
                                            </strong>
                                        </h5>
                                        <div id="data-style-div" class="col d-flex mb-2" style="height: 120px;">
                                            <div id="bar-chart-btn" class="col-4 d-flex">
                                                <input type="radio" class="btn-check" name="chart-btnradio" id="bar-chart-input" autocomplete="off" value="bar" checked>
                                                <label class="btn btn-outline-primary flex-fill data-style-btn me-1 p-0" for="bar-chart-input">
                                                    <img src="<c:url value='/images/bar_chart.png' />" id="bar-chart-img" class="data-chart-img">
                                                </label>
                                            </div>                                            
                                            <div id="line-chart-btn" class="col-4 d-flex">
                                                <input type="radio" class="btn-check" name="chart-btnradio" id="line-chart-input" autocomplete="off" value="line">
                                                <label class="btn btn-outline-primary flex-fill data-style-btn me-1 p-0" for="line-chart-input">
                                                    <img src="<c:url value='/images/line_chart.png' />" id="line-chart-img" class="data-chart-img">
                                                </label>
                                            </div>
                                            <div id="pie-chart-btn" class="col-4 d-flex">
                                                <input type="radio" class="btn-check" name="chart-btnradio" id="pie-chart-input" autocomplete="off" value="pie">
                                                <label class="btn btn-outline-primary flex-fill data-style-btn me-1 p-0" for="pie-chart-input">
                                                    <img src="<c:url value='/images/pie_chart.png' />" id="pie-chart-img" class="data-chart-img">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-2 panel scheduler-border mb-2">
                                    <div class="col px-3 panel-body">
                                        <h5 class="text-on-pannel"><strong class="text-uppercase"> 時間範圍
                                            </strong>
                                        </h5>
                                        <div class="col">
                                            <div class="row">
                                                <div class="col d-flex mb-1 text-nowrap">
                                                    <button id="this-year-btn" type="button" class="btn btn-primary flex-fill me-1">今年</button>
                                                    <button id="this-month-btn" type="button" class="btn btn-primary flex-fill me-1">本月</button>
                                                    <button id="this-week-btn" type="button" class="btn btn-primary flex-fill me-1">本周</button>
                                                    <button id="this-day-btn" type="button" class="btn btn-primary flex-fill">當日</button>
                                                </div>
                                            </div>
                                            <div class="row text-nowrap mb-1 px-0">
                                                <div class="col">
                                                    <label
                                                        class=" d-flex justify-content-center align-items-center">結束時間</label>
                                                    <input class="form-control" id="startdate" name="startdate"
                                                        placeholder='yyyy-mm-dd' type="text" style="font-size:15px" />
                                                </div>
                                                <div style="width:5%;font-size: large;">~</div>
                                                <div class="col">
                                                    <label
                                                        class=" d-flex justify-content-center align-items-center">結束時間</label>
                                                    <input class="form-control" id="enddate" name="enddate"
                                                        placeholder='yyyy-mm-dd' type="text" style="font-size:15px" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-2 panel scheduler-border mb-2">
                                    <div class="col panel-body px-3">
                                        <h5 class="text-on-pannel"><strong class="text-uppercase"> 圖表內容
                                            </strong>
                                        </h5>
                                        <div class="row text-nowrap">
                                            <div class="mb-1 btn-label">數據內容：</div>
                                            <div class="col mb-1">
                                                <select class="form-select" id="chart-data-select">
                                                    <option value="1">銷售數量</option>
                                                    <option value="2">銷售額</option>
                                                    <option value="3">銷售佔比</option>
                                                    <option value="4">利潤</option>
                                                    <option value="5">訂單數</option>
                                                    <option value="6">成本</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row text-nowrap mb-3" id="chart-target-select">
                                            <div class="mb-1 btn-label">對比內容：</div>
                                            <div class="col">
                                                <select class="form-select">
                                                    <option value="1">品項</option>
                                                    <option value="2">產品</option>
                                                    <option value="3">年</option>
                                                    <option value="4">月</option>
                                                    <option value="5">日</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div id="select-target-div" class="row g-2 mb-2 panel scheduler-border">
                                            <div class="col panel-body">
                                                <h5 class="text-on-pannel">
                                                    <strong class="text-uppercase me-1">對比項目</strong>
                                                    <a href="#" class="btn btn-primary btn-sm flex-fill" type="button"
                                                        data-bs-toggle="modal" data-bs-target="#compareItemsDiv">選取</a>
                                                    <!-- <button type="button" class="btn btn-primary btn-sm flex-fill">選取</button> -->
                                                </h5>
                                                <div class="container">
                                                    <div id="target-items-div" class="row mb-2 g-1">
                                                        <!-- js setTargerItemsDiv -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <div class="row g-2 container mb-2">
                                    <button id="chart-generation-btn" type="button" class="btn btn-primary">生成圖表</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="ChartDiv" class="col col-md-7">
                </div>
            </div>
        </div>
        <div id="data-output-div" class="container-fluid tab-pane fade">
            <div class="row g-2 pt-3">
                <div class="col col-md-10 offset-md-1 me-4 ">
                    <div class="row text-nowrap">
                        <label class="col col-md-1 d-flex align-items-center">設定時間：</label>
                        <div class="col-md-2 px-0">
                            <input class="col form-control " id="output-startdate" name="output-startdate" placeholder='開始 yyyy-mm-dd'
                                type="text" />
                        </div>
                        <div class="col col-md-1 d-flex justify-content-center align-items-center"
                            style="width:5%;font-size: large;">~</div>
                        <div class="col-md-2 px-0">
                            <input class="col form-control" id="output-enddate" name="output-enddate" placeholder='結束 yyyy-mm-dd'
                                type="text" />
                        </div>
                        <div class="offset-1 col-1 d-flex justify-content-center align-items-center">
                            <button id="table-generation-btn" type="button" class="btn btn-primary">生成預覽表格</button>
                        </div>
                    </div>
                    <div class="row text-nowrap">
                        <label class="col col-md-1 d-flex align-items-center">數據內容：</label>
                        <div class="col col-md-8">
                            <div class="row justify-content-start">
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-value-checkbox" type="checkbox" id="Quantity-checkbox" value="Quantity" checked>
                                    <label class="form-check-label" for="Quantity-checkbox">銷售數量</label>
                                </div>
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-value-checkbox" type="checkbox" id="Sales_Price-checkbox" value="Sales_Price" checked>
                                    <label class="form-check-label" for="Sales_Price-checkbox">銷售額 </label>
                                </div>
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-value-checkbox" type="checkbox" id="Sales_Price_Proportion-checkbox" value="Sales_Price_Proportion" checked>
                                    <label class="form-check-label" for="Sales_Price_Proportion-checkbox">銷售佔比 </label>
                                </div>
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-value-checkbox" type="checkbox" id="Profit-checkbox" value="Profit" checked>
                                    <label class="form-check-label" for="Profit-checkbox">利潤 </label>
                                </div>
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-value-checkbox" type="checkbox" id="Count_Orders-checkbox" value="Count_Orders" checked>
                                    <label class="form-check-label" for="Count_Orders-checkbox">訂單數 </label>
                                </div>
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-value-checkbox" type="checkbox" id="Cost-checkbox" value="Cost" checked>
                                    <label class="form-check-label" for="Cost-checkbox">成本 </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row text-nowrap mb-2">
                        <label class="col col-md-1 d-flex align-items-center">對比內容：</label>
                        <div class="col col-md-8 ">
                            <div class="row">
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-target-checkbox" type="checkbox" id="Category-checkbox" value="Category" checked>
                                    <label class="form-check-label" for="Category-checkbox">品項</label>
                                </div>
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-target-checkbox" type="checkbox" id="Dish-checkbox" value="Dish" checked>
                                    <label class="form-check-label" for="Dish-checkbox">產品 </label>
                                </div>
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-target-checkbox" type="checkbox" id="Year-checkbox" value="Year" checked>
                                    <label class="form-check-label" for="Year-checkbox">年</label>
                                </div>
                                <div class="col-md-2  form-check">
                                    <input class="form-check-input output-target-checkbox" type="checkbox" id="Month-checkbox" value="Month" checked>
                                    <label class="form-check-label" for="Month-checkbox">月</label>
                                </div>
                                <div class="col-md-2  form-check" style="position: relative;z-index: 2;">
                                    <input class="form-check-input output-target-checkbox" type="checkbox" id="Day-checkbox" value="Day" checked>
                                    <label class="form-check-label" for="Day-checkbox">日</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col col-md-12 align-items-center mb-1">
                            <div class="row col-md-12 ">
                                <div class="col col-md-1" id="page-Category-div">
                                    <input type="radio" class="btn-check " name="page-data-radio" id="btnradio1" autocomplete="off" value="Category"
                                        checked>
                                    <label class="btn btn-outline-primary d-flex justify-content-center align-items-center" for="btnradio1">品項</label>
                                </div>
    
                                <div class="col col-md-1" id="page-Dish-div">
                                    <input type="radio" class="btn-check" name="page-data-radio" id="btnradio2" autocomplete="off" value="Dish">
                                    <label class="btn btn-outline-primary d-flex justify-content-center align-items-center" id="page-Dish-label" for="btnradio2">產品</label>
                                </div>
    
                                <div class="col col-md-1" id="page-Year-div">
                                    <input type="radio" class="btn-check" name="page-data-radio" id="btnradio3" autocomplete="off" value="Year">
                                    <label class="btn btn-outline-primary d-flex justify-content-center align-items-center" id="page-Year-label" for="btnradio3">年</label>
                                </div>
    
                                <div class="col col-md-1" id="page-Month-div" >
                                    <input type="radio" class="btn-check" name="page-data-radio" id="btnradio4" autocomplete="off" value="Month">
                                    <label class="btn btn-outline-primary d-flex justify-content-center align-items-center" id="page-Month-label" for="btnradio4">月</label>
                                </div>
    
                                <div class="col col-md-1" id="page-Day-div">
                                    <input type="radio" class="btn-check" name="page-data-radio" id="btnradio5" autocomplete="off" value="Day">
                                    <label class="btn btn-outline-primary d-flex justify-content-center align-items-center" id="page-Day-label" for="btnradio5">日</label>
                                </div>
                            </div>
                        </div>
                        <div class="col col-md-12 align-items-center pb-0" >
                            <div class="row col-md-12">
                                <div style="overflow-x: auto; width: 100%;">
                                    <div class="me-2">
                                        <table class="table table-hover table-primary data">
                                            <thead  class="data">
                                                <tr class="data">
                                                    <th class="table_Time">開始時間</th>
                                                    <th class="table_Time">結束時間</th>
                                                    <th class="targetItem target-class">對比項目</th>
                                                    <th class="data Quantity-class">銷售數量</th>
                                                    <th class="data Sales_Price-class">銷售額</th>
                                                    <th class="data Sales_Price_Proportion-class">銷售佔比</th>
                                                    <th class="data Profit-class">利潤</th>
                                                    <th class="data Count_Orders-class">訂單數</th>
                                                    <th class="data Cost-class">成本</th>
                                                </tr>
                                            </thead>
                                            <tbody class="faq-body data" id="output-data-tbody">
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col offset-md-10 col-md-2 align-items-center">
                                <a href="#" class="btn btn-primary btn-lg d-flex justify-content-center align-items-center me-1"
                                    type="button" id="csv-download-btn">下載CSV檔案</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="compareItemsDiv" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg ">
            <div class="modal-content px-3">
                <div class="modal-header pb-1">
                    <h5 class="modal-title">選取對比項目</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div id="modal-dialog-body-div" class="modal-body pt-3 pb-0">
                </div>
                <div class="modal-footer px-0">
                    <div class="row flex-fill">
                        <button id="modal-target-clear-btn" type="button" class="col col-md-3 btn btn-primary">清空</button>
                        <button id="modal-target-sure-btn" type="button" class="col col-md-3 btn btn-primary offset-sm-6">確定</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    var contextPath = "<%=request.getContextPath()%>";
    var token = "${_csrf.token}";
    var header = "${_csrf.headerName}";
</script>

<script type="text/javascript" src="<c:url value='js/dataAnalysis/dataAnalysis.js'/>"></script>
<script type="text/javascript" src="<c:url value='js/dataAnalysis/dataAnalysis_output.js'/>"></script>

</html>