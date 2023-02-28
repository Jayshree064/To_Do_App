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
</head>
<body>
	<div class="container">
		<h1 class="text-center mt-4">Welcome to TODO App</h1>
		
		<c:if test="${not empty msg }">
			<div class="alert alert-success">
				<b><c:out value="${msg }"></c:out></b>
			</div>
		</c:if>
		
		<div class="row mt-5">
			<div class="col-md-2">
				<h3 class="text-center">Options</h3>
				<div class="list-group">
					<a type="button"
						class="list-group-item list-group-item-action active"
						aria-current="true">Menu</a>
					<a type="button" href='<c:url value='/add'></c:url>'
						class="list-group-item list-group-item-action">
						Add Todo</a>
					<a type="button" href='<c:url value='/home'></c:url>'
						class="list-group-item list-group-item-action">
						View Todo</a>
				</div>
			</div>
			<div class="col-md-10">
				<c:if test="${name=='home' }">
					<h1 class="text-center">All To Do</h1>
					<c:forEach items="${todos }" var="t">
						<div class="card mb-2">
							<div class="card-body">
								<h3><c:out value="${t.todoTitle }"></c:out></h3>
								<p><c:out value="${t.description }"></c:out></p>
								<p><c:out value="${t.entryDate }"></c:out></p>
							</div>
						</div>
					</c:forEach>
					
				</c:if>
				
				<c:if test="${name=='add' }">
					<h1 class="text-center">Add To Do</h1>
					
					<form:form action="saveTodo" method="post" modelAttribute="todo">
						<br>
						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control" placeholder="Enter title.."/>
						</div>
						<div class="form-group">
							<form:textarea path="description" cssClass="form-control mt-2" placeholder="Enter todo details.." cssStyle="height:200px"/>
						</div>
						<div class="container text-center mt-2">
							<button class="btn btn-outline-success">Add</button>
						</div>
					</form:form>
					
					
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>