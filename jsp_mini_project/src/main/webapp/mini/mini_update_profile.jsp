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
		request.setCharacterEncoding("UTF-8");
        String sesid = (String)session.getAttribute("userid");
        if(sesid == null || sesid.trim().isEmpty()) {
    %>
        <script>
            function redirectToLogin() {
                alert("Please use it after logging in.");
                location.href = "mini_login.jsp";
            }
            redirectToLogin();
        </script>
    <%
        } else {
        	String userid = request.getParameter("userid");
        	String username = request.getParameter("username");
        	String password = request.getParameter("password");
        	String email = request.getParameter("email");
        	String address = request.getParameter("address");
        	String phone = request.getParameter("phone");
        	
        	String sql = "UPDATE MINI_USER SET USERNAME = ?, PASSWORD = ?, EMAIL = ?, ADDRESS = ?, PHONE = ? WHERE USERID = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, email);
            pstmt.setString(4, new String(address.getBytes("UTF-8"), "UTF-8"));
            pstmt.setString(5, phone);
            pstmt.setString(6, userid);
            pstmt.executeUpdate();
        }
    %>
    <script>
    	location.href = "mini_home.jsp";
    </script>
</body>
</html>