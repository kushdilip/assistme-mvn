<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="resources/styles/uniform.css" rel="stylesheet"
	type="text/css" />

</head>
<body>

	<jsp:include page="../common/header.jsp"></jsp:include>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

	<div align="center">
		<h3 align="center">my important dates</h3>

		<input type="button" class="shiny-blue"
			onClick="window.location.href='importantDates.html'" value="Refresh"
			width="20"> <input type="button" class="shiny-blue"
			onClick="window.location.href='addAnniversary.html'" value="Add"
			width="20"> <br> <br>
		<table border="1">
			<thead>
				<tr>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${anniversaryList}" var="anvrsry" varStatus="loop">

					<tr>
						<td><c:out value="${loop.index + 1}" /></td>
						<td><c:out value="${anvrsry.title}" /></td>
						<td><c:out value="${anvrsry.date}" /></td>
						<td><c:out value="${anvrsry.people}" /></td>
						<td><a
							href="deleteAnniversary.html?anniversaryId=${anvrsry.anniversaryId}&anniversaryTitle=${anvrsry.title}">delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>