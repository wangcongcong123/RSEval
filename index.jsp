<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>
<br>
	<a href="main">go to main page</a>
	<br>
	
	<a href="page1">go to page 1</a>
	<br>
	<br>

	<form action="testFileUpload" method="POST"
		enctype="multipart/form-data">
		<label>upload file</label> File: <input type="file" name="file" /> <input
			type="submit" value="Submit" />
	</form>
<br>
	
	<br>
	<a href="download">download file</a>
	<br>
	<br>
	<a id="checkJSON" href="">check JSON</a>
		<br>
	<br>
	<a href="checkLibRec">check lib rec</a>
	<br>
	<br>
	<a href="checkHibernate">check Hibernate</a>
	
	
<%-- 	<% @include file="test2.jsp" %> --%>
	<jsp:include page="test2.jsp" />
	<div>Page include with params being passed</div>

<jsp:include page="test2.jsp" flush="true">  
  <jsp:param name="name" value="2014"/>
</jsp:include>


</body>

<script src="${pageContext.request.contextPath}/static/asserts/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
/* 	$("#checkJSON").click(function() {
		$.ajax({
			type : "POST",
			url : "checkJSON",
			data : {
				'testData' : 'wangcongcong'
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				alert('success');
			},
			error : function(xhr, type) {
				alert("error!");
			}
		});
	});
	 */
	$(function(){
		$("#checkJSON").click(function(){
			var url = "checkJSON";
			var args = {'name':'congcong'};
			$.post(url, args, function(data){
				console.log(data);
			/* 	for(var i = 0; i < data.length; i++){
					var id = data[i].id;
					var lastName = data[i].lastName;
					
					alert(id + ": " + lastName);
				} */
			});
			return false;
		});
	})
</script>

</html>
</html>