<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <%@ include file="dbconn.jsp"%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%
        // Check if the user is logged in and is an admin
        String userid = (String)session.getAttribute("userid");
        if(userid == null || userid.trim().isEmpty()) {
    %>
        <script>
            function redirectToLogin() {
                alert("Please use it after logging in.");
                location.href = "mini_login.jsp";
            }
            redirectToLogin();
        </script>
    <%
        } else {
            String sql = "SELECT * FROM MINI_USER WHERE USERID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userid);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
    %>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Fitness Shop Admin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
                    <a class="nav-link" href="#" onclick="signup()">Sign Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="logout()">Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="cart()">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="orderHistory()">Order History</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#" onclick="editProfile()">Edit Profile</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Edit Profile</h2>

        <!-- User Edit Form -->
        <form action="mini_update_profile.jsp" method="post" onsubmit="return fnSubmit()">
            <div class="form-group">
                <label for="username">UserId:</label>
                <input type="text" class="form-control" id="userid" name="userid" value="<%= rs.getString("USERID") %>" readonly>
            </div>
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" class="form-control" id="username" name="username" value="<%= rs.getString("USERNAME") %>" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" value="<%= rs.getString("PASSWORD") %>" required>
            </div>
            <div class="form-group">
                <label for="password2">Password Confirm:</label>
                <input type="password" class="form-control" id="password2" name="password2" value="<%= rs.getString("PASSWORD") %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= rs.getString("EMAIL") %>" required>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" class="form-control" id="address" name="address" value="<%= rs.getString("ADDRESS") %>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" class="form-control" id="phone" name="phone" value="<%= rs.getString("PHONE") %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Update User</button>
        </form>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
    	function home() {
    		location.href = "mini_home.jsp";	
    	}
    	
	    function logout() {
	    	alert("You have been logged out.");
	        location.href = "mini_logout.jsp";
	    }
	    
	    function signup() {
	    	location.href = "mini_signup.jsp";
	    }
	    
	    function products() {
	    	location.href = "mini_product.jsp";
	    }
	    
	    function cart() {
	    	location.href = "mini_cart.jsp";
	    }
	    
	    function orderHistory() {
	        location.href = "mini_order.jsp";
	    }
	    
	    function editProfile() {
	    	location.href = "mini_edit_profile.jsp";
	    }
	    
	    
	    function validatePassword(password) {
			// 영어, 숫자, 특수문자가 각각 하나 이상 포함하고 최소 10글자 이상 허용하는 정규식
			const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{10,}$/;
			return passwordRegex.test(password);
		}
	    
        function fnSubmit() {
        	var userid = document.getElementById('userid').value;
	        var username = document.getElementById('username').value;
	        var password = document.getElementById('password').value;
	        var password2 = document.getElementById('password2').value;
	        var email = document.getElementById('email').value;
	        var address = document.getElementById('address').value;
	        var phone = document.getElementById('phone').value;
	        if(userid == "" || username == "" || password == "" 
        		|| password2 == "" || email == "" || address == "" || phone == "") {
        		return false;
        	}
        	if (!validatePassword(password)) {
				alert("Invalid password. Password must contain at least one each of English letters, numbers, and special characters, and should be at least 10 characters long.");
				return false;
			}
        	if (password !== password2) {
				alert("Passwords do not match. Please make sure your passwords match.");
				return false;
			}
        	alert("completed");
        	return true;
        }
    </script>

    <%
            }
        }
    %>
</body>
</html>