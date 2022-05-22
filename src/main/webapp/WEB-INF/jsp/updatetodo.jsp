<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo Page</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<h1>Hi ${name}!!</h1>
		<h3>Add to do Page</h3>

		<sf:form action="/update-todo" method="post" modelAttribute="todo">
			<sf:hidden path="id" />
			<fieldset class="form-group">
				<sf:label path="desc">Description</sf:label>
				<sf:input type="text" path="desc" id="desc" class="form-control"
					required="required" />
				<sf:errors path="desc" cssClass="text-warning" />
			</fieldset>
			<fieldset class="form-group">
				<sf:label path="targetDate">Date</sf:label>
				<sf:input type="text" path="targetDate" id="targetDate" class="form-control"
					required="required" />
				<sf:errors path="targetDate" cssClass="text-warning" />
			</fieldset>
			<button type="submit" class="btn btn-success">ADD</button>
		</sf:form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>