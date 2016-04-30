<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>flashdesk loginjsp</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String id=request.getParameter("username"); 
session.putValue("id",id); 
String password=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:ts79.ddns.net:3306/flashdesk","peter","wpeter"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from initiator where id='"+id+"'"); 
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
</body>
</html>