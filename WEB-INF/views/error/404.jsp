<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%response.setStatus(200);%>

<!DOCTYPE html>
<html>
<head>
	<title>404 - 页面不存在</title>
	<style type="text/css">
		a{
			text-decoration: none;
		}
	</style>
</head>

<body>
	<center>
	  <h1>404错误</h1>
	  <p><a href="<c:url value="/"/>">返回首页</a></p>
	</center>
</body>
</html>