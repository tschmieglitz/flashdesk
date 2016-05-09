<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.sql.Connection" %>
<%
String usernam=request.getParameter("usernam");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");
Statement st=con.createStatement();
String query="select * from ticket";
//String query="select * from info where username='"+username+"'";
ResultSet rss=st.executeQuery(query);
%>

<%
while(rss.next())
{
%>
<table border="2" bordercolor="#2494b7">
<tr>
<th>TicketID</th>
<th>Beschreibung</th>
<th>Fehlertyp</th>
</tr>
<tr>
<td><%=rss.getString(1)%></td>
<td><%=rss.getString(2)%></td>
<td><%=rss.getString(3)%></td>
</tr>
</table>
<%
}
%>

