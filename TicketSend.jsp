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

<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.sql.*"%>

<%
    String ticketid = request.getParameter("ticketid");    
    String beschreibung = request.getParameter("beschreibung");
    String user = request.getParameter("user");
    String ftyp = request.getParameter("ftyp");         
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");
    Statement st = con.createStatement();
   
    String result;
    // Recipient's email ID needs to be mentioned.
    String to = "thomas.tt929@gmail.com";

    // Sender's email ID needs to be mentioned
    String from = "thomas@schmieglitz.de";

    // Assuming you are sending email from localhost
    String host = "localhost";

    // Get system properties object
    Properties properties = System.getProperties();

    // Setup mail server
    properties.setProperty("smtp.1und1.de", host);

    // Get the default Session object.
    Session mailSession = Session.getDefaultInstance(properties);

    try{
       // Create a default MimeMessage object.
       MimeMessage message = new MimeMessage(mailSession);
       // Set From: header field of the header.
       message.setFrom(new InternetAddress(from));
       // Set To: header field of the header.
       message.addRecipient(Message.RecipientType.TO,
                                new InternetAddress(to));
       // Set Subject: header field
       message.setSubject("Ticket!");
       // Now set the actual message
       message.setText(user);
       // Send message
       Transport.send(message);
       result = "Ihr Ticket wurde versand!";
    }catch (MessagingException mex) {
       mex.printStackTrace();
       result = "Error: unable to send message....";
    }

%>

</body>
</html>
 	
 	
 	
