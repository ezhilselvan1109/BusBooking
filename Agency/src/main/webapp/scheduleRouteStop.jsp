<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="tableStyle.css">
<style type="text/css">

*{
	margin:opx;
	padding:0px;
	box-sizing:border-box;
}
 
nav{
	width:99%;
	height:50px;
	line-height:20px;
	padding:opx 100px; 
	position:fixed;
	background-image:linear-gradient(#033747,#012733);	
}
nav ul{
	float:right;
} 

nav li{
	display:inline-block;
	list-style:none;
}
nav li{
	float:left;
}

nav li a{
	font-size:18px;
	text-transform:uppercase;
	padding:0px 30px;
	color:white;
	text-decoration:none;
}
nav li a:hover{
	color:#ff8c69;
	transition:all 0.4s esse 0s;
}

</style>
</head>
<body>

<body>
	<nav>
		<ul>
			<li><a href="Logout">Logout</a></li>
		</ul>
	</nav>
	
	<%@page import="com.route.stop.*,java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
	String route_id = request.getParameter("route_id");
	List<Stop> list = StopDetails.getStopDetails(Integer.parseInt(route_id));
	request.setAttribute("list", list);
	%>

	<br>
	<br>
	<br>
	<h3>ROUTE STOP DETAILS</h3>
	<form action="ScheduleStopHandler" method="post">
	<table id="table">
		<tr> <th>SELECT</th> <th>stop</th> <th>KM</th> </tr>
		<c:forEach items="${list}" var="u">
		<tr> <td><input type='checkbox' name='checkedRows' value=${u.getRoute_stop_id()}> </td>  <td> ${u.getStop()}</td>  <td>${u.getKm()}</td></tr>
		</c:forEach>
	</table>
	<br>
	<button type="submit">SCHEDULE</button>
	</form> 
</body>
</html>