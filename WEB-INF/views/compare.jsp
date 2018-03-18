<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Page 1</title>
</head>
<body>
<h1>this is page 1</h1>
<h1>data: ${requestScope.data}</h1>
<canvas id="myChart"></canvas>

  </body>

      <!--Load the AJAX API-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/asserts/plugins/Chart.bundle.min.js"></script>
    <script type="text/javascript">

var ctx = document.getElementById('myChart').getContext('2d');


// var myBubbleChart = new Chart(ctx,{
//     type: 'bubble',
//     data: data,
//     options: {}
// });

var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [{
            label: "My First dataset",
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [0, 10, 5, 2, 20, 30, 45],
        }]
    },

    // Configuration options go here
    options: {}
});
    </script>

</html>