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
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String sql = "SELECT * FROM MINI_USER WHERE USERID='" + userid + "'";
	ResultSet rs = stmt.executeQuery(sql);
	
	if (rs.next()) {
		if (rs.getString("PASSWORD").equals(password)) {
			session.setAttribute("userid",rs.getString("USERID"));
			session.setAttribute("username",rs.getString("USERNAME"));
			session.setAttribute("status",rs.getString("STATUS"));
			if(rs.getString("STATUS").equals("A")){
				response.sendRedirect("mini_admin_home.jsp");
			} else {
				response.sendRedirect("mini_home.jsp");
			}
	%>
		
	<%
		} else {
	%>
	<script>
		function fnPass(){
			alert("Please check the password");
			history.back();
		}
		fnPass();
	</script>
	<%
		}
		} else {
	%>
	<script>
		function fnId(){
			alert("Please check the ID");
			history.back();
		}
		fnId();
	</script>
	<%
		}
	%>
</body>
</html>