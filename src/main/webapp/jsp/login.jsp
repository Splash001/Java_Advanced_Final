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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Sign in</title>

<link rel="icon" type="image/png"
	href="${contextPath}/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="${contextPath}/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${contextPath}/css/main.css">
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" method="POST"
					action="${contextPath}/login">
					<span class="login100-form-title"> Member Login </span>

					<div class="text-center p-t-12">
						<span class="txt1"> ${message} </span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email"
							placeholder="Email"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-envelope"
							aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<input class="input100" type="password" name="password"
							placeholder="Password"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-lock"
							aria-hidden="true"></i>
						</span>
					</div>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">Login</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">${error}</span>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="${contextPath}/registration"> Create
							your Account <i class="fa fa-long-arrow-right m-l-5"
							aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="${contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="${contextPath}/vendor/bootstrap/js/popper.js"></script>
	<script src="${contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${contextPath}/vendor/select2/select2.min.js"></script>
	<script src="${contextPath}/vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale : 1.1
		})
	</script>
	<script src="${contextPath}/js/login.js"></script>

</body>
</html>
