<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link href="css/style.css" rel="stylesheet" />
</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container-fluid">
		<div class="py-5 text-center">
			<h2>Checkout form</h2>
		</div>
		<div class="row alert alert-${alert} justify-content-center">${mess}</div>
		<c:set var="o" value="${sessionScope.cart}" />
		<div class="row g-5">
			<div class="col-md-5 col-lg-4 order-md-last">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-primary">Your cart</span> <span
						class="badge bg-primary rounded-pill">${o.items.size()}</span>
				</h4>
				<ul class="list-group mb-3">
					<c:forEach items="${o.items}" var="p">
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">${p.name}</h6>
							</div> <span class="text-muted">${p.price} x ${p.number}</span>
						</li>
					</c:forEach>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">Total:</h6>
						</div> <span class="text-muted">${cart.getAmount()}</span>
					</li>
				</ul>
			</div>
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">Billing address</h4>
				<form class="needs-validation" action="pay?user=${user}"
					method="post" novalidate>
					<div class="row g-3">

						<div class="col-sm-12">
							<label for="Name" class="form-label">Name</label> <input
								type="text" class="form-control" id="lastName" placeholder=""
								value="" name="name"  >
							<div class="invalid-feedback">Valid last name is  .
							</div>
						</div>

						<div class="col-12">
							<label for="phone" class="form-label">Phone <span
								class="text-muted"></span></label> <input type="tel"
								class="form-control" id="phone" placeholder="+84..."
								name="phone"  >
							<div class="invalid-feedback">Please enter a valid your
								phone number.</div>
						</div>

						<div class="col-12">
							<label for="email" class="form-label" >Email <span
								class="text-muted"></span></label> <input type="email"
								class="form-control" id="email" placeholder="you@example.com"
								name="mail" value="${user}" >
							<div class="invalid-feedback">Please enter a valid email
								address for shipping updates.</div>
						</div>

						<div class="col-12">
							<label for="address" class="form-label">Address</label> <input
								type="text" class="form-control" id="address"
								placeholder="Plaza street" name="address"  >
							<div class="invalid-feedback">Please enter your shipping
								address.</div>
						</div>

						<div class="col-md-5">
							<label for="country" class="form-label">Country</label> <select
								class="form-select" id="country"  >
								<option value="">Choose...</option>
								<option>Viet Name</option>
							</select>
							<div class="invalid-feedback">Please select a valid
								country.</div>
						</div>

						<div class="col-md-4">
							<label for="state" class="form-label">State</label> <select
								class="form-select" id="state"  >
								<option value="">Choose...</option>
								<option>Ho Chi Minh</option>
								<option>Da Nang</option>
								<option>Ha Noi</option>
							</select>
							<div class="invalid-feedback">Please provide a valid state.
							</div>
						</div>

						<div class="col-md-3">
							<label for="zip" class="form-label">Zip</label> <input
								type="text" class="form-control" id="zip" placeholder=""
								 >
							<div class="invalid-feedback">Zip code  .</div>
						</div>
						<div class="col-md-3">
							<label for="zip" class="form-label">Discount</label> <input
								type="text" class="form-control" id="discount" placeholder=""
								name="discount"  >
						</div>
					</div>

					<hr class="my-4">

					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="same-address">
						<label class="form-check-label" for="same-address">Shipping
							address is the same as my billing address</label>
					</div>

					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="save-info">
						<label class="form-check-label" for="save-info">Save this
							information for next time</label>
					</div>

					<hr class="my-4">

					<h4 class="mb-3">Payment</h4>

					<div class="my-3">
						<div class="form-check">
							<input id="credit" name="paymentMethod" type="radio"
								class="form-check-input" checked  > <label
								class="form-check-label" for="credit">Credit card</label>
						</div>
						<div class="form-check">
							<input id="debit" name="paymentMethod" type="radio"
								class="form-check-input"  > <label
								class="form-check-label" for="debit">Debit card</label>
						</div>
						<div class="form-check">
							<input id="paypal" name="paymentMethod" type="radio"
								class="form-check-input"  > <label
								class="form-check-label" for="paypal">Paytm</label>
						</div>
						<div class="form-check">
							<input id="paypal" name="paymentMethod" type="radio"
								class="form-check-input"  > <label
								class="form-check-label" for="paypal">Phonepe</label>
						</div>
					</div>

					<div class="row gy-3">
						<div class="col-md-6">
							<label for="cc-name" class="form-label">Name on card</label> <input
								type="text" class="form-control" id="cc-name" placeholder=""
								 > <small class="text-muted">Full name as
								displayed on card</small>
							<div class="invalid-feedback">Name on card is  </div>
						</div>

						<div class="col-md-6">
							<label for="cc-number" class="form-label">Credit card
								number</label> <input type="text" class="form-control" id="cc-number"
								placeholder=""  >
							<div class="invalid-feedback">Credit card number is
								 </div>
						</div>

						<div class="col-md-3">
							<label for="cc-expiration" class="form-label">Expiration</label>
							<input type="text" class="form-control" id="cc-expiration"
								placeholder=""  >
							<div class="invalid-feedback">Expiration date  </div>
						</div>

						<div class="col-md-3">
							<label for="cc-cvv" class="form-label">CVV</label> <input
								type="text" class="form-control" id="cc-cvv" placeholder=""
								 >
							<div class="invalid-feedback">Security code  </div>
						</div>
					</div>

					<hr class="my-4">

					<button class="w-20 btn btn-danger btn-lg" type="submit">By
						Now</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>