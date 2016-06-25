<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

			<div class="main">
				<div class="container">
					<div class="row">

						<form>
							<!-- xs vorher 8, md 10 -->
							<div class="col-xs-12 col-md-12">
								<!-- Beschreibung wird um die ID zur Identifikation für die JavaScript Funktion, sowie um den Wert der Cols zur Berechnung
							innerhalb der Funktion erweitert -JM 30.05.2016- -->

								<input type="hidden" name="user_session" id="comment"
									type="text" value="<%=session.getAttribute("theName")%>">
								<input id="comment" type="text" name="beschreibung_session"
									placeholder="Beschreibung"> <input id="comment"
									type="text" name="ftyp" placeholder="Fehlertyp" list="Fehler">
								<datalist id="Fehler" class="datalist">
									<option>Software</option>
									<option>Hardware</option>
									<option>Peripherie</option>
								</datalist>
							</div>
						</form>
</div>

					

				
	<div class="col-xs-2 col-md-2">
		<!-- Sprachänderung und Button verkleinern - JM -->
		<button type="reset" class="btn" onClick="javascript:history.go(-2)"
			>Zurück</button>
	</div>
	<form method="post" action="show_erledigt.jsp">
		<div class="col-xs-2 col-md-2">
			<button type="submit" class="btn" >Erledigt</button>
		</div>
	</form>

	<form method="post" action="show_offen.jsp">
		<div class="col-xs-2 col-md-2">
			<button type="submit" class="btn" >Offen</button>
		</div>
	</form>
	
</div>
					</div>
				<br> <br> <br>
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
									<td valign="middle" align="center"><div class="col-xs-4col-md-2">
								</tr>
							</table>
							<%
								}
							%>
						</form>	
			
	<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
	<script src="script.js"></script>


</body>
</html>
