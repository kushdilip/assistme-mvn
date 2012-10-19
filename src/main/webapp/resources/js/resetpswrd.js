var emailId = '<c:out value="${emailId}"/>';
var isReset = '<c:out value="${isReset}"/>';

/* $('#resetResult p:first').html(emailId);
 */
 
if(emailId == ''){

}
  else if(emailId !=null && isReset == 'true'){
$('#resetResult p').html('your password reset link has been sent to your email id <span class="imp-red">' + emailId + '</span>');
}
  else if(emailId != null && isReset == 'false'){
$('#resetResult p').html('user does not exists with emailId <span class="imp-red">' + emailId + '</span> <br>Please enter vaild emailId');
}

/*var kaptcha = '<c:out value="${kaptcha}"/>';

if(kaptcha = ''){
	alert('kaptcha not entered');
}
*/