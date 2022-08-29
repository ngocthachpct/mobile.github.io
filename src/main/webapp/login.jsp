<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/login-style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%
	String uid = "", pwd = "", rmb = "";
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cook : cookies) {
			if (cook.getName().equalsIgnoreCase("cookUsername")) {
		uid = cook.getValue();
			}
			if (cook.getName().equalsIgnoreCase("cookPassword")) {
		pwd = cook.getValue();
			}
			if (cook.getName().equals("cookRemember")) {
		rmb = cook.getValue();
			}

		}
	}
	%>
	<section class="login">
		<div class="login_box">
			<div class="left">
				<div class="top_link"><a href="index.jsp"><img src="https://drive.google.com/u/0/uc?id=16U__U5dJdaTfNGobB_OpwAJ73vM50rPV&export=download" alt="">Return home</a></div>
				<div class="contact">
					<form action="login" method="post">
						<h3>SIGN IN</h3>
						<div class="alert">${error}</div>
						
						<input type="email" placeholder="EMAIL" name="username" value="<%=uid%>" required />
						<input type="password" placeholder="PASSWORD" name="password" value="<%=pwd%>" required />
						<div>
						Remember me<input type="checkbox" name="remember" value="0" 
						<%="1".equals(rmb.trim()) ? "checked='/checked'" : ""%> style="width:20%;">
  						</div>
  						<a href="#">Forgot password?</a>
						<button class="submit">LET'S GO</button>
					
					</form>
				</div>
			</div>
			<div class="right">
				<div class="right-text">
					<h2>WELCOME BACK</h2>
					<h5>To keep conected with us</h5>
					<h5>please login with your personal info</h5>
				</div>
				<div class="right-inductor"><img src="https://lh3.googleusercontent.com/fife/ABSRlIoGiXn2r0SBm7bjFHea6iCUOyY0N2SrvhNUT-orJfyGNRSMO2vfqar3R-xs5Z4xbeqYwrEMq2FXKGXm-l_H6QAlwCBk9uceKBfG-FjacfftM0WM_aoUC_oxRSXXYspQE3tCMHGvMBlb2K1NAdU6qWv3VAQAPdCo8VwTgdnyWv08CmeZ8hX_6Ty8FzetXYKnfXb0CTEFQOVF4p3R58LksVUd73FU6564OsrJt918LPEwqIPAPQ4dMgiH73sgLXnDndUDCdLSDHMSirr4uUaqbiWQq-X1SNdkh-3jzjhW4keeNt1TgQHSrzW3maYO3ryueQzYoMEhts8MP8HH5gs2NkCar9cr_guunglU7Zqaede4cLFhsCZWBLVHY4cKHgk8SzfH_0Rn3St2AQen9MaiT38L5QXsaq6zFMuGiT8M2Md50eS0JdRTdlWLJApbgAUqI3zltUXce-MaCrDtp_UiI6x3IR4fEZiCo0XDyoAesFjXZg9cIuSsLTiKkSAGzzledJU3crgSHjAIycQN2PH2_dBIa3ibAJLphqq6zLh0qiQn_dHh83ru2y7MgxRU85ithgjdIk3PgplREbW9_PLv5j9juYc1WXFNW9ML80UlTaC9D2rP3i80zESJJY56faKsA5GVCIFiUtc3EewSM_C0bkJSMiobIWiXFz7pMcadgZlweUdjBcjvaepHBe8wou0ZtDM9TKom0hs_nx_AKy0dnXGNWI1qftTjAg=w1920-h979-ft" alt=""></div>
			</div>
		</div>
	</section>
</body>
</html>