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
<title>Login flashdesk</title>

</head>
<body>

	<script type="text/javascript">
		function überprüfung() {
			if (document.formular.username.value == "") {
				alert('Bitte tragen Sie den Benutzernamen ein!');

				return false;
			}

			if (document.formular.password.value == "") {
				alert("Bitte tragen Sie ein Password ein!");

				return false;
			}
		}
	</script>

	<form class="form" name="formular" method="post" action="val.jsp"
		onSubmit="return überprüfung()">

		<header class="header">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-12">
						<h1>Login flashdesk</h1>
					</div>
				</div>
			</div>
		</header>

		<div class="main">
			<div class="container">
				<div class="row">
					<form>
						<div class="col-xs-12 col-md-12">
							<input id="comment" type="text" name="username"
								placeholder="Benutzername"> <input id="comment"
								type="password" name="password" placeholder="Passwort">

						</div>
					</form>
				</div>
				<div>
					<!-- Sprachänderung und Button verkleinern - JM -->
					<button type="submit" class="btn">Login</button>
					<button type="reset" class="btn">Eingaben löschen</button>
					<button type="reset" class="btn"
						onClick="javascript:history.go(-1)">Zurück</button>
				</div>

			</div>
		</div>

		<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
		<script src="script.js"></script>
	</form>
</body>
</html>
