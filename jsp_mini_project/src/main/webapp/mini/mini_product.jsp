<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Product Purchase</title>
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
                <li class="nav-item active">
                    <a class="nav-link" href="#">Products <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sign Up</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Cart</a>
                </li>
            </ul>
        </div>
    </nav>
    <%@ include file="dbconn.jsp"%>
    <%
        String sql = "SELECT * FROM MINI_PRODUCT";
        String sql2 = "SELECT REPLACE(PRODUCTNAME,' ','') AS PRODUCTNAME FROM MINI_PRODUCT WHERE PRODUCTID = ?";
        ResultSet rs = stmt.executeQuery(sql);

        // 값 전달을 위해 productImageName 변수를 사용
        String productImageName = "";
    %>
    <div class="container mt-4">
        <h2>Product Purchase</h2>
        <form>
            <div class="form-group">
                <label for="productName">Product Name</label>
                <select class="form-control" id="productName" onchange="changeImage('<%= productImageName %>')" required>
                    <%
                        while(rs.next()){
                        	PreparedStatement pstmt = conn.prepareStatement(sql2);
                            pstmt.setInt(1, rs.getInt("PRODUCTID"));
                            ResultSet rs2 = pstmt.executeQuery(sql2);
                    %>
                        <option value="<%= rs.getString("PRODUCTNAME") %>"><%= rs.getString("PRODUCTNAME") %></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="productImage">Product Image</label>
                <img id="productImage" src="path/to/default.jpg" alt="Product Image" class="img-fluid mb-2">
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" class="form-control" id="quantity" placeholder="Enter quantity" required>
            </div>
            <div class="form-group">
                <label for="totalAmount">Total Amount</label>
                <input type="text" class="form-control" id="totalAmount" value="$1,000,000" readonly>
            </div>
            <button type="submit" class="btn btn-primary">Purchase</button>
            <a href="#" class="btn btn-success ml-2">Add to Cart</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function changeImage(productImageName) {
            var productImage = document.getElementById('productImage');
            productImage.src = 'path/to/' + productImageName + '.jpg';
        }
    </script>
</body>
</html>