<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author"
	content="Jerome Morin, Peter Wachsmann, Thomas schmieglitz " />
<meta name="language" content="deutsch" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Status</title>
</head>
<body>



	<%@ page import="java.sql.*"%>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb", "admin", "herbert");
		Statement st = con.createStatement();
		//ResultSet rs;
		int i = st.executeUpdate("update ticket set state = 'geschlossen'");
		// state = offen Ticket wurde aufgeben
		// state = geschlossen Ticket wurde abgearbeitet
	%>



</body>
</html>