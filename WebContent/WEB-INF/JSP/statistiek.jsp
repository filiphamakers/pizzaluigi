<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="vdab" uri="http://vdab.be/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<c:import url="/WEB-INF/JSP/head.jsp">
	<c:param name="title" value="Statistieken" />
</c:import>
</head>
<body>
	<vdab:menu/>
	<h1>Statistiek</h1>
	<dl>
		<dt>Welkom</dt>
		<dd>${indexRequests}</dd>
		<dt>Pizza's</dt>
		<dd>${pizzasRequests}<dd>
		<dt>Aantal winkelmandjes</dt>
		<dd>${aantalMandjes}</dd>
	</dl>
</body>
</html>