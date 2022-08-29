<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/infor_product.css" rel="stylesheet" />
<link href="css/responsive.css" rel="stylesheet" />
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/custom.js"></script>
</head>
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container py-4 my-4 mx-auto d-flex flex-column">
		<div class="header">
			<div class="row r1">
				<div class="col-md-9 abc">
					<h1>${detail.name}</h1>
				</div>
				<div class="col-md-3 text-right pqr">
					<i class="fa fa-star"></i><i class="fa fa-star"></i><i
						class="fa fa-star"></i><i class="fa fa-star"></i><i
						class="fa fa-star"></i>
				</div>
				<p class="text-right para">Based on 250 Review</p>
			</div>
		</div>
		<div class="container-body mt-4">
			<div class="row r3">
				<div class="col-md-5 p-0 klo">
					<ul>
						<li>Type:${detail.type}</li>
						<li>Brand:${detail.brand}</li>
						<li>Display:${detail.descritption}</li>
						<li>Price:${detail.price}</li>
					</ul>
				</div>
				<div class="col-md-7">
					<img src="${detail.src}" width="90%" height="95%">
				</div>
			</div>
		</div>
		<div class="footer d-flex flex-column mt-5">
			<div class="row r4">
				<div class="col-md-2 myt des">
					<a href="#">Description</a>
				</div>
				<div class="col-md-2 myt ">
					<a href="#">Review</a>
				</div>
				<div class="col-md-2 mio offset-md-4">
					<a href="cart?action=add&id=${detail.id}">ADD TO CART</a>
				</div>
				<div class="col-md-2 myt ">
					<button type="button" class="btn btn-outline-warning">BUY
						NOW</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>