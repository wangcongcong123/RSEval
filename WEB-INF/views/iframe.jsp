<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/asserts/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/asserts/css/AdminLTE.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/asserts/fbicons/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/asserts/css/skins/_all-skins.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/asserts/plugins/layui/css/layui.css">
</head>
<body>

<input type="text" hidden id="selectedtestcase">
<input type="text" hidden id="selectedmetrics">
<input type="text" hidden id="configs">

<!-- <button class="printvalue btn btn-success">click here</button> -->

<div id="single-compare-box" style="padding: 10px;"></div>

<script
        src="${pageContext.request.contextPath}/static/asserts/jquery.min.js"></script>
<script
        src="${pageContext.request.contextPath}/static/asserts/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/static/asserts/js/scripts.js"></script>
<script
        src="${pageContext.request.contextPath}/static/asserts/plugins/layui/layui.js"></script>
<script
        src="${pageContext.request.contextPath}/static/asserts/plugins/Chart.bundle.min.js"></script>

<script>
    layui.use('layer', function () {
        var layer = layui.layer;
        var index = parent.layer.getFrameIndex(window.name);
        setTimeout(function () {

            console.log("iframe-selectedtestcase: "
                + $("#selectedtestcase").val());
            console.log("iframe-selectedmetrics: "
                + $("#selectedmetrics").val());

            var splitusecases = $("#selectedtestcase").val().split(",");

            var splitmetrics = $("#selectedmetrics").val().split(",");

            var chartdata = {};

            splitmetrics.forEach(function (metric) {
                var data = {};
                var isvalid = true;
                splitusecases.forEach(function (usecase) {
                    data[usecase] = parent.$('#' + usecase).find(
                        '.' + metric.toLowerCase() + '-score').text();
                    if (data[usecase] == "") {
                        isvalid = false;
                    }
                });
                if (isvalid) {
                    chartdata[metric] = data;
                } else {
                    chartdata[metric] = "invalid";
                }

            });
            console.log(chartdata);
            initializeSingleComparisonChart(chartdata);
        }, 500);

    });

    function initializeSingleComparisonChart(chartdata) {

        for (metric in chartdata) {
            if (chartdata[metric] != "invalid") {
                $("#single-compare-box").append(
                    '<canvas id="' + metric + '"></canvas><br>');
                var singlechart = document.getElementById(metric).getContext(
                    '2d');

                var labels = [];
                var data = [];
                var testcases = chartdata[metric];
                for (testcase in testcases) {
                    labels.push(testcase);
                    data.push(testcases[testcase]);
                }

                console.log("labels:"+labels);
                console.log("data:"+data);

                var chart = new Chart(singlechart, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: metric,
                            backgroundColor: 'rgb(255, 99, 132)',
                            borderColor: 'rgb(255, 99, 132)',
                            data: data
                        }]
                    },
                    options: {   scales:
                            {
                                xAxes: [{
                                    display: false
                                }]
                            }}
                });
                //
            }
            // chart.type= 'bar';
            // chart.update();

        }
        // $("#single-compare-box").append('<canvas id="single-chart1"></canvas>' +
        //     '    <canvas id="single-chart2"></canvas>' +
        //     '    <canvas id="single-chart3"></canvas>');

        // var singlechart2 = document.getElementById('single-chart2').getContext('2d');
        // var singlechart3 = document.getElementById('single-chart3').getContext('2d');
        //
        // var chart = new Chart(singlechart1, {
        //     type: 'bar',
        //     data: {
        //         labels: ["TestCase1", "TestCase2", "TestCase3", "TestCase4", "TestCase5"],
        //         datasets: [{
        //             label: "MAE",
        //             backgroundColor: 'rgb(255, 99, 132)',
        //             borderColor: 'rgb(255, 99, 132)',
        //             data: [0.6288, 0.6122, 0.6088, 0.6129, 0.5988]
        //         }]
        //     },
        //     options: {}
        // });
        //
        //
        // var chart = new Chart(singlechart2, {
        //     type: 'bar',
        //     data: {
        //         labels: ["TestCase1", "TestCase2", "TestCase3", "TestCase4", "TestCase5"],
        //         datasets: [{
        //             label: "MAE",
        //             backgroundColor: 'rgb(155, 99, 132)',
        //             borderColor: 'rgb(155, 99, 132)',
        //             data: [0.6288, 0.6122, 0.6088, 0.6129, 0.5988]
        //         }]
        //     },
        //     options: {}
        // });
        //
        //
        //
        //
        // var chart = new Chart(singlechart3, {
        //     type: 'bar',
        //     data: {
        //         labels: ["TestCase1"],
        //         datasets: [{
        //             label: "MAE",
        //             backgroundColor: 'rgb(255, 199, 132)',
        //             borderColor: 'rgb(255, 199, 132)',
        //             data: [0.6288]
        //         }]
        //     },
        //     options: {}
        // });
    }

    // var index = parent.layer.getFrameIndex(window.name);
    // $('.add').on('click', function(){
    //     $('body').append('insert data insert datainsert data insert datainsert data insert data');
    //     parent.layer.iframeAuto(index);
    // });
    //
    // $('.prompt').on('click', function(){
    //     parent.layer.msg('Hi, man', {shade: 0.3})
    // });
    //
    // $('.pass').on('click', function(){
    //     parent.$('.click-me-hide').text('I have been changed');
    //     console.log("");
    //     parent.layer.tips('Look here', '.click-me-hide', {time: 5000});
    //     parent.layer.close(index);
    // });
    //
    // $('.close').click(function(){
    //     var val = $('#name').val();
    //     if(val === ''){
    //         parent.layer.msg('fill in');
    //         return;
    //     }
    //     parent.layer.msg('you passed it to the parent [ ' +val + ' ]');
    //     parent.layer.close(index);
    // });
</script>
</body>
</html>