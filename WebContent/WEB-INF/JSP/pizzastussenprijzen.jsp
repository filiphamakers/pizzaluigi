<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="vdab" uri="http://vdab.be/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<c:import url="/WEB-INF/JSP/head.jsp">
	<c:param name="title" value="Pizza's tussen prijzen" />
</c:import>
</head>
<body>
	<vdab:menu/>
	<h1>Pizza's tussen prijzen</h1>
	<form>
		<label>Van prijs<span>${fouten.van}</span> <input name="van"
			value="${param.van}" type="number" min="0" autofocus required>
		</label> <label>Tot prijs<span>${fouten.van}</span> <input name="tot"
			value="${param.tot}" type="number" min="0" required>
		</label> <input type="submit" value="Zoeken">
	</form>
	<c:if test="${not empty pizzas}">
		<ul class="zebra">
			<c:forEach var="pizza" items="${pizzas}">
				<li><c:out value="${pizza.naam}" /> &euro;${pizza.prijs}</li>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${not empty param and empty fouten and empty pizzas}">
		<div class="fout">Geen pizza's gevonden</div>
	</c:if>
</body>
</html>