<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Pokój</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Pokój</h1>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<div class="col-md-5">
				<h3>${room.description}</h3>
				<p>Pełen opis pokoju (uzupełnić klasę)</p>
				<p>
					<strong>Możliwa dostawka: </strong><span class="label label-warning">(Uzupełnic klasę)</span>
				</p>
				<p>
					<strong>Piętro:</strong> ${room.storey}
				</p>
				
				<h4>${room.price} PLN</h4>
				<p>
					<a href="#" class="btn btn-warning btn-large"> 
					<span class="glyphicon-shopping-cart glyphicon"></span> Zarezerwuj teraz
					</a> 
					<a href="<spring:url value="/rooms" />" class="btn btn-default">
					<span class="glyphicon-hand-left glyphicon"></span> Powrót
					</a>

				</p>

			</div>
		</div>
	</section>
</body>
</html>
