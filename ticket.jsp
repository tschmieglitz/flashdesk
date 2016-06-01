<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
								<input id="comment" type="text" name="beschreibung"
									placeholder="Beschreibung"> <input id="comment"
									type="text" name="ftyp" placeholder="Fehlertyp" list="Fehler">
								<datalist id="Fehler">
									<option>Software</option>
									<option>Hardware</option>
									<option>Peripherie</option>
								</datalist>
							</div>
						</form>
					</div>
					<divclass"col-xs-4col-md-2">
					<button type="submit" class="btn">Send</button>
					<button type="reset" class="btn">Reset</button>
					<button type="reset" class="btn"
						onClick="javascript:history.go(-1)">Back</button>
				</div>

			</div>
			</div>
			<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
			<script src="script.js"></script>
		</form>
	</form>
</body>
</html>
