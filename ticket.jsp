<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.Connection"%>
<%
	String user_ticket = request.getParameter("username");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb", "admin", "herbert");
	Statement st = con.createStatement();
	String query = "select * from ticket where user = '" + user_ticket + " '";
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

	<script type="text/javascript">
		function überprüfung() {
			if (document.formular.beschreibung_session.value == "") {
				alert('Der Fehler wurde nicht näher beschrieben!');

				return false;
			}

			if (document.formular.ftyp.value == "") {
				alert("Bitte tragen Sie den Fehlertyp ein!");

				return false;
			}
		}
	</script>

	<form class="form" name="formular" method="post"
		action="TicketSend.jsp" onSubmit="return überprüfung()">
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
					<div class="col-xs-2col-md-2">
						<!-- Änderung der Sprache der Buttons und Verkleinerung dieser - JM -->
						<button type="submit" class="btn">Absenden</button>
						<button type="reset" class="btn">Löschen</button>
						<button type="reset" class="btn"
							onClick="javascript:history.go(-1)">Zurück</button>

						<br> <br> <br>
						<div class="col-xs-12 col-md-12">
							<div>
								<ul class="commentsTicket" id="commentsTicket">
									<table style="margin-left: -70px">
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


									<table style="margin-left: -70px">
										<tr>
											<td style="width: 100px; height: 50px"><li
												class="ticket"><%=rss.getString(1)%></li></td>
											<td style="width: 350px"><li class="ticket"><%=rss.getString(2)%></li></td>
											<td style="width: 150px"><li class="ticket"><%=rss.getString(5)%></li></td>
											<td style="width: 150px"><li class="ticket"><%=rss.getString(6)%></li></td>
											<td valign="middle" align="center"><div
													class="col-xs-4col-md-2">
										</tr>
									</table>
									<%
										}
									%>
								</ul>
							</div>

						</div>
					</div>
				</div>
			</div>
			<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
			<script src="script.js"></script>
		</form>
	</form>
</body>
</html>
