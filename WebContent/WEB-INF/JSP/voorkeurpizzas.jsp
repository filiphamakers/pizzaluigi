<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="vdab" uri="http://vdab.be/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<vdab:head title="Voorkeurspizza's"/>
</head>
<body>
	<vdab:menu/>
	<h1>Voorkeurspizza's</h1>
	<form>
		<ul class="zonderbolletjes">
			<c:forEach var="pizza" items="${pizzas}">
				<li><label><input type="checkbox" name="id"
						value="${pizza.id}"> <c:out value="${pizza.naam}" /></label></li>
			</c:forEach>
		</ul>
		<input type="submit" value="Toon mijn keuzes">
	</form>
	<c:if test="${not empty voorkeurPizzas}">
		<c:forEach var="pizza" items="${voorkeurPizzas}">
			<li><c:out value="${pizza.naam}" /></li>
		</c:forEach>
	</c:if>
</body>
</html>