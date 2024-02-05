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
                alert("Please use it after logging in.");
                location.href = "mini_login.jsp";
            }
            redirectToLogin();
        </script>
    <%
        }
        String productid = request.getParameter("productid");
        String sql = "SELECT * FROM MINI_PRODUCT ORDER BY PRODUCTID";
        ResultSet rs = stmt.executeQuery(sql);
    %>
</body>
</html>