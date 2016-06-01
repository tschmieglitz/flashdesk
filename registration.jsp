<%@ page import="java.sql.*"%>
<%
    String user = request.getParameter("user");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname"); 
    //String id = request.getParameter("id");
        Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");
    Statement st = con.createStatement();
    
    if (user.equals (""))
    { %>
<% out.println("Das Feld BENUTZERNAME muss ausgefüllt werden." );%>
<%@     include file="/register.jsp"%>
<%  }else {%>
<% 
 	if (pwd.equals (""))
    { %>
<% out.println("Das Feld PASSWORT muss ausgefüllt werden." );%>
<%@     include file="/register.jsp"%>
<%  }else {%>
<%    
 	if (fname.equals (""))
    { %>
<% out.println("Das Feld VORNAME muss ausgefüllt werden." );%>
<%@     include file="/register.jsp"%>
<%  }else {%>
<%  
 	if (lname.equals (""))
    { %>
<% out.println("Das Feld NACHNAME muss ausgefüllt werden." );%>
<%@     include file="/register.jsp"%>
<%  }else {%>
<%
 	
 	 //ResultSet rs;
    int i = st.executeUpdate("insert into user(fname, lname, user,  pass) values ('" + fname + "','" + lname + "','" + user + "','" + pwd + "')");
    out.println("Ihr Benutzerkonto ist angelegt. Bitte loggen Sie sich ein:");
    { %>

<%@     include file="/login.jsp"%>
<%
 	 }
 	 }
 	 }
 	 } 
 	 }  
 	 
    %>

