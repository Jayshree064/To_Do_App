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
	<style>
		.addBtn{
		    color: #f88634;
		    border: 1px solid #f88634;
		}
		.addBtn:hover{
		    color: white;
		    background-color: #f88634;
		}
	</style>
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
								<div class="row">
									<h3><c:out value="${t.todoId }"></c:out></h3>
									<div class="col">
										<h3><c:out value="${t.todoTitle }"></c:out></h3>
									</div>
									<div class="col d-flex justify-content-end">
										<a href="update/${t.todoId }" class="btn btn-outline-warning border-0" >
											<i class="fa-solid fa-pen-to-square" style="font-size:17px"></i>
										</a>

										<a href="delete/${t.todoId }" class="btn btn-outline-danger ms-2 border-0">
											<i class="fa-solid fa-trash " style="font-size:17px"></i>
										</a>
									</div>
									<p><c:out value="${t.description }"></c:out></p>
									<p><c:out value="${t.entryDate }"></c:out></p>
								</div>
								
								
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
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>