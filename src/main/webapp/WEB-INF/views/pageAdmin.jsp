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
						face="'Algerian',Times New Roman','Courier New'">Rezerwacje</font>
				</h1>
				</strong>
				<p>Zarządzaj rezerwacjami</p>
			</div>
		</div>
	</section>

	<section class="container">
		<div class="row">
			<div class="col-sm-3 col-md-3" style="background-color: white;">
				<form:form modelAttribute="reservation" class="form-horizontal">
					<div class="form-group ">
						<label class="control-label " for="date"> Od </label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"> </i>
							</div>
							<form:input class="form-control" id="date-pick1" name="date"
								path="dataStart" placeholder="yyyy-mm-dd" type="text" />
						</div>
						<form:errors path="dataStart" cssClass="text-danger" />
					</div>

					<div class="form-group ">
						<label class="control-label " for="date1"> Do </label>
						<div class="input-group">
							<div class="input-group-addon">
								<i class="fa fa-calendar"> </i>
							</div>
							<form:input class="form-control" id="date-pick2" name="date1"
								path="dataStop" placeholder="yyyy-mm-dd" type="text" />
						</div>
						<form:errors path="dataStop" cssClass="text-danger" />
					</div>
					<div class="form-group">

						<div>
							<button class="btn btn-primary " name="submit" type="submit">
								<span class="glyphicon glyphicon-search"></span> Sprawdź
								rezerwacje
							</button>
						</div>
					</div>
				</form:form>
			</div>


			<div class="row">
				<div class="btn-group btn-group-justified">
					<a href=<spring:url value="/admin/filter/confirm" />
						class="btn btn-success" role="button">Filtrij po rezerwacjach
						potwierdzonych</a> <a href=<spring:url value="/admin/filter/wait" />
						class="btn btn-warning" role="button">Filtrij po rezerwacjach
						oczekujących</a> <a href=<spring:url value="/admin/filter/break" />
						class="btn btn-danger" role="button">Filtrij po rezerwacjach
						przerwanych</a>
				</div>
			</div>



			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Rozpoczęcie</th>
						<th>Zakończenie</th>
						<th>Pokój nr</th>
						<th>Klient id</th>
						<th>Status</th>
						<th>Potwierdź</th>
						<th>Anuluj</th>
						<th>Usuń</th>
					</tr>
				</thead>
				<c:forEach items="${reservations}" var="reservation">
					<tbody>
						<tr>
							<td>${reservation.id}</td>
							<td>${reservation.dataStart}</td>
							<td>${reservation.dataStop}</td>
							<td>${reservation.idRoom}</td>
							<td>${reservation.idClient}</td>
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
							<td><a
								href=<spring:url value="/admin/confirm?id=${reservation.id}" />
								class="btn btn-success" role="button">Potwierdź</a></td>
							<td><a
								href=<spring:url value="/admin/break?id=${reservation.id}" />
								class="btn btn-danger" role="button">Przerwij</a></td>
							<td><a
								href=<spring:url value="/admin/delete/reservation?id=${reservation.id}" />
								class="btn btn-warning" role="button">Usuń</a></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</section>
	<hr class="featurette-divider">

	<script type="text/javascript">
		$(function() {
			$('#date-pick1').datepicker({
				showOn : "button",
				format : 'yyyy-mm-dd',
				disabled : true,
				buttonImage : "calendar.png",
				buttonImageOnly : true,
				autoclose : true,
			});
		});
	</script>

	<script type="text/javascript">
		$(function() {
			$('#date-pick2').datepicker({
				showOn : "button",
				format : 'yyyy-mm-dd',
				disabled : true,
				buttonImage : "calendar.png",
				buttonImageOnly : true,
				autoclose : true,
			});
		});
	</script>
</body>
<!-- Extra JavaScript/CSS added manually in "Settings" tab -->
<!-- Include jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

</html>

