<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profile details</title>
<link href="resources/styles/uniform.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

	<div align="center">
		<h3 align="center">Profile Details</h3>
		<br>
		<table id="profile_table">
			<tr>
				<td>Name:</td>
				<td colspan="2"><b> ${currentUser.firstName} ${currentUser.lastName}</b></td>
			</tr>
			<tr>
				<td>Email Id:</td>
				<td colspan="2"><b>${currentUser.emailId}</b></td>
			</tr>
			<tr>

				<td><a href="editProfile.html">edit</a></td>

			</tr>

		</table>


	</div>



</body>
</html>