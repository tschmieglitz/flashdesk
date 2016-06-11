<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration</title>
<Link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Montserat:400,700' />
<Link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author" content="Jerome Morin, Peter Wachsmann, Thomas schmieglitz " />
<meta name="language" content="deutsch" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	<form method="post" action="registration.jsp">
		<header class="header">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-12">
						<h1>flashdesk Benutzeranmeldung</h1>
					</div>
				</div>
			</div>
		</header>

		<div class="main">
			<div class="container">
				<div class="row">
					<form class="form">
						<div class="col-xs-12 col-md-12">
							<input id="comment" type="text" name="fname"
								placeholder="Vorname"> <input id="comment" type="text"
								name="lname" placeholder="Nachname"> <input id="comment"
								type="text" name="user" placeholder="Benutzername"> <input
								id="comment" type="text" name="pass" placeholder="Passwort">
								 <input id="comment" type="text" name="mail" placeholder="E-Mail Adresse">

						</div>
					</form>
				</div>
				<!-- Sprachänderung und Button verkleinern - JM -->
				<div class "col-xs-2 col-md-2">
					<button type="submit" class="btn">Absenden</button>
					<button type="reset" class="btn">Eingaben löschen</button>
					<button type="reset" class="btn" onClick="javascript:history.go(-1)">Zurück</button>
				</div>

			</div>
		</div>
		<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
		<script src="script.js"></script>
	</form>
</body>
</html>
