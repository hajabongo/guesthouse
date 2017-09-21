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
	<div style="background: ">

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
					<h1><strong><font face="'Algerian',Times New Roman','Courier New'">Pokoje</font></h1></strong>
					<p>Wszystkie pokoje dostępne w naszym pensjonacie</p>
				</div>
			</div>
		</section>

		<section class="container">
			<div class="col-sm-3 col-md-3" style="background-color: white;">
				<div class="row">
					<div class="col-sm-3 col-md-12 sidebar">
						<ul class="nav nav-sidebar">
							<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
							<div class="bootstrap-iso">
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-12 col-sm-6 col-xs-12">

											<form:form modelAttribute="reservation"
												class="form-horizontal">

												<div class="form-group ">
													<label class="control-label " for="date"> Od </label>
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-calendar"> </i>
														</div>
														<form:input class="form-control" id="date-pick1"
															name="date" path="dataStart" placeholder="yyyy-mm-dd"
															type="text" />
													</div>
													<form:errors path="dataStart" cssClass="text-danger" />
												</div>

												<div class="form-group ">
													<label class="control-label " for="date1"> Do </label>
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-calendar"> </i>
														</div>
														<form:input class="form-control" id="date-pick2"
															name="date1" path="dataStop" placeholder="yyyy-mm-dd"
															type="text" />
													</div>
													<form:errors path="dataStop" cssClass="text-danger" />
												</div>
												<div class="form-group">
													<br></br>
													<div>
														<button class="btn btn-primary " name="submit"
															type="submit">
															<span class="glyphicon glyphicon-search"></span> Sprawdź
															dostępność
														</button>
													</div>
												</div>
											</form:form>
										</div>
									</div>
								</div>
							</div>

							
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

						</ul>
					</div>
				</div>

			</div>

			<div class="col-sm-9 col-md-9" style="background-color: white;">
				<div class="row">
					<c:forEach items="${rooms}" var="room">
						<div class="col-sm-6 col-md-4" style="padding-bottom: 15px">
							<div class="thumbnail">
								<div class="caption">
									<h3>${room.description}</h3>
									<img src="<c:url value="/resource/images/room.jpg"></c:url>"
										alt="image" style="width: 100%" />
									<p>Cena: ${room.price}PLN</p>
									<p>
										<a href=" <spring:url value="/reservation/add?id=${room.roomId }" />"
											class="btn btn=primary"><span
											class="glyphicon glyphicon-hand-right" /></span> Zarezerwuj &raquo;</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			
		</section>
		<hr class="featurette-divider">

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
