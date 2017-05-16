<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Pokoje</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Pokoje</h1>
				<p>Wszystkie pokoje dostępne w naszym pensjonacie</p>
			</div>
		</div>
	</section>

	<section class="container">
		<div class="row">
			<c:forEach items="${rooms}" var="room">
				<div class="col-sm-6 col-md-3" style="padding-bottom: 15px">
					<div class="thumbnail">
						<div class="caption">
							<h3>${room.roomId}</h3>
							<p>${room.description}</p>
							<p>${room.price} PLN</p>
							<p>Wolny? ${room.free}</p>
							<p>
								<a href=" <spring:url value="/rooms/room?id=${room.roomId }" />
								"class="btn btn=primary">
								<span class="glyphicon-info-sign glyphicon" /></span> Szczegóły</a>
							</p>
							<p>
								<a href=" <spring:url value="/reservation?id=${room.roomId }"/>
								"class="btn btn=primary">
								<span class="glyphicon glyphicon-hand-right" /></span> Zarezerwuj</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>
