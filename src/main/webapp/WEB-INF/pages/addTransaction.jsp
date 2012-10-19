<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transactions</title>
<link href="resources/styles/uniform.css" rel="stylesheet" type="text/css" />
<link href="resources/styles/error.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#datepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "yy-mm-dd",
			altField : "#alternate",
			altFormat : "DD, d MM, yy",
			showButtonPanel : true,
			showOtherMonths : true,
			selectOtherMonths : true,
			showOn : "button",
			buttonImage : "resources/images/calendar.gif",
			buttonImageOnly : true,
			showAnim : "slide"
		});
	});
</script>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

	<div id="container" align="center">
		<h3>Add new Transaction</h3>

		<c:set var="iOwes" value="I" />
		<c:set var="someoneOwes" value="someone" />

		<div id="transaction_form">
			<form:form commandName="transaction" method="POST">
				<table>
					<tr>
						<td><c:if test="${owes == iOwes }">
							I Owe :
						</c:if></td>
						<td><form:select path="contactId" id="myOptions"
								selected="select" style="width:150px">
								<option selected="selected">Select contact</option>
								<c:forEach items="${contactsList}" var="cntct" varStatus="loop">
									<form:option value="${cntct.id}">${cntct.name}</form:option>
								</c:forEach>

							</form:select></td>
						<td align="left"><c:if test="${owes == someoneOwes }">
							Owes Me.
						</c:if></td>
						<td><form:input path="contactName" id="contactName"
								type="hidden" /></td>
					</tr>
					<tr>
						<td>&#8377; :</td>
						<td><input type="text" id="amount"
							onchange="setActualAmount(this.value)" /></td>
						<td><form:input path="amount" id="actualAmount" type="hidden" /></td>
						<td><form:errors path="amount" cssClass="error" /></td>
					</tr>
					<tr>
						<td>for :</td>
						<td><form:input path="description" /></td>
						<td><form:errors path="description" cssClass="error" /></td>
					</tr>
					<tr>
						<td>On :</td>
						<td><form:input id="datepicker" path="date" /></td>
						<td><form:errors path="date" cssClass="error" /></td>

					</tr>
					<tr>
						<td></td>
						<td><input class="shiny-blue" type="submit" value="Add" /> <input type="button"
							class="shiny-blue" value="Cancel"
							onClick="window.location.href='transactions-list.html'">
						<td>
					</tr>
				</table>
			</form:form>



		</div>

		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>

	<script type="text/javascript">
		$('#myOptions').change(function() {
			var nameVal = $("#myOptions option:selected").text();
			$('#contactName').val(nameVal);
		});

		function setActualAmount(val) {
			var owes_param = gup('owes');
			if (owes_param == 'someone')
				val = -val;
			document.getElementById("actualAmount").value = val;
		}

		function gup(name) {
			name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
			var regexS = "[\\?&]" + name + "=([^&#]*)";
			var regex = new RegExp(regexS);
			var results = regex.exec(window.location.href);
			if (results == null)
				return "";
			else
				return results[1];
		}
	</script>

</body>
</html>