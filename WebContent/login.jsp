<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>

<%
String email = request.getParameter("email");
session.putValue("email", email);
String password = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "spectre007");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from registration where email = '"+email+"'");

if(rs.next()) {
	boolean checkLogin = rs.getString(2).equals(password);
	if(checkLogin) {
		out.println("<div id='user-info' style='display:block;'>");
	}
	else {
		out.println("Invalid password, please try again.");
		out.println("<br>");
		out.println("<a href='Login.html'>Back</a>");
		out.println("<div id='user-info' style='display:none;'>");
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

<div id="user-info">
<% out.println("Welcome " +rs.getString("fname")); %>
<h1>Registration Profile</h1>
First Name: <% out.println(rs.getString(3)); %> <br>
Last Name: <% out.println(rs.getString(4)); %> <br>
Age: <% out.println(rs.getString(5)); %> <br>
Gender: <% out.println(rs.getString(6)); %> <br>
Country: <% out.println(rs.getString(7)); %> <br>
Address: <% out.println(rs.getString(8)); %> <br>
Contact: <% out.println(rs.getString(9)); %> <br>
Email: <% out.println(rs.getString(1)); %> <br>
Category: <% out.println(rs.getString(10)); %> <br>
Paid in: <% out.println(rs.getString(11)); %>
Mode of Payment: <% out.println(12); %>
Hotel: <% out.println(rs.getString(13)); %> <br>
</div>
</body>
</html>