<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Login</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Fitness Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="home()">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="products()">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="add()">Sign Up</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#" onclick="login()">Login <span class="sr-only">(current)</span></a>
                </li>
                <%
					if (session != null && session.getAttribute("userid") != null) {
				%>
			            <li class="nav-item">
			                <a class="nav-link" href="#" onclick="cart()">Cart</a>
			            </li>
			    <%
					} else {
				%>
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
        <h2>Login</h2>
        <form name="login" action="mini_login_view.jsp" onsubmit="return validateLogin()">
            <div class="form-group">
                <label for="userid">Userid</label>
                <input type="text" class="form-control" name="userid" id="userid" placeholder="Enter username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		function home(){
			location.href = "mini_home.jsp";
		}
		
		function add() {
	    	location.href = "mini_signup.jsp";
	    }
		
		function products() {
			location.href = "mini_product.jsp";
		}
		
		function login() {
			location.href = "mini_login.jsp";
		}
		
		function cart() {
	    	location.href = "mini_cart.jsp";
	    }
	    
	    function noCart() {
	    	alert("Please use it after logging in.");
	    	location.href = "mini_login.jsp";
	    }
	</script>
</body>
</html>