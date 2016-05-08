<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket</title>
    </head>
    <body>
        <form method="post" action="TicketSend.jsp">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Ticket absenden</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>TicketID</td>
                        <td><input type="text" name="ticketid" value="" /></td>
                    </tr>
                    <tr>
                        <td>Beschreibung</td>
                        <td><input type="text" name="beschreibung" value="" /></td>
                    </tr>
                                        <tr>
                        <td>Fehlertyp</td>
                        <td><input type="text" name="ftyp" value="" /></td>
                    </tr>
                      
                    <tr>
                        <td><input type="submit" value="Absenden" /></td>
                        <td><input type="reset" value="Abbruch" /></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>