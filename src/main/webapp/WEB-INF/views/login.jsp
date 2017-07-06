<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
					<li><a href=<spring:url value="/add" />><span
							class="glyphicon glyphicon-user"></span> Rejestracja</a></li>
					<li><a href=<spring:url value="/login" />><span
							class="glyphicon glyphicon-log-in"></span> Logowanie</a></li>
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

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Zaloguj się</h3>
					</div>
					<div class="panel-body">
						<c:if test="${not empty error}">
							<div class="alert alert-danger">Niepoprawna nazwa
								użytkownika lub hasło</div>
						</c:if>
						<form action="<c:url value="/j_spring_security_check"></c:url>"
							method="post">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="Nazwa użytkownika"
										name='client_login' type="text">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Hasło"
										name='client_password' type="password" value="">
								</div>
								<input class="btn btn-lg btn-success btn-block" type="submit"
									value="Zaloguj się">
							</fieldset>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>