<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="vdab" uri="http://vdab.be/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<c:import url="/WEB-INF/JSP/head.jsp">
	<c:param name="title" value="Pizza toevoegen"></c:param>
</c:import>
</head>
<body>
	<vdab:menu/>
	<h1>Pizza toevoegen</h1>
	<form method="post" id="toevoegform" enctype="multipart/form-data">
		<label>Naam<span>${fouten.naam}</span> <input name="naam"
			value="${param.naam}" autofocus required></label> 
		<label>Prijs<span>${fouten.prijs}</span><input
			name="prijs" value="${param.prijs}" type="number" min="0" step="0.01"
			required></label>
		<div><label><input type="checkbox" name="pikant" value="pikant">Pikant</label></div>
		<label>Foto<span>${fouten.foto}</span><input type="file" name="foto"></label>
		<input type="submit" value="Toevoegen" id="toevoegknop">
	</form>
	<script>
		document.getElementById("toevoegform").onsubmit = function(){
			document.getElementById("toevoegknop").disabled = true;
		};
	</script>
</body>
</html>