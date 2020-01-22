<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register for the faculty</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<!-- Sidebar -->
	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width: 10%">
		<h3 class="w3-bar-item">Menu</h3>
		<a href="/home" class="w3-bar-item w3-button">Home</a> <a
			href="/show-entrants" class="w3-bar-item w3-button">Show all
			entrants</a>
	</div>

	<!-- Page Content -->
	<div style="margin-left: 10%">
		<div class="w3-container w3-teal">
			<h1>Register for the faculty</h1>
		</div>

		<div class="w3-container">

			<form:form method="POST" action="${contextPath}/register-for-faculty"
				enctype="multipart/form-data">
				<table>
					<tr>
						<th>To register for the faculty you have to upload your photo
							and to fill marks from such subjects:</th>
					</tr>
					<tr>
						<td>Upload you photo</td>
						<td><input type="file" name="image" /></td>
					</tr>

					<c:forEach items="${facultyRegistration.faculty.subjects}"
						var="currentSubject">
						<tr>
							<td>${currentSubject}</td>
							<td><input type="number" name="marks" /></td>
						</tr>
					</c:forEach>

					<tr>
						<td><input type="hidden" name="facultyId"
							value="${facultyRegistration.faculty.id}" /></td>
						<td><input type="hidden" name="email"
							value="${facultyRegistration.user.email}" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Register" /></td>
					</tr>

				</table>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form:form>
		</div>
	</div>

	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>
