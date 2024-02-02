<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sign Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Cart <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </nav>
	<%@ include file="dbconn.jsp"%>
    <%
    	int idx = 1;
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
    	} else {
	        String sql = "SELECT PRODUCTNAME, QUANTITY, PRICE, TOTALAMOUNT  FROM MINI_CART C INNER JOIN MINI_PRODUCT P ON c.productid = p.productid WHERE USERID = '" + userid + "'";
	        ResultSet rs = stmt.executeQuery(sql);
    	}
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
                <tr>
                    <th scope="row"><%= idx++ %></th>
                    <td>Treadmill</td>
                    <td>2</td>
                    <td>$500</td>
                    <td>$1000</td>
                    <td>
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmDeleteModal">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="text-right">
            <p class="font-weight-bold">Total: $1000</p>
            <button class="btn btn-primary">Checkout</button>
        </div>
    </div>

    <!-- Modal for Confirm Delete -->
    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmDeleteModalLabel">Confirm Delete</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this item from your cart?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>