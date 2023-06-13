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

select,input[type=text] ,input[type=number]{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

select,input[type=text]:focus,input[type=number]:focus {
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
<form action="StopHandler" method="post">
  <div class="container">
    <h1>Route</h1>
    <p>Please fill in this form to add a route.</p>
    <hr>
    <label><b>stop</b></label>
    <input type='text' placeholder="Enter Stop" name='stop' required/>

    <label><b>Km</b></label>
    <input type='number' placeholder="Enter Km" name='km' required/>

    <hr>
    <input type='submit' name='continue' class="registerbtn" value='Add And Save'/>
    <input type='submit' name='next'  class="registerbtn" value='Save'/>
  </div>
</form>
</body>
</html>