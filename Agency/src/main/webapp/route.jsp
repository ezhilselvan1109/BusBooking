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
			<li><a href="addRoute.jsp">add route</a></li>
			<li><a href="Logout">Logout</a></li>
		</ul>
	</nav>
	<%@page import="com.route.*,java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
	List<Route> list = RouteDetails.getRouteDetails();
	request.setAttribute("list", list);
	%>

	<br>
	<br>
	<br>
	<h3>ROUTE DETAILS</h3>
	<table id="table">
		<tr>
			<th>STATING POINT</th>
			<th>DESTINATION</th>
			<th>KM</th>
			<th>VIEW</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getStarting_point()}</td>
				<td>${u.getDestination()}</td>
				<td>${u.getKm()}</td>
				<td><a href="routeStop.jsp?route_id=${u.getRoute_id()}">View</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>