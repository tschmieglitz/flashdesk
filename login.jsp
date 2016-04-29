<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>flashdesk</title>
<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
  <div id="distance"></div>
  <div id="login">

	<h1 style="color: red; size:8">Benutzeranmeldung</h1>
	<form action="flashdesk.jsp" method="post">
		Benutzername <input type="text" name="name" />
	<br></br>
		Kennwort <input type="text" name="name" />
		<br></br>
		<input type="submit" name="submit" value="Anmelden" /> 	
	</form>
</div>
</body>
</html>