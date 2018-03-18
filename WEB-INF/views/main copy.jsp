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
                                               class="algmethod1" value="User-based" ng-model="algmethod">
                                    User-based CF
                                </label>
                            </div>
                            <div class="radio">
                                <label> <input type="radio" name="algmethod"
                                               class="algmethod2" value="Item-based" ng-model="algmethod">
                                    Item-based CF
                                </label>
                            </div>
                            <div class="radio">
                                <label> <input type="radio" name="algmethod"
                                               class="algmethod3" value="Matrix-Factorisation"
                                               ng-model="algmethod">Matrix-Factorisation CF (Biased MF is
                                    used here)
                                </label>
                            </div>


                        </div>

                        Algorithm selected:<label style="color: tomato" class="algmethod"></label> <br><br>

                        <div class="form-group">
                            <label>Default Dataset: </label> <a
                                href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_1.txt">ratings_1
                        </a> <a
                                href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_2.txt">ratings_2
                        </a> <a
                                href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_3.txt">ratings_3
                        </a> <a
                                href="${pageContext.request.contextPath}/data/filmtrust/rating/ratings_0.txt">ratings_4
                        </a>
                        </div>

                        <div class="form-group">

                            <label> Upload Dataset <a
                                    class="dataset-format text-green">See Format</a></label> <input
                                type="checkbox" class="dataset-type"> is UIRT? <input
                                type="file" class="form-control-file dataset-file">

                        </div>

                        <div class="form-group row">
                            <div class="col-md-5">
                                <label>Evaluation Methodology: </label>
                                <select class="form-control evaluation-method">
                                    <option selected name="evalmethod" value="ratio">Random Sub-Sampling
                                    </option>
                                    <option name="evalmethod" value="loocv">Leave-one-out</option>
                                    <option name="evalmethod" value="kcv">K-Fold Cross-Validation</option>
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
                                <h4>Result for Configuration:</h4>
                                <p class="text-red rating-configuration" style="word-wrap: break-word;"></p>
                                <p class="text-yellow ranking-configuration"
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
                                                              aria-expanded="true">Report Summary</a></li>

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
                                                    <li><a href="#"><i class="fa fa-save"></i> Sava</a></li>
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

                                            <tbody>

                                            <tr>

                                                <td class="text-red"><input type="checkbox" class="metric-checkbox">
                                                    MAE <a class="fa fa-question-circle-o"
                                                           data-toggle="popover"
                                                           title="Mean Absolute Error"
                                                           data-content="<a href='https://en.wikipedia.org/wiki/Mean_absolute_error'>Check details</a>"></a>
                                                </td>
                                                <td class="mae-score">0</td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        class="fa fa-trash-o metric-trash"
                                                        data-toggle="tooltip"
                                                        data-placement="top" title="delete"></a>&nbsp;&nbsp;&nbsp;<a
                                                        class="fa fa-search metric-visualise"
                                                        data-toggle="tooltip"
                                                        data-placement="top" title="visualise"></a></td>

                                            </tr>


                                            <tr>
                                                <td class="text-red"><input type="checkbox" class="metric-checkbox">
                                                    MSE <a
                                                            class="fa fa-question-circle-o"
                                                            data-toggle="popover" title="Mean Squared Error"
                                                            data-content="<a href='https://en.wikipedia.org/wiki/Mean_squared_error'>Check details</a>"></a>
                                                </td>
                                                <td class="mse-score">0</td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        class="fa fa-trash-o metric-trash"
                                                        data-toggle="tooltip"
                                                        data-placement="top" title="delete"></a>&nbsp;&nbsp;&nbsp;<a
                                                        class="fa fa-search metric-visualise"
                                                        data-toggle="tooltip"
                                                        data-placement="top" title="visualise"></a></td>
                                            </tr>

                                            <tr>
                                                <td class="text-red"><input type="checkbox" class="metric-checkbox">
                                                    RMSE <a
                                                            class="fa fa-question-circle-o"
                                                            data-toggle="popover"
                                                            title="Root Mean Squared Error"
                                                            data-content="<a href='https://en.wikipedia.org/wiki/Root_mean_squared_error'>Check details</a>"></a>
                                                </td>
                                                <td class="rmse-score">0</td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        class="fa fa-trash-o metric-trash"
                                                        data-toggle="tooltip"
                                                        data-placement="top" title="delete"></a>&nbsp;&nbsp;&nbsp;<a
                                                        class="fa fa-search metric-visualise"
                                                        data-toggle="tooltip"
                                                        data-placement="top" title="visualise"></a></td>
                                            </tr>

                                            <tr>
                                                <td><input type="checkbox" class="metric-checkbox"> MPE <a
                                                        class="fa fa-question-circle-o"
                                                        data-toggle="popover" title="Mean Percentage Error"
                                                        data-content="<a href='https://en.wikipedia.org/wiki/Mean_percentage_error'>Check details</a>"></a>
                                                </td>
                                                <td class="mpe-score">0</td>
                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                        class="fa fa-trash-o metric-trash"
                                                        data-toggle="tooltip"
                                                        data-placement="top" title="delete"></a>&nbsp;&nbsp;&nbsp;<a
                                                        class="fa fa-search metric-visualise"
                                                        data-toggle="tooltip"
                                                        data-placement="top" title="visualise"></a></td>

                                            </tr>

                                            </tbody>

                                            <%--<tfoot>--%>

                                            <%--<tr>--%>
                                            <%--<th colspan="2">--%>

                                            <%--<select class="form-control accuracy-select">--%>
                                            <%--<option selected>MSE</option>--%>
                                            <%--<option>RMSE</option>--%>
                                            <%--</select>--%>
                                            <%--</th>--%>

                                            <%--<th><a class="btn btn-add" data-toggle="tooltip"--%>
                                            <%--data-placement="top" title="add a metric"> <i--%>
                                            <%--class="fa fa-plus-square-o fa-2x"></i>--%>
                                            <%--</a></th>--%>
                                            <%--</tr>--%>


                                            <%--</tr>--%>
                                            <%--</tfoot>--%>
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
                                                              aria-expanded="true">Report Summary</a></li>

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
                                                <tbody>

                                                <tr>
                                                    <td><input type="checkbox" class="metric-checkbox">
                                                        Precision <a
                                                                class="fa fa-question-circle-o"></a></td>
                                                    <td class="precision-score">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td><input type="checkbox" class="metric-checkbox">
                                                        Recall <a
                                                                class="fa fa-question-circle-o"></a></td>
                                                    <td class="recall-score">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="text-red"><input type="checkbox"
                                                                                class="metric-checkbox">
                                                        F1 <a class="fa fa-question-circle-o"></a></td>
                                                    <td class="f1-score text-red">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>


                                                <%--<tr>--%>
                                                <%--<td><input type="checkbox" class="metric-checkbox"> AUC--%>
                                                <%--<a--%>
                                                <%--class="fa fa-question-circle-o"></a></td>--%>
                                                <%--<td class="auc-score">0</td>--%>
                                                <%--<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-search metric-visualise-r"></a>--%>
                                                <%--</td>--%>
                                                <%--</tr>--%>

                                                <%--<tr>--%>
                                                <%--<td><input type="checkbox" class="metric-checkbox">--%>
                                                <%--Reciprocal-Rank <a--%>
                                                <%--class="fa fa-question-circle-o"></a></td>--%>
                                                <%--<td class="reciprocal-rank-score">0</td>--%>
                                                <%--<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-search metric-visualise-r"></a>--%>
                                                <%--</td>--%>
                                                <%--</tr>--%>


                                                <%--<tr>--%>
                                                <%--<td><input type="checkbox" class="metric-checkbox"> NDCG--%>
                                                <%--<a--%>
                                                <%--class="fa fa-question-circle-o"></a></td>--%>
                                                <%--<td class="ndcg-score">0</td>--%>
                                                <%--<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-search metric-visualise-r"></a>--%>
                                                <%--</td>--%>
                                                <%--</tr>--%>

                                                <%--<tr>--%>
                                                <%--<td><input type="checkbox" class="metric-checkbox">--%>
                                                <%--Average-Precision--%>
                                                <%--<a--%>
                                                <%--class="fa fa-question-circle-o"></a></td>--%>
                                                <%--<td class="average-precision-score">0</td>--%>
                                                <%--<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-search metric-visualise-r"></a>--%>
                                                <%--</td>--%>
                                                <%--</tr>--%>

                                                <tr>
                                                    <td class="text-red"><input type="checkbox" class="metric-checkbox">
                                                        Relevance
                                                        <a class="fa fa-question-circle-o"></a></td>
                                                    <td class="relevance-score text-red">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>


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
                                            <h3 class="box-title">Beyond accuracy metrics</h3>
                                            <div class="box-tools">
                                                <div class="input-group input-group-sm"
                                                     style="width: 150px;">
                                                    <ul class="dropdown-menu" role="menu">
                                                        <li><a href="#"><i class="fa fa-save"></i> Sava</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- /.box-header -->
                                        <div class="box-body table-responsive no-padding">
                                            <table class="table table-hover">

                                                <thead>
                                                <tr>
                                                    <th>Matrics</th>
                                                    <th>Score</th>
                                                    <th>More Options</th>
                                                </tr>
                                                </thead>
                                                <tbody>


                                                <%--<tr>--%>
                                                <%--<td><input type="checkbox" class="metric-checkbox"> Diversity <a--%>
                                                <%--class="fa fa-question-circle-o"></a></td>--%>
                                                <%--<td>84.5%</td>--%>
                                                <%--<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a--%>
                                                <%--class="fa fa-search metric-visualise"></a></td>--%>
                                                <%--</tr>--%>

                                                <tr>
                                                    <td><input type="checkbox" class="metric-checkbox">
                                                        Novelty <a
                                                                class="fa fa-question-circle-o"></a></td>
                                                    <td class="novelty-score">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>


                                                <tr class="text-red">
                                                    <td><input type="checkbox" class="metric-checkbox"> SimpleCoverage
                                                        <a class="fa fa-question-circle-o"></a></td>
                                                    <td class="simplecoverage-score text-red">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>

                                                <tr class="text-red">
                                                    <td><input type="checkbox" class="metric-checkbox"> RecCoverage
                                                        <a class="fa fa-question-circle-o"></a></td>
                                                    <td class="reccoverage-score text-red">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td class="text-red"><input type="checkbox" class="metric-checkbox">
                                                        ItemCoverage
                                                        <a class="fa fa-question-circle-o"></a></td>
                                                    <td class="itemcoverage-score text-red">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>


                                                <tr class="text-red">
                                                    <td><input type="checkbox" class="metric-checkbox">
                                                        Popularity <a class="fa fa-question-circle-o"></a></td>
                                                    <td class="popularity-score text-red">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>


                                                <tr>
                                                    <td class="text-red"><input type="checkbox" class="metric-checkbox">
                                                        Diversity <a
                                                                class="fa fa-question-circle-o"></a></td>
                                                    <td class="diversity-score text-red">0</td>
                                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-trash-o metric-trash"></a>&nbsp;&nbsp;&nbsp;<a
                                                            class="fa fa-search metric-visualise-r"></a>
                                                    </td>
                                                </tr>


                                                </tbody>

                                                <tfoot>

                                                </tfoot>
                                            </table>
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
