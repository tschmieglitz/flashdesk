<%@ page import ="java.sql.*" %>
<%
    String ticketid = request.getParameter("ticketid");    
    String beschreibung = request.getParameter("beschreibung");
    String ftyp = request.getParameter("ftyp");
         Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into ticket(ticketid, beschreibung, ftyp) values ('" + ticketid + "','" + beschreibung + "','" + ftyp + "')");
    out.println("Das Ticket ist versandt.");
    
%>