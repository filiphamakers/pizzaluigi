<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<title>Pizza's</title>
<link rel="icon" href="images/favicon.ico">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="styles/default.css">
</head>
<body>
	<c:import url="/WEB-INF/JSP/menu.jsp" />
	<h1>Pizza's</h1>
	<ul class="zebra">
		<c:forEach var="entry" items="${pizzas}">
			<li>${entry.key}: ${entry.value.naam} &euro;${entry.value.prijs}<c:if
					test="${entry.value.pikant}"> pikant</c:if> <c:url
					value="/pizzas/detail.htm" var="detailURL">
					<c:param name="id" value="${entry.key}" />
				</c:url> <a href="${detailURL}">Detail</a>
			</li>
		</c:forEach>
	</ul>
</body>
</html>