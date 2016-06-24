

<%@ page import="java.sql.*"%>
<%
    
    String beschreibung = request.getParameter("beschreibung_session");
    String user = request.getParameter("user_session");
    String ftyp = request.getParameter("ftyp");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");
    Statement st = con.createStatement();

 	  //ResultSet rs;
    int i = st.executeUpdate("insert into ticket(beschreibung, ftyp, user, state) values ('" + beschreibung + "','" + ftyp + "', '" + user + "', 'offen')");
    { %>
<%@     include file="/SendEmail.jsp"%>
<%  
 	 }
 	%>





