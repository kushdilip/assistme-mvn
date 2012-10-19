<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/styles/error.css" rel="stylesheet"
	type="text/css" />
<link href="resources/styles/uniform.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<style type="text/css">
.imp-red {
	color: red;
	font-weight: bold;
}
</style>
</head>
<body>

	<div id="container">

		<jsp:include page="../common/masterHeader.jsp"></jsp:include>

		<div id="resetPasswrod"
			style="width: 100%; text-align: center; margin-top: 100px;">

			<form action="forgot-password.html" method="get">
				<h3>Reset Password</h3>
				<table align="center" cellspacing="5">
					<tr>
						<td>Enter Email-Id:</td>
						<td><input type="text" name="emailId"></td>
						<td><p id="emailError" class="error"></p> </td>
						
					</tr>
					<tr>
						<td></td>
						<td><img src="kaptcha.jpg" alt="kaptcha" /></td>
					</tr>
					<tr>
						<td>Enter Captcha</td>
						<td><input type="text" id="kaptcha" name="kaptcha" value="" /></td>
						<td><p id="captchaError" class="error"></p> </td>
					</tr>
					
					<tr>
						<td colspan="2"><input class="shiny-blue" type="submit" value="submit">
						<input type="button" class="shiny-blue"
							onClick="window.location.href='login.html'" value="cancel"
							width="20"></td>
					</tr>
				</table>
			</form>
		</div>

		<div id="resetResult"
			style="width: 100%; text-align: center; margin-top: 100px;">
			<p></p>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script type="text/javascript">		
	var emailId = '<c:out value="${emailId}"/>';
	var isReset = '<c:out value="${isReset}"/>';
	var isKaptcha = '<c:out value="${isKaptcha}"/>';
	var kaptcha = '<c:out value="${kaptcha}"/>';

	
	if(isReset == 'true'){
		$('#resetPasswrod').empty();
		$('#resetResult p').html('your password reset link has been sent to your email id <span class="imp-red">' + emailId + '</span>');
		$('#resetResult p').append('<br>Go back to <a href="login.html"><b><h4>Login</b></a> page')
	}
	else if(isReset == 'false'){
		if(emailId.length === 0){
			$('#emailError').html('Email-Id can not be blank');
		}
		else if(kaptcha.length === 0){
			$('#captchaError').html('Captcha can not be blank');
		}
	}
	
	if(kaptcha.length != 0 && isKaptcha === 'false'){
		$('#captchaError').html('Enter Correct captcha');
	}
	
	
	
	 
/* 	if(emailId == ''){	
	}
	  else if(emailId !=null && isReset == 'true'){
	$('#resetResult p').html('your password reset link has been sent to your email id <span class="imp-red">' + emailId + '</span>');
	}
	  else if(emailId != null && isReset == 'false'){
	$('#resetResult p').html('user does not exists with emailId <span class="imp-red">' + emailId + '</span> <br>Please enter vaild emailId');
	}
 */	 
	</script>
</body>
</html>