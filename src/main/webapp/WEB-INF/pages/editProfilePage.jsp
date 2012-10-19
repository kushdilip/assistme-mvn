<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit Profile Page</title>
<link href="resources/styles/error.css" rel="stylesheet" type="text/css" />
<link href="resources/styles/uniform.css" rel="stylesheet"
	type="text/css" />

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

	<div align="center">
		<h2>Edit Profile</h2>
		<form:form method="POST" commandName="user">
			<table>
				<tr>
					<td>First name:</td>
					<td><form:input path="firstName" value="${currentUser.firstName}"/></td>
					<td><form:errors path="firstName" cssClass="error" /></td>
				</tr>
				<tr>
					<td>Last name:</td>
					<td><form:input path="lastName" value="${currentUser.lastName}"/></td>
					<td><form:errors path="lastName" cssClass="error" /></td>
				</tr>
				
				<tr>
					<td align="center" colspan="2"><input class="shiny-blue"
						type="submit" value="submit" /></td>
				</tr>






			</table>


		</form:form>
	</div>

</body>
</html>