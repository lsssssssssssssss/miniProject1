<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup Result</title>
    <%@ include file="dbconn.jsp"%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%
        String userid = request.getParameter("userid");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String detailAddress = " " + request.getParameter("detailAddress");
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

    <!-- Bootstrap Modal -->
    <div class="modal fade" id="signupSuccessModal" tabindex="-1" role="dialog" aria-labelledby="signupSuccessModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="signupSuccessModalLabel">Signup Successful</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Thank you for signing up, <%= username %>! Redirecting to login page...</p>
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
            $('#signupSuccessModal').modal('show');
            // Redirect after a delay
            setTimeout(function () {
                location.href = "mini_login.jsp";
            }, 2000); // 2000 milliseconds = 2 seconds
        });
    </script>
</body>
</html>