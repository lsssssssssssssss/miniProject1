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
    	int idx = 1;
    	int total = 0;
    	String userid = (String)session.getAttribute("userid");
    	String productid = request.getParameter("productid");
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
		    String sql = "DELETE FROM MINI_CART WHERE USERID = '" + userid + "' AND PRODUCTID = '" + productid + "'";
		    stmt.executeUpdate(sql);
		    response.sendRedirect("mini_cart.jsp");
    	}
    %>
</body>
</html>