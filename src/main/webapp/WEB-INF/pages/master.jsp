<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link href="resources/styles/uniform.css" rel="stylesheet"
	type="text/css" />
<link href="resources/styles/error.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="container">
		<jsp:include page="../common/masterHeader.jsp"></jsp:include>

		<div id="loginbar" align="left">
			<p>
				New User <a href="userRegistration.html"><b>Register</b></a>
			</p>

			<p>Already Registered, Please Login</p>

			<form:form commandName="user" method="POST">
				<table>
					<tr>
						<td>Email Id:</td>
						<td><form:input path="emailId" /></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><form:input path="password" type="password" /></td>
					</tr>

					<tr>
						<td colspan="2" align="center"><input class="shiny-blue"
							type="submit" value="Login"></td>
					</tr>
					<tr>
						<td colspan="2"><form:errors path="emailId" cssClass="error" /></td>
					</tr>
					<tr>
						<td colspan="2"><form:errors path="password" cssClass="error" /></td>
					</tr>

				</table>
			</form:form>
			
			<p>
				<a href="forgot-password.html"><b>Forgot Password</b></a>
			</p>
			

		</div>


		<div id="footer"
			style="background-color: #FFA500; clear: both; text-align: center;">
			Copyright ©</div>
	</div>

</body>
</html>