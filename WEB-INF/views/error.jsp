<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>Error page</title>

    <meta name="description" content="User login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/plugins/sweetalert/sweetalert.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/fbicons/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/asserts/css/skins/_all-skins.min.css">

</head>

<body style="background: #ecf0f5">


<section class="content">
    <div class="error-page">
        <h2 class="headline text-yellow"> Error</h2>

        <div class="error-content">
            <h3><i class="fa fa-warning text-yellow"></i> Oops! Something goes wrong with the page.</h3>

            <p>
                We could not find the page you were looking for.
                Meanwhile, you may <a href="main">return to dashboard</a> or try using the search form.
            </p>

            <form class="search-form">
                <div class="input-group">
                    <input name="search" class="form-control" placeholder="Search" type="text">

                    <div class="input-group-btn">
                        <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <!-- /.input-group -->
            </form>
        </div>
        <!-- /.error-content -->
    </div>
    <!-- /.error-page -->
</section>


</body>


<script src="${pageContext.request.contextPath}/static/asserts/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/plugins/completer.min.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/plugins/sweetalert/sweetalert-dev.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/plugins/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/asserts/adminlte.min.js"></script>


<script type="text/javascript">


</script>

</body>
</html>