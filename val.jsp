<%@ page import="java.sql.*"%>
<%
	try {
		String username = request.getParameter("username");
		session.setAttribute("theName", username);
		String password = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver"); // MySQL database connection
		Connection conn = DriverManager.getConnection("jdbc:mysql://ts79.ddns.net:3306/flashdb", "admin",
				"herbert");
		PreparedStatement pst = conn.prepareStatement("Select user,pass from user where user=? and pass=?");
		pst.setString(1, username);
		pst.setString(2, password);
		ResultSet rs = pst.executeQuery();
		
		if (username.equals (""))
        { %> 
     	 <%@     include file="/login.jsp"%>
     	 <%  }else {%>  
     	 <% 
               
        if (username.equals("admin"))
        { %> 
     	 <%@     include file="/show.jsp"%>
     	 <%  }else {%>  
     	 <% 
        if(rs.next())
       { %>
        <%@     include file="/ticket.jsp" %>
       <%  }else {%>
       <%@     include file="/login_error.jsp"%>
       <% 
       } 
     }
       }}
  catch(Exception e){       
     out.println("Fehler. Datenbankanbindung fehlerhaft!!");       
  }      
%>


