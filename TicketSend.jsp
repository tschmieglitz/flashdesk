<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author"
	content="Jerome Morin, Peter Wachsmann, Thomas schmieglitz " />
<meta name="language" content="deutsch" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Ticket versendet</title>
</head>
<body>



	<%@ page import="java.sql.*"%>
	<%
    String ticketid = request.getParameter("ticketid");    
    String beschreibung = request.getParameter("beschreibung");
    String user = request.getParameter("user");
    String ftyp = request.getParameter("ftyp");
         Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");
    Statement st = con.createStatement();
    
    if (beschreibung.equals (""))
    { %> 
 	 <% out.println("Das Feld BESCHREIBUNG muss ausgefüllt werden." );%>
 	 <%@     include file="/ticket.jsp"%>
 	 <%  }else {%>  
 	 <% 
 	if (ftyp.equals (""))
    { %> 
 	 <% out.println("Das Feld FEHLERTYP muss ausgefüllt werden." );%>
 	 <%@     include file="/ticket.jsp"%>
 	 <%  }else {%>  
 	 <% 
 	  //ResultSet rs;
    int i = st.executeUpdate("insert into ticket(beschreibung, ftyp, user, state) values ('" + beschreibung + "','" + ftyp + "', '" + user + "', 'offen')");
    { %> 
 	
 	  <%  
 	 }}}
 	%>
    </body>
</html>