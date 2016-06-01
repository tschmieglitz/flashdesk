<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="author"
	content="Jerome Morin, Peter Wachsmann, Thomas schmieglitz " />
<meta name="language" content="deutsch" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Login flashdesk</title>
</head>
<body>
	<form method="post" action="val.jsp">

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
					<form class="form" >
						<div class="col-xs-8 col-md-10">
							<input id="comment" type="text" name="username"
								placeholder="Benutzername"> 
								<input id="comment"
								type="password" name="password" placeholder="Passwort">

						</div>
					</form>
				</div>
				<divclass"col-xs-4col-md-2">
				<button type="submit" class="btn">Login</button>
				<button type="reset" class="btn">Reset</button>
				<button type="reset" class="btn" onClick="javascript:history.go(-1)">Back</button>
			</div>

		</div>
		</div>
		<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
		<script src="script.js"></script>
	</form>
</body>
</html>