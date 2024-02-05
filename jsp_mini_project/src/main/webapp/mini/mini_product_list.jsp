<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Admin - Product List</title>
    <style>
        /* Add your custom styles here */
    </style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
        // Check if the user is logged in
        String userid = (String)session.getAttribute("userid");
    	String status = (String)session.getAttribute("status");
        if(userid == null || userid.trim().isEmpty() || !status.equals("A")) {
    %>
        <script>
            function redirectToLogin() {
                alert("Please log in to view the product list.");
                location.href = "mini_login.jsp";
            }
            redirectToLogin();
        </script>
    <%
        }
        String sql = "SELECT * FROM MINI_PRODUCT ORDER BY PRODUCTID";
        ResultSet rs = stmt.executeQuery(sql);
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
        <h2>Product List - Admin</h2>

        <!-- Product Table -->
        <table class="table">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Stock Quantity</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
            	while(rs.next()){
            %>
                <tr>
                    <td><%= rs.getInt("PRODUCTID") %></td>
                    <td><%= rs.getString("PRODUCTNAME") %></td>
                    <td><%= rs.getInt("PRICE") %></td>
                    <td><%= rs.getInt("STOCKQUANTITY") %></td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="fnEdit('<%= rs.getInt("PRODUCTID") %>')">Edit</button>
                        <button class="btn btn-danger btn-sm" onclick="fnDelete('<%= rs.getInt("PRODUCTID") %>')">Delete</button>
                    </td>
                </tr>
            <%
            	}
            %>
            </tbody>
        </table>

        <!-- Add Product Form -->
        <div class="mt-4">
            <h3>Add New Product</h3>
            <form action="mini_product_add.jsp" method="post">
                <div class="form-group">
                    <label for="productName">Product Name:</label>
                    <input type="text" class="form-control" id="productName" name="productName" required>
                </div>
                <div class="form-group">
                    <label for="productPrice">Product Price ($):</label>
                    <input type="number" min="0" class="form-control" id="productPrice" name="productPrice" required>
                </div>
                <div class="form-group">
                    <label for="stockQuantity">Stock Quantity:</label>
                    <input type="number" min="0" class="form-control" id="stockQuantity" name="stockQuantity" required>
                </div>
                <button type="submit" class="btn btn-primary">Add Product</button>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function logout() {
        	alert("You have been logged out.");
            location.href = "mini_logout.jsp";
        }

        function productList() {
            location.href = "mini_product_list.jsp";
        }

        function userList() {
            location.href = "mini_user_list.jsp";
        }

        function orderList() {
            location.href = "mini_order_list.jsp";
        }
        
        function home(){
        	location.href = "mini_admin_home.jsp";
        }
        
        function fnEdit(productid){
        	location.href = "mini_product_edit.jsp?productid="+productid;
        }
        
        function fnDelete(productid){
        	location.href = "mini_product_delete.jsp?productid="+productid;
        }
    </script>

</body>

</html>