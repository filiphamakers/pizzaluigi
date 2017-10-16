<%-- Welkompagina --%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="vdab" uri="http://vdab.be/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="nl">
<head>
<c:import url="/WEB-INF/JSP/head.jsp">
	<c:param name="title" value="Pizza Luigi"></c:param>
</c:import>
</head>
<body>
	<vdab:menu/>
	<h1>Pizza Luigi</h1>
	<img alt="pizza" src="<c:url value="/images/pizza.jpg"/>"
		class="fullwidth">
	<h2>${begroeting}</h2>
	<h2>De zaakvoerder</h2>
	<dl>
		<dt>Naam</dt>
		<dd>${zaakvoerder.naam}</dd>
		<dt>Aantal kinderen</dt>
		<dd>${zaakvoerder.aantalKinderen}</dd>
		<dt>Gehuwd</dt>
		<dd>${zaakvoerder.gehuwd?"ja":"nee"}</dd>
		<dt>Adres</dt>
		<dd>${zaakvoerder.adres.adres}</dd>
	</dl>
	<div>Deze pagina werd ${aantalKeerBekeken} keer bekeken</div>
	<div>
		<a href="mailto:${initParam.emailAdresWebMaster}">${initParam.emailAdresWebMaster}</a>
	</div>
	<fmt:parseDate type="date" pattern="yyyy-MM-dd" var="nuAlsDate" value="${nu}" />
	<div>
		Vandaag:
		<fmt:formatDate type="date" dateStyle="long" value="${nuAlsDate}" />
	</div>
	<dl>
		<dt>Aantal pizza's verkocht</dt>
		<dd><fmt:formatNumber groupingUsed="false" value="${aantalPizzasVerkocht}"/></dd>
	</dl>
</body>
</html>