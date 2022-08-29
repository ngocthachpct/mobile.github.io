<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="hero_area">
		<!-- slider section -->
		<section class="slider_section ">
			<div id="customCarousel1" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container ">
							<div class="row">
								<div class="col-md-6">
									<div class="detail-box">
										<h1>Welcome to our shop</h1>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Iste quam velit saepe dolorem deserunt quo quidem ad
											optio.</p>
										<a href=""> Read More </a>
									</div>
								</div>
								<div class="col-md-6">
									<div class="img-box">
										<img src="images/slide1.png" alt="" style="width: 130%;">
									</div>
								</div>
							</div>
						</div>
					</div>
					<c:forEach varStatus="loop" begin="0" end="1">
						<div class="carousel-item">
							<div class="container ">
								<div class="row">
									<div class="col-md-6">
										<div class="detail-box">
											<h1>Welcome to our shop</h1>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit. Iste quam velit saepe dolorem deserunt quo quidem ad
												optio.</p>
											<a href=""> Read More </a>
										</div>
									</div>
									<div class="col-md-6">
										<div class="img-box">
											<img src="images/slide2.png" alt="" style="width: 130%;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="carousel_btn_box">
				<a class="carousel-control-prev" href="#customCarousel1"
					role="button" data-slide="prev"> <i class="fa fa-angle-left"
					aria-hidden="true"></i> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#customCarousel1"
					role="button" data-slide="next"> <i class="fa fa-angle-right"
					aria-hidden="true"></i> <span class="sr-only">Next</span>
				</a>
			</div>
		</section>
	</div>

	<section class="product_section layout_padding" id="products">
		<div class="container">
			<div class="heading_container heading_center">
				<h2>Our Products</h2>
			</div>
			<div class="row alert alert-${alert} justify-content-center">${mess}</div>
			<div class="row">
				<c:forEach items="${products}" var="p">
					<div class="col-sm-6 col-lg-4">
						<div class="box">
							<div class="img-box">
								<img src="${p.src}" alt=""> <a href="detail?pid=${p.id}"
									class="add_cart_btn"> <span> View more </span>
								</a>
							</div>
							<div class="detail-box">
								<h5>${p.name}</h5>
								<div class="product_info">
									<h5>
										<span>$</span> ${p.price}
									</h5>
									<div class="star_container">
										<i class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i> <i
											class="fa fa-star" aria-hidden="true"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:set var="key" value="${action}" scope="page"></c:set>
			<div class="btn-box" style="text-align: center;">
				<c:forEach begin="1" end="${num}" var="i">
					<c:if test="${key.equalsIgnoreCase('search')}">
						<a href="search?index=${i}&search=${save}">${i}</a>
					</c:if>
					<c:if test="${key !='search'}">
						<a href="list?index=${i}">${i}</a>
					</c:if>
				</c:forEach>
			</div>
			<div class="btn_box">
				<a href="" class="view_more-link"> View More </a>
			</div>
		</div>
	</section>

	<!-- end product section -->

	<!-- about section -->

	<section class="about_section">
		<div class="container-fluid  ">
			<div class="row">
				<div class="col-md-5 ml-auto">
					<div class="detail-box pr-md-3">
						<div class="heading_container">
							<h2>We Provide Best For You</h2>
						</div>
						<p>Respond as quickly as possible</p>
						<p>Know your customers</p>
						<p>Fix your mistakes</p>
						<p>Listen to your customers</p>
						<p>Think long term - A customer is for life</p>
						<a href=""> Read More </a>
					</div>
				</div>
				<div class="col-md-6 px-0">
					<div class="img-box">
						<img src="images/about-img.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- end about section -->

	<!-- why us section -->

	<section class="why_us_section layout_padding" id="why">
		<div class="container">
			<div class="heading_container heading_center">
				<h2>Why Choose Us</h2>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="box ">
						<div class="img-box">
							<img src="images/w1.png" alt="">
						</div>
						<div class="detail-box">
							<h5>Fast Delivery</h5>
							<p>variations of passages of Lorem Ipsum available</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="box ">
						<div class="img-box">
							<img src="images/w2.png" alt="">
						</div>
						<div class="detail-box">
							<h5>Free Shiping</h5>
							<p>variations of passages of Lorem Ipsum available</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="box ">
						<div class="img-box">
							<img src="images/w3.png" alt="">
						</div>
						<div class="detail-box">
							<h5>Best Quality</h5>
							<p>variations of passages of Lorem Ipsum available</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- end why us section -->


	<!-- client section -->

	<section class="client_section layout_padding-bottom">
		<div class="container">
			<div class="heading_container heading_center">
				<h2>What Says Our Customers</h2>
			</div>
		</div>
		<div class="client_container ">
			<div id="carouselExample2Controls" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container">
							<div class="box">
								<div class="detail-box">
									<p>
										<i class="fa fa-quote-left" aria-hidden="true"></i>
									</p>
									<p>It is a long established fact that a reader will be
										distracted by the readable content of a page when looking at
										its layout. The point of using Lorem Ipsum is that it has a
										more-or-less normal distribution of letters, as opposed to
										using 'Content here, content here', making it lookIt is a long
										established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look</p>
								</div>
								<div class="client-id">
									<div class="img-box">
										<img src="images/client.jpg" alt="">
									</div>
									<div class="name">
										<h5>James Dew</h5>
										<h6>Photographer</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container">
							<div class="box">
								<div class="detail-box">
									<p>
										<i class="fa fa-quote-left" aria-hidden="true"></i>
									</p>
									<p>It is a long established fact that a reader will be
										distracted by the readable content of a page when looking at
										its layout. The point of using Lorem Ipsum is that it has a
										more-or-less normal distribution of letters, as opposed to
										using 'Content here, content here', making it lookIt is a long
										established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look</p>
								</div>
								<div class="client-id">
									<div class="img-box">
										<img src="images/client.jpg" alt="">
									</div>
									<div class="name">
										<h5>James Dew</h5>
										<h6>Photographer</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container">
							<div class="box">
								<div class="detail-box">
									<p>
										<i class="fa fa-quote-left" aria-hidden="true"></i>
									</p>
									<p>It is a long established fact that a reader will be
										distracted by the readable content of a page when looking at
										its layout. The point of using Lorem Ipsum is that it has a
										more-or-less normal distribution of letters, as opposed to
										using 'Content here, content here', making it lookIt is a long
										established fact that a reader will be distracted by the
										readable content of a page when looking at its layout. The
										point of using Lorem Ipsum is that it has a more-or-less
										normal distribution of letters, as opposed to using 'Content
										here, content here', making it look</p>
								</div>
								<div class="client-id">
									<div class="img-box">
										<img src="images/client.jpg" alt="">
									</div>
									<div class="name">
										<h5>James Dew</h5>
										<h6>Photographer</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="carousel_btn-box">
					<a class="carousel-control-prev" href="#carouselExample2Controls"
						role="button" data-slide="prev"> <span> <i
							class="fa fa-angle-left" aria-hidden="true"></i>
					</span> <span class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExample2Controls"
						role="button" data-slide="next"> <span> <i
							class="fa fa-angle-right" aria-hidden="true"></i>
					</span> <span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</section>
	<!-- end client section -->

	<!-- info section -->
	<section class="info_section ">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="info_contact">
						<h5>
							<a href="" class="navbar-brand"> <span> Minics </span>
							</a>
						</h5>
						<p>
							<i class="fa fa-map-marker" aria-hidden="true"></i> Address
						</p>
						<p>
							<i class="fa fa-phone" aria-hidden="true"></i> +84 1234567890
						</p>
						<p>
							<i class="fa fa-envelope" aria-hidden="true"></i>
							mywebsite@gmail.com
						</p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="info_info">
						<h5>Information</h5>
						<p>Eligendi sunt, provident, debitis nemo, facilis cupiditate
							velit libero dolorum aperiam enim nulla iste maxime corrupti ad
							illo libero minus.</p>
					</div>
				</div>
				<div class="col-md-3">
					<div class="info_links">
						<h5>Useful Link</h5>
						<ul>
							<li><a href="index.jsp"> Home </a></li>
							<li><a href="about.html"> About </a></li>
							<li><a href="product.html"> Products </a></li>
							<li><a href="why.html"> Why Us </a></li>
							<li><a href="testimonial.html"> Testimonial </a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="info_form ">
						<h5>Newsletter</h5>
						<form action="">
							<input type="email" placeholder="Enter your email">
							<button>Subscribe</button>
						</form>
						<div class="social_box">
							<a href=""> <i class="fa fa-facebook" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-twitter" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-instagram" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-youtube" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>