
layui.use('layer', function () {
    var layer = layui.layer;

    // $("#pushconfirm").click(function () {
    //
    // var uniquecode = $("#pushuniquecode").val();
    // if (uniquecode == "") {
    // layer.msg('enter the coe !', {icon: 2, anim: 6, time:
    // 1000});
    // return false;
    // }
    // console.log("unique code is : " + uniquecode);
    // //TODO ajax goes here
    //
    // // var args = {'name':'congcong'};
    // $.post("checkJSON", args, function(data){
    // console.log(data);
    // $("#closepushmodal").trigger('click');
    // /* for(var i = 0; i < data.length; i++){
    // var id = data[i].id;
    // var lastName = data[i].lastName;
    // alert(id + ": " + lastName);
    // } */
    // });
    //
    // });

    // alert($("#pushuniquecode").val());

    var testcaselist = ['default'];

    $("#pullconfirm").click(function () {

        var uniquecode = $("#pulluniquecode").val();

        if (uniquecode == "") {
            layer.msg('enter the coe !', {
                icon: 2,
                anim: 6,
                time: 1000
            });
            return false;
        }
        console.log("unique code is : " + uniquecode);
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
            $(this).parent().parent().parent().siblings(
                '.algmethod').text($(this).val());
        });


    $(".rating").click(
        function () {


            var algmethod = $(this).parent().parent().parent()
                .siblings('.algmethod').text();
            console.log("algmethod: " + algmethod);

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
            // if (rankingbox.find(".runtime-log").val()!=""){
            //     rankingbox.find('.ranking-result').toggle('slow');
            //     return false;
            // }
            ratingbox.toggle('slow');
            ratingbox.find(".wait-label").show();
            var args = getConfigs($(this).parent().parent().parent().parent(), 'rating');
            $(this).parent().parent().siblings(".configuration-info").children(".rating-configuration").text(JSON.stringify(args));
            console.log(args);
            var ele = $(this).find("i");

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
                        // console.log(data.metrics.MAE);

                        ratingbox.find(".mae-score").text(data.metrics.MAE);
                        ratingbox.find(".mpe-score").text(data.metrics.MPE);
                        ratingbox.find(".mse-score").text(data.metrics.MSE);
                        ratingbox.find(".rmse-score").text(data.metrics.RMSE);
                        ratingbox.find(".runtime-log").val(data.extra.logcontent);
                        ratingbox.find(".runtime-log-path").attr('href', "download?downloadfile=" + data.extra.logpath);
                        ratingbox.find(".runtime-result-path").attr('href', "download?downloadfile=" + data.extra.resultpath);
                        ratingbox.find('.rating-result').toggle('slow');
                        ratingbox.find(".wait-label").hide();

                    } else if (data.success == false) {
                        layer.msg(data.error, {anim: 2, icon: 6, time: 2000});
                    }


                },
                error: function (xhr, type) {
                    layer.msg("error", {anim: 2, icon: 6, time: 2000});
                }
            });
            //
            //     setTimeout(function (args2) {
            //         var data = {
            //             success: true,
            //             metrics: {MAE: 0.6288, MPE: 0.9642, RMSE: 0.8221, MSE: 0.6759},
            //             extra: {
            //                 logcontent: "log...\n this is log content",
            //                 logpath: "log/rating-default",
            //                 resultpath: "result/filmtrust/rating-userknn-output/userknn"
            //             },
            //             error: null
            //         };
            //         console.log(data);
            //
            //         if (data.success == true) {
            //
            //
            //             ratingbox.find(".mae-score").text(data.metrics.MAE);
            //             ratingbox.find(".mpe-score").text(data.metrics.MPE);
            //             ratingbox.find(".mse-score").text(data.metrics.MSE);
            //             ratingbox.find(".rmse-score").text(data.metrics.RMSE);
            //             ratingbox.find(".runtime-log").val(data.extra.logcontent);
            //             ratingbox.find(".runtime-log-path").attr('href', "download?downloadfile=" + data.extra.logpath);
            //             ratingbox.find(".runtime-result-path").attr('href', "download?downloadfile=" + data.extra.resultpath);
            //
            //             console.log(data.metrics.MAE);
            //
            //         } else if (data.success == false) {
            //             layer.msg(data.error, {anim: 2, icon: 6, time: 2000});
            //         }
            //
            //
            //         ratingbox.find('.rating-result').toggle('slow');
            //         ratingbox.find(".wait-label").hide();
            //
            //
            //     }, 1000);
            //
            //
            if (ele.hasClass("fa-chevron-down")) {
                ele.removeClass("fa-chevron-down")
                    .addClass("fa-chevron-right");
            } else {
                ele.removeClass("fa-chevron-right")
                    .addClass("fa-chevron-down");
            }
        });


    function getConfigs(configpanel, operation) {
        var testcasetitle = configpanel.parent().parent().parent().parent().parent().find('.testcase-title').text();
        var algmethod = configpanel.find('.algmethod').text();
        var evalmethod = configpanel.find('.evaluation-method').val();
        var simmethod = configpanel.find('.similarity-method').val();
        var numneighborhood = configpanel.find('.number-neighborhood').val();
        var numbern = configpanel.find('.number-n').val();

        var args = {
            'operation': operation,
            'testcasetitle': testcasetitle,
            'algmethod': algmethod,
            'simmethod': simmethod,
            'evalmethod': evalmethod,
            'numneighborhood': numneighborhood,
            'numbern': numbern
        };

        return args;

    }

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
            rankingbox.toggle('slow');
            rankingbox.find(".wait-label").show();

            var ele = $(this).find("i");

            var args = getConfigs($(this).parent().parent().parent().parent(), 'ranking');
            console.log(args);
            $(this).parent().parent().siblings(".configuration-info").children(".ranking-configuration").text(JSON.stringify(args));

            var ele = $(this).find("i");

            $.ajax({
                type: 'POST',
                url: 'evaluate',
                data: args,
                dataType: 'json',
                success: function (data) {

                    if (data.success == true) {
                        rankingbox.find(".average-precision-score").text(data.metrics.PRECISION);
                        rankingbox.find(".auc-score").text(data.metrics.AUC);
                        rankingbox.find(".RR-score").text(data.metrics.RR);
                        rankingbox.find(".recall-score").text(data.metrics.RECALL);
                        rankingbox.find(".entropy-score").text(data.metrics.Entropy);
                        rankingbox.find(".ndcg-score").text(data.metrics.NDCG);
                        rankingbox.find(".ap-score").text(data.metrics.AP);
                        rankingbox.find(".novelty-score").text(data.metrics.Novelty);
                        rankingbox.find(".runtime-log").val(data.extra.logcontent);
                        rankingbox.find(".runtime-log-path").attr('href', "download?downloadfile=" + data.extra.logpath);
                        rankingbox.find(".runtime-result-path").attr('href', "download?downloadfile=" + data.extra.resultpath);
                        rankingbox.find('.ranking-result').toggle('slow');
                        rankingbox.find(".wait-label").hide();
                    } else if (data.success == false) {
                        layer.msg(data.error, {anim: 2, icon: 6, time: 2000});
                    }

                },
                error: function (xhr, type) {
                    layer.msg("error", {anim: 2, icon: 6, time: 2000});
                }
            });

            // setTimeout(function () {
            //
            //     var data = {
            //         success: true,
            //         metrics: {
            //             "RR": 0.6002,
            //             "RECALL": 0.6067,
            //             "Entropy": 20.8719,
            //             "NDCG": 0.5382,
            //             "AUC": 0.9141,
            //             "AP": 0.4436,
            //             "PRECISION": 0.3441,
            //             "Novelty": 13.8677
            //         },
            //         extra: {
            //             logpath: 'log/default',
            //             resultpath: 'result/filn\n',
            //             logcontent: "18/02/06 00:16:32 INFO DispatcherServlet: FrameworkServlet 'mvc-dispatcher': initialization started\\n18/02/06 00:16:32 INFO XmlWebApplicationContext: Refreshing WebApplicationContext for namespace 'mvc-dispatcher-servlet': startup date [Tue Feb 06 00:16:32 GMT 2018]; root of context hierarchy\\n18/02/06 00:16:32 INFO XmlBeanDefinitionReader: Loading XML bean definitions from file [/Library/apache-tomcat-8.0.48/webapps/librec-core/WEB-INF/classes/spring/spring-"
            //         },
            //         error: null
            //     };
            //     console.log(data);
            //
            //     if (data.success == true) {
            //
            //
            //         rankingbox.find(".average-precision-score").text(data.metrics.PRECISION);
            //         rankingbox.find(".auc-score").text(data.metrics.AUC);
            //         rankingbox.find(".RR-score").text(data.metrics.RR);
            //         rankingbox.find(".recall-score").text(data.metrics.RECALL);
            //         rankingbox.find(".entropy-score").text(data.metrics.Entropy);
            //         rankingbox.find(".ndcg-score").text(data.metrics.NDCG);
            //         rankingbox.find(".ap-score").text(data.metrics.AP);
            //         rankingbox.find(".novelty-score").text(data.metrics.Novelty);
            //         rankingbox.find(".runtime-log").val(data.extra.logcontent);
            //         rankingbox.find(".runtime-log-path").attr('href', "download?downloadfile=" + data.extra.logpath);
            //         rankingbox.find(".runtime-result-path").attr('href', "download?downloadfile=" + data.extra.resultpath);
            //         // console.log(data.metrics.RR);
            //
            //     } else if (data.success == false) {
            //         layer.msg(data.error, {anim: 2, icon: 6, time: 2000});
            //     }
            //
            //     rankingbox.find('.ranking-result').toggle('slow');
            //     rankingbox.find(".wait-label").hide();
            // }, 1000);


            if (ele.hasClass("fa-chevron-down")) {
                ele.removeClass("fa-chevron-down")
                    .addClass("fa-chevron-right");
            } else {
                ele.removeClass("fa-chevron-right")
                    .addClass("fa-chevron-down");
            }
        });


    $(".evaluation-method").change(function () {
        var kfolddiv = $(this).parent().siblings(".k-fold-div");
        if ($(this).val() != "") {
            kfolddiv.hide();
        } else {
            kfolddiv.hide();
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

            console.log("evalmethod:" + evalmethod);
            console.log("extra:" + extra);

            var args = {
                'algmethod': algmethod,
                'evalmethod': evalmethod,
                'extra': extra
            };

            $.post(url, args, function (data) {

                console.log(ele.parent().find(".mae-score").text());
                console.log(data);
                console.log(data.metrics.MAE);

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

    $("#addtestcase").click(
        function () {

            var testcasename = $("#testcasename").val().trim();

            if (testcasename == "") {
                layer.msg('enter the title !', {icon: 2, anim: 6, time: 1000});
                return false;
            }

            if (testcaselist.indexOf(testcasename) > -1) {
                layer.msg('you cannot create repeated test case', {icon: 2, anim: 6, time: 1000});
                return false;
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
            console.log("after added (testcaselist):" + testcaselist);

        });

    $(".removeBtn").click(function () {

        var testcasetitle = $(this).parent().siblings(".testcase-title").text();
        var ele = $(this).parent().parent().parent();
        layer.open({
            title: "Remove",
            content: "Are you sure to remove the test case?",
            yes: function () {
                testcaselist.splice(testcaselist.indexOf(testcasetitle), 1);
                console.log("after removed (testcaselist):" + testcaselist);
                ele.hide(1000);
                layer.msg('removed successfully!', {icon: 1, anim: 2, time: 1000});

            }
        });


    });

    $('[data-toggle="tooltip"]').tooltip();

    $("#usertable").dataTable({
        "paging": false,
        "lengthChange": false,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": false
    });
});
//    alert($(".fluid2").attr("ng-controller"));
//    <div ng-include="'testcase.html'"></div>