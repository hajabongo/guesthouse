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
<title>Witaj</title>
</head>
<body>

	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!-- Grupowanie "marki" i przycisku rozwijania mobilnego menu -->
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
					<li class="active"><a href="#">Kontakt</a></li>
					<li><a href="#">Informacje ogólne</a></li>
					<li class="dropdown">
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Akcja</a></li>
							<li><a href="#">Inna akcja</a></li>
							<li><a href="#">Coś jeszcze innego</a></li>
							<li class="divider"></li>
							<li><a href="#">Oddzielone linki</a></li>
							<li class="divider"></li>
							<li><a href="#">Jeszcze jeden oddzielony link</a></li>
						</ul>
					</li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
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
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<section>
		<div style="background: #5bc0de" class="jumbotron">
			<div class="container">
				<br> <br>
				<h1>Witaj w "nazwa pensjonatu"</h1>
				<p>Wyjątkowym i jedynym miejscu w "nazwa miasta"</p>
			</div>
		</div>
	</section>

	<section class="container">
		<form:form modelAttribute="newClient" class="form-horizontal">
			<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<fieldset>
				<legend>Rejestracja</legend>

				<div class="form-group">
					<label class="control-label col-lg-2" for="name"> <spring:message
							code="addClient.form.name.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="name" path="name" type="text"
							class="form:input-large" />
						<form:errors path="name" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="surname"> <spring:message
							code="addClient.form.surname.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="surname" path="surname" type="text"
							class="form:input-large" />
						<form:errors path="surname" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="country"> <spring:message
							code="addClient.form.country.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="country" path="country" type="text"
							class="form:input-large" />
						<form:errors path="country" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="phoneNumber"> <spring:message
							code="addClient.form.phoneNumber.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="phoneNumber" path="phoneNumber" type="text"
							class="form:input-large" />
						<form:errors path="phoneNumber" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="emailAdress"> <spring:message
							code="addClient.form.emailAdress.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="emailAdress" path="emailAdress" type="text"
							class="form:input-large" />
						<form:errors path="emailAdress" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="clientLogin"> <spring:message
							code="addClient.form.clientLogin.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="clientLogin" path="clientLogin" type="text"
							class="form:input-large" />
						<form:errors path="clientLogin" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="clientPassword">
						<spring:message code="addClient.form.clientPassword.label" />
					</label>
					<div class="col-lg-10">
						<form:input id="clientPassword" path="clientPassword"
							type="password" class="form:input-large" />
						<form:errors path="clientPassword" cssClass="text-danger" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary"
							value="Dodaj" />
					</div>
				</div>

			</fieldset>
		</form:form>
	</section>
</body>
</html>
