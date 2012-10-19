<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>change password form</title>
<link href="resources/styles/uniform.css" rel="stylesheet"
	type="text/css" />
<link href="resources/styles/error.css" rel="stylesheet" type="text/css" />

</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

	<div align="center">
		<h1>Edit Password</h1>

		<form:form method="POST" commandName="changePassword">
			<table>
				<tr>
					<td>Old Password:</td>
					<td><form:password path="oldPassword" /></td>
					<td><form:errors path="oldPassword" cssClass="error" /></td>
				</tr>
				<tr>
					<td>New Password:</td>
					<td><form:password path="newPassword" /></td>
					<td><form:errors path="newPassword" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Confirm Password:</td>
					<td><form:password path="confirmPassword" /></td>
					<td><form:errors path="confirmPassword" cssClass="error" /></td>
				</tr>
				<tr>
					<td></td>
					<td align="center"><input type="submit"
						class="shiny-blue" value="Change" /><input type="button"
						class="shiny-blue" onClick="window.location.href='home.html'"
						value="cancel" width="20"></td>
				</tr>

			</table>
		</form:form>
	</div>

</body>
</html>