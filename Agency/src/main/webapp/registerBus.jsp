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
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

* {
  box-sizing: border-box;
}

.container {
  padding: 16px;
  background-color: white;
}

select,input[type=text], input[type=password] ,input[type=number]{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

select,input[type=text]:focus, input[type=password],input[type=number]:focus {
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
<form action="BusHandler" method="post">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to register a bus.</p>
    <hr>
    <label><b>Bus Name</b></label>
    <input type='text' placeholder="Enter Bus Name" name='busname' required/>

    <label><b>Bus Plate No</b></label>
    <input type='text' placeholder="Enter Bus Plate Number" name='plateNo' required/>

    <label><b>Bus Type</b></label>
    <select name='type' id='type' required>
	    <option value='AC'>AC</option>  
	    <option value='NON-AC'>NON-AC</option>  
	    <option value='SEATER'>SEATER</option> 
    </select>

    <label><b>Capacity</b></label>
    <input type='number' placeholder="Enter Capacity" name='capacity' required/>

    <hr>
    <button type="submit" class="registerbtn">Register</button>
  </div>
</form>
</body>
</html>