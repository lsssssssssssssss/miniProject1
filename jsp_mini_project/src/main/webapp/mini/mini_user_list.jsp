<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <%@ include file="dbconn.jsp"%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%
        // Check if the user is logged in and is an admin
        String userid = (String)session.getAttribute("userid");
    	String status = (String)session.getAttribute("status");
        if(userid == null || userid.trim().isEmpty() || !status.equals("A")) {
    %>
        <script>
            function redirectToLogin() {
                alert("Please log in as an admin to view the user list.");
                location.href = "mini_login.jsp";
            }
            redirectToLogin();
        </script>
    <%
        } else {
            // Retrieve the user list from the database
            String sql = "SELECT * FROM MINI_USER";
            ResultSet rs = stmt.executeQuery(sql);
    %>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Fitness Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="productList()">Product List</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#" onclick="userList()">User List <span class="sr-only">(current)</span></a>
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
        <h2>User List</h2>

        <!-- User Table -->
        <table class="table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Password</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through users from the server and display them -->
                <%
                    while(rs.next()) {
                %>
                        <tr>
                            <td><%= rs.getString("USERID") %></td>
                            <td><%= rs.getString("USERNAME") %></td>
                            <td><%= rs.getString("PASSWORD") %></td>
                            <td><%= rs.getString("EMAIL") %></td>
                            <td><%= rs.getString("ADDRESS") %></td>
                            <td><%= rs.getString("PHONE") %></td>
                            <td>
                                <!-- Link to the user's profile/edit page -->
                                <a href="editUser.jsp?userid=<%= rs.getString("USERID") %>" class="btn btn-warning btn-sm">Edit</a>
                                <!-- Add more actions as needed -->
                            </td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JavaScript -->
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
    </script>

    <%
        }
    %>
</body>
</html>