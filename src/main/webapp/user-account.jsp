<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>My Account</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
</head>
<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav hidden-xs">
				<h2>Hello ${name}</h2>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="#section1">Dashboard</a></li>
					<li><a href="index.jsp">Go Home Page</a></li>
					<li><a href="#">Edit Infor</a></li>
					<li><a href="logout">Log out</a></li>
				</ul>
				<br>
			</div>
			<br>
			<div class="col-sm-9">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Order ID</th>
							<th>Order date</th>
							<th>Status</th>
							<th>Addres</th>
							<th>User mail</th>
							<th>Order Detail</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${order}" var="od">
							<tr>
								<td>${od.orderID}</td>
								<td>${od.orderDate}</td>
								<td>${od.status}</td>
								<td>${od.address}</td>
								<td>${od.userMail}</td>
								<td><a href="accountmanager?usermail=${name}&action=view&id=${od.orderID}"><button
											type="button" class="btn btn-primary" >View detail</button></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="btn-box" style="text-align: center;">
					<c:forEach begin="1" end="${num}" var="i">
						<a href="accountmanager?usermail=${name}&index=${i}">${i}</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<c:set var="view" value="${view}" scope="page"></c:set>
	<c:if test="${view == 'view' }">
	<div class="col-sm-12" style="text-align:center"><h1>Product Detail</h1></div>
	<div class="col-sm-12">
		<table class="table table-bordered">
		<tr>
			<th>Order ID</th>
			<th>Product ID</th>
			<th>Amount Product</th>
			<th>Price Product</th>
		</tr>
		<c:forEach items="${detail}" var="detail">
		<tr>
			<th>${detail.getOrderID() }</th>
			<th>${detail.getProductID()}</th>
			<th>${detail.getAmountProduct()}</th>
			<th>${detail.getPriceProduct()}</th>
		</tr>
		</c:forEach>
		</table>
	</div>
	</c:if>
</body>
</html>
