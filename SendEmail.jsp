<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%

String user = request.getParameter("username");

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
      message.setText("Es wurde ein neues Ticket erstellt von User: +name_session+ mit Fehler +bezeichnung_session+ und +ftyp_session+");
      // Send message
      Transport.send(message);
      result = "Ihr Ticket wurde versand!";
   }catch (MessagingException mex) {
      mex.printStackTrace();
      result = "Error: unable to send message....";
   }
%>
<html>
<head>
<title>Sie werden informiert!</title>
</head>
<body>
<center>
<h1>Ihr Ticket wurde versand!</h1>
</center>
<p align="center">
<% 
   out.println("Result: " + result + "\n");
%>
</p>
</body>
</html>