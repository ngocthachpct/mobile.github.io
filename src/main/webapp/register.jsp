<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/register-style.css" rel="stylesheet" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt="" />
				<h3>Welcome</h3>
				<p>You are 30 seconds away from earning your own money!</p>
				<a href="login.jsp"><input type="submit" name="" value="Login" /></a><br />
			</div>
			<div class="col-md-9 register-right">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<h3 class="register-heading">Apply as a Employee</h3>
						<form action="register" method="post">
						<div style="text-align: center; color: red;" class="alert"> ${warning}</div>
							<div class="row register-form">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Your name" value="" name="username" required/>
									</div>
									<div class="form-group">
										<input type="password" class="form-control"
											placeholder="Password *" value="" name="password" required/>
									</div>
									<div class="form-group">
										<input type="password" class="form-control"
											placeholder="Confirm Password *" value="" name="repass" required/>
									</div>
									<div class="form-group">
										<input type="email" class="form-control"
											placeholder="Your Email *" value="" name="mail" required/>
									</div>
									<div class="form-group">
										<div class="maxl">
											<label class="radio inline"> <input type="radio"
												name="gender" value="male" checked > <span>
													Male </span>
											</label> <label class="radio inline"> <input type="radio"
												name="gender" value="female"> <span>Female </span>
											</label>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Your Address *" value="" name="address" />
									</div>
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Your Phone *" value="" name="phone" />
									</div>
									<div class="form-group">
										<select class="form-control">
											<option class="hidden" selected disabled>Please
												select your Sequrity Question</option>
											<option>What is your Birthdate?</option>
											<option>What is Your old Phone Number</option>
											<option>What is your Pet Name?</option>
										</select>
									</div>
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Enter Your Answer *" value="" required/>
									</div>
									<input type="submit" class="btnRegister" value="Register" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>