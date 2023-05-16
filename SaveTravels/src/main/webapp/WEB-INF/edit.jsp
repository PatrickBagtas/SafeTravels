<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="navbar">
<h2>Edit Expense</h2>
<a href="/expense">GO HOme</a>
</div>
<form:form action="/expense/edited/${id }" mode="post" modelAttribute="expense">
	<div>
	<input type="hidden" name="_method" value="put">
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
</body>
</html>