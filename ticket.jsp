<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.Connection"%>
<%
	String user = request.getParameter("username");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb", "admin", "herbert");
	Statement st = con.createStatement();
	String query = "select * from ticket where user = '" + user + " '";
	//String query="select * from info where username='"+username+"'";
	ResultSet rss = st.executeQuery(query);
%>

<!DOCTYPE html>
<html>
<head>
<Link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Montserat:400,700' />
<Link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author"
	content="Jerome Morin, Peter Wachsmann, Thomas schmieglitz " />
<meta name="language" content="deutsch" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Ticket</title>
</head>
<!-- Folgend Implementierung von Javascript, damit sich das Beschreibungsfeld automatisch in der Höhe an den eingegebenen Text anpasst  -JM 30.05.2016- -->
<script type="text/javascript">
	function adjustIt() {
		var a = document.getElementById("beschreibung");
		var b = a.value.match(/\n/gi);
		var r = parseInt((a.value.length + 10) / a.cols, 10);
		if (r > 0)
			a.rows = r;
		else
			a.rows = 1;
		if (b)
			a.rows += b.length;
		a.rows++;
	}
</script>
<!-- Das Body-Element wird um die onLoad-Funktion zum Laden der JavaScript-Function "adjustIt" erweitert -JM 30.05.2016- -->
<body onLoad="adjustIt()">
	<form method="post" action="TicketSend.jsp">
		<form method="post" action="val.jsp">

			<header class="header">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-md-12">
							<h1>Ticket flashdesk</h1>
						</div>
					</div>
				</div>
			</header>

			<div class="main">
				<div class="container">
					<div class="row">
						<form class="form">
							<!-- xs vorher 8, md 10 -->
							<div class="col-xs-12 col-md-12">
								<!-- Beschreibung wird um die ID zur Identifikation für die JavaScript Funktion, sowie um den Wert der Cols zur Berechnung
							innerhalb der Funktion erweitert -JM 30.05.2016- -->

								<input type="hidden" name="user" id="comment" type="text"
									value="<%=session.getAttribute("theName")%>"> <input
									id="comment" type="text" name="beschreibung"
									placeholder="Beschreibung"> <input id="comment"
									type="text" name="ftyp" placeholder="Fehlertyp" list="Fehler">
								<datalist id="Fehler" class="datalist">
									<option>Software</option>
									<option>Hardware</option>
									<option>Peripherie</option>
								</datalist>

							</div>
						</form>


						<%
							while (rss.next()) {
						%>
						<table border="2" bordercolor="#2494b7">
							<tr>
								<th>Beschreibung</th>
								<th>Datum</th>
								<th>Fehlertyp</th>
								<th>Status</th>
								<th>Hinweis</th>
								<th>Nutzer</th>
							</tr>
							<tr>
								<td><%=rss.getString(2)%></td>
								<td><%=rss.getString(3)%></td>
								<td><%=rss.getString(4)%></td>
								<td><%=rss.getString(5)%></td>
								<td><%=rss.getString(6)%></td>
								<td><%=rss.getString(7)%></td>

							</tr>
						</table>
						<%
							}
						%>


					</div>
					<divclass"col-xs-2col-md-2"> <!-- Änderung der Sprache der Buttons und Verkleinerung dieser - JM -->
					<button type="submit" class="btn">Absenden</button>
					<button type="reset" class="btn">Eingaben löschen</button>
					<button type="reset" class="btn"
						onClick="javascript:history.go(-1)">Zurück</button>
				</div>

			</div>
			</div>
			<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
			<script src="script.js"></script>
		</form>
	</form>
</body>
</html>
