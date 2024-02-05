<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Fitness Shop</title>
    <style>
        img {
            height: 300px;
        }

        footer {
            background-color: #fff;
            color: #000;
            font-size: 12px;
            margin-top: 20px;
        }
    </style>
</head>

<body>
	<%
	String userid = (String)session.getAttribute("userid");
	String status = (String)session.getAttribute("status");
	    if(userid == null || userid.trim().isEmpty() || !status.equals("A")) {
    %>
        <script>
            function noCart() {
                alert("Please use it after logging in.");
                location.href = "mini_login.jsp";
            }
            noCart();
        </script>
    <%
	    }
    %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Fitness Shop Admin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="productList()">Product List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="userList()">User List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="orderList()">Order History</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="logout()">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Jumbotron -->
        <div class="jumbotron">
            <h1 class="display-4">Welcome to Fitness Shop!</h1>
            <p class="lead">Explore our high-quality fitness equipment to stay fit and healthy.</p>
            <hr class="my-4">
            <p>Check out our latest products and start your fitness journey today.</p>
            <a class="btn btn-primary btn-lg" href="#" role="button">Explore Products</a>
        </div>

        <!-- Carousel -->
        <div id="imageCarousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="image/slide1.jpeg" class="d-block w-100" alt="Slide 1">
                </div>
                <div class="carousel-item">
                    <img src="image/slide2.jpeg" class="d-block w-100" alt="Slide 2">
                </div>
                <!-- Add more slides as needed -->
            </div>
            <a class="carousel-control-prev" href="#imageCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#imageCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- Footer -->
        <footer class="py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h5>Contact Us</h5>
                        <p>Customer Service: 123-456-7890</p>
                        <p>Email: info@fitnessshop.com</p>
                    </div>
                    <div class="col-md-6">
                        <h5>Company Information</h5>
                        <p>Business Registration Number: 123456789</p>
                        <!-- Add more company information as needed -->
                    </div>
                </div>
            </div>
        </footer>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Enable carousel auto sliding
        $(document).ready(function(){
            $('#imageCarousel').carousel({
                interval: 2000 // Set the interval in milliseconds (e.g., 3000 ms = 3 seconds)
            });
        });
        
        function logout(){
        	alert("You have been logged out.");
            location.href = "mini_logout.jsp";
        }
        function productList(){
        	location.href = "mini_product_list.jsp";
        }
        function userList(){
        	location.href = "mini_user_list.jsp";
        }
        function orderList(){
        	location.href = "mini_order_list.jsp";
        }
    </script>

</body>

</html>