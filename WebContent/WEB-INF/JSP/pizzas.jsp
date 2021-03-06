<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="vdab" uri="http://vdab.be/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<vdab:head title="Pizza's"/>
</head>
<body>
	<vdab:menu/>
	<h1>Pizza's</h1>
	<ul class="zebra">
		<c:forEach var="pizza" items="${pizzas}">
			<li>${pizza.id}:<c:out value="${pizza.naam}" />
				&euro;${pizza.prijs} ${pizza.pikant?"pikant":"niet pikant"} 
				<c:url value="/pizzas/detail.htm" var="detailURL">
					<c:param name="id" value="${pizza.id}"/>
				</c:url> 
				<a href="${detailURL}">Detail</a> 
				<c:if test="${pizzaIdsMetFoto.contains(pizza.id)}">
					<c:url value="/pizzafotos/${pizza.id}.jpeg" var="fotoURL"/>
					<a href="${fotoURL}">Foto</a>
				</c:if>
			</li>
		</c:forEach>
	</ul>
</body>
</html>