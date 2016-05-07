<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <form method="post" action="registration.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Benutzer Anlegen</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Vorname</td>
                        <td><input type="text" name="fname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Nachname</td>
                        <td><input type="text" name="lname" value="" /></td>
                    </tr>
                                        <tr>
                        <td>Benutzername</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                                        <tr>
                        <td>ID</td>
                        <td><input type="id" name="id" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>