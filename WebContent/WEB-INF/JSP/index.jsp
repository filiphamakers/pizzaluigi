<%-- Welkompagina --%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="nl">
<head>
<title>Pizza Luigi</title>
<link rel="stylesheet" href="styles/default.css">
<link rel="icon" href="images/favicon.ico?">
</head>
<body>
	<h1>Pizza Luigi</h1>
	<img alt="pizza" src="images/pizza.jpg" class="fullwidth">
	<h2>${begroeting}</h2>
	<h2>De zaakvoerder</h2>
	<dl>
		<dt>Naam</dt><dd>${zaakvoerder.naam}</dd>
		<dt>Aantal kinderen</dt><dd>${zaakvoerder.aantalKinderen}</dd>
		<dt>Gehuwd</dt><dd>${zaakvoerder.gehuwd?"ja":"nee"}</dd>
		<dt>Adres</dt><dd>${zaakvoerder.adres.adres}</dd>
	</dl>
</body>
</html>