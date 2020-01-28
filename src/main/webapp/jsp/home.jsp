<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title><spring:message code="home.title" /></title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
				<spring:message code="home.heading" />
			</h1>
		</div>

		<div class="w3-container">

			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

				<h2>
					<spring:message code="home.title" />
					${pageContext.request.userPrincipal.name} | <a
						onclick="document.forms['logoutForm'].submit()"><spring:message
							code="home.logout" /></a>
				</h2>
			</c:if>
			<div class="w3-container" style="display: flex">
				<c:if test="${not empty faculties}">
					<c:forEach items="${faculties}" var="currentFaculty">
						<div class="w3-card-4" style="width: 20%; margin: 2%">
							<img
								src="https://www.wegagen.com/wp-content/themes/linstar23/assets/images/default-275x220.jpg"
								alt="Faculty logo" style="width: 100%">
							<div class="w3-container w3-center">
								<h3>${currentFaculty.name}</h3>
								<p>
									<spring:message code="home.studentsLimit" />
									: ${currentFaculty.numberOfStudents}
								</p>
								<p>
									<spring:message code="home.subjects" />
									: ${currentFaculty.subjects}
								</p>
							</div>

							<security:authorize access="hasRole('ROLE_USER')">
								<a class="w3-button w3-block w3-dark-grey"
									href="${contextPath}/register-for-faculty?facultyId=${currentFaculty.id}&email=${pageContext.request.userPrincipal.name}">
									<spring:message code="home.register" />
								</a>
							</security:authorize>

							<a class="w3-button w3-block w3-dark-grey"
								href="${contextPath}/show-enrolled-entrants?facultyId=${currentFaculty.id}">
								<spring:message code="home.showEntrants" />
							</a>
						</div>

					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</body>
</html>
