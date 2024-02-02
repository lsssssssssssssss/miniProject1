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
        String productid = request.getParameter("productid");
        String quantity = request.getParameter("quantity");
        String totalamount = request.getParameter("totalamount");
        
        int totalAmount = Integer.parseInt(totalamount);
        int quantityValue = Integer.parseInt(quantity);
        int result = totalAmount * quantityValue;
        
        String sql = "SELECT * FROM MINI_CART WHERE USERID = '" + userid + "' AND PRODUCTID = '" + productid + "'";
        ResultSet rs = stmt.executeQuery(sql);

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
            if(rs.next()){
                PreparedStatement pstmt = conn.prepareStatement("UPDATE MINI_CART SET QUANTITY = QUANTITY + ?, TOTALAMOUNT = TOTALAMOUNT + ? WHERE USERID = ? AND PRODUCTID = ?");
                pstmt.setString(1, quantity);
                pstmt.setInt(2, result);
                pstmt.setString(3, userid);
                pstmt.setString(4, productid);
                pstmt.executeUpdate();
    %>
                <!-- Bootstrap Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="myModalLabel">Added to Cart</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Item has been added to your cart.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onclick="history.back();">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bootstrap JavaScript -->
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

                <script>
                    $(document).ready(function () {
                        // Show modal on page load
                        $('#myModal').modal('show');
                    });
                </script>
    <%
            } else {
                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO MINI_CART VALUES(?,?,?,?)");
                pstmt.setString(1, userid);
                pstmt.setString(2, productid);
                pstmt.setString(3, quantity);
                pstmt.setInt(4, result);
                pstmt.executeUpdate();
    %>
                <!-- Bootstrap Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="myModalLabel">Added to Cart</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Item has been added to your cart.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" onclick="history.back();">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bootstrap JavaScript -->
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

                <script>
                    $(document).ready(function () {
                        // Show modal on page load
                        $('#myModal').modal('show');
                    });
                </script>
    <%
            }
        }
    %>
</body>
</html>