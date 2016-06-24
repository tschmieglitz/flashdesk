
<%@ page import="java.sql.*"%>
<%
    String user = request.getParameter("user");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname"); 
    String mail = request.getParameter("mail");
        Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");
    Statement st = con.createStatement();
    

 	 //ResultSet rs;
    int i = st.executeUpdate("insert into user(fname, lname, user,  pass, mail) values ('" + fname + "','" + lname + "','" + user + "','" + pwd + "','" + mail + "')");
    { %>

<%@     include file="/login.jsp"%>
<%
 	 }
 %>



