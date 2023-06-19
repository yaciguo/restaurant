<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- Include Date Range Picker -->
    <script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

</head>
<style>
    div.scheduler-border {
        border: 1px groove #4070ff !important;
        box-shadow: 0px 0px 0px 0px #000;
    }

    .text-on-pannel {
        background: #fff none repeat scroll 0 0;
        height: auto;
        margin-left: 20px;
        padding: 3px 5px;
        position: absolute;
        margin-top: -49px;
        border: 1px solid #337ab7;
        border-radius: 8px;
    }

    .panel {
        /* for text on pannel */
        margin-top: 0px;
    }

    .panel-body {
        padding-top: 30px;
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

    .seat-btn {
        position: relative;
    }

    .seat-people {
        font-size: medium;
        position: absolute;
        bottom: 5%;
        left: 0;
        right: 0;
    }

    .seat-num {
        font-size: x-large;
        position: absolute;
        bottom: 35%;
        left: 0;
        right: 0;
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

    .checkbox-td {
        width: 50px;
    }

    .rest-day-td {
        width: 150px;
    }

    .rest-weekDay-td {
        width: 100px;
    }

    .rest-time-td {
        width: 100px;
    }

    .rest-btn-td {
        width: 80px;
    }

    .text-wrap {
        white-space: normal;
    }

    select {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }

    .dropdown-menu.timepicker {
        max-height: 200px;
        --bs-dropdown-min-width: 7.8rem;
        overflow: auto;
    }

    button[data-bs-toggle="dropdown"]{
        text-align: left;

    }
</style>

<body>

    <div id="main-content" class="main-content">
        <ul class="nav nav-tabs" id="activity-tabs">
            <li class="nav-item"><a class="activity-link nav-link active" data-bs-toggle="tab"
                    href="#basic-setting-div">廣告看板</a></li>
            <li class="nav-item"><a class="activity-link nav-link" data-bs-toggle="tab"
                    href="#seat-setting-div">座位設定</a></li>
            <li class="nav-item"><a class="activity-link nav-link" data-bs-toggle="tab"
                    href="#opening-setting-div">營業設定</a></li>
        </ul>

        <!-- 分頁內容-->
        <div class="tab-content">
            <div id="basic-setting-div" class="container-fluid tab-pane fade show active">
                <div class="row col-10 offset-1 pt-3">
                    <div class="col-6 text-nowrap">
                        <div class="row mb-4 px-2">
                            <div class="panel-body panel scheduler-border pb-2">
                                <h5 class="text-on-pannel text-primary">
                                    <strong class="text-uppercase">店名設定</strong>
                                </h5>
                                <input class="form-control" type="text" />
                            </div>
                        </div>
                        <div class="row px-2">
                            <div class="panel-body panel scheduler-border pb-2">
                                <h5 class="text-on-pannel text-primary">
                                    <strong class="text-uppercase">商標</strong>
                                </h5>
                                <div class="col mb-2" style="height: 200px;background-color: aqua;">

                                </div>
                                <div class="col offset-10 col-2 d-flex">
                                    <button type="button" class="btn btn-primary flex-fill">上傳商標</button>

                                    <!-- <a href="#" class="btn btn-primary flex-fill" type="button">選取</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 text-nowrap">
                        <div class="row ps-2 pe-3">
                            <div class="panel-body panel scheduler-border pb-2">
                                <h5 class="text-on-pannel text-primary">
                                    <strong class="text-uppercase">樣式</strong>
                                </h5>
                                <div class="row mb-4">
                                    <div class="col col-2 d-flex">
                                        <button type="button"
                                            class="style-set btn btn-primary flex-fill p-0"></button>
                                    </div>
                                    <div class="col col-2 d-flex">
                                        <button type="button"
                                            class="style-set btn btn-success flex-fill p-0"></button>
                                    </div>
                                    <div class="col col-2 d-flex">
                                        <button type="button"
                                            class="style-set btn btn-danger flex-fill p-0"></button>
                                    </div>
                                    <div class="col col-2 d-flex">
                                        <button type="button"
                                            class="style-set btn btn-warning flex-fill p-0"></button>
                                    </div>
                                    <div class="col col-2 d-flex">
                                        <button type="button"
                                            class="style-set btn btn-info flex-fill p-0"></button>
                                    </div>
                                    <div class="col col-2 d-flex">
                                        <button type="button"
                                            class="style-set btn btn-light flex-fill p-0"></button>
                                    </div>
                                </div>
                                <div class="panel-body panel scheduler-border pb-2 px-2">
                                    <h5 class="text-on-pannel text-primary">
                                        <strong class="text-uppercase">樣式預覽</strong>
                                    </h5>
                                    <div class="row">
                                        <div class="col-3 d-flex">
                                            <button class="btn btn-primary flex-fill">按鈕樣式</button>
                                        </div>
                                    </div>
                                    <div class="row mb-1">
                                        <div class="btn-group col-3 text-nowrap mt-3 mb-2" role="group"
                                            aria-label="Basic radio toggle button group">
                                            <input type="radio" class="btn-check" name="btnradio-style"
                                                id="btnradio-style1" autocomplete="off" checked>
                                            <label class="btn btn-outline-primary"
                                                for="btnradio-style1">按鈕樣式</label>
                                            <input type="radio" class="btn-check" name="btnradio-style"
                                                id="btnradio-style2" autocomplete="off">
                                            <label class="btn btn-outline-primary"
                                                for="btnradio-style2">按鈕樣式</label>
                                            <input type="radio" class="btn-check" name="btnradio-style"
                                                id="btnradio-style3" autocomplete="off">
                                            <label class="btn btn-outline-primary"
                                                for="btnradio-style3">按鈕樣式</label>
                                        </div>
                                    </div>
                                    <div class="row px-3 col-9">
                                        <table class="table table-hover table-primary data">
                                            <thead class="data">
                                                <tr class="data">
                                                    <th class="data">表格標題</th>
                                                    <th class="data">表格標題</th>
                                                    <th class="data">表格標題</th>
                                                </tr>
                                            </thead>
                                            <tbody class="data faq-body" style="height: 100px;">
                                                <tr class="data">
                                                    <td>表格內容</td>
                                                    <td>表格內容</td>
                                                    <td>表格內容</td>
                                                </tr>
                                                <tr class="data">
                                                    <td>表格內容</td>
                                                    <td>表格內容</td>
                                                    <td>表格內容</td>
                                                </tr>
                                                <tr class="data">
                                                    <td>表格內容</td>
                                                    <td>表格內容</td>
                                                    <td>表格內容</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row col-10 offset-1 pt-3">
                    <div class="offset-10 col-2 d-flex">
                        <button type="button" class="btn btn-primary flex-fill">上傳商標</button>
                    </div>
                </div>
            </div>

            <div id="seat-setting-div" class="container-fluid tab-pane fade">
                <div class="row col-10 offset-1 pt-3">
                    <div class="col-6 text-nowrap">
                        <div class="row px-2">
                            <div class="panel-body panel scheduler-border pb-2">
                                <h5 class="text-on-pannel text-primary">
                                    <strong class="text-uppercase">座位</strong>
                                </h5>
                                <div class="row mb-4 g-4 p-4">
                                    <div class="col col-3 d-flex">
                                        <button type="button" class="style-set btn btn-primary flex-fill p-0">
                                            <div class="flex-fill h-100 seat-btn">
                                                <span class="seat-num">桌號：<span>1</span></span>
                                                <span class="seat-people ">座位人數：<span>4</span></span>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col col-3 d-flex">
                                        <button type="button" class="style-set btn btn-primary flex-fill p-0">
                                            <div class="flex-fill h-100 seat-btn">
                                                <span class="seat-num">桌號：<span>1</span></span>
                                                <span class="seat-people ">座位人數：<span>4</span></span>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col col-3 d-flex">
                                        <button type="button" class="style-set btn btn-primary flex-fill p-0">
                                            <div class="flex-fill h-100 seat-btn">
                                                <span class="seat-num">桌號：<span>1</span></span>
                                                <span class="seat-people ">座位人數：<span>4</span></span>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col col-3 d-flex">
                                        <button type="button" class="style-set btn btn-primary flex-fill p-0">
                                            <div class="flex-fill h-100 seat-btn">
                                                <span class="seat-num">桌號：<span>1</span></span>
                                                <span class="seat-people ">座位人數：<span>4</span></span>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col col-3 d-flex">
                                        <button type="button" class="style-set btn btn-primary flex-fill p-0">
                                            <div class="flex-fill h-100 seat-btn">
                                                <span class="seat-num">桌號：<span>1</span></span>
                                                <span class="seat-people ">座位人數：<span>4</span></span>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col col-3 d-flex">
                                        <button type="button" class="style-set btn btn-primary flex-fill p-0">
                                            <div class="flex-fill h-100 seat-btn">
                                                <span class="seat-num">桌號：<span>1</span></span>
                                                <span class="seat-people ">座位人數：<span>4</span></span>
                                            </div>
                                        </button>
                                    </div>
                                    <div class="col col-3 d-flex">
                                        <button type="button" class="style-set btn btn-primary flex-fill p-0">
                                            <div class="flex-fill "
                                                style="font-size: 80px; vertical-align: middle;">+
                                            </div>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 text-nowrap">
                        <div class="row ps-2 pe-3 ">
                            <div class="panel-body panel scheduler-border pb-2 ">
                                <h5 class="text-on-pannel text-primary">
                                    <strong class="text-uppercase">座位設定</strong>
                                </h5>
                                <div class="row col-8 offset-2 mb-4 px-2 mt-3">
                                    <div class="panel-body panel scheduler-border pb-2">
                                        <h5 class="text-on-pannel text-primary">
                                            <strong class="text-uppercase">桌號</strong>
                                        </h5>
                                        <input class="form-control" type="text" />
                                    </div>
                                </div>
                                <div class="row col-8 offset-2 mb-4 px-2 mt-3">
                                    <div class="panel-body panel scheduler-border pb-2">
                                        <h5 class="text-on-pannel text-primary">
                                            <strong class="text-uppercase">座位人數</strong>
                                        </h5>
                                        <input class="form-control" type="text" />
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="offset-6 col-2 d-flex px-2">
                                        <button type="button" class="btn btn-primary flex-fill">移除</button>
                                    </div>
                                    <div class=" col-2 d-flex px-2 ">
                                        <button type="button" class="btn btn-primary flex-fill">確定</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- opening hour tab -->
            <div id="opening-setting-div" class="container-fluid tab-pane fade">
                <div class="row col-10 offset-1 pt-3">
                    <div class="col-4 text-nowrap">
                        <div class="row px-2">
                            <div class="panel-body panel scheduler-border pb-2">
                                <h5 class="text-on-pannel text-primary">
                                    <strong class="text-uppercase">營業時間</strong>
                                </h5>
                                <div class="row me-1">
                                    <div style="overflow-x: auto; width: 100%;">
                                        <div class="me-2">
                                            <table class="table table-hover table-primary data">
                                                <thead class="data">
                                                    <tr class="data">
                                                        <th class="checkbox-td">勾選</th>
                                                        <th class="table_Time">星期幾</th>
                                                        <th class="targetItem">營業時間</th>
                                                        <th class="data"></th>
                                                        <th class="data">刪除</th>
                                                        <th class="data">修改</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="faq-body data" id="openhour-tody">
                                                    <tr class="data">
                                                        <td class="checkbox-td data ">
                                                            <input class="form-check-input " type="checkbox"
                                                                value="option1" id="AAA">
                                                        </td>
                                                        <td class="data">星期一</td>
                                                        <td class="data">8:00</td>
                                                        <td class="data">13:00</td>
                                                        <td class="td-btn p-1">

                                                            <div class="d-flex">
                                                                <a class="btn btn-primary btn-sm flex-fill"
                                                                    type="button">刪除</a>
                                                            </div>
                                                        </td>
                                                        <td class="td-btn p-1">
                                                            <div class="d-flex td-btn">
                                                                <a class="btn btn-primary btn-sm flex-fill"
                                                                    type="button" data-bs-toggle="modal"
                                                                    data-bs-target="#tdItemModalDiv">修改</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row me-1">
                                    <div class="col-2 d-flex ps-2 pe-1">
                                        <a class="btn btn-primary btn-sm flex-fill" id="allCheck"
                                            type="button">全選</a>
                                        <a class="btn btn-primary btn-sm flex-fill" id="removeAllCheck"
                                            type="button" style="display: none;">清空</a>
                                    </div>
                                    <div class="offset-5 col-3 d-flex px-1">
                                        <a class="btn btn-primary btn-sm flex-fill" type="button">刪除選取</a>
                                    </div>
                                    <div class="col-2 d-flex px-1">
                                        <a class="btn btn-primary btn-sm flex-fill" type="button"
                                            data-bs-toggle="modal" data-bs-target="#tdItemModalDiv"
                                            id="openhour-addbtn">新增</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-8 text-nowrap">
                        <div class="row ps-2 pe-3 ">
                            <div class="panel-body panel scheduler-border pb-2 ">
                                <h5 class="text-on-pannel text-primary">
                                    <strong class="text-uppercase">特定休假</strong>
                                </h5>
                                <div class="accordion accordion-flush " id="accordionFlushExample">
                                    <div class="accordion-item ">
                                        <h2 class="accordion-header " id="flush-headingOne">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
                                                aria-expanded="false" aria-controls="flush-collapseOne">
                                                休假
                                            </button>
                                        </h2>
                                        <div id="flush-collapseOne" class="accordion-collapse collapse show"
                                            aria-labelledby="flush-headingOne"
                                            data-bs-parent="#accordionFlushExample">
                                            <div class="pe-1" style=" width: 100%;">
                                                <div class="me-2">
                                                    <table class="table table-hover table-primary data">
                                                        <thead class="data">
                                                            <tr class="data">
                                                                <th class="checkbox-td">勾選</th>
                                                                <th class="rest-day-td">日期</th>
                                                                <th class="rest-weekDay-td">星期幾</th>
                                                                <th class="rest-time-td">休假時間</th>
                                                                <th class="rest-time-td"></th>
                                                                <th class="data">說明</th>
                                                                <th class="rest-btn-td">刪除</th>
                                                                <th class="rest-btn-td">修改</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="faq-body data">
                                                            <tr class="data">
                                                                <td class="checkbox-td data ">
                                                                    <input class="form-check-input "
                                                                        type="checkbox" value="option1"
                                                                        id="AAA">
                                                                </td>
                                                                <td class="rest-day-td">2023-06-05</td>
                                                                <td class="rest-weekDay-td">星期一</td>
                                                                <td class="rest-time-td">8:00</td>
                                                                <td class="rest-time-td">13:00</td>
                                                                <td class="data">
                                                                    <p class="text-wrap">
                                                                        說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明
                                                                    </p>
                                                                </td>
                                                                <td class="rest-btn-td p-1">
                                                                    <div class="d-flex">
                                                                        <a class="btn btn-primary btn-sm flex-fill"
                                                                            type="button">刪除</a>
                                                                    </div>
                                                                </td>
                                                                <td class="rest-btn-td p-1">
                                                                    <div class="d-flex td-btn">
                                                                        <a class="btn btn-primary btn-sm flex-fill"
                                                                            type="button" data-bs-toggle="modal"
                                                                            data-bs-target="#tdItemModalDiv">修改</a>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row me-1">
                                        <div class="col-2 d-flex ps-2 pe-1">
                                            <a class="btn btn-primary btn-sm flex-fill" id="allCheck"
                                                type="button">全選</a>
                                            <a class="btn btn-primary btn-sm flex-fill" id="removeAllCheck"
                                                type="button" style="display: none;">清空</a>
                                        </div>
                                        <div class="offset-5 col-3 d-flex px-1">
                                            <a class="btn btn-primary btn-sm flex-fill" type="button">刪除選取</a>
                                        </div>
                                        <div class="col-2 d-flex px-1">
                                            <a id="addRestBtn" class="btn btn-primary btn-sm flex-fill"
                                                type="button" data-bs-toggle="modal"
                                                data-bs-target="#tdItemModalDiv">新增</a>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="flush-headingTwo">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
                                                aria-expanded="false" aria-controls="flush-collapseTwo">
                                                過去休假
                                            </button>
                                        </h2>
                                        <div id="flush-collapseTwo" class="accordion-collapse collapse"
                                            aria-labelledby="flush-headingTwo"
                                            data-bs-parent="#accordionFlushExample">
                                            <div class="pe-1" style=" width: 100%;">
                                                <div class="me-2">
                                                    <table class="table table-hover table-primary data">
                                                        <thead class="data">
                                                            <tr class="data">
                                                                <th class="rest-day-td">日期</th>
                                                                <th class="rest-weekDay-td">星期幾</th>
                                                                <th class="rest-time-td">休假時間</th>
                                                                <th class="rest-time-td"></th>
                                                                <th class="data">說明</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody class="faq-body data">
                                                            <tr class="data">
                                                                <td class="rest-day-td">2023-06-05</td>
                                                                <td class="rest-weekDay-td">星期一</td>
                                                                <td class="rest-time-td">8:00</td>
                                                                <td class="rest-time-td">13:00</td>
                                                                <td class="data text-wrap">
                                                                    說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明說明
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="tdItemModalDiv" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content px-3">
                    <div class="modal-header pb-1">
                        <h5 class="modal-title" id="modalTitle">新增特定休假</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body pt-3 pb-0">
                        <div class="row">
                            <div class="col-4 d-flex align-items-center">
                                <label class=" justify-content-center align-items-center">日期：</label>
                            </div>
                            <div class="col-5">
                                <input class="form-control" id="setdate" name="setdate" placeholder='yyyy-mm-dd'
                                    type="text" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4 d-flex align-items-center">
                                <label class=" justify-content-center align-items-center">星期：</label>
                            </div>
                            <div class="col-5">
                                <select class="form-select" aria-label="select day of week">
                                    <option selected hidden>選取星期</option>
                                    <option value="1">星期一</option>
                                    <option value="2">星期二</option>
                                    <option value="3">星期三</option>
                                    <option value="4">星期四</option>
                                    <option value="5">星期五</option>
                                    <option value="6">星期六</option>
                                    <option value="7">星期日</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4 d-flex align-items-center">
                                <label class=" justify-content-center align-items-center">開始時間：</label>
                            </div>
                            <div class="col-5">
                                <button class="form-select " type="button"
                                    id="dropdownMenuStartTimeBtn" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    選取時間
                                </button>
                                <ul class="dropdown-menu timepicker" aria-labelledby="dropdownMenuStartTimeBtn"
                                    id="start-time-ul">
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4 d-flex align-items-center">
                                <label class=" justify-content-center align-items-center">結束時間：</label>
                            </div>
                            <div class="col-5">
                                <button class="form-select " type="button"
                                    id="dropdownMenuEndTimeBtn" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    選取時間
                                </button>
                                <ul class="dropdown-menu timepicker" aria-labelledby="dropdownMenuEndTimeBtn"
                                    id="end-time-ul">
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4 d-flex align-items-center">
                                <label class=" justify-content-center align-items-center">說明：</label>
                            </div>
                            <div class="col-5">
                                <input class="form-control" type="text" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer px-0">
                        <div class="row flex-fill">
                            <button type="button" class="col col-md-3 btn btn-primary">清空</button>
                            <button type="button" class="col col-md-3 btn btn-primary offset-sm-6">確定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>

<script>
    var contextPath = "<%=request.getContextPath()%>";
</script>

<script type="text/javascript" src="<c:url value='/js/basicSettings/basicSettings.js'/>"></script>

</html>