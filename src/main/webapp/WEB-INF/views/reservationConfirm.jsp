<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Special version of Bootstrap that only affects content wrapped in .bootstrap-iso -->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/bootstrap-iso.css" />

<!--Font Awesome (added because you use icons in your prepend/append)-->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />



<!-- Inline CSS based on choices in "Settings" tab -->
<style>
.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p,
	.bootstrap-iso form {
	font-family: Arial, Helvetica, sans-serif;
	color: black
}

.bootstrap-iso form button, .bootstrap-iso form button:hover {
	color: white !important;
}

.asteriskField {
	color: red;
}
</style>

<title>Guesthouse</title>
</head>
<body>
	<div style="background:">

		<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-2">
					<span class="sr-only">Rozwiń nawigację</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href=" <spring:url value="/" />" class="navbar-brand">Strona
					główna</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-2">
				<ul class="nav navbar-nav">
					<li class="active"><a href=" <spring:url value="/information" />">Kontakt</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href=<c:url value="/admin/reservations" />><span
								class="glyphicon glyphicon-log-in"></span> Rezerwacje</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href=<c:url value="/admin/clients" />><span
								class="glyphicon glyphicon-log-in"></span> Klienci</a></li>
					</sec:authorize>
					<sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
						<li><a href=<spring:url value="/add" />><span
								class="glyphicon glyphicon-user"></span> Rejestracja</a></li>
					</sec:authorize>

					<sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
						<li><a href=<spring:url value="/login" />><span
								class="glyphicon glyphicon-log-in"></span> Logowanie</a></li>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<li><a href=<c:url value="/client/home" />><span
								class="glyphicon glyphicon-log-in"></span> Profil</a></li>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<li><a href=<c:url value="/j_spring_security_logout" />><span
								class="glyphicon glyphicon-log-in"></span> Wyloguj</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>
		<section>
			<div style="background: #66FF33" class="jumbotron">
				<div class="container">
					<br> <br>
					<h1>
						<strong><font
							face="'Algerian',Times New Roman','Courier New'">Rezerwacja</font>
					</h1>
					</strong>
					<p>Potwierdzenie</p>
				</div>
			</div>
		</section>

		<div class="alert alert-success">
			<strong>Gratulacje!</strong> Rezerwacja oczekuje na potwierdzenie. W ciągu 24h zostanie rozpatrzona. Obserwuj swoje konto.
		</div>
		
		<hr class="featurette-divider">
</body>
</html>
