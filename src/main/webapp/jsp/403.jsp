<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><spring:message code="403.title" /></title>
</head>
<body>
	<div>
		<div>
			<h3>
				<spring:message code="403.heading" />
			</h3>
		</div>
		<form action="/logout" method="post">
			<input type="submit" value="<spring:message code="403.logout"/>" />
			type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>

	</div>
</body>
</html>
