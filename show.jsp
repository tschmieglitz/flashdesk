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

	<div class="main">
		<div class="container">
			<div class="row">

				<table>
					<tr>
						<td><form method="post" action="login.jsp">
								<div class="col-xs-2 col-md-2">
									<button type="submit" class="btn">Zurück</button>
								</div>
							</form></td>
						<td><form method="post" action="show_erledigt.jsp">
								<div class="col-xs-2 col-md-2">
									<button type="submit" class="btn">Erledigt</button>
								</div>
							</form></td>
						<td><form method="post" action="show_offen.jsp">
								<div class="col-xs-2 col-md-2">
									<button type="submit" class="btn" >Offen</button>
								</div>

							</form></td>

					</tr>
				</table>


				<form method="post" action="aendernStatus_erledigt.jsp">
					<div class="col-xs-12 col-md-12">
						<div>
							<br />
							<ul class="commentsTicket" id="commentsTicket">
								<table style="margin-left: -60px">
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


								<table style="margin-left: -60px">
									<tr>
										<td style="width: 100px; height: 50px"><li class="ticket"><%=rss.getString(1)%></li></td>
										<td style="width: 350px"><li class="ticket"><%=rss.getString(2)%></li></td>
										<td style="width: 150px"><li class="ticket"><%=rss.getString(4)%></li></td>
										<td style="width: 150px"><li class="ticket"><%=rss.getString(5)%></li></td>
										<td valign="middle" align="center"><div
												class="col-xs-4col-md-2">
												<button type="submit" class="btnTicket" name="ticketid"
													value="<%=rss.getString(1)%>">Erledigt</button>
											</div></td>
									</tr>
								</table>
								<%
									}
								%>
							</ul>
						</div>
					</div>

				</form>

			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
	<script src="script.js"></script>


</body>
</html>
