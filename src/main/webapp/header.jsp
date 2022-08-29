<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<!-- header section strats -->
	<header class="header_section">
		<div class="header_top">
			<div class="container-fluid">
				<div class="top_nav_container">
					<div class="contact_nav">
						<c:if test="${sessionScope.user != null}">
							<a href="accountmanager?usermail=${user}"> <i class="fa fa-user" aria-hidden="true"></i> <span>
									My Accout </span>
							</a>
							<span style="color: white;"> ${user} </span>
						</c:if>
					</div>
					<div class="user_option_box">
						<a href="cart.jsp" class="cart-link"> <i
							class="fa fa-shopping-cart" aria-hidden="true"></i> <span>
								Cart </span>
						</a>
						<c:if test="${sessionScope.user != null}">
							<a href="logout" class="account-link"> <i
								class="fa fa-sign-out" aria-hidden="true"></i> <span> Log
									out </span>
							</a>
						</c:if>
						<c:if test="${sessionScope.user == null}">
							<a href="login.jsp" class="account-link"> <i
								class="fa fa-user" aria-hidden="true"></i> <span> Log in
							</span>
							</a>
							<a href="register.jsp" class="account-link"> <i
								class="fa fa-registered" aria-hidden="true"></i> <span>
									Register </span>
							</a>
						</c:if>
					</div>
				</div>

			</div>
		</div>
		<div class="header_bottom">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="index.jsp"> <span> My Shop
					</span>
					</a>
					<form class="search_form" action="search" method="get">
						<input name="search" type="text" class="form-control"
							placeholder="Search here...">
						<button class="" type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class=""> </span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ">
							<li class="nav-item active"><a class="nav-link"
								href="index.jsp">Home <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item"><a class="nav-link" href="aboutus.jsp">
									About</a></li>
							<li class="nav-item"><a class="nav-link" href="#products">Products</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#why">Why
									Us</a></li>
							<li class="nav-item"><a class="nav-link"
								href="#testimonial">Testimonial</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>
	<!-- end header section -->

</body>
</html>