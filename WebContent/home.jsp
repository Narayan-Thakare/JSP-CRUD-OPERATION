<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
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

String fn=request.getParameter("first_name");
String ln=request.getParameter("last_name");
String cn=request.getParameter("number");


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/serv","root","abc123");
PreparedStatement stmt=con.prepareStatement("Insert into serv.ser values(?,?,?)");
stmt.setString(1,fn);
stmt.setString(2, ln);
stmt.setString(3, cn);
int a=stmt.executeUpdate();
if(a>0){
	 System.out.println("data inserted");
}



java.util.Date date=(Calendar.getInstance().getTime());
%>
<b><%=fn%></b><%=date %>

today is <%=date %>






</body>
</html>