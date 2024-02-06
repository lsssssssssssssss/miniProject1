<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="dbconn.jsp"%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%
        String userid = (String)session.getAttribute("userid");
        String total = request.getParameter("total");
        String sql = "SELECT C.PRODUCTID, PRODUCTNAME, QUANTITY, PRICE, TOTALAMOUNT FROM MINI_CART C INNER JOIN MINI_PRODUCT P ON c.productid = p.productid WHERE USERID = '"
                + userid + "' ORDER BY C.PRODUCTID";
        ResultSet rs = stmt.executeQuery(sql);
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
        String sql2 = "INSERT INTO MINI_ORDER VALUES(MINI_ORDER_SEQ.NEXTVAL,?,SYSDATE,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql2, new String[] { "ORDERID" }); // Specify the column names to retrieve
        pstmt.setString(1, userid);
        pstmt.setString(2, total);
        pstmt.executeUpdate();
        
        ResultSet generatedKeys = pstmt.getGeneratedKeys();
        int orderId;
        if (generatedKeys.next()) {
            orderId = generatedKeys.getInt(1);
            while (rs.next()) {
                String sql3 = "INSERT INTO MINI_ORDERDETAIL VALUES(?, ?, ?, ?, ?)";
                PreparedStatement pstmt2 = conn.prepareStatement(sql3);
                pstmt2.setInt(1, orderId);
                pstmt2.setInt(2, rs.getInt("PRODUCTID"));
                pstmt2.setInt(3, rs.getInt("QUANTITY"));
                pstmt2.setInt(4, rs.getInt("PRICE"));
                pstmt2.setInt(5, rs.getInt("TOTALAMOUNT"));
                pstmt2.executeUpdate();
                String sql4 = "UPDATE MINI_PRODUCT SET STOCKQUANTITY = STOCKQUANTITY - ? WHERE PRODUCTID = ?";
                PreparedStatement pstmt3 = conn.prepareStatement(sql4);
                pstmt3.setInt(1, rs.getInt("QUANTITY"));
                pstmt3.setInt(2, rs.getInt("PRODUCTID"));
                pstmt3.executeUpdate();
            }
        }
        String sql5 = "DELETE FROM MINI_CART WHERE USERID = ?";
        PreparedStatement pstmt4 = conn.prepareStatement(sql5);
        pstmt4.setString(1, userid);
        pstmt4.executeUpdate();
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
            setTimeout(function() {
            	location.href = "mini_order.jsp";
            }, 2000);
        });

        function redirectToOrderPage() {
            location.href = "mini_order.jsp";
        }
    </script>
</body>
</html>