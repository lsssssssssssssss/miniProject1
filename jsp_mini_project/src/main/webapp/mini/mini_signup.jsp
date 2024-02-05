<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Sign Up</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Fitness Shop</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#" onclick="home()">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#" onclick="products()">Products</a></li>
				<li class="nav-item active"><a class="nav-link" href="#" onclick="signup()">Sign Up</a></li>
				<%
					if (session != null && session.getAttribute("userid") != null) {
				%>
			            <li class="nav-item">
			                <a class="nav-link" href="#" onclick="logout()">Logout</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="#" onclick="cart()">Cart</a>
			            </li>
			            <li class="nav-item">
               				<a class="nav-link" href="#" onclick="orderHistory()">Order History</a>
            			</li>
			    <%
					} else {
				%>
						<li class="nav-item">
			                <a class="nav-link" href="#" onclick="login()">Login</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="#" onclick="noCart()">Cart</a>
			            </li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>

	<div class="container mt-4">
		<h2>Sign Up</h2>
		<form name="signup" action="mini_signup_view.jsp" onsubmit="return commit()">
			<div class="form-group">
				<label for="userid">Userid</label> <input type="text"
					class="form-control" name="userid" id="userid" placeholder="Enter userid"
					required>
				<button type="button" class="btn btn-secondary mt-2"
					onclick="checkDuplicate()">Check Duplicate</button>
			</div>
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					class="form-control" name="username" id="username" placeholder="Enter username"
					required>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					class="form-control" name="password" id="password" placeholder="Enter password"
					required>
			</div>
			<div class="form-group">
				<label for="password2">Password Confirm</label> <input
					type="password" class="form-control" id="password2"
					placeholder="Enter password confirm" required>
			</div>
			<div class="form-group">
				<label for="email">Email</label> <input type="email"
					class="form-control" name="email" id="email" placeholder="Enter email" required>
			</div>
			<div class="form-group">
				<label for="address">Address</label> <input type="text"
					class="form-control" name="address" id="address" placeholder="Enter address">
				<button type="button" class="btn btn-secondary mt-2"
					onclick="openDaumPostcode()">Search Address</button>
			</div>
			<div class="form-group">
				<label for="detailAddress">Detail Address</label> <input type="text"
					class="form-control" name="detailAddress" id="detailAddress"
					placeholder="Enter detail address">
			</div>
			<div class="form-group">
				<label for="phone">Phone</label>
				<div class="input-group">
					<input type="tel" class="form-control" name="phone1" id="phone1"
						placeholder="Enter phone number" maxlength="3">
					<div class="input-group-prepend">
						<span class="input-group-text">-</span>
					</div>
					<input type="tel" class="form-control" name="phone2" id="phone2"
						placeholder="Enter phone number" maxlength="4">
					<div class="input-group-prepend">
						<span class="input-group-text">-</span>
					</div>
					<input type="tel" class="form-control" name="phone3" id="phone3"
						placeholder="Enter phone number" maxlength="4">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Sign Up</button>
			<a href="#" class="btn btn-secondary ml-2" onclick="login()">Login</a>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function validatePassword(password) {
			// 영어, 숫자, 특수문자가 각각 하나 이상 포함하고 최소 10글자 이상 허용하는 정규식
			const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$/;
			return passwordRegex.test(password);
		}

		function checkDuplicate() {
			var userid = document.getElementById('userid').value;
			if (userid == "" || userid == undefined) {
				alert("Please enter your ID");
				return;
			}
			if (document.getElementById('userid').getAttribute('disabled') != null) {
				var pop = window.open("mini_idCheck.jsp?userid=", "idCheck",
						"width=400,height=400,left=550,top=130");
			} else {
				var pop = window.open("mini_idCheck.jsp?userid=" + userid,
						"idCheck", "width=400,height=400,left=550,top=130");
			}
		}

		function openDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					document.getElementById('address').value = data.address;
				}
			}).open();
		}

		function validateLogin() {
			var userid = document.getElementById('userid').value;
	        var username = document.getElementById('username').value;
	        var password = document.getElementById('password').value;
	        var password2 = document.getElementById('password2').value;
	        var email = document.getElementById('email').value;
	        if(userid == "" || username == "" || password == "" 
	        		|| password2 == "" || email == "") {
	        	return false;
	        }
			// 패스워드 검증 추가
			if (!validatePassword(password)) {
				alert("Invalid password. Password must contain at least one each of English letters, numbers, and special characters, and should be at least 10 characters long.");
				return false;
			}

			// 패스워드 확인 검증 추가
			if (password !== password2) {
				alert("Passwords do not match. Please make sure your passwords match.");
				return false;
			}

			// 모든 검증 통과
			return true;
		}

		function commit() {
		    var isDuplicate = document.getElementById('userid').getAttribute('disabled') !== null;
			if(validateLogin()){
			    if (isDuplicate) {
			    	document.getElementById('userid').removeAttribute('disabled');
			        return true;
			    } else {
			        alert("Click the Userid Check Duplicate button");
			       	return false;
			    }
			} else {
				return false;
			}
		}

		function home(){
        	location.href = "mini_home.jsp";
        }
        function products(){
        	location.href = "mini_product.jsp";
        }
        function signup(){
        	location.href = "mini_signup.jsp";
        }
        function login(){
        	location.href = "mini_login.jsp";
        }
        function logout() {
        	alert("You have been logged out.");
            location.href = "mini_logout.jsp";
        }
        function cart(){
        	location.href = "mini_cart.jsp";
        }
        function noCart() {
        	alert("Please use it after logging in.");
        	location.href = "mini_login.jsp";
        }
        function orderHistory() {
            location.href = "mini_order.jsp";
        }
	</script>
</body>
</html>