<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.lang.*" %>

<%
String email = request.getParameter("email");
session.putValue("email", email);
String password = request.getParameter("password");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
int age = Integer.valueOf(request.getParameter("age"));
String gender = request.getParameter("gender");
String country = request.getParameter("country");
String address = request.getParameter("address");
String contact = request.getParameter("contact");
String category = request.getParameter("category");
String currency = request.getParameter("currency");
String mode = request.getParameter("mode");
String hotel = request.getParameter("hotels");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "spectre007");
Statement st = con.createStatement();
ResultSet rs;
st.executeUpdate("create table if not exists registration (email varchar(50), password varchar(20), fname varchar(20), lname varchar(20), age tinyint(2), gender varchar(10), country varchar(50), address varchar(50), contact varchar(10), category varchar(20), currency varchar(20), mode varchar(20), hotel varchar(20), primary key(email), unique(email));"); 
rs = st.executeQuery("select distinct email from registration where email='"+email+"'");

if (!rs.next()) {
	out.println("<h2>Registration successful!</h2>");
	out.println("<p>Thank you for registering.</p>");
	st.executeUpdate("insert into registration values('"+email+"', '"+password+"', '"+fname+"', '"+lname+"', '"+age+"', '"+gender+"', '"+country+"', '"+address+"', '"+contact+"', '"+category+"', '"+currency+"', '"+mode+"', '"+hotel+"')");	
}
else {
	out.println("<p>This email address is already registered, please use a different one.</p>");
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
	<a href="Login.html">Back to Login</a>
</body>
</html>