<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ include file="dbconn.jsp"%>
    <%
    String userid = request.getParameter("userid");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String detailAddress = request.getParameter("detailAddress");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");
    
    // PreparedStatement 생성 시에 적절한 인코딩을 지정
    String sql = "INSERT INTO MINI_USER VALUES(?,?,?,?,?,?,'U')";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, userid);
    pstmt.setString(2, username);
    pstmt.setString(3, password);
    pstmt.setString(4, email);
    
    // 주소와 상세주소를 UTF-8로 인코딩하여 합친 후 저장
    pstmt.setString(5, new String((address + detailAddress).getBytes("UTF-8"), "UTF-8"));
    
    pstmt.setString(6, phone1 + "-" + phone2 + "-" + phone3);
    
    pstmt.executeUpdate();
    %>
    <script>
        alert("Successful Signup");
        location.href = "mini_login.jsp";
    </script>
</body>
</html>