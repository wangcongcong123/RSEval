<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/fbicons/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/plugins/layui/css/layui.css">
</head>

<body>


<input type="text" hidden id="selectedtestcase">
<input type="text" hidden id="selectedmetrics">
<input type="text" hidden id="configs">

<%--common configuration panel--%>
<br>
<p class="text-bold">Visualization for metrics: <span class="text-green" id="reference-panel" style="word-wrap: break-word;"></span></p>
<p class="text-bold">For test cases: <span id="testcase-panel" class="text-red" style="word-wrap: break-word;"></span></p>
<br>

<div class="box box-success">
    <div class="box-header">
        <h3 class="box-title">Common Configurations</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body no-padding">
        <table class="table table-condensed">
            <tbody class="common-config-tbody">

            <tr>
                <th>Attribute</th>
                <th>Config</th>
            </tr>
            <%--<tr>--%>
            <%--<td class="common-attribute">Algorithm</td>--%>
            <%--<td class="common-config">User-based</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
            <%--<td class="common-attribute">Dataset</td>--%>
            <%--<td class="common-config">default</td>--%>
            <%--</tr>--%>
            </tbody>
        </table>
    </div>
</div>

<%--different configuration panel--%>
<div class="box box-info">
    <div class="box-header">
        <h3 class="box-title">Different Configurations</h3>
    </div>
    <div class="box-body no-padding">
        <table class="table table-condensed">
            <tbody class="different-config-tbody">

            <tr class="different-config-theader">
                <th>Attribute</th>
                <%--<th>testcase1</th>--%>
                <%--<th>testcase2</th>--%>
            </tr>

            <%--<tr>--%>
            <%--<td class="different-attribute">Similarity</td>--%>
            <%--<td class="testcase-config">PCC</td>--%>
            <%--<td class="testcase-config">Cos</td>--%>
            <%--</tr>--%>


            </tbody>
        </table>
    </div>
</div>


<script src="${pageContext.request.contextPath}/static/asserts/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/plugins/layui/layui.js"></script>


<script>

    layui.use('layer', function () {

        setTimeout(function () {
            var configs = $("#configs").val();
            var commonconfigs = {};
            var differentconfigs = {};
            // var configsarray=[];
            var configsarray = configs.split("%");
            // if(configs.indexOf('%')==-1){
            // }else{
            //     configsarray=[configs];
            // }

            var firstconfig = $.parseJSON(configsarray[0]);
            for (var key in firstconfig) {
                if (configsarray.length == 1) {
                    commonconfigs[key] = [firstconfig[key]];
                }
                if (key == "sessionCode") {
                    continue;
                }

                //start from the second one
                for (var i = 1; i < configsarray.length; i++) {
                    var nextconfig = $.parseJSON(configsarray[i]);
                    if (nextconfig[key] == firstconfig[key]) {
                        if (!(key in commonconfigs) && i == 1) {
                            commonconfigs[key] = [firstconfig[key]];
                        }
                        if (!(key in commonconfigs) && i != 1) {
                            var tempconfig = differentconfigs[key];
                            tempconfig.push(nextconfig[key]);
                            differentconfigs[key] = tempconfig;
                        }
                    } else {
                        if (!(key in differentconfigs)) {
                            if (key in commonconfigs) {
                                var tempconfig = commonconfigs[key];
                                for (var j = 1; j < i; j++) {
                                    tempconfig.push(tempconfig[0]);
                                }
                                tempconfig.push(nextconfig[key]);
                                differentconfigs[key] = tempconfig;
                                delete commonconfigs[key];
                            } else {
                                differentconfigs[key] = [firstconfig[key], nextconfig[key]];
                            }
                        } else {
                            var tempconfig = differentconfigs[key];
                            tempconfig.push(nextconfig[key]);
                            differentconfigs[key] = tempconfig;
                        }
                    }
                }
            }


            for (key in commonconfigs) {
                if (commonconfigs[key][0] != "undefined") {
                    $(".common-config-tbody").append(' <tr>' +
                        '                <td class="common-attribute">' + key + '</td>' +
                        '                <td class="common-config">' + commonconfigs[key][0] + '</td>' +
                        '            </tr>');
                }
            }

            for (key in differentconfigs) {
                if (key == 'testcasetitle') {
                    differentconfigs[key].forEach(function (element) {
                        $(".different-config-theader").append('<th>' + element + '</th>');
                    });
                } else {
                    var trele = '<tr><td class="different-attribute text-orange">' + key + '</td>';
                    differentconfigs[key].forEach(function (element) {
                        if(element=="undefined"||key=="predictionmetrics"||key=="recommendationmetrics"){
                            trele += '<td class="testcase-config text-red"></td>';
                        }else{
                            trele += '<td class="testcase-config text-red">' + element + '</td>';
                        }
                    });
                    trele += '</tr>';
                    $(".different-config-tbody").append(trele);
                }
            }
        }, 500);

        // var layer = layui.layer;
        var index = parent.layer.getFrameIndex(window.name);
        $('.add').on('click', function () {
            $('body').append('insert data insert datainsert data insert datainsert data insert data');
            parent.layer.iframeAuto(index);
        });

        $('.prompt').on('click', function () {
            parent.layer.msg('Hi, man', {shade: 0.3})
        });

        $('.pass').on('click', function () {
            parent.$('.click-me-hide').text('I have been changed');
            console.log("");
            parent.layer.tips('Look here', '.click-me-hide', {time: 5000});
            parent.layer.close(index);
        });

        $('.close').click(function () {
            var val = $('#name').val();
            if (val === '') {
                parent.layer.msg('fill in');
                return;
            }
            parent.layer.msg('you passed it to the parent [ ' + val + ' ]');
            parent.layer.close(index);
        });


    });

</script>
</body>
</html>