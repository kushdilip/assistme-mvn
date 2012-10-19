<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transactions</title>

<link href="resources/styles/uniform.css" rel="stylesheet"
	type="text/css" />
<!-- <link href="resources/styles/dashboard.css" rel="stylesheet"
	type="text/css" />
 -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../common/menubar.jsp"></jsp:include>


	<div id="addMenu" align="center">
		<br>
		<table>
			<tr>
				<td>Add New:</td>
				<td><button class="shiny-blue"
						onclick="window.location.href='transaction-add.html?owes=I'">I
						owe someone</button></td>
				<td><button class="shiny-blue"
						onclick="window.location.href='transaction-add.html?owes=someone'">Someone
						owes me</button></td>
			</tr>
		</table>
	</div>

	<div align="center">
		<h3 align="center">Bills and Transactions</h3>

		<table border="1" id="transactionTable">
			<tbody>

				<c:forEach items="${transactionList}" var="trnsction"
					varStatus="loop">
					<c:set var="owingCash" value="${trnsction.amount}" />
					<tr>
						<c:choose>
							<c:when test="${trnsction.amount < 0 }">
								<c:set var="owingCash" value="${-trnsction.amount}" />
								<td><span> ${trnsction.contactName}</span> Owes me</td>
							</c:when>
							<c:otherwise>
								<td>I owe <span> ${trnsction.contactName}</span></td>
							</c:otherwise>
						</c:choose>

						<td>&#8377;<c:out value="${owingCash}" /></td>

						<td>for <span> ${trnsction.description}</span></td>
						<td>on <span id="datedtls">${trnsction.date}</span></td>
						<td><a
							href="delete-transaction.html?transId=${trnsction.id}&contactId=${trnsction.contactId}">delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div id="dashboard_balances" align="center" >
		<h2>Balance Summary</h2>

		<div class="total_summary settled_up">
			<strong>In total</strong>, you owe <strong class="amount">&#8377;${totalAmounts[0]
				+ totalAmounts[1]}</strong>
		</div>
		<div class="negative balances">
			<h4>I owe &#8377;${totalAmounts[0] }</h4>
		</div>
		<div class="positive balances">
			<h4>I am owed &#8377;${-totalAmounts[1] }</h4>
		</div>
	</div>


	<jsp:include page="../common/footer.jsp"></jsp:include>

	<script type="text/javascript">
		$('#transactionTable td span').css({
			'font-weight' : 'bold'
		});

		$('#transactionTable td:odd').css({
			'background-color' : '#dddddd'
		});
	</script>
</body>
</html>