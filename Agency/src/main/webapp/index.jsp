<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<li><a href="login.jsp">Login</a></li>
			<li><a href="register.jsp">Register</a></li>
		</ul>
	</nav>
	<br><br><br><br>
	<h1 align="center">BOokIng SysTem</h1>
</body>
</html>