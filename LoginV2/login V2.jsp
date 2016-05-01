<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>flashdesk login jsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String id=request.getParameter("username"); 
session.putValue("username",id); 
String password=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","peter","wpeter"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from initiator where username='"+id+"'"); 
if(rs.next()) 
{ 
if(rs.getString(2).equals(password)) 
{ 
out.println("welcome"+id); 

} 
else 
{ 
out.println("Invalid password try again"); 
} 
} 
else 
%>
<a href="Login V2.html">Home</a>
</body>
</html>