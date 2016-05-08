<%@ page import ="java.sql.*" %>
<%

   try{
	    String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb","admin","herbert");    
        PreparedStatement pst = conn.prepareStatement("Select user,pass from initiator where user=? and pass=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
       if(rs.next())      
       { %>
       <%@     include file="/ticket.jsp" %>
       <%  }else {%>
       <%@     include file="/pw_error.jsp" %>
       <% 
        }
                      
   }
  catch(Exception e){       
     out.println("Fehler. Datenbankanbindung fehlerhaft!!");       
  }      
%>


