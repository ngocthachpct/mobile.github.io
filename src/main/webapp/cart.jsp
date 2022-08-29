<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/cart.css" rel="stylesheet" />
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/responsive.css" rel="stylesheet" />
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/custom.js"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container px-4 py-5 mx-auto">
		<div class="d-flex flex-row align-items-center">
			<i class="fa fa-long-arrow-left"></i><span class="ml-2"><a
				href="index.jsp">Continue Shopping</a></span>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="col-12">
				<div class="row text-center">
					<div class="col-2">
						<h6 class="mt-2">Illustration</h6>
					</div>
					<div class="col-2">
						<h6 class="mt-2">Type/Brand</h6>
					</div>
					<div class="col-2">
						<h6 class="mt-2">Name</h6>
					</div>
					<div class="col-2">
						<h6 class="mt-2">Quantity</h6>
					</div>
					<div class="col-2">
						<h6 class="mt-2">Price</h6>
					</div>
					<div class="col-2">
						<h6 class="mt-2">ACTION</h6>
					</div>
				</div>
			</div>
		</div>
		<c:forEach items="${cart.items}" var="product">
			<div class="row d-flex justify-content-center border-top">
				<div class="col-12">
					<div class="row text-center">
						<div class="col-2">
							<div class="book">
								<img src="${product.src}" class="book-img">
							</div>
						</div>
						<div class="col-2">
							<p class="mob-text">${product.type}</p>
							<p class="mob-text">${product.brand}</p>
						</div>
						<div class="col-2">
							<p class="mob-text">${product.name}</p>
						</div>
						<div class="col-2">
							<div class="row d-flex justify-content-center ">
								<p class="mb-0" id="cnt1">${product.number}</p>
								<div class="d-flex flex-column plus-minus">
									<span class="vsm-text plus"><a
										href="cart?action=add&id=${product.id}">+</a></span> <span
										class="vsm-text minus"><a
										href="cart?action=decrease&id=${product.id}">-</a></span>
								</div>
							</div>
						</div>
						<div class="col-2">
							<h6 class="mob-text">${product.price}</h6>
						</div>
						<div class="col-2">
							<a href="cart?action=delete&id=${product.id}">DELETE</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="card">
					<div class="row">

						<div class="col-lg-12 mt-2">
							<div class="row d-flex justify-content-between px-4">
								<p class="mb-1 text-left">Subtotal</p>
								<h6 class="mb-1 text-right">$${cart.getAmount()}</h6>
							</div>
							<div class="row d-flex justify-content-between px-4">
								<p class="mb-1 text-left">Shipping</p>
								<h6 class="mb-1 text-right">Free</h6>
							</div>
							<div class="row d-flex justify-content-between px-4" id="tax">
								<p class="mb-1 text-left">Total (tax included)</p>
								<h6 class="mb-1 text-right">$${cart.getAmount()}</h6>
							</div>
							<a href="pay.jsp">
								<button class="btn-block btn-blue">
									<span><span id="checkout">Checkout</span> <span
										id="check-amt">$${cart.getAmount()}</span> </span>
								</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>