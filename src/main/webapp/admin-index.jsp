<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="css/font-awesome.min.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav hidden-xs">
				<h2>Hello ${name}</h2>

				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#section1">Dashboard</a></li>
					<li><a href="#section2">Edit info</a></li>
					<li><a href="index.jsp">Index Page</a></li>
					<li><a href="accountmanager?usermail=${name}">View All
							Product</a></li>
					<li><a href="logout">Log out</a></li>

				</ul>
				<br>
			</div>

			<br>
			<div class="col-sm-9">
				<div class="form-outline mb-4">
					<form class="search_form" action="searchAD" method="get">
						<input name="search" type="text" class="form-control"
							placeholder="Search here...">
						<button class="" type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th scope="col">Description</th>
							<th scope="col">Price</th>
							<th scope="col">Type</th>
							<th scope="col">Brand</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="p">
							<tr>
								<td>${p.id}</td>
								<td>${p.name}</td>
								<td>${p.descritption}</td>
								<td>${p.price}</td>
								<td>${p.type}</td>
								<td>${p.brand}</td>
								<td><a href="#">Edit</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row alert alert-${alert} justify-content-center">${mess}</div>
				<div class="btn-box" style="text-align: center;">
					<c:forEach begin="1" end="${num}" var="i">
						<a href="searchAD?index=${i}&search=${save}">${i}</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>