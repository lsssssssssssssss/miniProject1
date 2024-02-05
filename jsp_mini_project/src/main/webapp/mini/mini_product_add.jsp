<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                alert("Please log in to edit the product.");
                location.href = "mini_login.jsp";
            }
            redirectToLogin();
        </script>
    <%
        } else {
	        String productid = request.getParameter("productid");
	        String productname = request.getParameter("productName");
	        String price = request.getParameter("productPrice");
	        String stockquantity = request.getParameter("stockQuantity");
	        
	        String sql = "UPDATE MINI_PRODUCT SET PRODUCTNAME = ?, PRICE = ?, STOCKQUANTITY = ? WHERE PRODUCTID = ?";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, productname);
	        pstmt.setString(2, price);
	        pstmt.setString(3, stockquantity);
	        pstmt.setString(4, productid);
	        pstmt.executeUpdate();
        }
    %>
    <script>
    	alert("completed");
    	location.href = "mini_product_list.jsp";
    </script>
</body>
</html>