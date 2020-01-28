<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="allRegistrations.title" /></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Sidebar -->
	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%">
		<h3 class="w3-bar-item">
			<spring:message code="sidebar.menu" />
		</h3>
		<a href="/home" class="w3-bar-item w3-button"><spring:message
				code="sidebar.home" /></a> <a href="/show-entrants"
			class="w3-bar-item w3-button"><spring:message
				code="sidebar.showAll" /></a>
	</div>

	<!-- Page Content -->
	<div class="container mt-3" style="margin-left: 10%">
		<div class="w3-container w3-teal">
			<h1><spring:message code="allRegistrations.title"/></h1>
		</div>

		<input class="form-control" id="myInput" type="text"
			placeholder="<spring:message code="allRegistrations.search"/>.."> <br>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th><spring:message code="allRegistrations.faculty"/></th>
					<th><spring:message code="allRegistrations.photo"/></th>
					<th><spring:message code="allRegistrations.name"/></th>
					<th><spring:message code="allRegistrations.surname"/></th>
					<th><spring:message code="allRegistrations.email"/></th>
					<th><spring:message code="allRegistrations.marks"/></th>
				</tr>
			</thead>
			<tbody id="myTable">

				<c:forEach items="${facultyRegistrations}" var="currentRegistration">
					<tr>
						<td>${currentRegistration.faculty.name}</td>
						<td><img
							src="data:image/png;base64,${currentRegistration.base64}"
							width="100" height="70" /></td>
						<td>${currentRegistration.user.name}</td>
						<td>${currentRegistration.user.surname}</td>
						<td>${currentRegistration.user.email}</td>
						<td>${currentRegistration.faculty.subjects}<br>${currentRegistration.marks}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	</div>

	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>

</body>
</html>
