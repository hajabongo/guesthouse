<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
		<div style="background: #66FF33 " class="jumbotron">
			<div class="container">
				<br> <br>
				<h1>
					<strong><font
						face="'Algerian',Times New Roman','Courier New'">Rezerwacja</font>		
				</h1>
				</strong>
				<p>${room.description }</p>
			</div>
		</div>
	</section>

	<!-- Dotąd kopiować -->

	<section class="container">
		<form:form modelAttribute="newReservation" class="form-horizontal">
			<form:errors path="*" cssClass="alert alert-danger" element="div" />
			<fieldset>
				<legend>Formularz rezerwacji</legend>

				<div class="form-group">
					<label class="control-label col-lg-2" for="nameClient">Imię</label>
					<div class="col-lg-10">
						<div class="col-xs-3">
							<input id="idRoom" type="text" value="${client.name}"
								class="form-control" readonly="true" />

						</div>
					</div>
				</div>


				<div class="form-group">
					<label class="control-label col-lg-2" for="nameClient">Nazwisko</label>
					<div class="col-lg-10">
						<div class="col-xs-3">
							<input id="idRoom" type="text" value="${client.surname}"
								class="form-control" readonly="true" />
						</div>
					</div>
				</div>


				<div class="text-danger" role="alert">
					<strong>${errorDate }</strong>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="dataStart">Data
						rozpoczęcia</label>
					<div class="col-lg-10">
						<div class="col-xs-3">
							<form:input id="date-pick1" path="dataStart" type="text"
								placeholder="yyyy-mm-dd" class="form-control" />
							<form:errors path="dataStart" cssClass="text-danger" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="dataStop">Data
						zakończenia</label>
					<div class="col-lg-10">
						<div class="col-xs-3">
							<form:input id="date-pick2" path="dataStop" type="text"
								placeholder="yyyy-mm-dd" class="form-control" />
							<form:errors path="dataStop" cssClass="text-danger" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2" for="idRoom">Pokój nr
					</label>
					<div class="col-lg-10">
						<div class="col-xs-3">
							<form:input id="idRoom" path="idRoom" type="text"
								value="${room.roomId}" class="form-control" readonly="true" />
							<form:errors path="idRoom" cssClass="text-danger" />
						</div>
					</div>
				</div>


				<div class="form-group">
					<label class="control-label col-lg-2" for="nameClient">Ilość
						osób</label>
					<div class="col-lg-10">
						<div class="col-xs-3">
							<input id="idRoom" type="text" value="${room.size}"
								class="form-control" readonly="true" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-2 col-lg-10">
						<input type="submit" id="btnAdd" class="btn btn-primary"
							value="Złóż rezerwacje" />
					</div>
				</div>

			</fieldset>
		</form:form>
		<hr class="featurette-divider">
	</section>

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
