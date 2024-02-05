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
    	String status = (String)session.getAttribute("status");
        if(sesid == null || sesid.trim().isEmpty() || !status.equals("A")) {
    %>
        <script>
            function redirectToLogin() {
                alert("Please log in as an admin to edit user information.");
                location.href = "mini_login.jsp";
            }
            redirectToLogin();
        </script>
    <% 	} else {
    		String userid = request.getParameter("userid");
    		String sql = "DELETE FROM MINI_USER WHERE USERID = '" + userid + "'";
    		stmt.executeUpdate(sql);
    	}
    %>
    <script>
   		location.href = "mini_user_list.jsp";
    </script>
</body>
</html>