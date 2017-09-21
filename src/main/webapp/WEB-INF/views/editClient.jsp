<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<title>Guesthouse</title>
</head>
<body>
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
					<li class="active"><a
						href=" <spring:url value="/information" />">Kontakt</a></li>
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
						face="'Algerian',Times New Roman','Courier New'">Witaj
							${client.name}</font>
				</h1>
				</strong>
			</div>
		</div>
	</section>


	<section>
		<form:form modelAttribute="client" class="form-horizontal">
			<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<div class="form-group">
				<div class="col-xs-1"></div>
				<label for="nameField" class="col-xs-1">Imię</label>
				<div class="col-xs-9">
					<form:input id="name" path="name" type="text" class="form-control" />
					<form:errors path="name" cssClass="text-danger" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-1"></div>
				<label for="nameField" class="col-xs-1">Nazwisko</label>
				<div class="col-xs-9">
					<form:input id="surname" path="surname" type="text"
						class="form-control" />
					<form:errors path="surname" cssClass="text-danger" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-1"></div>
				<label for="nameField" class="col-xs-1">Miasto</label>
				<div class="col-xs-9">
					<form:input id="country" path="country" type="text"
						class="form-control" />
					<form:errors path="country" cssClass="text-danger" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-1"></div>
				<label for="nameField" class="col-xs-1">Numer telefonu</label>
				<div class="col-xs-9">
					<form:input id="phoneNumber" path="phoneNumber" type="text"
						class="form-control" />
					<form:errors path="phoneNumber" cssClass="text-danger" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-1"></div>
				<label for="nameField" class="col-xs-1">Adres email</label>
				<div class="col-xs-9">
					<form:input id="emailAdress" path="emailAdress" type="text"
						class="form-control" />
					<form:errors path="emailAdress" cssClass="text-danger" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-1"></div>
				<label for="nameField" class="col-xs-1">Hasło</label>
				<div class="col-xs-9">
					<form:input id="clientPassword" path="clientPassword" type="text"
						class="form-control" />
					<form:errors path="clientPassword" cssClass="text-danger" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<input type="submit" id="btnAdd" class="btn btn-primary"
						value="Zatwierdź zmiany" />
				</div>
			</div>
			<div class="invisible">
				<div class="col-xs-1"></div>
				<label for="nameField" class="invisible">Login</label>
				<div class="col-xs-9">
					<form:input id="clientLogin" path="clientLogin" type="text"
						class="form-control" />
					<form:errors path="clientLogin" cssClass="text-danger" />
				</div>
			</div>
			<div class="invisible">
				<div class="col-xs-1"></div>
				<label for="nameField" class="col-xs-1">id</label>
				<div class="invisible">
					<form:input id="id" path="id" type="text" class="form-control" />
					<form:errors path="surname" cssClass="text-danger" />
				</div>
			</div>
		</form:form>
	</section>
	<hr class="featurette-divider">
</body>
</html>