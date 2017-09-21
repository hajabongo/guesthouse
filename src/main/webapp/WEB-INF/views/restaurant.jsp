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
						face="'Algerian',Times New Roman','Courier New'">Restauracja</font>
					</strong>
				</h1>
				<p>Zjedz ze smakiem</p>
			</div>
		</div>
	</section>

	<section>
		<div class="container marketing">
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						Kuchnia. <span class="text-muted">Smak i zdrowie.</span>
					</h2>
					<p class="lead">Głównym celem naszych kucharzy jest zapewnienie
						zdrowych i smacznych posiłków. Pyszne przystawki i wykwintne dania
						to tylko przedsmak tego co możemy Państwu zaoferować. Nasza
						restauracja otwarta jest codziennie od 6 do 22.</p>
				</div>
				<div class="col-md-5">
					<img src="<c:url value="/resource/images/diner.jpeg"></c:url>"
						alt="image" style="width: 100%" />
				</div>
			</div>
			<hr class="featurette-divider">
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7 col-md-push-5">
					<h2 class="featurette-heading">
						Bar. <span class="text-muted">Drinki i napoje.</span>
					</h2>
					<p class="lead">Serdecznie zapraszamy do skorzystania z baru,
						gdzie nasz barman przygotuje dla Państwa przepyszne drinki
						alkoholowe jak i bezalkoholowe. Bar otwarty jest do ostatniego
						klienta lub wyczerpania zapasów.</p>
				</div>
				<div class="col-md-5 col-md-pull-7">
					<img src="<c:url value="/resource/images/bar.jpeg"></c:url>"
						alt="image" style="width: 100%" />
				</div>
			</div>
			<hr class="featurette-divider">
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						Organizacja impez. <span class="text-muted">Wesela,
							urodziny i nie tylko.</span>
					</h2>
					<p class="lead">Oferujemy organizację wszelkich imprez
						okolicznościowych. Nasza sala jest w stanie pomieścić 70 osób, a
						nowoczesne nagłośnie i efekty wizualne sprawią, że każda zabawa
						będzie niezapomniana.</p>
				</div>
				<div class="col-md-5">
					<img src="<c:url value="/resource/images/wedding.jpeg"></c:url>"
						alt="image" style="width: 100%" />
				</div>
			</div>
			<hr class="featurette-divider">
		</div>
	</section>
</body>
</html>
