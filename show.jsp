<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Ticket Übersicht</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author"
	content="Jerome Morin, Peter Wachsmann, Thomas schmieglitz " />
<meta name="language" content="deutsch" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<form method="post" action="aendernStatus.jsp">
		<header class="header">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-12">
						<h1>Ticket Übersicht</h1>
					</div>
				</div>
			</div>
		</header>
		<%@page import="java.sql.*"%>
		<%@page import="javax.sql.*"%>
		<%@page import="java.sql.Connection"%>
		<%
			String usernam = request.getParameter("usernam");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb", "admin", "herbert");
			Statement st = con.createStatement();
			String query = "select * from ticket";
			//String query="select * from info where username='"+username+"'";
			ResultSet rss = st.executeQuery(query);
		%>
		<div>
			<div>
				<table>
					<tr>
						<td style="width: 90px">TicketID</td>
						<td style="width: 350px">Bezeichnung</td>
						<td style="width: 150px">Fehlertyp</td>
						<td>Status</td>
					</tr>
				</table>
				<%
					while (rss.next()) {
				%>


				<table>
					<tr>
						<td style="width: 90px"><%=rss.getString(1)%></td>
						<td style="width: 350px"><%=rss.getString(2)%></td>
						<td style="width: 150px"><%=rss.getString(5)%></td>
						<td style="width: 100px"><%=rss.getString(6)%></td>
						<td><divclass"col-xs-4col-md-2">
							<button type="submit" class="btn" name="ticketid"
								value="<%=rss.getString(1)%>">erledigt</button>
			</div>
			</td>


			</tr>
			</table>
			<%
}
%>
		</div>
		</div>
	</form>
</body>
</html>