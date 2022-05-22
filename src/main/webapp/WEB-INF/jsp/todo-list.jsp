<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo List</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body style="background-color: pink">
	<div class="container">
		<h1>Hi ${name}</h1>
		<h2>Here are your todos</h2>

		<table class="table table-striped">
			<thead>
				<tr>
					<th><b>Description</b></th>
					<th><b>Target Date</b></th>
					<th><b>Is Done?</b></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ todos}" var="todo">
					<tr>
						<td>${todo.desc }</td>
						<td><fmt:formatDate pattern="dd/MM/yyyy" value="${todo.targetDate}" /></td>
						<td>${todo.done }</td>
						<td><a href="/update-todo?id=${todo.id}" type="button"
							class="btn btn-success">UPDATE</a></td>
						<td><a href="/delete-todo?id=${todo.id}" type="button"
							class="btn btn-warning">DELETE</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="button">
			<a href="/add-todo">Add Todo</a>
		</div>
		<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
		<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script
			src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>

		<script>
			$('#targetDate').datepicker({
				format : 'dd/mm/yyyy'
			});
		</script>
	</div>
</body>
</html>