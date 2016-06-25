<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Ticket Übersicht</title>
<Link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Montserat:400,700' />
<Link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' />
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
		<div class="col-xs-12 col-md-12">
			<div>
				<ul class="commentsTicket" id="commentsTicket">
					<table>
						<tr>
							<td style="width: 100px"><li class="ticket">Ticket</li></td>
							<td style="width: 350px"><li class="ticket">Bezeichnung</li></td>
							<td style="width: 150px"><li class="ticket">Fehlertyp</li></td>
							<td style="width: 100px"><li class="ticket">Status</li></td>
						</tr>
					</table>
					<%
						while (rss.next()) {
					%>


					<table>
						<tr>
							<td style="width: 100px; height: 50px"><li class="ticket"><%=rss.getString(1)%></li></td>
							<td style="width: 350px"><li class="ticket"><%=rss.getString(2)%></li></td>
							<td style="width: 150px"><li class="ticket"><%=rss.getString(5)%></li></td>
							<td style="width: 150px"><li class="ticket"><%=rss.getString(6)%></li></td>
							<td valign="middle" align="center"><divclass"col-xs-4col-md-2">
								<button type="submit" class="btnTicket" name="ticketid"
									value="<%=rss.getString(1)%>">erledigt</button></td>
						</tr>
					</table>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</form>
	<div class="col-xs-2 col-md-2">
		<!-- Sprachänderung und Button verkleinern - JM -->
		<button type="reset" class="btn" onClick="javascript:history.go(-2)"
			style="margin-left: 30px;">Zurück</button>
	</div>

	<form method="post" action="show_erledigt.jsp">
		<div class="col-xs-2 col-md-2">
			<button type="submit" class="btn" style="margin-left: 30px;">Erledigt</button>
		</div>
	</form>

	<form method="post" action="show_offen.jsp">
		<div class="col-xs-2 col-md-2">
			<button type="submit" class="btn" style="margin-left: 30px;">Offen</button>
		</div>
	</form>


	<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
	<script src="script.js"></script>


</body>
</html>
