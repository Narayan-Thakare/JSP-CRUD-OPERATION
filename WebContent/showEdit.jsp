<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
String name=request.getParameter("name");


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/serv","root","abc123");
ResultSet rs= null;

PreparedStatement stmt = con.prepareStatement("SELECT * FROM serv.ser WHERE name = ?");
stmt.setString(1, name); // Set the unique identifier in the SQL query
rs = stmt.executeQuery();
%>

  <%
	if (rs.next()) {
		
		
  %>
  
   <%
  String address = rs.getString("address");
				String contact = rs.getString("contact");
				%>
<form action="edit.jsp" method="post">
   <label for="firstName">First Name:</label>
    <input type="text" name="firstName" value="<%= name %>"><br>
    <label for="lastName">Last Name:</label>
    <input type="text" name="lastName" value="<%= address %>"><br>
    <label for="contactNo">Contact No.:</label>
    <input type="text" name="contactNo" value="<%= contact %>"><br>
    <input type="submit" value="Update">
</form>
  
  
  
  
   
    
     <%
}
  %>
  /////////////////////////////////////////////////////////
  <%
  String address = rs.getString("address");
				String contact = rs.getString("contact");
				%>
  
<form action="edit.jsp" method="post">
   <label for="firstName">First Name:</label>
    <input type="text" name="firstName" value="<%= name %>"><br>
    <label for="lastName">Last Name:</label>
    <input type="text" name="lastName" value="<%= address %>"><br>
    <label for="contactNo">Contact No.:</label>
    <input type="text" name="contactNo" value="<%= contact %>"><br>
    <input type="submit" value="Update">
</form>
  
////////////////////////////////////////////////////////////////









</body>
</html>