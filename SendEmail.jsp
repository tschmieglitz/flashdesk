<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.sql.*"%>
<%
 		String user_email = request.getParameter("user_session"); 
		String beschreibung_email = request.getParameter("beschreibung_session");
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");    
        PreparedStatement pst = conn.prepareStatement("Select user,pass from user where user=? and pass=?");
        pst.setString(1, user_email);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery(); 



       

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
              message.setText("Es wurde ein neues Ticket erstellt von User:" + user_email +"."+ "\n"+"folgender Fehler wurde gemeldet:" + beschreibung_email );
              // Send message
              Transport.send(message);
              result = "Ihr Ticket wurde versand!" +"von"+ user_email ;
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