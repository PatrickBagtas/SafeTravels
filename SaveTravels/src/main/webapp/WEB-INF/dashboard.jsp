<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<div class="navbar d-flex justify-content-center">
	<h1>Safe Travels</h1>
</div>
<div>
	<table class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>Expense</th>
			<th>Vendor</th>
			<th>Amount</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="expense" items="${expenses}">
			<tr>
				<td><a href="/expense/${expense.id}"><c:out value="${expense.expenseName}"/></a></td>
				<td><c:out value="${expense.vendor}"/></td>
				<td><c:out value="${expense.amount}"/></td>
				<td class="d-flex justify-center-between"><a href="/expense/edit/${expense.id}" class="btn btn-success">Edit</a><span>  |   </span>
				<form class="col" action="/expense/delete/${expense.id}" method="post">
				    <input type="hidden" name="_method" value="delete">
				    <input class="btn btn-danger" type="submit" value="Delete">
				</form></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<h2>Add new Burger</h2>
<form:form action="/expense/add" mode="post" modelAttribute="expense">
	<div>
		<form:label path="expenseName">expense Name:</form:label><br>
		<form:errors path="expenseName" class="text-danger"/>
		<form:input class="form-select" path="expenseName" />
	</div>
	<div>
		<form:label path="vendor">vendor Name:</form:label><br>
		<form:errors path="vendor" class="text-danger"/>
		<form:input class="form-select" path="vendor" />
	</div>
	<div>
		<form:label path="amount">Amount:</form:label><br>
		<form:errors path="amount" class="text-danger"/>
		<form:input class="form-select" path="amount" type="double"/>
	</div>
	<div>
		<form:label path="description">Description:</form:label><br>
		<form:errors path="description" class="text-danger"/>
		<form:textarea class="form-select" path="description" rows="3" />
	</div>
	<div>
		<input type="submit" value="Submit"/>
	</div>
</form:form>
	
</div>
</body>
</html>