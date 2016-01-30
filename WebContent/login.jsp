<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>

<%
String userid = request.getParameter("userid");
session.putValue("userid", userid);
String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "spectre007");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from registration where userid = '"+userid+"'");

if(rs.next()) {
	boolean checkLogin = rs.getString(2).equals(password);
	if(checkLogin) {
		out.println("Welcome " +userid);
	}
	else {
		out.println("Invalid password, try again.");
	}
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
</head>
<body>

<div>
<h1>Registration Profile</h1>
First Name: <% out.println(rs.getString(3)); %> <br>
Last Name: <% out.println(rs.getString(4)); %> <br>
</div>
</body>
</html>