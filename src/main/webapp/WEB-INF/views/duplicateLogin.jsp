<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html charset=UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/
3.0.0/css/bootstrap.min.css">
<title>Witaj</title>
</head>
<body>
	<section>

		<strong> Podany login ${errorLogin} już istnieje, proszę
			wybrać inny </strong>

		<div class="container">
			<h1 class="alert alert-danger">
				Login: ${errorLogin} <br>już istnieje, proszę wybrać inny.
			</h1>
			<a href="<spring:url value="/add" />" class="btn btn-primary"> <span
				class="glyphicon-hand-left glyphicon"></span> Rejestracja
			</a>
		</div>

	</section>

	<div class="col-md-5">
		<img
			src="<c:url value="/resource/images/1.jpg"></c:url>"
			alt="image" style="width: 100%" />
	</div>
	
	<div class="container">
		<p>
			<input action="action" type="button" value="Back"
				onclick="history.go(-1);" />

		</p>
	</div>
</body>
</html>