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

<body>
	<nav>
		<ul>
			<li><a href="Logout">Logout</a></li>
		</ul>
	</nav>
	<br><br><br>
	<form action="ViewBus.jsp" method="post">
		<input type="text" placeholder="Enter The Boarding Point" name="starting_point" required>
		<input type="text" placeholder="Enter The Dropping Point" name="destination" required>
		<input type="date" placeholder="Enter The Date" name="date" required>
		<button type="submit" >Search</button>
	</form>
	<!--  
	<%-- <%@page import="com.booking.*,java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
	int customer_id=(int)session.getAttribute("customer_id");
	List<BookedList> list = BookedDetails.getBookedList(customer_id);
	request.setAttribute("list", list);
	%> --%>
	<h3>BOOKED LIST</h3>
	<table id="table">
		<tr> <th>Booking ID</th> <th>Schedule Date</th> <th>Dropping Stop</th> <th>boarding Stop</th>  <th>No Of Seats</th>  <th>Total Amount</th>  <th>Action</th></tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getBooking_id()}</td>
				<td>${u.getSchedule_date()}</td>
				<td>${u.getBoarding_stop()}</td>
				<td>${u.getDropping_stop()}</td>
				<td>${u.getNumber_of_seats()}</td>
				<td>${u.getTotal_amount()}</td>
				<td><form action='CancelBooking?booking_id=${u.getBooking_id()}' method='post'><input type='submit' value='Cancel' /></form></td>
			</tr>
		</c:forEach>
	</table>
	-->
</body>
</html>