<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/styles/uniform.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/uniform.js"></script>
</head>
<body>
	

		<jsp:include page="../common/header.jsp"></jsp:include>
		<jsp:include page="../common/menubar.jsp"></jsp:include>
		
		<div align="center">
			<h1>Welcome! ${currentUser.firstName}.</h1>
		</div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>