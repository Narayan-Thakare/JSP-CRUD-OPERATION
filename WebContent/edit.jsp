<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Record</title>
</head>
<body>
<%
try {
    String name = request.getParameter("firstName"); 
    String address = request.getParameter("lastName"); 
    String contact = request.getParameter("contactNo"); 

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/serv", "root", "abc123");
    PreparedStatement updateStmt = con.prepareStatement(
            "UPDATE serv.ser SET address = ?, contact = ? WHERE name = ?");
    updateStmt.setString(1, address);
    updateStmt.setString(2, contact);
    updateStmt.setString(3, name);

    int rowsUpdated = updateStmt.executeUpdate();

    if (rowsUpdated > 0) {
        out.println("<h2>Record updated successfully!</h2>");
        response.sendRedirect("show.jsp");
    } else {
        out.println("Record not found or update failed.");
    }
    
    updateStmt.close();
    con.close();
} catch (SQLException e) {
    e.printStackTrace();
}
%>
</body>
</html>
