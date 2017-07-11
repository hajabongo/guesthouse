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
<title>Witaj</title>
</head>
<body>
<div style="background: #993300" >
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
				<!-- kolor tekstu -->
				<font color="red"><h1>Witaj w "nazwa pensjonatu"</h1></font>
				<p>Wyjątkowym i jedynym miejscu w "nazwa miasta"</p>
			</div>
		</div>
	</section>

	<!-- Dotąd kopiować -->

	<section>
	<div style="background: #CC6633" >
		<div class="container">
			<!-- Example row of columns -->
			<div class="row" >
				<div class="col-md-4">
					<h2>Pokoje</h2>
					<img src="<c:url value="/resource/images/1.jpg"></c:url>"
						alt="image" style="width: 100%" />
					<p>Oferujemy pokoje 2, 3 i 4 osobowe</p>
					<p>
						<a href=" <spring:url value="/rooms" />
			" class="btn btn-info">
							<span class="glyphicon glyphicon-lamp" /></span> Szczegóły &raquo;
						</a>
					</p>
				</div>
				<div class="col-md-4">
					<h2>Rekreacja</h2>
					<img src="<c:url value="/resource/images/1.jpg"></c:url>"
					alt="image" style="width: 100%" />
					<p>Wypoczynek, sport i nie tylko!</p>
					<p>
						<a href=" <spring:url value="/rooms" />
			" class="btn btn-info">
							<span class="glyphicon glyphicon-heart" /></span> Szczegóły &raquo;
						</a>
				</div>
				<div class="col-md-4">
					<h2>Wyżywienie</h2>
					<img src="<c:url value="/resource/images/1.jpg"></c:url>"
					alt="image" style="width: 100%" />
					<p>Sprawdź co dla Państwa możemy zaoferować</p>
					<p>
						<a href=" <spring:url value="/rooms" />
			" class="btn btn-info">
							<span class="glyphicon glyphicon-list-alt" /></span> Szczegóły &raquo;
						</a>
				</div>
			</div>
	</section>
</body>
</html>
