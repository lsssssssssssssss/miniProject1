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
        String sesid = (String)session.getAttribute("userid");
        String status = (String)session.getAttribute("status");
        String userid = request.getParameter("userid");
        if(sesid == null || sesid.trim().isEmpty() || !status.equals("A")) {
    %>
        <script>
            function redirectToLogin() {
                alert("Please log in as an admin to edit user information.");
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
        <h2>Edit User</h2>

        <!-- User Edit Form -->
        <form action="mini_user_update.jsp" method="post" onsubmit="fnSubmit()">
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
        
        function fnSubmit() {
        	alert("completed");
        }
    </script>

    <%
            }
        }
    %>
</body>
</html>