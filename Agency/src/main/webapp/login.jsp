<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
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

input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

.loginbtn {
	background-color: #04AA6D;
	color: white;
	padding: 16px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.loginbtn:hover {
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
	String msg = request.getParameter("msg");
	if (msg == null) {
		msg = "";
	}
	out.print(msg);
	/* if(request.getParameter("msg").equals("wrong")){
		out.print("Wrong username and Password!");
	} */
	%>
	<form action="Login" method="post">
		<div class="container">
			<h1>Login</h1>
			<p>Please fill in this form to login an account.</p>
			<hr>
			<label for="username"><b>User Name</b></label> 
			<input type="text" placeholder="Enter User Name" name="userName" required> 
			<label for="psw"><b>Password</b></label> 
			<input type="password" placeholder="Enter Password" name="password" required>
			<hr>
			<button type="submit" class="loginbtn">Login</button>
		</div>

		<div class="container signin">
			<p>
				Don't have an account? <a href="register.jsp">Register</a>.
			</p>
		</div>
	</form>
</body>
</html>