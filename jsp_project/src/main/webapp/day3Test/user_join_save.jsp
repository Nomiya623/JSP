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
	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");
	String userName = request.getParameter("userName");
	String gender = request.getParameter("gender");
	
	String sql = "INSERT INTO TBL_MEMBER (USERID, PWD, USERNAME, GENDER) " + "VALUES('" + userId + "', '" + pwd + "','" 
			+ userName + "','"
			+ gender + "') ";

	stmt.executeUpdate(sql);
	%>
	
</body>
</html>