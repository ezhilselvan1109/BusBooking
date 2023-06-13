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

input[type=text]{
  width: 33%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

button {
  width: 33%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

button:hover {
  background-color: #45a049;
}


</style>
</head>
<body>
<nav>
	<ul>
		<li><a href="Logout">Logout</a></li>
		</ul>
	</nav>
	<br><br>
	<%@page import="com.stop.*,java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
	int customer_id=(int)session.getAttribute("customer_id");
	String starting_point=request.getParameter("starting_point");
	String destination=request.getParameter("destination");
	String date=request.getParameter("date");
	List<StopDetails> list = StopLists.getStopLists(schedule_id);
	request.setAttribute("list", list);
	%>
	<h3>BUS LIST</h3>
	<table id="table">
		<tr><th>Bus Name</th>  <th>Bus Type</th>    <th>Capacity</th>   <th>Available</th>  <th>Date</th>  <th>Departare Time</th>  <th>Fare Amount</th> <th>Select</th></tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getBus_name()}</td>
				<td>${u.getBus_type()}</td>
				<td>${u.getCapacity()}</td>
				<td>5</td>
				<td>${u.getSchedule_date()}</td>
				<td>${u.getDepartare_time()}</td>
				<td>${u.getFare_amount()}</td>
				<td><form action='boarding.jsp?schedule_id=${u.getSchedule_id()}' method='post'><input type='submit' value='SELECT' /></form></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>