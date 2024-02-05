<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Shopping Cart</title>
    <style>
        /* Add your custom styles here */
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
    </style>
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
                    <a class="nav-link" href="#" onclick="signup()">Sign Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="logout()">Logout</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#" onclick="cart()">Cart <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
               				<a class="nav-link" href="#" onclick="orderHistory()">Order History</a>
            	</li>
            </ul>
        </div>
    </nav>
    <%@ include file="dbconn.jsp"%>
    <%
        int idx = 1;
        int total = 0;
        
        String userid = (String)session.getAttribute("userid");
        if(userid == null || userid.trim().isEmpty()) {
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
        String sql = "SELECT C.PRODUCTID, PRODUCTNAME, QUANTITY, PRICE, TOTALAMOUNT  FROM MINI_CART C INNER JOIN MINI_PRODUCT P ON c.productid = p.productid WHERE USERID = '" + userid + "' ORDER BY C.PRODUCTID";
        ResultSet rs = stmt.executeQuery(sql);
    %>
    <!-- Your Cart Content Goes Here -->
    <div class="container">
        <h2 class="text-center mb-4">Your Shopping Cart</h2>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Total Price</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Example row, replace with actual cart data -->
                <%
                    while(rs.next()){
                        total += rs.getInt("TOTALAMOUNT");
                %>
                <tr>
                    <th scope="row"><%= idx++ %></th>
                    <td><%= rs.getString("PRODUCTNAME") %></td>
                    <td><%= rs.getString("QUANTITY") %></td>
                    <td>$<%= rs.getString("PRICE") %></td>
                    <td>$<%= rs.getString("TOTALAMOUNT") %></td>
                    <td>
                        <button type="button" class="btn btn-danger" onclick="fnDelete('<%= rs.getString("PRODUCTID") %>')">Delete</button>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="text-right">
            <p class="font-weight-bold">Total: $<%= total %></p>
            <%
                if(total != 0){
            %>
            <button class="btn btn-primary" onclick="checkout('<%= total %>')">Checkout</button>
            <%
                }
            %>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function fnDelete(productid){
            location.href = "mini_cart_delete.jsp?productid="+productid;
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
        function logout(){
        	alert("You have been logged out.");
        	location.href = "mini_logout.jsp";
        }
        function cart(){
        	location.href = "mini_cart.jsp";
        }
        
        function checkout(total) {                 
            location.href = "mini_checkout.jsp?total="+total;
        }
        function orderHistory() {
            location.href = "mini_order.jsp";
        }
    </script>
</body>
</html>