<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.lang.*" %>

<%
String userid = request.getParameter("userid");
session.putValue("userid", userid);
String password = request.getParameter("password");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
int age = Integer.valueOf(request.getParameter("age"));
String gender = request.getParameter("gender");
String country = request.getParameter("country");
String address = request.getParameter("address");
long contact = Integer.parseInt(request.getParameter("contact"));
String email = request.getParameter("email");
String category = request.getParameter("category");
String payment = request.getParameter("payment");
String mode = request.getParameter("mode");
String hotel = request.getParameter("hotels");


Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "spectre007");
Statement st = con.createStatement();
ResultSet rs;
st.executeUpdate("create table if not exists registration (userid varchar(20), password varchar(20), fname varchar(20), lname varchar(20), age tinyint(2), gender varchar(10), country varchar(50), address varchar(50), contact bigint(10), email varchar(30), category varchar(20), payment varchar(20), mode varchar(20), hotel varchar(20), primary key(userid), unique(userid));");
int i = st.executeUpdate("insert into registration values('"+userid+"', '"+password+"', '"+fname+"', '"+lname+"', '"+age+"', '"+gender+"', '"+country+"', '"+address+"', '"+contact+"', '"+email+"', '"+category+"', '"+payment+"', '"+mode+"', '"+hotel+"')");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
	<h1>Registration successful!</h1>
	<% out.println("Thank you for registering for the seminar " +fname); %> <br>
	<button onclick="location.href='Login.html'" value="Back to Login">Login</button>
</body>
</html>