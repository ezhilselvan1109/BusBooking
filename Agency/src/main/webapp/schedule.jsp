<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
/* body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
} */

* {
  box-sizing: border-box;
}

.container {
  padding: 16px;
  background-color: white;
}

input[type=Date]:focus, input[type=time],input[type=number]{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=Date]:focus, input[type=time],input[type=number]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

.registerbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

a {
  color: dodgerblue;
}

.signin {
  background-color: #f1f1f1;
  text-align: center;
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
			<li><a href="Logout">Logout</a></li>
		</ul>
	</nav>
<%
String bus_id = request.getParameter("bus_id");
request.setAttribute("bus_id", bus_id);
String route_id = request.getParameter("route_id");
request.setAttribute("route_id", route_id);
System.out.println("**&&&&&&&&&&&&&&"+bus_id);
%>
${route_id}
${bus_id}
 <form action="ScheduleHandler?route_id=${route_id}&bus_id=${bus_id}" method="post">
  <div class="container">
    <h1>Schedule</h1>
    <hr>
    <label ><b>Schedule Date</b></label>
    <input type='Date' name='schedule_date' required><br>

    <label ><b>Departare Time</b></label>
    <input type='time' name='departare_time' required/>
    <input type='hidden' name='route_id' value=${route_id} required/>
    <input type='hidden' name='bus_id' value=${bus_id} required/>

    <label ><b>Fare Amount</b></label>
    <input type='number' name='fare_amount' required/>
    
    <hr>
    <button type="submit" class="registerbtn">NEXT</button>
  </div>
</form> 
</body>
</html>