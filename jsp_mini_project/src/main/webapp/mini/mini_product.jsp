<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Product Purchase</title>
    <style>
    #productImage {
        width: 200px;
        height: auto;
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
                <li class="nav-item active">
                    <a class="nav-link" href="#" onclick="products()">Products <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" onclick="signup()">Sign Up</a>
                </li>
                <%
					if (session != null && session.getAttribute("userid") != null) {
				%>
			            <li class="nav-item">
			                <a class="nav-link" href="#" onclick="logout()">Logout</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="#" onclick="cart()">Cart</a>
			            </li>
			    <%
					} else {
				%>
						<li class="nav-item">
			                <a class="nav-link" href="#" onclick="login()">Login</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="#" onclick="noCart()">Cart</a>
			            </li>
				<%
					}
				%>
            </ul>
        </div>
    </nav>
    <%@ include file="dbconn.jsp"%>
    <%
        String sql = "SELECT * FROM MINI_PRODUCT";
        ResultSet rs = stmt.executeQuery(sql);
        ResultSet rs2;
        // 값 전달을 위해 productImageName 변수를 사용
        String productImageName = "";
    %>
    <div class="container mt-4">
        <h2>Product Purchase</h2>
        <form name="product" action="mini_order.jsp" onsubmit="return purchase()">
            <div class="form-group">
                <label for="productName">Product Name</label>
                <select class="form-control" id="productName" onchange="changeImage(); totalPrice(); updateStockQuantity()">
                    <%
                        while(rs.next()){
                        	PreparedStatement pstmt = conn.prepareStatement("SELECT REPLACE(TRIM(PRODUCTNAME),' ','') AS PRODUCTNAME, PRICE, STOCKQUANTITY, PRODUCTID FROM MINI_PRODUCT WHERE PRODUCTID = ?");
                            pstmt.setInt(1, rs.getInt("PRODUCTID"));
                            rs2 = pstmt.executeQuery();
                            if(rs2.next()){
                                productImageName = rs2.getString("PRODUCTNAME");   
                    %>
                        <option value="<%= productImageName %>" <%= rs.getString("PRODUCTNAME").equals("Treadmill") ? "selected" : "" %> data-price="<%= rs.getInt("PRICE") %>" data-stockquantity="<%= rs2.getInt("STOCKQUANTITY") %>" data-productid="<%= rs2.getInt("PRODUCTID") %>"><%= rs.getString("PRODUCTNAME") %></option>
                    <%
                        	}
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="productImage">Product Image</label>
                <img id="productImage" src="image/Treadmill.jpg" alt="Product Image" class="img-fluid mb-2">
            </div>
            <div class="form-group">
                <label for="quantity">Quantity</label>
                <input type="number" min="1" class="form-control" id="quantity" placeholder="1" required value="1" onchange="totalPrice()">
            </div>
            <div class="form-group">
                <label for="totalAmount">Total Amount</label>
                <input type="text" class="form-control" id="totalAmount" value="$0" readonly>
            </div>
            <div class="form-group">
                <label for="stockQuantity">Stock Quantity</label>
                <span id="stockQuantity">0</span>
            </div>
            <input type="text" id="productid" hidden>
            <button type="submit" class="btn btn-primary">Purchase</button>
            <a href="#" class="btn btn-success ml-2" onclick="addCart()">Add to Cart</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
    	document.addEventListener("DOMContentLoaded", function() {
        	changeImage();
        	totalPrice();
        	updateStockQuantity();
    	});
    	
        function changeImage() {
            var productName = document.getElementById('productName');
            var productImage = document.getElementById('productImage');
            var selectedOption = productName.options[productName.selectedIndex];
            var productImageName = selectedOption.value;
			// PRODUCTID값 저장
			var productid = document.getElementById('productid');
            // 이미지 경로를 동적으로 설정
            productImage.src = 'image/' + productImageName + '.jpg';
            productid.value = selectedOption.getAttribute('data-productid');
        }
        
        function totalPrice() {
        	var productName = document.getElementById('productName');
            var quantity = document.getElementById('quantity').value;
            var totalAmountField = document.getElementById('totalAmount');
            
            var selectedOption = productName.options[productName.selectedIndex];
            var price = selectedOption.getAttribute('data-price');
            
            var totalAmount = parseInt(quantity) * parseInt(price);
            totalAmountField.value = '$' + totalAmount.toLocaleString();
        }
        
        function updateStockQuantity() {
            var productName = document.getElementById('productName');
            var stockQuantityField = document.getElementById('stockQuantity');

            var selectedOption = productName.options[productName.selectedIndex];
            var stockQuantity = selectedOption.getAttribute('data-stockquantity');

            stockQuantityField.innerText = stockQuantity;
        }
        
        function purchase() {
            var productName = document.getElementById('productName');
            var quantity = document.getElementById('quantity').value;
            var stockQuantity = document.getElementById('stockQuantity').innerText;

            if (parseInt(quantity) > parseInt(stockQuantity)) {
                alert('Cannot purchase more than available stock.');
                return false;
            }

            return true;
        }
        
        function addCart(){
        	var productName = document.getElementById('productName');
            var quantity = document.getElementById('quantity').value;
            var stockQuantity = document.getElementById('stockQuantity').innerText;
            var selectedOption = productName.options[productName.selectedIndex];
            
            var confirmation = confirm('Do you want to add this item to your cart?');

            if (confirmation) {
	            if (parseInt(quantity) > parseInt(stockQuantity)) {
	                alert('Cannot purchase more than available stock.');
	                return;
	            }
	            location.href = "mini_product_cart.jsp?productid="+document.getElementById('productid').value+"&quantity="+document.getElementById('quantity').value+"&totalamount="+selectedOption.getAttribute('data-price');
            } else {
                return;
            }
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
        function login(){
        	location.href = "mini_login.jsp";
        }
        function logout(){
        	location.href = "mini_logout.jsp";
        }
        function cart(){
        	location.href = "mini_cart.jsp";
        }
        function noCart() {
        	alert("Please use it after logging in.");
        	location.href = "mini_login.jsp";
        }
    </script>
</body>
</html>