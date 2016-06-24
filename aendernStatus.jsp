

<%@ page import="java.sql.*"%>
<%
		String ticketid = request.getParameter("ticketid");
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb", "admin", "herbert");
		Statement st = con.createStatement();
	
		int i = st.executeUpdate("update ticket set state ='erledigt'where TicketID='" + ticketid + "'");
		
	%>

