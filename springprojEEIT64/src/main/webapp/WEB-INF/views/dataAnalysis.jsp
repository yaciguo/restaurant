<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=., initial-scale=1.0">
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

    <!-- chart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
</style>
<script>
</script>

<body>
    <div class="container-fluid">
        <div class="row pt-4">
            <div class="col-sm-3 offset-sm-1 text-nowrap  me-4">
                <h1>數據分析</h1>
            </div>
            <div class="col-sm-2 offset-sm-5 d-flex">
                <button type="button" class="btn btn-primary flex-fill btn-lg">輸出CSV檔案</button>
            </div>
        </div>
    </div>
    <hr>
    <div class="container-fluid">
        <div class="row g-2" style="height: 700px;">
            <div class="col offset-md-1 col-md-3 me-4">
                <div class="row g-2 panel scheduler-border">
                    <div class="col px-3 panel-body">
                        <h5 class="text-on-pannel text-primary"><strong class="text-uppercase"> 生成圖表 </strong></h5>
                        <div class="col">
                            <div class="row g-2 panel scheduler-border mb-2">
                                <div class="col px-3 panel-body">
                                    <h5 class="text-on-pannel text-primary"><strong class="text-uppercase"> 圖表模式
                                        </strong>
                                    </h5>
                                    <div id="data-style-div" class="d-flex mb-2" style="height: 120px;">
                                        <button id="bar-chart-btn" type="button" class="btn btn-primary flex-fill data-style-btn me-1 p-0"></button>
                                        <button id="line-chart-btn" type="button" class="btn btn-primary flex-fill data-style-btn me-1 p-0"></button>
                                        <button id="pie-chart-btn" type="button" class="btn btn-primary flex-fill data-style-btn p-0"></button>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2 panel scheduler-border mb-2">
                                <div class="col px-3 panel-body">
                                    <h5 class="text-on-pannel text-primary"><strong class="text-uppercase"> 時間範圍
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
                                        <div class="row text-nowrap mb-1">
                                            <div class="col">
                                                <label
                                                    class=" d-flex justify-content-center align-items-center">結束時間</label>
                                                <input class="form-control" id="startdate" name="startdate"
                                                    placeholder='yyyy-mm-dd' type="text" />
                                            </div>
                                            <div style="width:10%;font-size: large;">~</div>
                                            <div class="col">
                                                <label
                                                    class=" d-flex justify-content-center align-items-center">結束時間</label>
                                                <input class="form-control" id="enddate" name="enddate"
                                                    placeholder='yyyy-mm-dd' type="text" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2 panel scheduler-border mb-2">
                                <div class="col panel-body px-3">
                                    <h5 class="text-on-pannel text-primary"><strong class="text-uppercase"> 圖表內容
                                        </strong>
                                    </h5>
                                    <div class="row text-nowrap">
                                        <div class="mb-1 btn-label">數據內容：</div>
                                        <div class="col mb-1">
                                            <select class="form-select">
                                                <option value="1">銷售數量</option>
                                                <option value="2">銷售佔比</option>
                                                <option value="3">銷售額</option>
                                                <option value="4">利潤</option>
                                                <option value="5">訂單數</option>
                                                <option value="6">成本</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row text-nowrap mb-3">
                                        <div class="mb-1 btn-label">對比內容：</div>
                                        <div class="col">
                                            <select class="form-select">
                                                <option value="1">品項</option>
                                                <option value="2">產品</option>
                                                <option value="3">年</option>
                                                <option value="4">月</option>
                                                <option value="5">周</option>
                                                <option value="6">日</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row g-2 mb-2 panel scheduler-border">
                                        <div class="col panel-body">
                                            <h5 class="text-on-pannel text-primary">
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
                                <button type="button" class="btn btn-primary">生成圖表</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="ChartDiv" class="col col-md-7">
                <canvas id="myChart" height="784"></canvas>
            </div>
        </div>
    </div>


    <div id="compareItemsDiv" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content px-3">
                <div class="modal-header pb-1">
                    <h5 class="modal-title">選取對比項目</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div id="modal-dialog-body-div" class="modal-body pt-3 pb-0">
                        <div class="row mb-1">
                            <button type="button" class="col col-md-3 btn btn-primary">品項</button>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3 form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox1">項目A</label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox2">項目B </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox3">項目C </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox4">項目D </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox5">項目E </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox6">項目F </label>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <button type="button" class="col col-md-3 btn btn-primary">品項</button>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3 form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox1">項目A</label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox2">項目B </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox3">項目C </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox4">項目D </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox5">項目E </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox6">項目F </label>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <button type="button" class="col col-md-3 btn btn-primary">品項</button>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3 form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox1">項目A</label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox2">項目B </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox3">項目C </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox4">項目D </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox5">項目E </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox6">項目F </label>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <button type="button" class="col col-md-3 btn btn-primary">品項</button>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3 form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox1">項目A</label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox2">項目B </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox3">項目C </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox4">項目D </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox5">項目E </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox6">項目F </label>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <button type="button" class="col col-md-3 btn btn-primary">品項</button>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3 form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox1">項目A</label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox2">項目B </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox3">項目C </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox4">項目D </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox5">項目E </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox6">項目F </label>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <button type="button" class="col col-md-3 btn btn-primary">品項</button>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3 form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox1">項目A</label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox2">項目B </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox3">項目C </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox4">項目D </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox5">項目E </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox6">項目F </label>
                            </div>
                        </div>
                        <div class="row mb-1">
                            <button type="button" class="col col-md-3 btn btn-primary">品項</button>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-3 form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox1">項目A</label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox2">項目B </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox3">項目C </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox4">項目D </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox5">項目E </label>
                            </div>
                            <div class="col-md-3  form-check">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6"
                                    value="option3">
                                <label class="form-check-label" for="inlineCheckbox6">項目F </label>
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

<script type="text/javascript" src="<c:url value='/js/dataAnalysis/dataAnalysis.js'/>"></script>

</html>