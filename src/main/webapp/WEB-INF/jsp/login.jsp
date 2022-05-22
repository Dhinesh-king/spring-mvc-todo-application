<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
My First JSP!!
<br>
${errorMessage}
<form action="/login" method="post">
	Name:
	<input type="text" name="name" id="name"/>
	Password:
	<input type="text" name="password" id="password"/>
	<input type="submit" value="Login" />
	<input type="reset" value="Clear">
</form>
</body>
</html>