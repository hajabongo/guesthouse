<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
				<p>Sprawdź rezerwacje i edytuj dane</p>
			</div>
		</div>
	</section>
	<section>


		<section class="container">
			<div class="col-sm-3 col-md-3" style="background-color: white;">
				<legend>
					<h3>Dane osobowe</h3>
				</legend>
				<h4>Imie: ${client.name}</h4>
				<h4>Nazwisko: ${client.surname}</h4>
				<h4>Miasto: ${client.country}</h4>
				<h4>Numer telefonu: ${client.phoneNumber}</h4>
				<h4>Email ${client.emailAdress}</h4>
				<a href=<spring:url value="/client/edit" /> class="btn btn-success"
					role="button">Edytuj</a>
			</div>

			<div class="col-sm-1 col-md-1"></div>

			<div class="col-sm-8 col-md-8" style="background-color: white;">
				<div class="row">
					<legend>
						<h3>Rezerwacje</h3>
					</legend>
					<table class="table">
						<thead>
							<tr>
								<th>Rozpoczęcie</th>
								<th>Zakończenie</th>
								<th>Pokój nr</th>
								<th>Status</th>
							</tr>
						</thead>
						<c:forEach items="${reservation}" var="reservation">
							<tbody>
								<tr>
									<td>${reservation.dataStart}</td>
									<td>${reservation.dataStop}</td>
									<td>${reservation.idRoom}</td>
									<c:choose>
										<c:when test="${reservation.confirm.equals('false')}">
											<td>Czeka na potwierdzenie</td>
										</c:when>
										<c:when test="${reservation.confirm.equals('true')}">
											<td>Potwierdzona</td>
										</c:when>
										<c:when test="${reservation.confirm.equals('break')}">
											<td>Anulowana</td>
										</c:when>
									</c:choose>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
		</section>
		<hr class="featurette-divider">
</body>
</html>
