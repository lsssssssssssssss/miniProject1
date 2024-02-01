<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form div {
            margin-bottom: 15px;
        }

        form input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        form input[type="button"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        form input[type="button"]:hover {
            background-color: #0056b3;
        }

        div.alert {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #d6e9c6;
            border-radius: 3px;
            color: #3c763d;
            background-color: #dff0d8;
        }

        div.alert-error {
            border-color: #ebccd1;
            color: #a94442;
            background-color: #f2dede;
        }
    </style>
</head>
<body>
    <%@ include file="dbconn.jsp" %>
    <%
        String userid = request.getParameter("userid");
        String sql = "SELECT * FROM MINI_USER WHERE USERID = '" + userid + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if(userid.equals("")) {
    %>
    <form name="idChecked">
        <div><input name="userid" type="text" placeholder="Enter User ID"></div>
        <div><input type="button" value="Duplicate Check" onclick="check()"></div>
    </form>
    <%
        } else if(userid.length() > 20) {
    %>
    <form name="idChecked2">
        <div class="alert alert-error">Invalid userid. Please make sure your username is 20 characters or less.</div>
        <div><input name="userid" type="text" placeholder="Enter User ID"></div>
        <div><input type="button" value="Duplicate Check" onclick="check2()"></div>
    </form>
    <%
        } else {
            if(rs.next()) {
    %>
    <form name="idChecking">
        <div class="alert alert-error">Duplicate ID found</div>
        <div><input name="userid" type="text" placeholder="Enter User ID"></div>
        <div><input type="button" value="Duplicate Check" onclick="idCheck()"></div>
    </form>
    <%
            } else {
    %>
    <div class="alert">The ID is available</div>
    <div><input type="button" value="Using" onclick="popClose('<%= userid %>')"></div>
    <%
            }
        }
    %>
</body>
</html>
<script>
	function popClose(userid){
		opener.document.getElementById('userid').value = userid;
		opener.document.getElementById('userid').setAttribute('disabled', 'disabled');
		window.close();
	}
	function idCheck(){
		var obj = document.idChecking;
		if(obj.userid.value == "" || obj.userid.value == undefined){
			return;
		} else {
			location.href = "mini_idCheck.jsp?userid=" + obj.userid.value;
		}
	}
	function check(){
		var obj = document.idChecked;
		if(obj.userid.value == "" || obj.userid.value == undefined){
			return;
		} else {
			location.href = "mini_idCheck.jsp?userid=" + obj.userid.value;
		}
	}
	function check2(){
		var obj = document.idChecked2;
		if(obj.userid.value == "" || obj.userid.value == undefined){
			return;
		} else {
			location.href = "mini_idCheck.jsp?userid=" + obj.userid.value;
		}
	}
</script>