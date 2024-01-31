<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		String userid = request.getParameter("userid");
		String sql = "SELECT * FROM MINI_USER WHERE USERID = '" + userid + "'";

		ResultSet rs = stmt.executeQuery(sql);
		if(userid.equals("")){
	%>
		<form name="idChecked">
			<div><input name="userid" type="text"></div>
			<div><input type="button" value="Duplicate check" onclick="check()"></div>
		</form>
	<%
		} else if(userid.length() > 20){
			out.println("Invalid userid. Please make sure your username is 20 characters or less.");
	%>
			<form name="idChecked2">
			<div><input name="userid" type="text"></div>
			<div><input type="button" value="Duplicate check" onclick="check2()"></div>
			</form>
	<%
		} else {
			if(rs.next()){
				out.println("Duplicate ID found");
	%>
			<form name="idChecking">
				<div><input name="userid" type="text"></div>
				<div><input type="button" value="Duplicate check" onclick="idCheck()"></div>
			</form>
	<%
			} else {
				out.println("The ID is available");
	%>
			<div><input type="button" value="Using" onclick="popClose('<%= userid %>')"></div>
	<%
			}
		}
	%>
</body>
</html>
<script>
	function popClose(userid){
		opener.document.signup.userid.value = userid;
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