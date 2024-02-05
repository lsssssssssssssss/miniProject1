<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.HashMap, java.util.Map"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Order History</title>
</head>
<body>
    <%@ include file="dbconn.jsp"%>
    <%
        String userid = (String)session.getAttribute("userid");
        if (userid == null || userid.trim().isEmpty()) {
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
            String sql = "SELECT O.ORDERID, TO_CHAR(ORDERDATE, 'YYYY-MM-DD HH24:MI') AS ORDERDATE, TOTALAMOUNT, PRODUCTNAME, QUANTITY, D.PRICE, SUBTOTAL FROM MINI_ORDER O INNER JOIN MINI_ORDERDETAIL D ON o.orderid = d.orderid INNER JOIN MINI_PRODUCT P ON d.productid = p.productid WHERE USERID = '" + userid + "' ORDER BY O.ORDERID, D.PRODUCTID";

            ResultSet rs = stmt.executeQuery(sql);
            Map<Integer, Integer> orderRowCountMap = new HashMap<>();
            int prevOrderId = 0;
    %>
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
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="logout()">Logout</a>
                </li>
                <% if (session != null && session.getAttribute("userid") != null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="cart()">Cart</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#" onclick="orderHistory()">Order History <span class="sr-only">(current)</span></a>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="#" onclick="noCart()">Cart</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#" onclick="orderHistory()">Order History <span class="sr-only">(current)</span></a>
                    </li>
                <% } %>
            </ul>
        </div>
    </nav>
    <div class="container mt-4">
        <h2>Order History</h2>
        <%
            while (rs.next()) {
                int orderId = rs.getInt("ORDERID");
                int quantity = rs.getInt("QUANTITY");

                int rowCount = orderRowCountMap.getOrDefault(orderId, 0);

                if (orderId != prevOrderId) {
                    // This is the first row for the current ORDERID
        %>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Total Amount</th>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Unit Price</th>
                                <th>Subtotal</th>
                                <!-- Add more columns as needed -->
                            </tr>
                        </thead>
                        <tbody>
        <%
                }
        %>
                    <tr>
                        <td><%= rs.getString("ORDERDATE") %></td>
                        <td>$<%= rs.getString("TOTALAMOUNT") %></td>
                        <td><%= rs.getString("PRODUCTNAME") %></td>
                        <td><%= rs.getString("QUANTITY") %></td>
                        <td>$<%= rs.getString("PRICE") %></td>
                        <td>$<%= rs.getString("SUBTOTAL") %></td>
                        <!-- Add more columns as needed -->
                    </tr>
        <%
                // Increment the row count for the current ORDERID
                orderRowCountMap.put(orderId, rowCount + 1);
                prevOrderId = orderId;
            }
        %>
                        </tbody>
                    </table>
    </div>
    <%
        }
    %>
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

        function logout() {
        	alert("You have been logged out.");
            location.href = "mini_logout.jsp";
        }

        function cart() {
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