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

String sn = request.getParameter("searchname");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/serv","root","abc123");
ResultSet rs= null;

PreparedStatement stmt = con.prepareStatement("SELECT * FROM serv.ser WHERE name LIKE ?");
stmt.setString(1, "%" + sn + "%");
rs = stmt.executeQuery();
%>
<table>
        <tr>
            <th>Name</th>
            <th>Address</th>
            <th>Contact No.</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
  <%
  while (rs.next()) {  
  %>
   <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>

            <td><a href='showEdit.jsp?name=<%= rs.getString("name") %>'>Edit</a></td>
            <td><a href='delete.jsp?name=<%= rs.getString(1) %>'>Delete</a></td>
        </tr>
    
     <%
     
     
}
  %>
  
  </table>











</body>
</html>