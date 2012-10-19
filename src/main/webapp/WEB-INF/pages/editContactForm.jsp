<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/styles/error.css" rel="stylesheet" type="text/css" />
<link href="resources/styles/uniform.css" rel="stylesheet"
	type="text/css" />

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../common/menubar.jsp"></jsp:include>


	<div align="center">
		<h1>Edit Contact</h1>
		<form:form method="POST" commandName="contact">
			<form:input type="hidden" path="id" value="${contact.id}" />
			<table>

				<tr>
					<td>Name:</td>
					<td><form:input path="name" value="${contact.name}" /></td>
					<td><form:errors path="name" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Mobile:</td>
					<td><form:input path="phoneNumber"
							value="${contact.phoneNumber}" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><form:input path="emailId" value="${contact.emailId}" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input class="shiny-blue" type="submit" value="submit" />
						<input class="shiny-blue" type="button" value="Cancel"
						onClick="window.location.href='showContacts.html'"></td>
				</tr>
			</table>
		</form:form>
		<br>

	</div>
</body>
</html>