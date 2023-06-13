<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="tableStyle.css">
<style type="text/css">
nav {
	width: 99%;
	height: 50px;
	line-height: 20px;
	padding: opx 100px;
	position: fixed;
	background-image: linear-gradient(#033747, #012733);
}

nav ul {
	float: right;
}

nav li {
	display: inline-block;
	list-style: none;
}

nav li {
	float: left;
}

nav li a {
	font-size: 18px;
	text-transform: uppercase;
	padding: 0px 30px;
	color: white;
	text-decoration: none;
}

nav li a:hover {
	color: #ff8c69;
	transition: all 0.4s esse 0s;
}
</style>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	if (session.getAttribute("userName") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<nav>
		<ul>
			<li><a href="route.jsp">route</a></li>
			<li><a href="registerBus.jsp">Register Bus</a></li>
			<li><a href="Logout">Logout</a></li>
		</ul>
	</nav>
	<%@page import="com.bus.*,java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
	int agency_id = (int) session.getAttribute("agency_id");
	List<Bus> list = BusDetails.getBusDetails(agency_id);
	request.setAttribute("list", list);
	%>

	<br>
	<br>
	<br>
	<h3>BUS DETAILS</h3>
	<table id="table">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Plate Name</th>
			<th>Type</th>
			<th>Capacity</th>
			<th>Schedule</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getBus_id()}</td>
				<td>${u.getBusname()}</td>
				<td>${u.getPlateNo()}</td>
				<td>${u.getType()}</td>
				<td>${u.getCapacity()}</td>
				<td><a href="scheduleRoute.jsp?bus_id=${u.getBus_id()}">Schedule</a></td>
				<td><a href="BusHandler?bus_id=${u.getBus_id()}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>