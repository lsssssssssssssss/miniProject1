<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="dbconn.jsp"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
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
        	String productid = request.getParameter("productid");
        	String quantity = request.getParameter("quantity");
        	String totalamount = request.getParameter("totalamount");
        	int price = Integer.parseInt(totalamount) * Integer.parseInt(quantity);
        	
            String sql = "INSERT INTO MINI_ORDER VALUES(MINI_ORDER_SEQ.NEXTVAL,?,SYSDATE,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "ORDERID" }); // Specify the column names to retrieve
            pstmt.setString(1, userid);
            pstmt.setInt(2, price);
            pstmt.executeUpdate();
            
            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            int orderId;
            if (generatedKeys.next()) {
            	orderId = generatedKeys.getInt(1);
	            String sql2 = "INSERT INTO MINI_ORDERDETAIL VALUES(?, ?, ?, ?, ?)";
	            PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	            pstmt2.setInt(1, orderId);
	            pstmt2.setString(2, productid);
	            pstmt2.setString(3, quantity);
	            pstmt2.setString(4, totalamount);
	            pstmt2.setInt(5, price);
	            pstmt2.executeUpdate();
	            
	            String sql3 = "UPDATE MINI_PRODUCT SET STOCKQUANTITY = STOCKQUANTITY - ? WHERE PRODUCTID = ?";
                PreparedStatement pstmt3 = conn.prepareStatement(sql3);
                pstmt3.setString(1, quantity);
                pstmt3.setString(2, productid);
                pstmt3.executeUpdate();
        	}
        }
    %>
    <!-- Bootstrap JavaScript and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <!-- Bootstrap Modal -->
    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="orderModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderModalLabel">Order Placed</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Your order has been placed. Thank you!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="redirectToOrderPage()">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
	    $(document).ready(function() {
	        // Show modal on page load
	        $('#orderModal').modal('show');
	    });
	    
	    function redirectToOrderPage() {
	            location.href = "mini_order.jsp";
	    }
    </script>
</body>
</html>