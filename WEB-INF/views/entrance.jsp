<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>

    <title>Entrance Page</title>
    <meta name="description" content="User login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/plugins/sweetalert/sweetalert.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/fbicons/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/css/skins/_all-skins.min.css">
    <script type="text/javascript" src="http://livejs.com/live.js"></script>

</head>

<body style="background: #ecf0f5">


<div class="lockscreen-wrapper">

    <div class="lockscreen-logo">
        <a href="#"><b>Evaluate</b>CF RS</a>
    </div>


    <c:choose>

        <c:when test="${not empty param.errorMsg}">
            <div style="color: #da4132;" class="text-center">
                    ${param.errorMsg}
            </div>
            <br>
        </c:when>

    </c:choose>
    <!-- User name -->
    <br>
    <!-- START LOCK SCREEN ITEM -->
    <div class="lockscreen-item">



        <!-- lockscreen image -->
        <div class="lockscreen-image">
            <img src="${pageContext.request.contextPath}/static/images/rs-logo.jpg" alt="Image">
        </div>

        <form class="lockscreen-credentials" action="mainWithSession" method="post">

            <div class="input-group">

                <input class="form-control" placeholder="Session Code" name="sessioncode" type="text">

                <div class="input-group-btn">
                    <button type="submit" class="btn"><i class="fa fa-arrow-right text-muted"></i></button>
                </div>


            </div>

        </form>




        <!-- /.lockscreen credentials -->

    </div>


    <!-- /.lockscreen-item -->
    <div class="help-block text-center">
        Enter a key to start a session
    </div>



    <div class="text-center help-block">
        Or <a href="main.html">start</a> as a guest
    </div>


    <div class="lockscreen-footer text-center">
        Copyright © 2017-2018 UCD, Congcong Wang. All rights reserved
        <a href="http://123.207.171.254"><strong> My Server</strong></a>
    </div>
</div>


</body>


<script src="${pageContext.request.contextPath}/static/asserts/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/plugins/completer.min.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/plugins/sweetalert/sweetalert-dev.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/adminlte.min.js"></script>


<script type="text/javascript">


</script>

</body>
</html>
