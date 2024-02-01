<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    // 세션이 존재하면 세션을 무효화합니다.
    if (session != null && session.getAttribute("userid") != null) {
        session.invalidate(); // 세션 무효화
    }

    // 로그아웃 후 mini_home.jsp 페이지로 이동합니다.
    response.sendRedirect("mini_home.jsp");
	%>
</body>
</html>