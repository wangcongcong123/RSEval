<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.congcong.ucd.entities.TestCaseEntity" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Evaluating | CF | Recommender System</title>
    <meta name="generator" content="Bootply"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/fbicons/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/plugins/layui/css/layui.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/asserts/plugins/multiselect/dist/jquery.popSelect.css">
    <%--<script type="text/javascript" src="http://livejs.com/live.js"></script>--%>
</head>
<body style="background-color: #fefefe">


<!-- header -->
<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main">Evaluating CF RS</a>
        </div>
        <div class="navbar-collapse collapse">

            <ul class="nav navbar-nav navbar-right">


                <li class="dropdown"><a class="dropdown-toggle" role="button"
                                        data-toggle="dropdown" href="#"><i class="fa fa-gears"></i>
                    Options <span class="caret"></span></a>

                    <ul id="g-account-menu" class="dropdown-menu" role="menu">

                        <li><a id="pullfromserver" href="#pullmodal"
                               data-toggle="modal"><i class="fa fa-mail-reply-all"></i>
                            Pull from server</a></li>
                        <li class="divider"></li>

                        <li><a href="asaguest"><i class="fa fa-user-o"></i>
                            As a guest</a></li>

                        <li class="divider"></li>
                        <li><a id="adminpage" href=""><i class="fa fa-gear"></i>
                            Admin settings</a></li>

                    </ul>
                </li>
            </ul>

        </div>
    </div>
    <!-- /container -->
</div>
<!-- /Header -->

<!-- Main -->
<div class="container-fluid">

    <c:choose>

    <c:when test="${not empty sessionMsg}">
    <p>${sessionMsg}</p>
    <br>
    </c:when>

    </c:choose>


    <div class="row">
        <div class="col-sm-2">
            <!-- left column -->
            <a href="#"><strong><i class="fa fa-wrench"></i>
                Control Panel</strong></a>
            <hr>

            <ul class="nav nav-stacked">
                <li class="nav-header"><a data-toggle="collapse"
                                          data-target="#menu1"> Navigation <i
                        class="fa fa-chevron-down nav-header-label"></i></a>
                    <ul class="nav nav-stacked collapse in" id="menu1">

                        <c:choose>

                            <c:when test="${not empty testcases}">


                                <c:forEach items="${testcases}" var="testcase">


                                    <li class="${testcase.testCaseCode} testcase-nav"><a
                                            href="#${testcase.testCaseCode}">${testcase.testCaseCode}</a></li>

                                </c:forEach>


                            </c:when>

                            <c:otherwise>
                                <li class="default testcase-nav"><a href="#default">default</a></li>
                            </c:otherwise>

                        </c:choose>

                    </ul>


                </li>


                <li class="nav-header"><a data-toggle="collapse"
                                          data-target="#menu2"> Test Selector <i
                        class="fa fa-chevron-down nav-header-label"></i></a>

                    <ul class="nav nav-stacked collapse in" id="menu2">


                        <c:choose>
                            <c:when test="${not empty testcases}">

                                <c:forEach items="${testcases}" var="testcase">

                                    <li class="${testcase.testCaseCode} testcase-checkbox">
                                        <a>
                                            <div class="checkbox"><label><input type="checkbox">${testcase.testCaseCode}
                                            </label></div>
                                        </a>
                                    </li>

                                </c:forEach>


                            </c:when>

                            <c:otherwise>
                                <li class="default testcase-checkbox">
                                    <a>
                                        <div class="checkbox"><label><input type="checkbox">default</label></div>
                                    </a>

                                </li>
                            </c:otherwise>

                        </c:choose>


                    </ul>
                </li>

                <li class="nav-header"><a data-toggle="collapse"
                                          data-target="#menu3">Settings <i
                        class="fa fa-chevron-down nav-header-label"></i></a>
                    <ul class="nav nav-stacked collapse in" id="menu3">

                        <li><a id="compare-contrast"><i class="fa fa-eye"></i>Compare &amp;Contrast</a></li>


                        <%--<li><a href="#"><i class="fa fa-save"></i> Save</a></li>--%>
                        <%--<li><a id="simulate-contrast"><i class="fa fa-area-chart"></i> Simulate</a></li>--%>

                    </ul>
                </li>

                <li class="nav-header"><a data-toggle="collapse"
                                          data-target="#menu4"> Other <i
                        class="fa fa-chevron-right nav-header-label"></i></a>
                    <ul class="nav nav-stacked collapse" id="menu4">
                        <li><a href=""><i class="fa fa-circle-o"></i> reserved 1</a></li>
                        <li><a href=""><i class="fa fa-circle-o"></i> reserved 2</a></li>
                    </ul>
                </li>

            </ul>

            <hr>

            <a href="" class="click-me-hide"><strong><i class="fa fa-link"></i>
                Resources</strong></a>
            <hr>
        </div>


        <!-- /col-3 -->
        <div class="col-sm-10">
            <!-- column 2 -->
            <ul class="list-inline pull-right">

                <li><a title="Add a test case" class="btn btn-primary btn-sm"
                       data-toggle="modal" href="#addWidgetModal"> <i
                        class="fa fa-plus"></i> Add
                </a> <a class="btn btn-success btn-sm" id="import"> <i
                        class="fa fa-sign-in"></i> Import
                </a> <input type="file" style="display: none" name="importfile">
                </li>
            </ul>

            <br> <a href="#"><strong><i class="fa fa-tags"></i>Testbed</strong></a>

            <hr>

            <div id="topline"></div>
            <!--test case html panel-->

            <c:choose>

            <c:when test="${not empty testcases}">
            <c:forEach items="${testcases}" var="testcase">


            <div class="box box-success" id="${testcase.testCaseCode}">

                <div class="box-header with-border">

                    <h3 class="box-title testcase-title">${testcase.testCaseCode}</h3>

                    <div class="box-tools pull-right">

                        <div class="btn-group">
                            <button type="button" class="btn btn-box-tool dropdown-toggle"
                                    data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-wrench"></i>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#"><i class="fa fa-eye"></i> Comtrast
                                    &amp; Compare</a></li>
                                <li><a href="#"><i class="fa fa-repeat"></i> Reset</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-save"></i> Sava</a></li>
                            </ul>
                        </div>


                        <!--<i class="fa fa-refresh fa-spin"></i>-->
                        <button type="button" class="btn btn-box-tool collapseBtn"
                                data-toggle="tooltip" title="" data-original-title="Collapse">
                            <i class="fa fa-minus"></i>
                        </button>


                        <button type="button" class="btn btn-box-tool removeBtn"
                                data-toggle="tooltip" title="" data-original-title="Remove">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>

                </div>

                <div class="box-body" style="">
                    <!--configure row-->
                    <div class="row">
                        <div class="col-md-12 configure-panel">
                            <!--Choose Algorithm and Example file input-->
                            <div class="box no-header no-border">

                                <div class="box-body">
                                    <div class="form-group">
                                        <label>Choose Algorithm</label>
                                        <div class="radio">
                                            <label> <input type="radio" name="algmethod"
                                                           class="algmethod1" value="User-based"
                                                           ng-model="algmethod">
                                                User-based CF
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label> <input type="radio" name="algmethod"
                                                           class="algmethod2" value="Item-based"
                                                           ng-model="algmethod">
                                                Item-based CF
                                            </label>
                                        </div>
                                        <div class="radio">
                                            <label> <input type="radio" name="algmethod"
                                                           class="algmethod3" value="Matrix-Factorisation"
                                                           ng-model="algmethod">Matrix-Factorisation CF
                                                <%--(Biased--%>
                                                <%--MF is--%>
                                                <%--used here)--%>
                                            </label>
                                        </div>

                                        <%--<div class="radio text-red">--%>
                                            <%--<label> <input type="radio" name="algmethod"--%>
                                                           <%--class="algmethod4" value="Hybrid"--%>
                                                           <%--ng-model="algmethod">Hybrid (click <a--%>
                                                    <%--href="http://www.pnas.org/content/pnas/107/10/4511.full.pdf"--%>
                                                    <%--class="text-green">here</a> know more--%>
                                                <%--used here)--%>
                                            <%--</label>--%>
                                        <%--</div>--%>

                                    </div>
                                    <%
                                        TestCaseEntity obj0 = (TestCaseEntity) pageContext.getAttribute("testcase");
                                        String configTC = obj0.getConfig();
                                        String output="";
                                        if(configTC!=null){
                                            ObjectMapper mapper0 = new ObjectMapper();
                                            Map<String, Object> map0 = mapper0.readValue(configTC, Map.class);
                                            output=(String)map0.get("algmethod");
                                        }
                                    %>
                                    Algorithm selected:<label style="color: tomato" class="algmethod"><%out.print(output);%></label>
                                    <br><br>

                                    <%--<div class="form-group">--%>
                                        <%--<label>Default Dataset: </label> <a--%>
                                            <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_1.txt">ratings_1--%>
                                    <%--</a> <a--%>
                                            <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_2.txt">ratings_2--%>
                                    <%--</a> <a--%>
                                            <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_3.txt">ratings_3--%>
                                    <%--</a> <a--%>
                                            <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_0.txt">ratings_4--%>
                                    <%--</a>--%>
                                    <%--</div>--%>

                                    <div class="form-group">

                                        <label> Upload Dataset <a
                                                class="dataset-format text-green">See Format</a></label> <input
                                            type="checkbox" class="dataset-type" style="display: none"> <input
                                            type="file" class="form-control-file dataset-file">
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-5">
                                            <label>Evaluation Methodology: </label>
                                            <select class="form-control evaluation-method">
                                                <option selected name="evalmethod" value="ratio">Random
                                                    Sub-Sampling
                                                </option>
                                                <option name="evalmethod" value="loocv">Leave-one-out</option>
                                                <option name="evalmethod" value="kcv">K-Fold Cross-Validation
                                                </option>
                                            </select>
                                        </div>


                                    </div>

                                    <div class="form-group row ratio-extra-config">

                                        <div class="col-md-6 ratio-extra-config-input">
                                            <label>Trainset ratio: </label>
                                            <input type="number" class="form-control trainset-ratio"
                                                   placeholder="0.8 by default">
                                        </div>

                                    </div>


                                    <div class="form-group row loocv-extra-config" style="display: none">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Choose leave target: </label>
                                                <select class="form-control leave-target">
                                                    <option selected value="user">User</option>
                                                    <option value="item">Item</option>
                                                </select>

                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group row kcv-extra-config" style="display: none">
                                        <div class="col-md-7">
                                            <div class="form-group">
                                                <label>K of cross validation: </label>
                                                <input type="number" class="form-control k-kcv"
                                                       placeholder="5 by default">
                                            </div>
                                        </div>
                                    </div>


                                    <hr>


                                        <%--Similarity Computation:--%>
                                    <div class="extra-config" style="display: none">
                                        <div class="control-group row">
                                            <div class="col-md-4">
                                                <label>Similarity Computation: </label>
                                                <select class="form-control similarity-method">
                                                    <option>BinaryCosineSimilarity</option>
                                                    <option>CosineSimilarity</option>
                                                    <option selected>PCCSimilarity</option>
                                                        <%--//new added--%>
                                                    <option class="text-red">SWPCCSimilarity</option>
                                                    <option class="text-red">DVCosineSimilarity</option>
                                                    <option class="text-red">CACosineSimilarity</option>
                                                    <option class="text-red">IUFCosineSimilarity</option>
                                                        <%--//new added--%>
                                                    <option>CPCSimilarity</option>
                                                    <option>DiceCoefficientSimilarity</option>
                                                    <option>ExJaccardSimilarity</option>
                                                    <option>KRCCSimilarity</option>
                                                    <option>MSDSimilarity</option>
                                                    <option>MSESimilarity</option>
                                                </select>
                                            </div>

                                            <div class="col-md-4">
                                                <label>Number of Neighborhood: </label>
                                                <div class="col-sm-8">
                                                    <input type="number"
                                                           class="form-control number-neighborhood"
                                                           placeholder="50 by default">
                                                </div>
                                            </div>


                                            <div class="col-md-4">
                                                <label>N of top N if ranking: </label>
                                                <div class="col-sm-8">
                                                    <input type="number" class="form-control number-n"
                                                           placeholder="10 by default">
                                                </div>
                                            </div>

                                        </div>
                                        <hr>

                                    </div>

                                    <div class="mf-extra-config" style="display: none">
                                        <div class="control-group row">
                                            <div class="col-md-3">
                                                <label>Learn Rate: </label>
                                                <input type="number" class="form-control learn-rate"
                                                       placeholder="0.01 by default">
                                            </div>

                                            <div class="col-md-3">
                                                <label>Maximum Iterator Number : </label>
                                                <input type="number"
                                                       class="form-control maximum-iterator-number"
                                                       placeholder="10 by default">
                                            </div>

                                            <div class="col-md-3">
                                                <label>Factor Number: </label>
                                                <input type="number" class="form-control factor-number"
                                                       placeholder="10 by default">
                                            </div>

                                            <div class="col-md-3"><br>
                                                <input type="checkbox" class="bold-driver"><label> launch bold
                                                    driver? </label>
                                            </div>

                                        </div>

                                        <hr>

                                        <div class="control-group row">
                                            <div class="col-md-3">
                                                <label>User Regularization: </label>
                                                <input type="number" class="form-control user-regularization"
                                                       placeholder="0.01 by default">
                                            </div>

                                            <div class="col-md-3">
                                                <label>Item Regularization: </label>
                                                <input type="number" class="form-control item-regularization"
                                                       placeholder="0.01 by default">
                                            </div>

                                            <div class="col-md-3">
                                                <label>Bias: </label>
                                                <input type="number" class="form-control bias-regularization"
                                                       placeholder="0.01 by default">
                                            </div>

                                            <div class="col-md-3">
                                                <label>n of top N if ranking: </label>
                                                <input type="number" class="form-control number-n"
                                                       placeholder="10 by default">
                                            </div>
                                        </div>
                                        <hr>
                                    </div>

                                    <br>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Prediction accuracy metrics</label>
                                                <select class="myselect form-control prediction-metrics"
                                                        multiple>
                                                    <option value="mae" selected="selected">MAE</option>
                                                    <option value="mse" selected>MSE</option>
                                                    <option value="rmse">RMSE</option>
                                                    <%--<option value="mpe" selected>MPE</option>--%>
                                                    <option value="simplecov">SimpleCoverage</option>
                                                    <option value="itemcov">ItemCoverage</option>

                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Recommendation metrics</label>

                                                <select class="myselect form-control recommendation-metrics"
                                                        multiple>
                                                    <option value="precision">Precison</option>
                                                    <option value="recall">recall</option>
                                                    <option value="f1" selected>f1</option>

                                                    <option value="ndcg" selected>NDCG</option>
                                                    <option value="auc" selected>AUC</option>

                                                        <%--<option value="relevance" selected>Relevance</option>--%>
                                                    <option value="novelty" selected>Novelty</option>

                                                    <option value="simplecov">SimpleCoverage</option>
                                                    <option value="reccov" selected>RecCoverage</option>
                                                    <option value="itemcov">ItemCoverage</option>
                                                    <option value="entropy">Entropy</option>


                                                    <option value="popularity" selected>Popularity</option>
                                                    <option value="diversity" selected>Diversity</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Evaluation</label>
                                        <br>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-5 col-md-offset-1">

                                                <button class="btn btn-block btn-info rating">
                                                    Rating<i class="fa fa-chevron-right"></i>
                                                </button>

                                            </div>
                                            <div class="col-md-5">

                                                <button class="btn btn-block btn-info ranking">
                                                    Ranking <i class="fa fa-chevron-right"></i>
                                                </button>

                                            </div>
                                            <div class="col-md-1"></div>
                                        </div>

                                        <br>

                                        <div class="configuration-info">
                                            <h4 style="font-weight: bold;">Result for Configuration:</h4>
                                            Rating: <p class="text-red rating-configuration"
                                               style="word-wrap: break-word;">${testcase.config}</p>
                                            Ranking: <p class="text-yellow ranking-configuration"
                                               style="word-wrap: break-word;">${testcase.config}</p>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--rating and ranking result panel-->

                    <div class="row">


                        <c:choose>
                        <c:when test='${testcase.ratingMetric!=null && !ratingMetrics.equals("")}'>
                        <div class="col-md-6 rating-panel">
                            </c:when>
                            <c:otherwise>
                            <div style="display: none" class="col-md-6 rating-panel">
                                </c:otherwise>

                                </c:choose>

                                    <%--<div style="display: none" class="col-md-6 rating-panel">--%>

                                <div class="row text-center wait-label" style="display: none">
                                    <i class="fa fa-refresh fa-spin fa-5x"> </i>
                                </div>

                                <label class="testcase-title-sub" style="display: none;">${testcase.testCaseCode}</label>
                                <br>
                                <c:choose>
                                <c:when test='${testcase.ratingMetric!=null && !ratingMetrics.equals("")}'>
                                <div class="box box-solid box-primary rating-result">

                                    </c:when>
                                    <c:otherwise>
                                    <div style="display: none" class="box box-solid box-primary rating-result">
                                        </c:otherwise>
                                        </c:choose>
                                            <%--<div style="display: none" class="box box-solid box-primary rating-result">--%>

                                        <div class="nav-tabs-custom">

                                            <ul class="nav nav-tabs">
                                                <li class="tab1 my-tab active"><a href="" data-toggle="tab"
                                                                                  aria-expanded="true">Report
                                                    Summary</a></li>

                                                <li class="tab2 my-tab"><a href="" data-toggle="tab"
                                                                           aria-expanded="false">Runtime
                                                    Log</a>
                                                </li>

                                                <li class="tab3 my-tab"><a href="" data-toggle="tab"
                                                                           aria-expanded="false">Execution
                                                    Result</a>
                                                </li>

                                                <li class="pull-right">
                                                    <button type="button"
                                                            class="btn btn-box-tool dropdown-toggle"
                                                            data-toggle="dropdown" aria-expanded="true">
                                                        <i class="fa fa-wrench"></i>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><i class="fa fa-save"></i> Export</a></li>
                                                    </ul>
                                                </li>
                                            </ul>

                                            <div class="tab-content">

                                                <div class="tab-pane active tab1-content">
                                                    <div class="box no-border">
                                                        <div class="box-header">
                                                            <h3 class="box-title">Prediction Accuracy metrics</h3>
                                                            <div class="box-tools">
                                                                <div class="input-group input-group-sm pull-right">
                                                                    <button type="button"
                                                                            class="btn btn-box-tool dropdown-toggle"
                                                                            data-toggle="dropdown" aria-expanded="true">
                                                                        <i class="fa fa-wrench"></i>
                                                                    </button>

                                                                    <ul class="dropdown-menu" role="menu">
                                                                        <li><a href="#"><i class="fa fa-save"></i> Sava</a>
                                                                        </li>
                                                                    </ul>

                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="box-body table-responsive no-padding">

                                                            <table class="table table-hover">

                                                                <thead>
                                                                <tr>
                                                                    <th>Matrics</th>
                                                                    <th>Score</th>
                                                                    <th>More Options</th>
                                                                </tr>
                                                                </thead>

                                                                <tbody class="prediction-metrics-table">
                                                                <%
                                                                    TestCaseEntity obj = (TestCaseEntity) pageContext.getAttribute("testcase");

                                                                    String ratingMetrics = obj.getRatingMetric();

                                                                    if (ratingMetrics != null && !ratingMetrics.equals("")) {
                                                                        ObjectMapper mapper = new ObjectMapper();
                                                                        Map<String, Object> map = mapper.readValue(ratingMetrics, Map.class);
                                                                        Set<Entry<String, Object>> set = map.entrySet();
                                                                        for (Entry<String, Object> entry : set) {
                                                                            out.println("<tr>" +
                                                                                    "                                    " +
                                                                                    "                                                                                              <td class=\"text-red\"><input type=\"checkbox\"" +
                                                                                    "                                                                                                                            class=\"metric-checkbox\">" +
                                                                                    "                                                                                                   " + entry.getKey() + " <a class=\"fa fa-question-circle-o\"" +
                                                                                    "                                                                                                          data-toggle=\"popover\"" +
                                                                                    "                                                                                                         title=\"Mean Absolute Error\"" +
                                                                                    "                                                                                                          data-content=\"<a href=\\'https://en.wikipedia.org/wiki/Mean_absolute_error\\'>Check details</a>\"></a>" +
                                                                                    "                                                                                               </td>" +
                                                                                    "                                                                                              <td class=\"" + entry.getKey().toLowerCase() + "-score text-red\">" + entry.getValue() + "</td>" +
                                                                                    "                                                                                              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a" +
                                                                                    "                                                                                                       class=\"fa fa-trash-o metric-trash\"" +
                                                                                    "                                                                                                       data-toggle=\"tooltip\"" +
                                                                                    "                                                                                                       data-placement=\"top\" title=\"delete\"></a>&nbsp;&nbsp;&nbsp;<a" +
                                                                                    "                                                                                                       class=\"fa fa-search metric-visualise\"" +
                                                                                    "                                                                                                    data-toggle=\"tooltip\"" +
                                                                                    "                                                                                                     data-placement=\"top\" title=\"visualise\"></a></td>" +
                                                                                    "                                    " +
                                                                                    "                                                                                            </tr>");

                                                                        }
                                                                    }
                                                                %>

                                                                </tbody>


                                                            </table>
                                                        </div>

                                                    </div>


                                                </div>

                                                <div class="tab-pane tab2-content">

                                                    <div class="form-group">
                                                        <div class="pull-right">
                                                            <a href="${testcase.logPath}" class="runtime-log-path">
                                                                <i class="fa fa-cloud-download"></i>
                                                            </a>
                                                        </div>
                                                        <textarea class="form-control runtime-log" rows="10"
                                                                  value=""></textarea>
                                                    </div>

                                                </div>

                                                <div class="tab-pane tab3-content">
                                                    <div style="margin-top: 150px">
                                                        <a class="btn btn-block btn-success runtime-result-path" href="${testcase.resultPath}">
                                                            <i class="fa fa-cloud-download"></i> Get Result
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                                <c:choose>
                                <c:when test='${testcase.rankingMetric!=null && !rankingMetrics.equals("")}'>
                                <div class="col-md-6 ranking-panel">
                                    </c:when>
                                    <c:otherwise>
                                    <div style="display: none" class="col-md-6 ranking-panel">
                                        </c:otherwise>
                                        </c:choose>

                                        <!--/ ranking panel-->
                                            <%--<div style="display: none" class="col-md-6 ranking-panel">--%>

                                        <div class="row text-center wait-label" style="display: none">
                                            <i class="fa fa-refresh fa-spin fa-5x"></i>
                                        </div>

                                        <label class="testcase-title-sub" style="display: none;">${testcase.testCaseCode}</label>

                                        <br>

                                        <c:choose>
                                        <c:when test='${testcase.rankingMetric!=null && !rankingMetrics.equals("")}'>
                                        <div class="panel panel-primary ranking-result">
                                            </c:when>
                                            <c:otherwise>
                                            <div style="display: none" class="panel panel-primary ranking-result">
                                                </c:otherwise>
                                                </c:choose>

                                                    <%--<div style="display: none" class="panel panel-primary ranking-result">--%>

                                                <div class="nav-tabs-custom">

                                                    <ul class="nav nav-tabs">
                                                        <li class="tab1 my-tab active"><a href="" data-toggle="tab"
                                                                                          aria-expanded="true">Report
                                                            Summary</a></li>

                                                        <li class="tab2 my-tab"><a href="" data-toggle="tab"
                                                                                   aria-expanded="false">Runtime
                                                            Log</a>
                                                        </li>

                                                        <li class="tab3 my-tab"><a href="" data-toggle="tab"
                                                                                   aria-expanded="false">Execution
                                                            Result</a>
                                                        </li>

                                                        <li class="pull-right">
                                                            <button type="button"
                                                                    class="btn btn-box-tool dropdown-toggle"
                                                                    data-toggle="dropdown" aria-expanded="true">
                                                                <i class="fa fa-wrench"></i>
                                                            </button>
                                                            <ul class="dropdown-menu" role="menu">
                                                                <li><a href="#"><i class="fa fa-save"></i> Export</a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>

                                                    <div class="tab-content">

                                                        <div class="tab-pane active tab1-content">
                                                            <!--Ranking Accuracy metrics-->

                                                            <div class="panel-body">
                                                                <!--Decison-support Metrics-->
                                                                <div class="box no-border">
                                                                    <div class="box-header">
                                                                        <h3 class="box-title">Recommendation
                                                                            Metrics</h3>
                                                                        <div class="box-tools">
                                                                            <div class="input-group input-group-sm"
                                                                                 style="width: 150px;">
                                                                                <button type="button"
                                                                                        class="btn btn-box-tool dropdown-toggle"
                                                                                        data-toggle="dropdown"
                                                                                        aria-expanded="true">
                                                                                    <i class="fa fa-wrench"></i>
                                                                                </button>

                                                                                <ul class="dropdown-menu" role="menu">
                                                                                    <li><a href="#"><i
                                                                                            class="fa fa-save"></i>
                                                                                        Sava</a>
                                                                                    </li>
                                                                                </ul>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="box-body table-responsive no-padding">
                                                                        <table class="table table-hover">

                                                                            <thead>
                                                                            <tr>
                                                                                <th>Matrics</th>
                                                                                <th>Score</th>
                                                                                <th>More Options</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody class="recommendation-metrics-table">
                                                                            <%
                                                                                TestCaseEntity obj2 = (TestCaseEntity) pageContext.getAttribute("testcase");
                                                                                String rankingMetrics = obj2.getRankingMetric();
                                                                                if (rankingMetrics != null && !rankingMetrics.equals("")) {
                                                                                    ObjectMapper mapper2 = new ObjectMapper();
                                                                                    Map<String, Object> map2 = mapper2.readValue(rankingMetrics, Map.class);
                                                                                    Set<Entry<String, Object>> set2 = map2.entrySet();
                                                                                    for (Entry<String, Object> entry : set2) {
                                                                                        out.println("<tr>" +
                                                                                                "                                    " +
                                                                                                "                                                                                              <td class=\"text-red\"><input type=\"checkbox\"" +
                                                                                                "                                                                                                                            class=\"metric-checkbox\">" +
                                                                                                "                                                                                                   " + entry.getKey() + " <a class=\"fa fa-question-circle-o\"" +
                                                                                                "                                                                                                          data-toggle=\"popover\"" +
                                                                                                "                                                                                                        " +
                                                                                                "                                                                                                          ></a>" +
                                                                                                "                                                                                               </td>" +
                                                                                                "                                                                                              <td class=\"" + entry.getKey().toLowerCase() + "-score text-red\">" + entry.getValue() + "</td>" +
                                                                                                "                                                                                              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a" +
                                                                                                "                                                                                                       class=\"fa fa-trash-o metric-trash\"" +
                                                                                                "                                                                                                       data-toggle=\"tooltip\"" +
                                                                                                "                                                                                                       data-placement=\"top\" title=\"delete\"></a>&nbsp;&nbsp;&nbsp;<a" +
                                                                                                "                                                                                                       class=\"fa fa-search metric-visualise-r\"" +
                                                                                                "                                                                                                    data-toggle=\"tooltip\"" +
                                                                                                "                                                                                                     data-placement=\"top\" title=\"visualise\"></a></td>" +
                                                                                                "                                    " +
                                                                                                "                                                                                            </tr>");
                                                                                    }
                                                                                }
                                                                            %>
                                                                            </tbody>

                                                                            <tfoot>


                                                                            </tfoot>
                                                                        </table>
                                                                    </div>
                                                                    <!-- /.box-body -->
                                                                </div>

                                                                <!--beyond accuracy metrics-->
                                                                <div class="box no-border">

                                                                    <div class="box-header">

                                                                    </div>

                                                                    <!-- /.box-header -->
                                                                    <div class="box-body table-responsive no-padding">


                                                                    </div>
                                                                    <!-- /.box-body -->
                                                                </div>


                                                            </div>


                                                        </div>

                                                        <div class="tab-pane tab2-content">

                                                            <div class="form-group">
                                                                <div class="pull-right">
                                                                    <a href="${testcase.logPathRanking}" class="runtime-log-path">
                                                                        <i class="fa fa-cloud-download"></i>
                                                                    </a>
                                                                </div>
                                                                <textarea class="form-control runtime-log" rows="10"
                                                                          value="this is runtiome log"></textarea>
                                                            </div>

                                                        </div>

                                                        <div class="tab-pane tab3-content">
                                                            <div style="margin-top: 150px">
                                                                <a class="btn btn-block btn-success runtime-result-path" href="${testcase.resultPathRanking}">
                                                                    <i class="fa fa-cloud-download"></i> Get Result
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <!--/panel-body-->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- comparison panel-->
                                    <div class="row comparison-selection">

                                        <div class="col-md-8 comparison-selection-label">
                                            <p>

                                            </p>
                                        </div>

                                        <div class="col-ml-4 comparison-selection-visualize">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                class="btn btn-default fa fa-area-chart"> Visualize</a>
                                        </div>

                                    </div>

                                </div>


                                <div class="box-footer" style="">
                                    <div>
                                        <a class="btn btn-default btn-block btn-sm" data-toggle="modal"
                                           href="#addWidgetModal"> <i class="fa fa-plus"></i> Add
                                        </a>
                                    </div>
                                </div>
                                <!-- /.box-footer-->
                            </div>


                                <%----%>

                            </c:forEach>

                            </c:when>

                            <c:otherwise>
                                <div class="box box-success" id="default">

                                    <div class="box-header with-border">

                                        <h3 class="box-title testcase-title">default</h3>

                                        <div class="box-tools pull-right">

                                            <div class="btn-group">
                                                <button type="button" class="btn btn-box-tool dropdown-toggle"
                                                        data-toggle="dropdown" aria-expanded="true">
                                                    <i class="fa fa-wrench"></i>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#"><i class="fa fa-eye"></i> Comtrast
                                                        &amp; Compare</a></li>
                                                    <li><a href="#"><i class="fa fa-repeat"></i> Reset</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="#"><i class="fa fa-save"></i> Sava</a></li>
                                                </ul>
                                            </div>


                                            <!--<i class="fa fa-refresh fa-spin"></i>-->
                                            <button type="button" class="btn btn-box-tool collapseBtn"
                                                    data-toggle="tooltip" title="" data-original-title="Collapse">
                                                <i class="fa fa-minus"></i>
                                            </button>


                                            <button type="button" class="btn btn-box-tool removeBtn"
                                                    data-toggle="tooltip" title="" data-original-title="Remove">
                                                <i class="fa fa-times"></i>
                                            </button>
                                        </div>

                                    </div>

                                    <div class="box-body" style="">
                                        <!--configure row-->
                                        <div class="row">
                                            <div class="col-md-12 configure-panel">
                                                <!--Choose Algorithm and Example file input-->
                                                <div class="box no-header no-border">

                                                    <div class="box-body">
                                                        <div class="form-group">
                                                            <label>Choose Algorithm</label>
                                                            <div class="radio">
                                                                <label> <input type="radio" name="algmethod"
                                                                               class="algmethod1" value="User-based"
                                                                               ng-model="algmethod">
                                                                    User-based CF
                                                                </label>
                                                            </div>
                                                            <div class="radio">
                                                                <label> <input type="radio" name="algmethod"
                                                                               class="algmethod2" value="Item-based"
                                                                               ng-model="algmethod">
                                                                    Item-based CF
                                                                </label>
                                                            </div>
                                                            <div class="radio">
                                                                <label> <input type="radio" name="algmethod"
                                                                               class="algmethod3"
                                                                               value="Matrix-Factorisation"
                                                                               ng-model="algmethod">Matrix-Factorisation CF
                                                                    <%--(Biased--%>
                                                                    <%--MF is--%>
                                                                    <%--used here)--%>
                                                                </label>
                                                            </div>

                                                            <%--<div class="radio text-red">--%>
                                                                <%--<label> <input type="radio" name="algmethod"--%>
                                                                               <%--class="algmethod4" value="Hybrid"--%>
                                                                               <%--ng-model="algmethod">Hybrid (click <a--%>
                                                                        <%--href="http://www.pnas.org/content/pnas/107/10/4511.full.pdf"--%>
                                                                        <%--class="text-green">here</a> know more--%>
                                                                    <%--used here)--%>
                                                                <%--</label>--%>
                                                            <%--</div>--%>

                                                        </div>

                                                        Algorithm selected:<label style="color: tomato"
                                                                                  class="algmethod"></label>
                                                        <br><br>

                                                        <%--<div class="form-group">--%>
                                                            <%--<label>Default Dataset: </label> <a--%>
                                                                <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_1.txt">ratings_1--%>
                                                        <%--</a> <a--%>
                                                                <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_2.txt">ratings_2--%>
                                                        <%--</a> <a--%>
                                                                <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_3.txt">ratings_3--%>
                                                        <%--</a> <a--%>
                                                                <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_0.txt">ratings_4--%>
                                                        <%--</a>--%>
                                                        <%--</div>--%>

                                                        <div class="form-group">

                                                            <label> Upload Dataset <a
                                                                    class="dataset-format text-green">See
                                                                Format</a></label>
                                                            <input
                                                                    type="checkbox" class="dataset-type" style="display: none">
                                                            <input
                                                                    type="file" class="form-control-file dataset-file">

                                                        </div>

                                                        <div class="form-group row">
                                                            <div class="col-md-5">
                                                                <label>Evaluation Methodology: </label>
                                                                <select class="form-control evaluation-method">
                                                                    <option selected name="evalmethod" value="ratio">
                                                                        Random
                                                                        Sub-Sampling
                                                                    </option>
                                                                    <option name="evalmethod" value="loocv">
                                                                        Leave-one-out
                                                                    </option>
                                                                    <option name="evalmethod" value="kcv">K-Fold
                                                                        Cross-Validation
                                                                    </option>
                                                                </select>
                                                            </div>


                                                        </div>

                                                        <div class="form-group row ratio-extra-config">

                                                            <div class="col-md-6 ratio-extra-config-input">
                                                                <label>Trainset ratio: </label>
                                                                <input type="number" class="form-control trainset-ratio"
                                                                       placeholder="0.8 by default">
                                                            </div>

                                                        </div>


                                                        <div class="form-group row loocv-extra-config"
                                                             style="display: none">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Choose leave target: </label>
                                                                    <select class="form-control leave-target">
                                                                        <option selected value="user">User</option>
                                                                        <option value="item">Item</option>
                                                                    </select>

                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="form-group row kcv-extra-config"
                                                             style="display: none">
                                                            <div class="col-md-7">
                                                                <div class="form-group">
                                                                    <label>K of cross validation: </label>
                                                                    <input type="number" class="form-control k-kcv"
                                                                           placeholder="5 by default">
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <hr>


                                                            <%--Similarity Computation:--%>
                                                        <div class="extra-config" style="display: none">
                                                            <div class="control-group row">
                                                                <div class="col-md-4">
                                                                    <label>Similarity Computation: </label>
                                                                    <select class="form-control similarity-method">
                                                                        <option>BinaryCosineSimilarity</option>
                                                                        <option>CosineSimilarity</option>
                                                                        <option selected>PCCSimilarity</option>
                                                                            <%--//new added--%>
                                                                        <option class="text-red">SWPCCSimilarity
                                                                        </option>
                                                                        <option class="text-red">DVCosineSimilarity
                                                                        </option>
                                                                        <option class="text-red">CACosineSimilarity
                                                                        </option>
                                                                        <option class="text-red">IUFCosineSimilarity
                                                                        </option>
                                                                            <%--//new added--%>
                                                                        <option>CPCSimilarity</option>
                                                                        <option>DiceCoefficientSimilarity</option>
                                                                        <option>ExJaccardSimilarity</option>
                                                                        <option>KRCCSimilarity</option>
                                                                        <option>MSDSimilarity</option>
                                                                        <option>MSESimilarity</option>
                                                                    </select>
                                                                </div>

                                                                <div class="col-md-4">
                                                                    <label>Number of Neighborhood: </label>
                                                                    <div class="col-sm-8">
                                                                        <input type="number"
                                                                               class="form-control number-neighborhood"
                                                                               placeholder="50 by default">
                                                                    </div>
                                                                </div>


                                                                <div class="col-md-4">
                                                                    <label>N of top N if ranking: </label>
                                                                    <div class="col-sm-8">
                                                                        <input type="number"
                                                                               class="form-control number-n"
                                                                               placeholder="10 by default">
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <hr>

                                                        </div>

                                                        <div class="mf-extra-config" style="display: none">
                                                            <div class="control-group row">
                                                                <div class="col-md-3">
                                                                    <label>Learn Rate: </label>
                                                                    <input type="number" class="form-control learn-rate"
                                                                           placeholder="0.01 by default">
                                                                </div>

                                                                <div class="col-md-3">
                                                                    <label>Maximum Iterator Number : </label>
                                                                    <input type="number"
                                                                           class="form-control maximum-iterator-number"
                                                                           placeholder="10 by default">
                                                                </div>

                                                                <div class="col-md-3">
                                                                    <label>Factor Number: </label>
                                                                    <input type="number"
                                                                           class="form-control factor-number"
                                                                           placeholder="10 by default">
                                                                </div>

                                                                <div class="col-md-3"><br>
                                                                    <input type="checkbox" class="bold-driver"><label>
                                                                        launch bold
                                                                        driver? </label>
                                                                </div>

                                                            </div>

                                                            <hr>

                                                            <div class="control-group row">
                                                                <div class="col-md-3">
                                                                    <label>User Regularization: </label>
                                                                    <input type="number"
                                                                           class="form-control user-regularization"
                                                                           placeholder="0.01 by default">
                                                                </div>

                                                                <div class="col-md-3">
                                                                    <label>Item Regularization: </label>
                                                                    <input type="number"
                                                                           class="form-control item-regularization"
                                                                           placeholder="0.01 by default">
                                                                </div>

                                                                <div class="col-md-3">
                                                                    <label>Bias: </label>
                                                                    <input type="number"
                                                                           class="form-control bias-regularization"
                                                                           placeholder="0.01 by default">
                                                                </div>

                                                                <div class="col-md-3">
                                                                    <label>n of top N if ranking: </label>
                                                                    <input type="number" class="form-control number-n"
                                                                           placeholder="10 by default">
                                                                </div>
                                                            </div>
                                                            <hr>
                                                        </div>

                                                        <br>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Prediction accuracy metrics</label>
                                                                    <select class="myselect form-control prediction-metrics"
                                                                            multiple>
                                                                        <option value="mae" selected="selected">MAE
                                                                        </option>
                                                                        <option value="mse" selected>MSE</option>
                                                                        <option value="rmse">RMSE</option>
                                                                        <%--<option value="mpe" selected>MPE</option>--%>
                                                                        <option value="simplecov">SimpleCoverage
                                                                        </option>
                                                                        <option value="itemcov">ItemCoverage</option>

                                                                    </select>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Recommendation metrics</label>

                                                                    <select class="myselect form-control recommendation-metrics"
                                                                            multiple>
                                                                        <option value="precision">Precison</option>
                                                                        <option value="recall">recall</option>
                                                                        <option value="f1" selected>F1</option>

                                                                        <option value="ndcg" selected>NDCG</option>
                                                                        <option value="auc" selected>AUC</option>

                                                                            <%--<option value="relevance" selected>Relevance</option>--%>
                                                                        <option value="novelty" selected>Novelty
                                                                        </option>

                                                                        <option value="simplecov">SimpleCoverage
                                                                        </option>
                                                                        <option value="reccov" selected>RecCoverage
                                                                        </option>
                                                                        <option value="itemcov">ItemCoverage</option>
                                                                        <option value="entropy">Entropy</option>

                                                                        <option value="popularity" selected>Popularity
                                                                        </option>

                                                                        <option value="diversity">Diversity
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Evaluation</label>
                                                            <br>
                                                            <br>
                                                            <div class="row">
                                                                <div class="col-md-5 col-md-offset-1">

                                                                    <button class="btn btn-block btn-info rating">
                                                                        Rating<i class="fa fa-chevron-right"></i>
                                                                    </button>

                                                                </div>
                                                                <div class="col-md-5">

                                                                    <button class="btn btn-block btn-info ranking">
                                                                        Ranking <i class="fa fa-chevron-right"></i>
                                                                    </button>

                                                                </div>
                                                                <div class="col-md-1"></div>
                                                            </div>

                                                            <br>

                                                            <div class="configuration-info">
                                                                <h4 style="font-weight: bold;">Result for Configuration:</h4>
                                                                Rating: <p class="text-red rating-configuration"
                                                                   style="word-wrap: break-word;"></p>
                                                                Ranking: <p class="text-yellow ranking-configuration"
                                                                   style="word-wrap: break-word;"></p>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--rating and ranking result panel-->
                                        <div class="row">

                                            <div style="display: none" class="col-md-6 rating-panel">

                                                <div class="row text-center wait-label" style="display: none">
                                                    <i class="fa fa-refresh fa-spin fa-5x"> </i>
                                                </div>

                                                <label class="testcase-title-sub" style="display: none;"></label>
                                                <br>

                                                <div style="display: none"
                                                     class="box box-solid box-primary rating-result">

                                                    <div class="nav-tabs-custom">

                                                        <ul class="nav nav-tabs">
                                                            <li class="tab1 my-tab active"><a href="" data-toggle="tab"
                                                                                              aria-expanded="true">Report
                                                                Summary</a></li>

                                                            <li class="tab2 my-tab"><a href="" data-toggle="tab"
                                                                                       aria-expanded="false">Runtime
                                                                Log</a>
                                                            </li>

                                                            <li class="tab3 my-tab"><a href="" data-toggle="tab"
                                                                                       aria-expanded="false">Execution
                                                                Result</a>
                                                            </li>

                                                            <li class="pull-right">
                                                                <button type="button"
                                                                        class="btn btn-box-tool dropdown-toggle"
                                                                        data-toggle="dropdown" aria-expanded="true">
                                                                    <i class="fa fa-wrench"></i>
                                                                </button>
                                                                <ul class="dropdown-menu" role="menu">
                                                                    <li><a href="#"><i class="fa fa-save"></i>
                                                                        Export</a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>

                                                        <div class="tab-content">

                                                            <div class="tab-pane active tab1-content">
                                                                <div class="box no-border">
                                                                    <div class="box-header">
                                                                        <h3 class="box-title">Prediction Accuracy
                                                                            metrics</h3>
                                                                        <div class="box-tools">
                                                                            <div class="input-group input-group-sm pull-right">
                                                                                <button type="button"
                                                                                        class="btn btn-box-tool dropdown-toggle"
                                                                                        data-toggle="dropdown"
                                                                                        aria-expanded="true">
                                                                                    <i class="fa fa-wrench"></i>
                                                                                </button>

                                                                                <ul class="dropdown-menu" role="menu">
                                                                                    <li><a href="#"><i
                                                                                            class="fa fa-save"></i> Sava</a>
                                                                                    </li>
                                                                                </ul>

                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                    <div class="box-body table-responsive no-padding">

                                                                        <table class="table table-hover">

                                                                            <thead>
                                                                            <tr>
                                                                                <th>Matrics</th>
                                                                                <th>Score</th>
                                                                                <th>More Options</th>
                                                                            </tr>
                                                                            </thead>

                                                                            <tbody class="prediction-metrics-table">


                                                                            </tbody>


                                                                        </table>
                                                                    </div>

                                                                </div>


                                                            </div>

                                                            <div class="tab-pane tab2-content">

                                                                <div class="form-group">
                                                                    <div class="pull-right">
                                                                        <a href="" class="runtime-log-path">
                                                                            <i class="fa fa-cloud-download"></i>
                                                                        </a>
                                                                    </div>
                                                                    <textarea class="form-control runtime-log" rows="10"
                                                                              value=""></textarea>
                                                                </div>

                                                            </div>

                                                            <div class="tab-pane tab3-content">
                                                                <div style="margin-top: 150px">
                                                                    <a class="btn btn-block btn-success runtime-result-path">
                                                                        <i class="fa fa-cloud-download"></i> Get Result
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <!--/ ranking panel-->
                                            <div style="display: none" class="col-md-6 ranking-panel">

                                                <div class="row text-center wait-label" style="display: none">
                                                    <i class="fa fa-refresh fa-spin fa-5x"></i>
                                                </div>

                                                <label class="testcase-title-sub" style="display: none;"></label>

                                                <br>

                                                <div style="display: none" class="panel panel-primary ranking-result">

                                                    <div class="nav-tabs-custom">

                                                        <ul class="nav nav-tabs">
                                                            <li class="tab1 my-tab active"><a href="" data-toggle="tab"
                                                                                              aria-expanded="true">Report
                                                                Summary</a></li>

                                                            <li class="tab2 my-tab"><a href="" data-toggle="tab"
                                                                                       aria-expanded="false">Runtime
                                                                Log</a>
                                                            </li>

                                                            <li class="tab3 my-tab"><a href="" data-toggle="tab"
                                                                                       aria-expanded="false">Execution
                                                                Result</a>
                                                            </li>

                                                            <li class="pull-right">
                                                                <button type="button"
                                                                        class="btn btn-box-tool dropdown-toggle"
                                                                        data-toggle="dropdown" aria-expanded="true">
                                                                    <i class="fa fa-wrench"></i>
                                                                </button>
                                                                <ul class="dropdown-menu" role="menu">
                                                                    <li><a href="#"><i class="fa fa-save"></i>
                                                                        Export</a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>

                                                        <div class="tab-content">

                                                            <div class="tab-pane active tab1-content">
                                                                <!--Ranking Accuracy metrics-->

                                                                <div class="panel-body">
                                                                    <!--Decison-support Metrics-->
                                                                    <div class="box no-border">
                                                                        <div class="box-header">
                                                                            <h3 class="box-title">Recommendation
                                                                                Metrics</h3>
                                                                            <div class="box-tools">
                                                                                <div class="input-group input-group-sm"
                                                                                     style="width: 150px;">
                                                                                    <button type="button"
                                                                                            class="btn btn-box-tool dropdown-toggle"
                                                                                            data-toggle="dropdown"
                                                                                            aria-expanded="true">
                                                                                        <i class="fa fa-wrench"></i>
                                                                                    </button>

                                                                                    <ul class="dropdown-menu"
                                                                                        role="menu">
                                                                                        <li><a href="#"><i
                                                                                                class="fa fa-save"></i>
                                                                                            Sava</a>
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="box-body table-responsive no-padding">
                                                                            <table class="table table-hover">

                                                                                <thead>
                                                                                <tr>
                                                                                    <th>Matrics</th>
                                                                                    <th>Score</th>
                                                                                    <th>More Options</th>
                                                                                </tr>
                                                                                </thead>
                                                                                <tbody class="recommendation-metrics-table">


                                                                                </tbody>

                                                                                <tfoot>


                                                                                </tfoot>
                                                                            </table>
                                                                        </div>
                                                                        <!-- /.box-body -->
                                                                    </div>

                                                                    <!--beyond accuracy metrics-->
                                                                    <div class="box no-border">

                                                                        <div class="box-header">

                                                                        </div>

                                                                        <!-- /.box-header -->
                                                                        <div class="box-body table-responsive no-padding">

                                                                        </div>
                                                                        <!-- /.box-body -->
                                                                    </div>


                                                                </div>


                                                            </div>

                                                            <div class="tab-pane tab2-content">

                                                                <div class="form-group">
                                                                    <div class="pull-right">
                                                                        <a href="" class="runtime-log-path">
                                                                            <i class="fa fa-cloud-download"></i>
                                                                        </a>
                                                                    </div>
                                                                    <textarea class="form-control runtime-log" rows="10"
                                                                              value="this is runtiome log"></textarea>
                                                                </div>

                                                            </div>

                                                            <div class="tab-pane tab3-content">
                                                                <div style="margin-top: 150px">
                                                                    <a class="btn btn-block btn-success runtime-result-path">
                                                                        <i class="fa fa-cloud-download"></i> Get Result
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <!--/panel-body-->
                                                </div>
                                            </div>
                                        </div>
                                        <!-- comparison panel-->
                                        <div class="row comparison-selection">

                                            <div class="col-md-8 comparison-selection-label">
                                                <p>

                                                </p>
                                            </div>

                                            <div class="col-ml-4 comparison-selection-visualize">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                    class="btn btn-default fa fa-area-chart"> Visualize</a>
                                            </div>

                                        </div>

                                    </div>


                                    <div class="box-footer" style="">
                                        <div>
                                            <a class="btn btn-default btn-block btn-sm" data-toggle="modal"
                                               href="#addWidgetModal"> <i class="fa fa-plus"></i> Add
                                            </a>
                                        </div>
                                    </div>
                                    <!-- /.box-footer-->
                                </div>
                            </c:otherwise>
                            </c:choose>

                        </div>
                        <!--/col-span-9-->
                    </div>
                </div>
                <!-- /Main -->

                <div id="testcaseboxlast"></div>
                <!--test case html panel-->

                <div class="box box-success" style="display: none">

                    <div class="box-header with-border">

                        <h3 class="box-title testcase-title">default</h3>

                        <div class="box-tools pull-right">

                            <div class="btn-group">
                                <button type="button" class="btn btn-box-tool dropdown-toggle"
                                        data-toggle="dropdown" aria-expanded="true">
                                    <i class="fa fa-wrench"></i>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#"><i class="fa fa-eye"></i> Comtrast
                                        &amp; Compare</a></li>
                                    <li><a href="#"><i class="fa fa-repeat"></i> Reset</a></li>
                                    <li class="divider"></li>
                                    <li><a href="#"><i class="fa fa-save"></i> Sava</a></li>
                                </ul>
                            </div>


                            <!--<i class="fa fa-refresh fa-spin"></i>-->
                            <button type="button" class="btn btn-box-tool collapseBtn"
                                    data-toggle="tooltip" title="" data-original-title="Collapse">
                                <i class="fa fa-minus"></i>
                            </button>


                            <button type="button" class="btn btn-box-tool removeBtn"
                                    data-toggle="tooltip" title="" data-original-title="Remove">
                                <i class="fa fa-times"></i>
                            </button>
                        </div>

                    </div>

                    <div class="box-body" style="">
                        <!--configure row-->
                        <div class="row">
                            <div class="col-md-12 configure-panel">
                                <!--Choose Algorithm and Example file input-->
                                <div class="box no-header no-border">

                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>Choose Algorithm</label>
                                            <div class="radio">
                                                <label> <input type="radio" name="algmethod"
                                                               class="algmethod1" value="User-based"
                                                               ng-model="algmethod">
                                                    User-based CF
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label> <input type="radio" name="algmethod"
                                                               class="algmethod2" value="Item-based"
                                                               ng-model="algmethod">
                                                    Item-based CF
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label> <input type="radio" name="algmethod"
                                                               class="algmethod3" value="Matrix-Factorisation"
                                                               ng-model="algmethod">Matrix-Factorisation CF
                                                    <%--(Biased MF is used here)--%>
                                                </label>
                                            </div>

                                            <%--<div class="radio text-red">--%>
                                                <%--<label> <input type="radio" name="algmethod"--%>
                                                               <%--class="algmethod4" value="Hybrid"--%>
                                                               <%--ng-model="algmethod">Hybrid (click <a--%>
                                                        <%--href="http://www.pnas.org/content/pnas/107/10/4511.full.pdf"--%>
                                                        <%--class="text-green">here</a> know more--%>
                                                    <%--used here)--%>
                                                <%--</label>--%>
                                            <%--</div>--%>

                                        </div>

                                        Algorithm selected:<label style="color: tomato" class="algmethod"></label>
                                        <br><br>

                                        <%--<div class="form-group">--%>
                                            <%--<label>Default Dataset: </label> <a--%>
                                                <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_1.txt">ratings_1--%>
                                        <%--</a> <a--%>
                                                <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_2.txt">ratings_2--%>
                                        <%--</a> <a--%>
                                                <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_3.txt">ratings_3--%>
                                        <%--</a> <a--%>
                                                <%--href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_0.txt">ratings_4--%>
                                        <%--</a>--%>
                                        <%--</div>--%>

                                        <div class="form-group">

                                            <label> Upload Dataset <a
                                                    class="dataset-format text-green">See Format</a></label><input
                                                type="checkbox" class="dataset-type" style="display: none"><input
                                                type="file" class="form-control-file dataset-file">
                                        </div>

                                        <div class="form-group row">
                                            <div class="col-md-5">
                                                <label>Evaluation Methodology: </label>
                                                <select class="form-control evaluation-method">
                                                    <option selected name="evalmethod" value="ratio">Random Sub-Sampling
                                                    </option>
                                                    <option name="evalmethod" value="loocv">Leave-one-out</option>
                                                    <option name="evalmethod" value="kcv">K-Fold Cross-Validation
                                                    </option>
                                                </select>
                                            </div>


                                        </div>

                                        <div class="form-group row ratio-extra-config">

                                            <div class="col-md-6 ratio-extra-config-input">
                                                <label>Trainset ratio: </label>
                                                <input type="number" class="form-control trainset-ratio"
                                                       placeholder="0.8 by default">
                                            </div>

                                        </div>


                                        <div class="form-group row loocv-extra-config" style="display: none">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Choose leave target: </label>
                                                    <select class="form-control leave-target">
                                                        <option selected value="user">User</option>
                                                        <option value="item">Item</option>
                                                    </select>

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group row kcv-extra-config" style="display: none">
                                            <div class="col-md-7">
                                                <div class="form-group">
                                                    <label>K of cross validation: </label>
                                                    <input type="number" class="form-control k-kcv"
                                                           placeholder="5 by default">
                                                </div>
                                            </div>
                                        </div>


                                        <hr>


                                        <%--Similarity Computation:--%>
                                        <div class="extra-config" style="display: none">
                                            <div class="control-group row">
                                                <div class="col-md-4">
                                                    <label>Similarity Computation: </label>
                                                    <select class="form-control similarity-method">
                                                        <option>BinaryCosineSimilarity</option>
                                                        <option>CosineSimilarity</option>
                                                        <option selected>PCCSimilarity</option>
                                                        <%--//new added--%>
                                                        <option class="text-red">SWPCCSimilarity</option>
                                                        <option class="text-red">DVCosineSimilarity</option>
                                                        <option class="text-red">CACosineSimilarity</option>
                                                        <option class="text-red">IUFCosineSimilarity</option>
                                                        <%--//new added--%>
                                                        <option>CPCSimilarity</option>
                                                        <option>DiceCoefficientSimilarity</option>
                                                        <option>ExJaccardSimilarity</option>
                                                        <option>KRCCSimilarity</option>
                                                        <option>MSDSimilarity</option>
                                                        <option>MSESimilarity</option>
                                                    </select>
                                                </div>

                                                <div class="col-md-4">
                                                    <label>Number of Neighborhood: </label>
                                                    <div class="col-sm-8">
                                                        <input type="number" class="form-control number-neighborhood"
                                                               placeholder="50 by default">
                                                    </div>
                                                </div>


                                                <div class="col-md-4">
                                                    <label>N of top N if ranking: </label>
                                                    <div class="col-sm-8">
                                                        <input type="number" class="form-control number-n"
                                                               placeholder="10 by default">
                                                    </div>
                                                </div>

                                            </div>
                                            <hr>

                                        </div>

                                        <div class="mf-extra-config" style="display: none">
                                            <div class="control-group row">
                                                <div class="col-md-3">
                                                    <label>Learn Rate: </label>
                                                    <input type="number" class="form-control learn-rate"
                                                           placeholder="0.01 by default">
                                                </div>

                                                <div class="col-md-3">
                                                    <label>Maximum Iterator Number : </label>
                                                    <input type="number" class="form-control maximum-iterator-number"
                                                           placeholder="10 by default">
                                                </div>

                                                <div class="col-md-3">
                                                    <label>Factor Number: </label>
                                                    <input type="number" class="form-control factor-number"
                                                           placeholder="10 by default">
                                                </div>

                                                <div class="col-md-3"><br>
                                                    <input type="checkbox" class="bold-driver"><label> launch bold
                                                        driver? </label>
                                                </div>

                                            </div>

                                            <hr>

                                            <div class="control-group row">
                                                <div class="col-md-3">
                                                    <label>User Regularization: </label>
                                                    <input type="number" class="form-control user-regularization"
                                                           placeholder="0.01 by default">
                                                </div>

                                                <div class="col-md-3">
                                                    <label>Item Regularization: </label>
                                                    <input type="number" class="form-control item-regularization"
                                                           placeholder="0.01 by default">
                                                </div>

                                                <div class="col-md-3">
                                                    <label>Bias: </label>
                                                    <input type="number" class="form-control bias-regularization"
                                                           placeholder="0.01 by default">
                                                </div>

                                                <div class="col-md-3">
                                                    <label>n of top N if ranking: </label>
                                                    <input type="number" class="form-control number-n"
                                                           placeholder="10 by default">
                                                </div>
                                            </div>
                                            <hr>
                                        </div>

                                        <br>
                                        <div class="row multiple-selector">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Prediction accuracy metrics</label>
                                                    <select class="form-control prediction-metrics" multiple>
                                                        <option value="mae" selected="selected">MAE</option>
                                                        <option value="mse" selected>MSE</option>
                                                        <option value="rmse">RMSE</option>
                                                        <%--<option value="mpe" selected>MPE</option>--%>
                                                        <option value="simplecov">SimpleCoverage</option>
                                                        <option value="itemcov">ItemCoverage</option>

                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Recommendation metrics</label>

                                                    <select class="form-control recommendation-metrics" multiple>
                                                        <option value="precision">Precison</option>
                                                        <option value="recall">recall</option>

                                                        <option value="f1" selected>F1</option>
                                                        <option value="ndcg" selected>NDCG</option>
                                                        <option value="auc" selected>AUC</option>

                                                        <%--<option value="relevance" selected>Relevance</option>--%>
                                                        <option value="novelty" selected>Novelty</option>

                                                        <option value="simplecov">SimpleCoverage</option>
                                                        <option value="reccov" selected>RecCoverage</option>
                                                        <option value="itemcov">ItemCoverage</option>
                                                        <option value="entropy">Entropy</option>


                                                        <option value="popularity" selected>Popularity</option>
                                                        <option value="diversity">Diversity</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label>Evaluation</label>
                                            <br>
                                            <br>
                                            <div class="row">
                                                <div class="col-md-5 col-md-offset-1">

                                                    <button class="btn btn-block btn-info rating">
                                                        Rating<i class="fa fa-chevron-right"></i>
                                                    </button>

                                                </div>
                                                <div class="col-md-5">

                                                    <button class="btn btn-block btn-info ranking">
                                                        Ranking <i class="fa fa-chevron-right"></i>
                                                    </button>

                                                </div>
                                                <div class="col-md-1"></div>
                                            </div>

                                            <br>

                                            <div class="configuration-info">
                                                <h4 style="font-weight: bold;">Result for Configuration:</h4>
                                                Rating: <p class="text-red rating-configuration"
                                                   style="word-wrap: break-word;"></p>
                                                Ranking: <p class="text-yellow ranking-configuration"
                                                   style="word-wrap: break-word;"></p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--rating and ranking result panel-->
                        <div class="row">

                            <div style="display: none" class="col-md-6 rating-panel">

                                <div class="row text-center wait-label" style="display: none">
                                    <i class="fa fa-refresh fa-spin fa-5x"> </i>
                                </div>

                                <label class="testcase-title-sub" style="display: none;"></label>
                                <br>

                                <div style="display: none" class="box box-solid box-primary rating-result">

                                    <div class="nav-tabs-custom">

                                        <ul class="nav nav-tabs">
                                            <li class="tab1 my-tab active"><a href="" data-toggle="tab"
                                                                              aria-expanded="true">Report Summary</a>
                                            </li>

                                            <li class="tab2 my-tab"><a href="" data-toggle="tab" aria-expanded="false">Runtime
                                                Log</a>
                                            </li>

                                            <li class="tab3 my-tab"><a href="" data-toggle="tab" aria-expanded="false">Execution
                                                Result</a>
                                            </li>

                                            <li class="pull-right">
                                                <button type="button"
                                                        class="btn btn-box-tool dropdown-toggle"
                                                        data-toggle="dropdown" aria-expanded="true">
                                                    <i class="fa fa-wrench"></i>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#"><i class="fa fa-save"></i> Export</a></li>
                                                </ul>
                                            </li>
                                        </ul>

                                        <div class="tab-content">

                                            <div class="tab-pane active tab1-content">
                                                <div class="box no-border">
                                                    <div class="box-header">
                                                        <h3 class="box-title">Prediction Accuracy metrics</h3>
                                                        <div class="box-tools">
                                                            <div class="input-group input-group-sm pull-right">
                                                                <button type="button"
                                                                        class="btn btn-box-tool dropdown-toggle"
                                                                        data-toggle="dropdown" aria-expanded="true">
                                                                    <i class="fa fa-wrench"></i>
                                                                </button>

                                                                <ul class="dropdown-menu" role="menu">
                                                                    <li><a href="#"><i class="fa fa-save"></i> Sava</a>
                                                                    </li>
                                                                </ul>

                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="box-body table-responsive no-padding">

                                                        <table class="table table-hover">

                                                            <thead>
                                                            <tr>
                                                                <th>Matrics</th>
                                                                <th>Score</th>
                                                                <th>More Options</th>
                                                            </tr>
                                                            </thead>

                                                            <tbody class="prediction-metrics-table">


                                                            </tbody>


                                                        </table>
                                                    </div>

                                                </div>


                                            </div>

                                            <div class="tab-pane tab2-content">

                                                <div class="form-group">
                                                    <div class="pull-right">
                                                        <a href="" class="runtime-log-path">
                                                            <i class="fa fa-cloud-download"></i>
                                                        </a>
                                                    </div>
                                                    <textarea class="form-control runtime-log" rows="10"
                                                              value=""></textarea>
                                                </div>

                                            </div>

                                            <div class="tab-pane tab3-content">
                                                <div style="margin-top: 150px">
                                                    <a class="btn btn-block btn-success runtime-result-path">
                                                        <i class="fa fa-cloud-download"></i> Get Result
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!--/ ranking panel-->
                            <div style="display: none" class="col-md-6 ranking-panel">

                                <div class="row text-center wait-label" style="display: none">
                                    <i class="fa fa-refresh fa-spin fa-5x"></i>
                                </div>

                                <label class="testcase-title-sub" style="display: none;"></label>

                                <br>

                                <div style="display: none" class="panel panel-primary ranking-result">

                                    <div class="nav-tabs-custom">

                                        <ul class="nav nav-tabs">
                                            <li class="tab1 my-tab active"><a href="" data-toggle="tab"
                                                                              aria-expanded="true">Report Summary</a>
                                            </li>

                                            <li class="tab2 my-tab"><a href="" data-toggle="tab" aria-expanded="false">Runtime
                                                Log</a>
                                            </li>

                                            <li class="tab3 my-tab"><a href="" data-toggle="tab" aria-expanded="false">Execution
                                                Result</a>
                                            </li>

                                            <li class="pull-right">
                                                <button type="button"
                                                        class="btn btn-box-tool dropdown-toggle"
                                                        data-toggle="dropdown" aria-expanded="true">
                                                    <i class="fa fa-wrench"></i>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="#"><i class="fa fa-save"></i> Export</a></li>
                                                </ul>
                                            </li>
                                        </ul>

                                        <div class="tab-content">

                                            <div class="tab-pane active tab1-content">
                                                <!--Ranking Accuracy metrics-->

                                                <div class="panel-body">
                                                    <!--Decison-support Metrics-->
                                                    <div class="box no-border">
                                                        <div class="box-header">
                                                            <h3 class="box-title">Recommendation Metrics</h3>
                                                            <div class="box-tools">
                                                                <div class="input-group input-group-sm"
                                                                     style="width: 150px;">
                                                                    <button type="button"
                                                                            class="btn btn-box-tool dropdown-toggle"
                                                                            data-toggle="dropdown" aria-expanded="true">
                                                                        <i class="fa fa-wrench"></i>
                                                                    </button>

                                                                    <ul class="dropdown-menu" role="menu">
                                                                        <li><a href="#"><i class="fa fa-save"></i> Sava</a>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="box-body table-responsive no-padding">
                                                            <table class="table table-hover">

                                                                <thead>
                                                                <tr>
                                                                    <th>Matrics</th>
                                                                    <th>Score</th>
                                                                    <th>More Options</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody class="recommendation-metrics-table">


                                                                </tbody>

                                                                <tfoot>


                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                        <!-- /.box-body -->
                                                    </div>

                                                    <!--beyond accuracy metrics-->
                                                    <div class="box no-border">

                                                        <div class="box-header">

                                                        </div>

                                                        <!-- /.box-header -->
                                                        <div class="box-body table-responsive no-padding">

                                                        </div>
                                                        <!-- /.box-body -->
                                                    </div>


                                                </div>


                                            </div>

                                            <div class="tab-pane tab2-content">

                                                <div class="form-group">
                                                    <div class="pull-right">
                                                        <a href="" class="runtime-log-path">
                                                            <i class="fa fa-cloud-download"></i>
                                                        </a>
                                                    </div>
                                                    <textarea class="form-control runtime-log" rows="10"
                                                              value="this is runtiome log"></textarea>
                                                </div>

                                            </div>

                                            <div class="tab-pane tab3-content">
                                                <div style="margin-top: 150px">
                                                    <a class="btn btn-block btn-success runtime-result-path">
                                                        <i class="fa fa-cloud-download"></i> Get Result
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <!--/panel-body-->
                                </div>
                            </div>
                        </div>
                        <!-- comparison panel-->
                        <div class="row comparison-selection">

                            <div class="col-md-8 comparison-selection-label">
                                <p>

                                </p>
                            </div>

                            <div class="col-ml-4 comparison-selection-visualize">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                    class="btn btn-default fa fa-area-chart"> Visualize</a>
                            </div>

                        </div>

                    </div>


                    <div class="box-footer" style="">
                        <div>
                            <a class="btn btn-default btn-block btn-sm" data-toggle="modal"
                               href="#addWidgetModal"> <i class="fa fa-plus"></i> Add
                            </a>
                        </div>
                    </div>
                    <!-- /.box-footer-->
                </div>


                <div class="modal" id="addWidgetModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">×
                                </button>
                                <h4 class="modal-title">Add Test Case</h4>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label for="testcasename">Test case name: </label> <input
                                        type="email" class="form-control" id="testcasename"
                                        placeholder="give a name to the test case">
                                </div>
                            </div>


                            <div class="modal-footer">

                                <a id="closemodal" data-dismiss="modal" class="btn">Close</a> <a
                                    id="addtestcase" class="btn btn-primary">Add</a>
                            </div>
                        </div>
                    </div>
                </div>


                <%--push modal--%>
                <div class="modal" id="pushmodal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">×
                                </button>
                                <h4 class="modal-title">Push to the server</h4>
                            </div>


                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="pushuniquecode"
                                           placeholder="Enter an unique code">
                                </div>
                            </div>


                            <div class="modal-footer">
                                <a id="closepushmodal" data-dismiss="modal" class="btn">Close</a> <a
                                    id="pushconfirm" class="btn btn-primary">Push</a>
                            </div>
                        </div>
                    </div>
                </div>

                <%--pull modal--%>
                <div class="modal" id="pullmodal">
                    <div class="modal-dialog">

                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">×
                                </button>
                                <h4 class="modal-title">Pull from the server</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="pulluniquecode"
                                           placeholder="Enter the unique code to pull from server">
                                </div>
                            </div>

                            <div class="modal-footer">
                                <a id="closepullmodal" data-dismiss="modal" class="btn">Close</a> <a
                                    id="pullconfirm" class="btn btn-primary">Pull</a>
                            </div>
                        </div>


                    </div>
                </div>

                <div id="multi-compare-box">
                    <div class="row">
                        <div class="col-md-4">
                            <canvas id="multi-chart1"></canvas>
                        </div>
                        <div class="col-md-4">
                            <canvas id="multi-chart2"></canvas>
                        </div>
                        <div class="col-md-4">
                            <canvas id="multi-chart3"></canvas>
                        </div>
                    </div>
                </div>

                <div id="dataset-format-box" style="padding: 10px;display: none">
                    <h2 class="sectionedit2" id="text">Text</h2>
                    <p>Examples are shown below</p>
                    <p>User-Item-Rating (UIR)</p>
                    <pre><code>1050 215 3
1050 250 2
1050 251 2.5
</code></pre>
                    <p>User-Item-Rating-Time (UIRT)</p>
                    <pre><code>1 1 2   97
1 1 3   75
1 1 4   76
1 4 3   87
1 5 4   96
</code></pre>
                    <h2 class="sectionedit2" id="arff">Arff</h2>
                    <p>When data columns are larger than four, the Arff data format is recommended to store the data.
                        The
                        very top line
                        of the Arff data defines the name of a data set. Each following line is the column name and data
                        type. Examples
                        are shown bellow.</p>
                    <pre><code>@RELATION user-movie

@ATTRIBUTE user NUMERIC
@ATTRIBUTE item NUMERIC
@ATTRIBUTE time NUMERIC
@ATTRIBUTE rating NUMERIC

@DATA
1,1,97,2
1,1,75,3
1,1,76,4
1,4,87,3
1,5,96,4
1,6,78,3.5
1,7,1,3.5
</code></pre>

                </div>


                <div style="margin-top: 100px">&nbsp;</div>
                <footer class="text-center"
                        style="position:fixed; left: 0; bottom: 0;width: 100% ">This
                    is a platform for evaluating mainstream recommender system via offline<a
                            href="http://123.207.171.254"><strong> My Server</strong></a></footer>


                <script
                        src="${pageContext.request.contextPath}/static/asserts/jquery.min.js"></script>

                <script
                        src="${pageContext.request.contextPath}/static/asserts/bootstrap.min.js"></script>
                <script
                        src="${pageContext.request.contextPath}/static/asserts/js/scripts.js"></script>
                <script
                        src="${pageContext.request.contextPath}/static/asserts/adminlte.min.js"></script>
                <script
                        src="${pageContext.request.contextPath}/static/asserts/plugins/layui/layui.js"></script>

                <script src="${pageContext.request.contextPath}/static/asserts/plugins/multiselect/dist/jquery.popSelect.js"></script>

                <%--<script src="${pageContext.request.contextPath}/static/asserts/mainjs.js"></script>--%>
                <%--<script src="${pageContext.request.contextPath}/static/asserts/plugins/Chart.bundle.min.js"></script>--%>

                <script>


                    var testcaselist = [];
                    $(".testcase-nav").each(function () {
                        testcaselist.push($(this).children('a').text());
                    });

                    console.log("testcaselist is initialized:" + testcaselist);

                    layui.use('layer', function () {
                        var layer = layui.layer;
                        //start all popover events


                        $(".myselect").popSelect({
                            showTitle: false
                            // maxAllowed: 4
                        });

                        //
                        // $("body").on('popSelect','.myselect',function () {
                        //     showTitle: false
                        // });

                        /*         $('[data-toggle="popover"]').popover({html:true}); */


                        $(".dataset-format").click(function () {
                            layer.open({
                                title: "Dataset format",
                                type: 1,
                                content: $("#dataset-format-box"),
                                btn: ['Cancel'],
                                resize: false,
                                anim: 2,
                                maxmin: true,
                                closeBtn: 1,
                                shadeClose: true,
                                shade: 0.6,
                                area: ['600px', '600px'],
                                yes: function (index) {
                                    layer.close(index);
                                }
                            });
                        });

                        $("#pulluniquecode").keyup(function (event) {
                            if (event.keyCode == 13) {
                                $("#pullconfirm").trigger('click');
                            }
                        });


                        $("#pullconfirm").click(function () {
                            var uniquecode = $("#pulluniquecode").val();
                            if (uniquecode == "") {
                                layer.msg('enter the code!', {
                                    icon: 2,
                                    anim: 6,
                                    time: 1000
                                });
                                return false;
                            }

                            $.ajax({
                                type: 'POST',
                                url: 'pullBySessionCode',
                                data: {"sessionCode": uniquecode},
                                dataType: 'json',
                                success: function (data) {
                                    if (data.success == true) {
                                        window.location.href = "main";
                                    } else if (data.success == false) {
                                        layer.msg("Not found", {anim: 6, icon: 2, time: 2000});
                                    }
                                },
                                error: function (xhr, type) {
                                    layer.msg("error", {anim: 6, icon: 2, time: 2000});
                                }
                            });


                            // TODO ajax goes here


                            $("#closepullmodal").trigger('click');

                        });

                        $(".nav-header").click(
                            function () {
                                var ele = $(this).find(".nav-header-label");
                                if (ele.hasClass("fa-chevron-down")) {
                                    ele.removeClass("fa-chevron-down")
                                        .addClass("fa-chevron-right");
                                } else {
                                    ele.removeClass("fa-chevron-right")
                                        .addClass("fa-chevron-down");
                                }
                            });

                        $("#import").click(function () {
                            $("input[name='importfile']").trigger('click');
                        });
                        $("#testcasename").keyup(function (event) {
                            if (event.keyCode == 13) {
                                $("#addtestcase").trigger('click');
                            }
                        });


                        $("input[name='importfile']").change(function () {
                            console.log($(this)[0].files[0]);
                        });

                        $("input[name='algmethod']").click(
                            function () {

                                if ($(this).val() == "User-based" || $(this).val() == "Item-based") {
                                    $(this).parent().parent().parent().siblings(".extra-config").show(1000);
                                    $(this).parent().parent().parent().siblings(".mf-extra-config").hide();
                                } else if ($(this).val() == "Matrix-Factorisation") {
                                    $(this).parent().parent().parent().siblings(".extra-config").hide();
                                    $(this).parent().parent().parent().siblings(".mf-extra-config").show(1000);
                                } else if ($(this).val() == "Hybrid") {
                                    $(this).parent().parent().parent().siblings(".extra-config").hide();
                                    $(this).parent().parent().parent().siblings(".mf-extra-config").hide();
                                }

                                $(this).parent().parent().parent().siblings(
                                    '.algmethod').text($(this).val());
                            });


                        $(".rating").click(
                            //rating function
                            function () {
                                var algmethod = $(this).parent().parent().parent()
                                    .siblings('.algmethod').text();
                                if (algmethod === "") {
                                    layer.msg('select an algorithm!', {
                                        icon: 2,
                                        anim: 6,
                                        time: 1000
                                    });
                                    return false;
                                }

                                var ratingbox = $(this).parent().parent().parent().parent().parent()
                                    .parent().parent().parent().find('.rating-panel');

                                // ratingbox.toggle('slow');

                                if (!ratingbox.is(':visible')) {
                                    ratingbox.show('slow');
                                }

                                ratingbox.find(".wait-label").show();
                                var args = getConfigs($(this).parent().parent().parent().parent(), 'rating');
                                if (args.predictionmetrics == "") {
                                    layer.msg('select metrics for rating!', {
                                        icon: 2,
                                        anim: 6,
                                        time: 1000
                                    });
                                    return false;
                                }
                                ratingbox.children('.testcase-title-sub').text(args.testcasetitle);
                                var ele = $(this).parent().parent();

                                var comparisonselectionlabelp = ratingbox.parent().parent().parent().find(".comparison-selection-label").children("p");


                                $.ajax({
                                    type: 'POST',
                                    url: 'evaluate',
                                    data: args,
                                    dataType: 'json',
                                    success: function (data) {
                                        // console.log(ele.parent().find(".mae-score").text());
                                        // console.log(data);
                                        // console.log(JSON.stringify(data));
                                        if (data.success == true) {
                                            console.log(data);
                                            // console.log(data.metrics.MAE);
                                            var returnData = data.returnData;
                                            var ratingmetrictrs = '';
                                            for (var key in returnData) {
                                                ratingmetrictrs += '' +
                                                    '                                                        <tr>' +
                                                    '' +
                                                    '                                                            <td class="text-red"><input type="checkbox"' +
                                                    '                                                                                        class="metric-checkbox">' +
                                                    '                                                                ' + key + ' <a class="fa fa-question-circle-o"' +
                                                    '                                                                       data-toggle="popover"' +
                                                    '                                                                       title="Mean Absolute Error"' +
                                                    '                                                                       data-content="<a href=\'https://en.wikipedia.org/wiki/Mean_absolute_error\'>Check details</a>"></a>' +
                                                    '                                                            </td>' +
                                                    '                                                            <td class="' + key.toLowerCase() + '-score text-red">' + returnData[key] + '</td>' +
                                                    '                                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a' +
                                                    '                                                                    class="fa fa-trash-o metric-trash"' +
                                                    '                                                                    data-toggle="tooltip"' +
                                                    '                                                                    data-placement="top" title="delete"></a>&nbsp;&nbsp;&nbsp;<a' +
                                                    '                                                                    class="fa fa-search metric-visualise"' +
                                                    '                                                                    data-toggle="tooltip"' +
                                                    '                                                                    data-placement="top" title="visualise"></a></td>' +
                                                    '' +
                                                    '                                                        </tr>';

                                            }


                                            ratingbox.find(".prediction-metrics-table").html(ratingmetrictrs);
                                            //
                                            // ratingbox.find(".mae-score").text(data.returnData.MAEEvaluator);
                                            // ratingbox.find(".mpe-score").text(data.returnData.MPEEvaluator);
                                            // ratingbox.find(".mse-score").text(data.returnData.MSEEvaluator);
                                            // ratingbox.find(".rmse-score").text(data.returnData.RMSEEvaluator);
                                            ratingbox.find(".runtime-log").val(data.extra.logcontent);
                                            ratingbox.find(".runtime-log-path").attr('href', "download?downloadfile=" + data.extra.logpath);
                                            ratingbox.find(".runtime-result-path").attr('href', "download?downloadfile=" + data.extra.resultpath);


                                            if (!ratingbox.find('.rating-result').is(':visible')) {
                                                ratingbox.find('.rating-result').show('slow');
                                            }


                                            ratingbox.find(".wait-label").hide();


                                            delete args["operation"];
                                            delete args["predictionmetrics"];
                                            delete args["recommendationmetrics"];
                                            ele.siblings(".configuration-info").children(".rating-configuration").text(JSON.stringify(args));
                                            comparisonselectionlabelp.html("");
                                        } else if (data.success == false) {
                                            ratingbox.find(".wait-label").hide();
                                            layer.msg(data.error, {anim: 6, icon: 2, time: 2000});
                                        }


                                    },
                                    error: function (xhr, type) {
                                        ratingbox.find(".wait-label").hide();
                                        layer.msg("There is something wrong with your dataset", {
                                            anim: 6,
                                            icon: 2,
                                            time: 2000
                                        });
                                    }
                                });


                                // $(this).parent().parent().find(".ranking").trigger('click');
                                // setTimeout(function (args2) {
                                //     var data = {
                                //         success: true,
                                //         metrics: {MAE: 0.6288, MPE: 0.9642, RMSE: 0.8221, MSE: 0.6759},
                                //         extra: {
                                //             logcontent: "log... this is log content",
                                //             logpath: "log/rating-default",
                                //             resultpath: "result/filmtrust/rating-userknn-output/userknn"
                                //         },
                                //         error: null
                                //     };
                                //     if (data.success == true) {
                                //
                                //         ratingbox.find(".mae-score").text(data.metrics.MAE);
                                //         ratingbox.find(".mpe-score").text(data.metrics.MPE);
                                //         ratingbox.find(".mse-score").text(data.metrics.MSE);
                                //         ratingbox.find(".rmse-score").text(data.metrics.RMSE);
                                //         ratingbox.find(".runtime-log").val(data.extra.logcontent);
                                //         ratingbox.find(".runtime-log-path").attr('href', "download?downloadfile=" + data.extra.logpath);
                                //         ratingbox.find(".runtime-result-path").attr('href', "download?downloadfile=" + data.extra.resultpath);
                                //         ele.siblings(".configuration-info").children(".rating-configuration").text(JSON.stringify(args));
                                //     } else if (data.success == false) {
                                //         layer.msg(data.error, {anim: 2, icon: 6, time: 2000});
                                //     }
                                //
                                //     ratingbox.find('.rating-result').toggle('slow');
                                //     ratingbox.find(".wait-label").hide();
                                // }, 100);

                                var elei = $(this).find('i');
                                if (elei.hasClass("fa-chevron-down")) {
                                    // elei.removeClass("fa-chevron-down")
                                    //     .addClass("fa-chevron-right");
                                } else {
                                    elei.removeClass("fa-chevron-right")
                                        .addClass("fa-chevron-down");
                                }
                            });

                        $(".ranking").click(
                            function () {

                                // if (rankingbox.find(".runtime-log").val()!=""){
                                //     rankingbox.find('.ranking-result').toggle('slow');
                                //     return false;
                                // }
                                var algmethod = $(this).parent().parent().parent()
                                    .siblings('.algmethod').text();

                                if (algmethod === "") {
                                    layer.msg('select an algorithm!', {
                                        icon: 2,
                                        anim: 6,
                                        time: 1000
                                    });
                                    return false;
                                }


                                var rankingbox = $(this).parent().parent().parent().parent().parent()
                                    .parent().parent().parent().find('.ranking-panel');
                                // rankingbox.toggle('slow');
                                if (!rankingbox.is(':visible')) {
                                    rankingbox.show('slow');
                                }

                                rankingbox.find(".wait-label").show();

                                var ele = $(this).parent().parent();
                                var comparisonselectionlabelp = rankingbox.parent().parent().parent().find(".comparison-selection-label").children("p");

                                var args = getConfigs($(this).parent().parent().parent().parent(), 'ranking');

                                if (args.recommendationmetrics == "") {
                                    layer.msg('select metrics for ranking!', {
                                        icon: 2,
                                        anim: 6,
                                        time: 1000
                                    });
                                    return false;
                                }


                                //assign test title again
                                rankingbox.children('.testcase-title-sub').text(args.testcasetitle);
                                // $(this).parent().parent().find(".rating").trigger('click');


                                $.ajax({
                                    type: 'POST',
                                    url: 'evaluate',
                                    data: args,
                                    dataType: 'json',
                                    success: function (data) {
                                        if (data.success == true) {
                                            var returnData = data.returnData;
                                            var rankingmetricstrs = '';

                                            for (var key in returnData) {

                                                rankingmetricstrs += ' <tr>' +
                                                    '                                                                <td class="text-red"><input type="checkbox"' +
                                                    '                                                                                            class="metric-checkbox">' +
                                                    '                                                                    ' + key + ' <a' +
                                                    '                                                                            class="fa fa-question-circle-o"></a></td>' +
                                                    '                                                                <td class="' + key.toLowerCase() + '-score text-red">' + returnData[key] + '</td>' +
                                                    '                                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a' +
                                                    '                                                                        class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a' +
                                                    '                                                                        class="fa fa-search metric-visualise-r"></a>' +
                                                    '                                                                </td>' +
                                                    '                                                            </tr>'

                                            }
                                            rankingbox.find(".recommendation-metrics-table").html(rankingmetricstrs);
                                            // rankingbox.find(".precision-score").text(data.returnData.UpdatePrecisionEvaluator);
                                            // rankingbox.find(".f1-score").text(data.returnData.F1);
                                            // rankingbox.find(".recall-score").text(data.returnData.UpdateRecallEvaluator);
                                            // rankingbox.find(".entropy-score").text(data.returnData.EntropyEvaluator);
                                            // rankingbox.find(".novelty-score").text(data.returnData.NoveltyEvaluator);
                                            // // rankingbox.find(".auc-score").text(data.returnData.AUC);
                                            // // rankingbox.find(".reciprocal-rank-score").text(data.returnData.RR);
                                            // // rankingbox.find(".ndcg-score").text(data.returnData.NDCG);
                                            // // rankingbox.find(".average-precision-score").text(data.returnData.AP);
                                            // rankingbox.find(".relevance-score").text(data.returnData.RelevanceEvaluator);
                                            // rankingbox.find(".itemcoverage-score").text(data.returnData.ItemCoverageEvaluator);
                                            // rankingbox.find(".simplecoverage-score").text(data.returnData.SimpleCoverageEvaluator);
                                            // rankingbox.find(".reccoverage-score").text(data.returnData.RecCoverageEvaluator);
                                            // rankingbox.find(".popularity-score").text(data.returnData.PopularityEvaluator);
                                            // rankingbox.find(".diversity-score").text(data.returnData.DiversityEvaluator);

                                            rankingbox.find(".runtime-log").val(data.extra.logcontent);


                                            rankingbox.find(".runtime-log-path").attr('href', "download?downloadfile=" + data.extra.logpath);
                                            rankingbox.find(".runtime-result-path").attr('href', "download?downloadfile=" + data.extra.resultpath);

                                            // rankingbox.find('.ranking-result').toggle('slow');

                                            if (!rankingbox.find('.ranking-result').is(':visible')) {
                                                rankingbox.find('.ranking-result').show('slow');
                                            }

                                            rankingbox.find(".wait-label").hide();

                                            delete args["operation"];
                                            delete args["predictionmetrics"];
                                            delete args["recommendationmetrics"];

                                            ele.siblings(".configuration-info").children(".ranking-configuration").text(JSON.stringify(args));
                                            comparisonselectionlabelp.html("");
                                        } else if (data.success == false) {
                                            rankingbox.find(".wait-label").hide();
                                            layer.msg(data.error, {anim: 6, icon: 2, time: 2000});
                                        }
                                    },
                                    error: function (xhr, type) {
                                        rankingbox.find(".wait-label").hide();
                                        layer.msg("There is something wrong with your dataset", {
                                            anim: 6,
                                            icon: 2,
                                            time: 2000
                                        });
                                    }
                                });

                                //     setTimeout(function () {
                                //         var data = {
                                //             success: true,
                                //             metrics: {
                                //                 "RR": 0.6002,
                                //                 "RECALL": 0.6067,
                                //                 "Entropy": 20.8719,
                                //                 "NDCG": 0.5382,
                                //                 "AUC": 0.9141,
                                //                 "AP": 0.4436,
                                //                 "PRECISION": 0.3441,
                                //                 "Novelty": 13.8677,
                                //                 'EntropyRank':22.222
                                //             },
                                //             extra: {
                                //                 logpath: 'log/default',
                                //                 resultpath: 'result/filn',
                                //                 logcontent: "18/02/06 00:16:32 INFO DispatcherServlet: FrameworkServlet 'mvc-dispatcher': initialization started\18/02/06 00:16:32 INFO XmlWebApplicationContext: Refreshing WebApplicationContext for namespace 'mvc-dispatcher-servlet': startup date [Tue Feb 06 00:16:32 GMT 2018]; root of context hierarchy\18/02/06 00:16:32 INFO XmlBeanDefinitionReader: Loading XML bean definitions from file [/Library/apache-tomcat-8.0.48/webapps/librec-core/WEB-INF/classes/spring/spring-"
                                //             },
                                //             error: null
                                //         };
                                //         if (data.success == true) {
                                //             rankingbox.find(".average-precision-score").text(data.metrics.PRECISION);
                                //             rankingbox.find(".auc-score").text(data.metrics.AUC);
                                //             rankingbox.find(".reciprocal-rank-score").text(data.metrics.RR);
                                //             rankingbox.find(".recall-score").text(data.metrics.RECALL);
                                //             rankingbox.find(".entropy-score").text(data.metrics.Entropy);
                                //             rankingbox.find(".ndcg-score").text(data.metrics.NDCG);
                                //             rankingbox.find(".ap-score").text(data.metrics.AP);
                                //             rankingbox.find(".novelty-score").text(data.metrics.Novelty);
                                //             rankingbox.find(".entropy-rank-score").text(data.metrics.EntropyRank);
                                //             rankingbox.find(".runtime-log").val(data.extra.logcontent);
                                //             rankingbox.find(".runtime-log-path").attr('href', "download?downloadfile=" + data.extra.logpath);
                                //             rankingbox.find(".runtime-result-path").attr('href', "download?downloadfile=" + data.extra.resultpath);
                                //             // console.log(data.metrics.RR);
                                //             ele.siblings(".configuration-info").children(".ranking-configuration").text(JSON.stringify(args));
                                //
                                //         } else if (data.success == false) {
                                //             layer.msg(data.error, {anim: 2, icon: 6, time: 2000});
                                //         }
                                //         rankingbox.find('.ranking-result').toggle('slow');
                                //         rankingbox.find(".wait-label").hide();
                                //     }, 100);
                                //
                                //
                                var elei = $(this).find('i');
                                if (elei.hasClass("fa-chevron-down")) {
                                    // elei.removeClass("fa-chevron-down")
                                    //     .addClass("fa-chevron-right");
                                } else {
                                    elei.removeClass("fa-chevron-right")
                                        .addClass("fa-chevron-down");
                                }
                            });


                        function getConfigs(configpanel, operation) {

                            var testcasetitle = configpanel.parent().parent().parent().parent().parent().find('.testcase-title').text();
                            var algmethod = configpanel.find('.algmethod').text();
                            var evalmethod = configpanel.find('.evaluation-method').val();


                            var predictionmetrics = configpanel.find('.prediction-metrics').val();
                            var recommendationmetrics = configpanel.find('.recommendation-metrics').val();


                            var trainsetratio = "undefined";
                            var leavetarget = "undefined";
                            var kkcv = "undefined";

                            if (evalmethod != "kcv") {
                                if (evalmethod == "ratio") {
                                    trainsetratio = configpanel.find('.trainset-ratio').val();
                                    if (trainsetratio.trim() == "") {
                                        trainsetratio = 0.8;
                                    } else if (trainsetratio > 1 || trainsetratio < 0) {
                                        layer.msg("give train ratio between 0 and 1", {anim: 6, icon: 2, time: 1000});
                                    }
                                } else if (evalmethod == "loocv") {
                                    leavetarget = configpanel.find('.leave-target').val();
                                }

                            } else {
                                kkcv = configpanel.find('.k-kcv').val();
                                if (kkcv.trim() == "") {
                                    kkcv = 5;
                                } else if (kkcv > 10 || trainsetratio < 1) {
                                    layer.msg("give k of kcv between 1 and 10", {anim: 6, icon: 2, time: 1000});
                                }
                            }


                            var datasettypeele = configpanel.find('.dataset-type');

                            var datasettype = "UIR";
                            if (datasettypeele.is(":checked")) {
                                datasettype = "UIRT";
                            }

                            var dataset = configpanel.find('.dataset-file')[0].files[0];
                            var datasetname = "default";

                            if (dataset != undefined) {
                                if (dataset.name != "") {
                                    datasetname = dataset.name;
                                }
                            }

                            var numbern = configpanel.find('.number-n').val();

                            if (numbern.trim() == "") {
                                numbern = 10;
                            }

                            var learnrate = "undefined";
                            var maximumiteratornumber = "undefined";
                            var factornumber = "undefined";
                            var bolddriver = "undefined";
                            var userregularization = "undefined";
                            var itemregularization = "undefined";
                            var biasregularization = "undefined";


                            if (algmethod == "Matrix-Factorisation") {
                                learnrate = configpanel.find('.learn-rate').val();
                                if (learnrate.trim() == "") {
                                    learnrate = 0.01;
                                } else if (learnrate > 1 || learnrate < 0) {
                                    layer.msg("give learn rate between 0 and 1", {anim: 6, icon: 2, time: 1000});
                                }
                                maximumiteratornumber = configpanel.find('.maximum-iterator-number').val();

                                if (maximumiteratornumber.trim() == "") {
                                    maximumiteratornumber = 10;
                                } else if (maximumiteratornumber > 100 || maximumiteratornumber < 0) {
                                    layer.msg("give iteratornumber between 0 and 100", {anim: 6, icon: 2, time: 1000});
                                }
                                factornumber = configpanel.find('.factor-number').val();
                                if (factornumber.trim() == "") {
                                    factornumber = 10;
                                } else if (factornumber > 100 || userregularization < 0) {
                                    layer.msg("give factor number between 0 and 100", {anim: 6, icon: 2, time: 1000});
                                }
                                bolddriver = false;
                                if (configpanel.find('.factor-number').is("checked")) {
                                    bolddriver = true;
                                }
                                userregularization = configpanel.find('.user-regularization').val();
                                if (userregularization.trim() == "") {
                                    userregularization = 0.01;
                                } else if (userregularization > 1 || userregularization < 0) {
                                    layer.msg("give user regularization between 0 and 1", {
                                        anim: 6,
                                        icon: 2,
                                        time: 1000
                                    });
                                }
                                itemregularization = configpanel.find('.item-regularization').val();
                                if (itemregularization.trim() == "") {
                                    itemregularization = 0.01;
                                } else if (itemregularization > 1 || itemregularization < 0) {
                                    layer.msg("give item regularization between 0 and 1", {
                                        anim: 6,
                                        icon: 2,
                                        time: 1000
                                    });
                                }
                                biasregularization = configpanel.find('.bias-regularization').val();
                                if (biasregularization.trim() == "") {
                                    biasregularization = 0.01;
                                } else if (biasregularization > 1 || biasregularization < 0) {
                                    layer.msg("give bias regularization between 0 and 1", {
                                        anim: 6,
                                        icon: 2,
                                        time: 1000
                                    });
                                }

                            }

                            var simmethod = "undefined";
                            // if (configpanel.find('.similarity-method').is(":visible")) {
                                simmethod = configpanel.find('.similarity-method').val();
                            // }

                            var numneighborhood = "undefined";

                            if (simmethod != "undefined") {
                                numneighborhood = configpanel.find('.number-neighborhood').val();
                                if (numneighborhood.trim() == "") {
                                    numneighborhood = 50;
                                }
                            }
                            var args = {
                                'dataset': datasetname,
                                'datasettype': datasettype,
                                'operation': operation,
                                'testcasetitle': testcasetitle,
                                'algmethod': algmethod,
                                'simmethod': simmethod,
                                'learnrate': learnrate,
                                'maximumiteratornumber': maximumiteratornumber,
                                'factornumber': factornumber,
                                'bolddriver': bolddriver,
                                'userregularization': userregularization,
                                'itemregularization': itemregularization,
                                'biasregularization': biasregularization,
                                'evalmethod': evalmethod,
                                'leavetarget': leavetarget,
                                'trainsetratio': trainsetratio,
                                'kkcv': kkcv,
                                'numneighborhood': numneighborhood,
                                'numbern': numbern,
                                'predictionmetrics': predictionmetrics,
                                'recommendationmetrics': recommendationmetrics
                            };
                            console.log("args:" + JSON.stringify(args));
                            return args;
                        }

                        $(".evaluation-method").change(function () {

                            var ratioextraconfig = $(this).parent().parent().siblings('.ratio-extra-config');
                            var loocvextraconfig = $(this).parent().parent().siblings('.loocv-extra-config');
                            var kcvextraconfig = $(this).parent().parent().siblings('.kcv-extra-config');


                            if ($(this).val() == "ratio") {
                                ratioextraconfig.show();
                                loocvextraconfig.show();
                                kcvextraconfig.hide();
                            } else if ($(this).val() == "loocv") {
                                kcvextraconfig.hide();
                                ratioextraconfig.hide();
                                loocvextraconfig.show();
                            } else if ($(this).val() == "kcv") {
                                ratioextraconfig.hide();
                                kcvextraconfig.show();
                                loocvextraconfig.hide();
                            }
                        });


                        $(".start-evaluation")
                            .click(function () {
                                var ele = $(this).parent();
                                var evalmethod = ele
                                    .siblings(".evalmethod")
                                    .children("select").val();

                                if (evalmethod != "K-Fold Cross-Validation") {
                                    layer.msg('Sorry, only K-Fold Cross-Validation available now',
                                        {
                                            icon: 2,
                                            anim: 6,
                                            time: 1000
                                        });
                                    return false;
                                }

                                ele.siblings(".wait-label").show();

                                var url = "getBasicMetrics";

                                var algmethod = ele.parent().parent().parent().find(".algmethod").text();

                                var extra = ele.siblings(".k-fold-div").find('.k-fold-k').val();

                                // console.log("evalmethod:" + evalmethod);
                                // console.log("extra:" + extra);

                                var args = {
                                    'algmethod': algmethod,
                                    'evalmethod': evalmethod,
                                    'extra': extra
                                };

                                $.post(url, args, function (data) {
                                    // console.log(ele.parent().find(".mae-score").text());
                                    // console.log(data);
                                    // console.log(data.metrics.MAE);
                                    ele.siblings('.evaluation-result').toggle('slow');
                                    ele.siblings(".wait-label").hide();

                                });
                            });

                        $(".my-tab").click(function () {
                            var tabbox = $(this).parent().parent();
                            if (!$(this).hasClass("active")) {
                                tabbox.find('.tab-pane').each(function () {
                                    if ($(this).hasClass("active")) {
                                        $(this).removeClass("active");
                                    }
                                });

                                if ($(this).hasClass("tab1")) {
                                    tabbox.find(".tab1-content").addClass("active");
                                } else if ($(this).hasClass("tab2")) {
                                    tabbox.find(".tab2-content").addClass("active");
                                } else if ($(this).hasClass("tab3")) {
                                    tabbox.find(".tab3-content").addClass("active");
                                }

                                $(this).addClass("active");

                                $(this).siblings('li').each(function () {
                                    if ($(this).hasClass("active")) {
                                        $(this).removeClass("active");
                                    }
                                });
                            }
                        });


                        $(".collapseBtn").click(function () {
                            $(this).parent().parent().next().toggle(1000);
                        });


                        $("#compare-contrast").click(function () {

                            var isselected = false;
                            var isvalid = true;
                            var selectedtestcases = [];
                            var allmetricsselected = [];
                            var configs = "";
                            var notsameconfigmsg = "";

                            $('.testcase-checkbox').each(function () {

                                if ($(this).find("input").is(":checked")) {
                                    isselected = true;

                                    var testcaseid = $(this).find("label").text();
                                    selectedtestcases.push(testcaseid);

                                    var ratingconfig = $('#' + testcaseid + '').find(".rating-configuration").text();
                                    var rankingconfig = $('#' + testcaseid + '').find(".ranking-configuration").text();


                                    if (ratingconfig == "" && rankingconfig == "") {
                                        isvalid = false;
                                    } else {
                                        if (getRealConfigs(testcaseid) == "invalid") {
                                            notsameconfigmsg = testcaseid + "'s rating or ranking should be run to achieve synchronisation";
                                        } else {
                                            configs += getRealConfigs(testcaseid) + "%";
                                        }
                                    }

                                    if (allmetricsselected.length == 0) {
                                        var metricsele = $('#' + testcaseid).find(".metric-checkbox");
                                        metricsele.each(function () {
                                            allmetricsselected.push($(this).parent().text().trim());
                                        });
                                    }
                                    // var data = $('#' + testcaseid + '').find(".rating-configuration").text();
                                    // $.ajax({
                                    //     type: 'POST',
                                    //     url: 'compare',
                                    //     data: {data: "dataaaa..."},
                                    //     dataType: 'json',
                                    //     success: function (data) {
                                    //         console.log(data);
                                    //         layer.open({
                                    //             type: 1,
                                    //             content: data
                                    //         });
                                    //     },
                                    //     error: function (xhr, type) {
                                    //         layer.msg("error", {anim: 6, icon: 2, time: 2000});
                                    //     }
                                    // });

                                }
                            });


                            if (!isselected) {
                                layer.msg('No test case is selected', {icon: 2, anim: 6, time: 1000});
                            }


                            if (isvalid) {
                                // console.log("selectedtestcases:"+selectedtestcases );
                                // console.log("allmetricsselected:" +allmetricsselected );
                                // console.log("configs:" +configs.substring(0, configs.length - 1) );
                                if (notsameconfigmsg != "") {
                                    layer.msg(notsameconfigmsg, {icon: 2, anim: 6, time: 2000});
                                } else {

                                    visualize(selectedtestcases, allmetricsselected, configs.substring(0, configs.length - 1));
                                }
                            } else {
                                layer.msg('you should run the selected test cases first', {
                                    icon: 2,
                                    anim: 6,
                                    time: 1000
                                });
                            }
                        });


                        $("#addtestcase").click(
                            function () {
                                var testcasename = $("#testcasename").val().trim();

                                if (/[^a-zA-Z0-9\-\/]/.test(testcasename)) {
                                    alert('the name should not contain special character');
                                    return false;
                                }
                                if (testcasename == "") {
                                    layer.msg('enter the title !', {icon: 2, anim: 6, time: 1000});
                                    return false;
                                }

                                if (testcaselist.indexOf(testcasename) > -1) {
                                    layer.msg('you cannot create repeated test case', {icon: 2, anim: 6, time: 1000});
                                    return false;
                                }


                                if ($("#sessioncode").text() != "") {
                                    requestWithSession(testcasename, "createTestCase");
                                }


                                $("#closemodal").trigger('click');
                                var testcasebox = $("#testcaseboxlast").next()
                                    .clone(true);
                                testcasebox.find(".testcase-title").text(
                                    testcasename);
                                testcasebox.attr('id', testcasename);
                                $("#topline").after(testcasebox);
                                testcasebox.show('slow');
                                testcaselist.push(testcasename);
                                // console.log("after added (testcaselist):" + testcaselist);
                                $("#menu1").prepend('<li class="' + testcasename + ' testcase-nav"><a href="#' + testcasename + '">' + testcasename + '</a></li>');
                                $("#menu2").prepend('<li class="' + testcasename + ' testcase-checkbox"> <a><div class = "checkbox" ><label><input type = "checkbox">' + testcasename + '</label></div></a></li>');


                                // $(".myselect").popSelect({
                                //     showTitle: false
                                //     // maxAllowed: 4
                                // });

                            });

                        function requestWithSession(params, url) {
                            $.ajax({
                                type: 'POST',
                                url: 'testcase/' + url,
                                data: {"data": params},
                                dataType: 'json',
                                success: function (data) {
                                    console.log("success:" + JSON.stringify(data));
                                    if (data.success == true) {
                                    } else if (data.success == false) {
                                        layer.msg(data.error, {anim: 2, icon: 6, time: 2000});
                                    }

                                },
                                error: function (xhr, type) {
                                    layer.msg("error", {anim: 2, icon: 6, time: 2000});
                                }
                            });
                        }

                        $(".removeBtn").click(function () {
                            var testcasetitle = $(this).parent().siblings(".testcase-title").text();
                            var ele = $(this).parent().parent().parent();
                            layer.open({
                                title: "",
                                content: "Are you sure to remove the test case?",
                                btn: ['yes'],
                                yes: function () {

                                    if ($("#sessioncode").text() != "") {
                                        requestWithSession(testcasetitle, "deleteTestCase");
                                    }

                                    var removedtestcase = testcaselist.splice(testcaselist.indexOf(testcasetitle), 1);
                                    ele.hide(1000);
                                    layer.msg(removedtestcase + ' was removed successfully!', {
                                        icon: 1,
                                        anim: 2,
                                        time: 1000
                                    });
                                    $("#menu1").children('.' + removedtestcase + '').remove();
                                    $("#menu2").children('.' + removedtestcase + '').remove();
                                }
                            });
                        });


                        // $(".metric-trash").click(function () {
                        //     //delete a single metric
                        //     $(this).parent().parent().hide(1000);
                        // });

                        $("body").on("click", ".metric-trash", function () {
                            $(this).parent().parent().hide(1000);
                        });

                        $("body").on("click", ".metric-visualise", function () {
                            // <canvas id="precison"></canvas>
                            var currenttestcasetitle = $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().siblings('.testcase-title-sub').text();
                            var currentmetric = $(this).parent().parent().find('.metric-checkbox').parent().text().trim();
                            previsualize(currenttestcasetitle, currentmetric);
                        });
                        // $(".metric-visualise").click(function () {
                        //     // <canvas id="precison"></canvas>
                        //     var currenttestcasetitle = $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().siblings('.testcase-title-sub').text();
                        //     var currentmetric = $(this).parent().parent().find('.metric-checkbox').parent().text().trim();
                        //     previsualize(currenttestcasetitle, currentmetric);
                        //
                        // });

                        $("body").on("click", ".metric-visualise-r", function () {
                            // <canvas id="precison"></canvas>
                            var currenttestcasetitle = $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().siblings('.testcase-title-sub').text();
                            var currentmetric = $(this).parent().parent().find('.metric-checkbox').parent().text().trim();
                            previsualize(currenttestcasetitle, currentmetric);

                        });

                        // $(".metric-visualise-r").click(function () {
                        //     // <canvas id="precison"></canvas>
                        //     var currenttestcasetitle = $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().siblings('.testcase-title-sub').text();
                        //     var currentmetric = $(this).parent().parent().find('.metric-checkbox').parent().text().trim();
                        //     previsualize(currenttestcasetitle, currentmetric);
                        //
                        // });

                        $('[data-toggle="tooltip"]').tooltip();

                        $("body").on("change", ".metric-checkbox", function () {
                            var randomlabellist = ['label-danger', 'label-success', 'label-info', 'label-primary', 'label-warning', 'label-default'];
                            var currenttestcasebox = $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().parent();

                            if (currenttestcasebox.find(".comparison-selection-label").html() == undefined) {
                                currenttestcasebox = currenttestcasebox.parent();
                            }
                            var comparisonselectionlabelp = currenttestcasebox.find(".comparison-selection-label").children("p");
                            var currentMetric = $(this).parent().text().trim();
                            // console.log("currentMetric:" + currentMetric);
                            if (!$(this).is(":checked")) {
                                comparisonselectionlabelp.find('.' + currentMetric).remove();
                            } else {
                                var randomValue = Math.floor(Math.random() * randomlabellist.length);
                                comparisonselectionlabelp.append('<span class="' + currentMetric + ' label ' + randomlabellist[Math.floor(Math.random() * randomlabellist.length)] + '">' + currentMetric + '</span>');
                            }

                        });

                        // $(".metric-checkbox").change(function () {
                        //
                        //     var randomlabellist = ['label-danger', 'label-success', 'label-info', 'label-primary', 'label-warning', 'label-default'];
                        //     var currenttestcasebox = $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().parent().parent();
                        //
                        //     if (currenttestcasebox.find(".comparison-selection-label").html() == undefined) {
                        //         currenttestcasebox = currenttestcasebox.parent();
                        //     }
                        //     var comparisonselectionlabelp = currenttestcasebox.find(".comparison-selection-label").children("p");
                        //     var currentMetric = $(this).parent().text().trim();
                        //     // console.log("currentMetric:" + currentMetric);
                        //     if (!$(this).is(":checked")) {
                        //         comparisonselectionlabelp.find('.' + currentMetric).remove();
                        //     } else {
                        //         var randomValue = Math.floor(Math.random() * randomlabellist.length);
                        //         comparisonselectionlabelp.append('<span class="' + currentMetric + ' label ' + randomlabellist[Math.floor(Math.random() * randomlabellist.length)] + '">' + currentMetric + '</span>');
                        //     }
                        // });


                        $(".comparison-selection-visualize").click(function () {
                            var allmetricsselected = new Array();
                            var spans = $(this).siblings('.comparison-selection-label').find('span');
                            if (spans != null) {
                                spans.each(function () {
                                    allmetricsselected.push($(this).text());
                                });
                            }
                            var currenttestcasetitle = $(this).parent().parent().parent().find(".testcase-title").text();
                            if (allmetricsselected.length != 0) {
                                previsualize(currenttestcasetitle, allmetricsselected);
                            } else {
                                layer.msg("No metrics selected", {icon: 2, anim: 6, time: 1000});
                            }
                        });
                    });

                    $("#simulate-contrast").click(function () {
                        var allmetricsselected = ['MAE', 'MPE', 'MSE', 'AUC'];
                        var selectedtestcases = ['default', 'test2', 'test1'];
                        var configs = "";
                        for (var i = 0; i < selectedtestcases.length; i++) {
                            var getConfig = {
                                "dataset": "datatset" + i,
                                "operation": "rating",
                                "testcasetitle": selectedtestcases[i],
                                "algmethod": "Item-based",
                                "simmethod": "PCCSimilarity",
                                "evalmethod": "Repeated Random Sub-Sampling",
                                "numneighborhood": i,
                                "numbern": 10
                            };
                            if (i == selectedtestcases.length - 1) {
                                configs += JSON.stringify(getConfig);
                            } else {
                                configs += JSON.stringify(getConfig) + "%";
                            }
                        }

                        console.log("selectedtestcases:" + selectedtestcases);
                        console.log("allmetricsselected:" + allmetricsselected);
                        console.log("configs:" + configs.substring(0, configs.length - 1));

                        // console.log(configs);
                        visualize(selectedtestcases, allmetricsselected, configs);
                    });

                    // $("body").on('click', '.dataset-file', function () {
                    $(".dataset-file").change(function () {

                        var testcasetitle = $(this).parent().parent().parent().parent().parent().parent().parent().find('.testcase-title').text();

                        var file = $(this)[0].files[0];

                        setTimeout(function () {
                            var reader = new FileReader();
                            reader.onload = function (progressEvent) {
                                // By lines
                                var lines = this.result.split('');
                                for (var line = 0; line < lines.length; line++) {

                                    if (/[a-zA-Z]/.test(lines[line])) {
                                        layer.msg("the file you uploaded may have incorrect format!", {
                                            anim: 6,
                                            icon: 2,
                                            time: 2000
                                        });
                                        break;
                                    }

                                }
                            };
                            reader.readAsText(file);
                        }, 2000);

                        console.log(file);
                        var form = new FormData();

                        form.append("file", file);
                        form.append("testcasetitle", testcasetitle);


                        if (file.name.endsWith('arff') || file.name.endsWith('txt') || file.name.endsWith('csv') || file.name.endsWith('data')) {
                            var loadindex = layer.load(1);
                            $.ajax({
                                url: 'upload',
                                data: form,
                                dataType: 'text',
                                processData: false,
                                contentType: false,
                                type: 'POST',
                                success: function (data) {
                                    console.log(data);
                                    layer.close(loadindex);
                                    layer.msg(file.name + " uploaded!", {anim: 1, icon: 1, time: 1000});

                                }, error: function () {
                                    layer.msg("maybe the file is too big", {anim: 6, icon: 2, time: 1000});
                                    layer.close(loadindex);
                                }
                            });
                        } else {
                            $(this).val("");
                            layer.msg("the file type is incorrect!", {anim: 6, icon: 2, time: 1000});
                        }


                        // if (!window.File || !window.FileReader || !window.FileList || !window.Blob) {
                        //     alert('The File APIs are not fully supported in this browser.');
                        //     return;
                        // }
                        // input = $(this);
                        // if (!input) {
                        //     alert("Um, couldn't find the fileinput element.");
                        // }
                        // else if (!input.files) {
                        //     alert("This browser doesn't seem to support the `files` property of file inputs.");
                        // }
                        // else if (!input.files[0]) {
                        //     alert("Please select a file before clicking 'Load'");
                        // }
                        // else {
                        //     file = input.files[0];
                        //     fr = new FileReader();
                        //     fr.onload = receivedText;
                        //     //fr.readAsText(file);
                        //     fr.readAsDataURL(file);
                        // }

                    });


                    function visualize(selectedtestcases, allmetricsselected, configs) {
                        layer.open({
                            title: "Reference Panel",
                            type: 2,
                            content: "referenceiframe",
                            btn: ['Cancel'],
                            anim: 2,
                            maxmin: true,
                            zIndex: layer.zIndex,
                            closeBtn: 1,
                            shade: 0,
                            area: ['400px', '500px'],
                            offset: ['50px', '50px'],
                            success: function (layero, index) {
                                layer.setTop(layero);
                                var body = layer.getChildFrame('body', index);
                                body.find("#selectedtestcase").val(selectedtestcases);
                                body.find("#selectedmetrics").val(allmetricsselected);
                                body.find("#reference-panel").text(allmetricsselected);
                                body.find("#testcase-panel").text(selectedtestcases);
                                body.find("#configs").val(configs);
                            },
                            cancel: function () {
                                layer.closeAll();
                            }
                        });

                        layer.open({
                            title: "Compare & Contrast",
                            type: 2,
                            content: "iframe",
                            btn: ['Cancel'],
                            resize: true,
                            zIndex: layer.zIndex,
                            anim: 2,
                            maxmin: true,
                            closeBtn: 1,
                            shade: 0,
                            offset: ['50px', '500px'],
                            area: ['600px', '600px'],
                            yes: function (index) {
                                layer.close(index);
                            },
                            success: function (layero, index) {
                                layer.setTop(layero);
                                var body = layer.getChildFrame('body', index);
                                body.find("#selectedtestcase").val(selectedtestcases);
                                body.find("#selectedmetrics").val(allmetricsselected);
                                body.find("#configs").val(configs);
                            },
                            cancel: function () {
                                layer.closeAll();
                            }
                        });
                    }


                    function previsualize(currenttestcasetitle, allmetricsselected) {

                        console.log("currenttestcasetitle: " + currenttestcasetitle);
                        console.log("allmetricsselected: " + allmetricsselected);

                        var testcaseselection = '<div class="box-body"><div class="form-group"><label>Choose test cases to compare</label>';
                        for (var i = 0; i < testcaselist.length; i++) {
                            if (testcaselist[i] == currenttestcasetitle) {
                                testcaseselection += '<div class="checkbox text-red"><label><input type="checkbox" class="metric-checkbox" checked disabled class="comparison-test-case">' + testcaselist[i] + '</label></div>';
                            } else {
                                testcaseselection += '<div class="checkbox"><label><input type="checkbox" class="metric-checkbox comparison-test-case">' + testcaselist[i] + '</label></div>';
                            }
                        }
                        testcaseselection += '</div></div>';

                        layer.open({
                            title: "Compare & Contrast",
                            type: 1,
                            content: testcaseselection,
                            btn: ['Confirm'],
                            anim: 2,
                            closeBtn: 1,
                            shadeClose: true,
                            area: ['300px', '400px'],
                            yes: function (index) {
                                var isvalid = true;
                                var selectedtestcases = [];
                                var configs = "";
                                var notsameconfigmsg = "";
                                selectedtestcases.push(currenttestcasetitle);

                                if (getRealConfigs(currenttestcasetitle) == "invalid") {
                                    notsameconfigmsg = currenttestcasetitle + "'s rating or ranking should be run to achieve synchronisation";
                                } else {
                                    configs += getRealConfigs(currenttestcasetitle) + "%";
                                }

                                $(".comparison-test-case").each(function () {
                                    if ($(this).is(":checked")) {
                                        var usecasetitle = $(this).parent().text();

                                        selectedtestcases.push(usecasetitle);

                                        if (getRealConfigs(usecasetitle) == "") {
                                            isvalid = false;
                                        } else {
                                            if (getRealConfigs(usecasetitle) == "invalid") {
                                                notsameconfigmsg = usecasetitle + "'s rating or ranking should be run to achieve synchronisation";
                                            } else {
                                                configs += getRealConfigs(usecasetitle) + "%";
                                            }

                                        }
                                        // console.log("selected test cases are: " + $(this).val());

                                    }

                                });

                                if (isvalid) {
                                    console.log("notsameconfigmsg:" + notsameconfigmsg);
                                    if (notsameconfigmsg != "") {
                                        layer.msg(notsameconfigmsg, {icon: 2, anim: 6, time: 2000});
                                    } else {
                                        visualize(selectedtestcases, allmetricsselected, configs.substring(0, configs.length - 1));
                                    }
                                } else {
                                    layer.msg('you should run the selected test cases first', {
                                        icon: 2,
                                        anim: 6,
                                        time: 1000
                                    });
                                }
                                console.log("selectedtestcases:" + selectedtestcases);
                                console.log("configs:" + configs);
                                layer.close(index);

                            }
                        });
                    }

                    function getRealConfigs(testcasetitle) {
                        var ratingconfig = $('#' + testcasetitle + '').find(".rating-configuration").text();
                        var rankingconfig = $('#' + testcasetitle + '').find(".ranking-configuration").text();

                        if (ratingconfig != "" && rankingconfig != "") {
                            var ratingconfigobj = $.parseJSON(ratingconfig);
                            delete ratingconfigobj['operation'];
                            delete ratingconfigobj['predictionmetrics'];
                            delete ratingconfigobj['predictionmetrics%5B%5D'];
                            delete ratingconfigobj['predictionmetrics'];
                            delete ratingconfigobj['recommendationmetrics%5B%5D'];

                            var rankingconfigobj = $.parseJSON(rankingconfig);
                            delete rankingconfigobj['operation'];
                            delete rankingconfigobj['predictionmetrics'];
                            delete rankingconfigobj['predictionmetrics%5B%5D'];
                            delete rankingconfigobj['predictionmetrics'];
                            delete rankingconfigobj['recommendationmetrics%5B%5D'];
                            if (JSON.stringify(ratingconfigobj) !== JSON.stringify(rankingconfigobj)) {
                                console.log("JSON.stringify(ratingconfigobj): " + JSON.stringify(ratingconfigobj));
                                return "invalid";
                            }else{
                                ratingconfig= JSON.stringify(ratingconfigobj);
                                rankingconfig= JSON.stringify(rankingconfigobj);
                            }
                        }

                        if (ratingconfig != "") {
                            return ratingconfig
                        }

                        return rankingconfig;

                    }


                    // function initializeSingleComparisonChart(data) {
                    //     console.log(data);
                    //     $("#single-compare-box").append('  <label class="compasion-title"></label>' +
                    //         '    <canvas id="single-chart1"></canvas>' +
                    //         '    <canvas id="single-chart2"></canvas>' +
                    //         '    <canvas id="single-chart3"></canvas>');
                    //     var singlechart1 = document.getElementById('single-chart1').getContext('2d');
                    //     var singlechart2 = document.getElementById('single-chart2').getContext('2d');
                    //     var singlechart3 = document.getElementById('single-chart3').getContext('2d');
                    //     var chart = new Chart(singlechart1, {
                    //         type: 'bar',
                    //         data: {
                    //             labels: ["TestCase1", "TestCase2", "TestCase3", "TestCase4", "TestCase5"],
                    //             datasets: [{
                    //                 label: "MAE",
                    //                 backgroundColor: 'rgb(255, 99, 132)',
                    //                 borderColor: 'rgb(255, 99, 132)',
                    //                 data: [0.6288, 0.6122, 0.6088, 0.6129, 0.5988]
                    //             }]
                    //         },
                    //         options: {}
                    //     });
                    //     var chart = new Chart(singlechart2, {
                    //         type: 'bar',
                    //         data: {
                    //             labels: ["TestCase1", "TestCase2", "TestCase3", "TestCase4", "TestCase5"],
                    //             datasets: [{
                    //                 label: "MAE",
                    //                 backgroundColor: 'rgb(155, 99, 132)',
                    //                 borderColor: 'rgb(155, 99, 132)',
                    //                 data: [0.6288, 0.6122, 0.6088, 0.6129, 0.5988]
                    //             }]
                    //         },
                    //         // Configuration options go here
                    //         options: {}
                    //     });
                    //     var chart = new Chart(singlechart3, {
                    //         type: 'bar',
                    //         data: {
                    //             labels: ["TestCase1"],
                    //             datasets: [{
                    //                 label: "MAE",
                    //                 backgroundColor: 'rgb(255, 199, 132)',
                    //                 borderColor: 'rgb(255, 199, 132)',
                    //                 data: [0.6288]
                    //             }]
                    //         },
                    //         // Configuration options go here
                    //         options: {}
                    //     });
                    // }
                    // initializeSingleComparisonChart("dassa");
                    // var contrastpanel = layer.open({
                    //     title: "Compare & Contrast",
                    //     type: 1,
                    //     content: $("#single-compare-box"),
                    //     btn: ['Cancel'],
                    //     resize: true,
                    //     anim: 2,
                    //     maxmin: true,
                    //     closeBtn: 1,
                    //     scrollBar: false,
                    //     area: ['600px', '700px'],
                    //     yes: function (index) {
                    //         layer.close(index);
                    //         $("#single-compare-box").empty();
                    //     }, cancel: function (index) {
                    //         $("#single-compare-box").empty();
                    //     }
                    // });

                    // layer.full(contrastpanel);
                    // layer.open({
                    //     title: "Test Case Reference Panel",
                    //     type: 1,
                    //     content: "<h1>This is Reference Panel for test case configuration</h1>",
                    //     btn: ['Confirm'],
                    //     anim: 2,
                    //     closeBtn: 1,
                    //     area: ['300px', '400px'],
                    //     yes: function (index) {
                    //
                    //     }
                    // });

                    //    alert($(".fluid2").attr("ng-controller"));
                    //    <div ng-include="'testcase.html'"></div>
                </script>
</body>
</html>