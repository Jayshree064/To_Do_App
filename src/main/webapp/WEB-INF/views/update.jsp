<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><c:out value="${name }"></c:out></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
</head>
<body>
	<div class="container">
		<h1 class="text-center">Update To Do</h1>
					
		<form:form action="${pageContext.request.contextPath }/saveTodo" method="post" modelAttribute="todo">
			<br>
			<div class="form-group"> 
				<label>Todo Id is:</label>
				<input type="text" value="${todo.todoId }" cssClass="form-control">
			</div>
			<br>
			<div class="form-group"> 
				<form:input path="todoTitle" cssClass="form-control" placeholder="Enter title.."/>
			</div>
			<div class="form-group">
				<form:textarea path="description" cssClass="form-control mt-2" placeholder="Enter todo details.." cssStyle="height:200px"/>
			</div>
			<div class="container text-center mt-2">
				<a href="${pageContext.request.contextPath }/" class="btn btn-outline-secondary">Back</a>
				<button class="btn btn-outline-warning">Update</button>
				
			</div>
		</form:form>
	</div>
</body>
</html>