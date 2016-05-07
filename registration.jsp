<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("user");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname"); 
    String id = request.getParameter("id");
        Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into initiator(fname, lname, user, id, pass) values ('" + fname + "','" + lname + "','" + user + "','" + id + "','" + pwd + "')");
    out.println("Registered");
    
%>