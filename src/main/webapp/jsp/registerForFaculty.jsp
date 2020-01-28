<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><spring:message code="registerForFaculty.title" /></title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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
	<div style="margin-left: 10%">
		<div class="w3-container w3-teal">
			<h1>
				<spring:message code="registerForFaculty.title" />
			</h1>
		</div>

		<div class="w3-container">

			<form:form method="POST" action="${contextPath}/register-for-faculty"
				enctype="multipart/form-data">
				<table>
					<tr>
						<th><spring:message code="registerForFaculty.heading" />:</th>
					</tr>
					<tr>
						<td><spring:message code="registerForFaculty.uploadPhoto" /></td>
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
						<td><input type="submit"
							value="<spring:message code="registerForFaculty.register"/>" /></td>
					</tr>

				</table>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form:form>
		</div>
	</div>

	<!-- /container -->
</body>
</html>
