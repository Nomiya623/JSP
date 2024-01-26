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
	String pwdStr = "";

	
	if(pwd != null && !pwd.equals("")){
		pwdStr = "PWD = '" + pwd + "',";
	}


	String sql = "UPDATE TBL_MEMBER SET " + "PWD = '" + pwd + "'," + "USERNAME = '" + userName + "' " + "WHERE USERID = '"
			+ userId + "'";
	
	stmt.executeUpdate(sql);
	out.println("수정되었습니다!");
	
	%>
	

</body>
</html>