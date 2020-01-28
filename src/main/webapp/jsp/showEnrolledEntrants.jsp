<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="enrolledEntrants.title" /></title>
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
			<h1>
				<spring:message code="enrolledEntrants.info" />
				: ${faculty.name}
			</h1>
			<h2>
				<spring:message code="enrolledEntrants.limit" />
				${faculty.numberOfStudents}
			</h2>
			<h2>
				<spring:message code="enrolledEntrants.registered" />
				${numberOfEntrants}
			</h2>
		</div>

		<input class="form-control" id="myInput" type="text"
			placeholder="<spring:message code="enrolledEntrants.search"/>..">
		<br>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th><spring:message code="enrolledEntrants.photo" /></th>
					<th><spring:message code="enrolledEntrants.name" /></th>
					<th><spring:message code="enrolledEntrants.surname" /></th>
					<th><spring:message code="enrolledEntrants.email" /></th>
					<c:forEach items="${faculty.subjects}" var="currentSubject">
						<th>${currentSubject}</th>
					</c:forEach>
					<th><spring:message code="enrolledEntrants.total" /></th>
				</tr>
			</thead>
			<tbody id="myTable">

				<c:forEach items="${enrolledEntrants}" var="currentEntrant">
					<tr style="background-color: yellow">
						<td><img src="data:image/png;base64,${currentEntrant.base64}"
							width="100" height="70" /></td>
						<td>${currentEntrant.user.name}</td>
						<td>${currentEntrant.user.surname}</td>
						<td>${currentEntrant.user.email}</td>
						<c:forEach items="${currentEntrant.marks}" var="currentMark">
							<td>${currentMark}</td>
						</c:forEach>
						<td>${currentEntrant.sumOfMarks}</td>
					</tr>
				</c:forEach>

				<c:forEach items="${notEnrolledEntrants}" var="currentEntrant">
					<tr>
						<td><img src="data:image/png;base64,${currentEntrant.base64}"
							width="100" height="70" /></td>
						<td>${currentEntrant.user.name}</td>
						<td>${currentEntrant.user.surname}</td>
						<td>${currentEntrant.user.email}</td>
						<c:forEach items="${currentEntrant.marks}" var="currentMark">
							<td>${currentMark}</td>
						</c:forEach>
						<td>${currentEntrant.sumOfMarks}</td>
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
