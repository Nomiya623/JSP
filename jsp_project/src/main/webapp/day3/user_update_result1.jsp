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
	/* String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");
	String userName = request.getParameter("userName");

	String updateSql = "UPDATE TBL_MEMBER SET ";

	boolean updateNeeded = false;

	if (pwd != null && !pwd.trim().isEmpty()) {
		updateSql += "PWD = '" + pwd + "'";
		updateNeeded = true;
	}

	if (userName != null && !userName.trim().isEmpty()) {
		if (updateNeeded)
			updateSql += ", ";
		updateSql += "USERNAME = '" + userName + "'";
		updateNeeded = true;
	}

	if (updateNeeded) {
		updateSql += " WHERE USERID = '" + userId + "'";
		int result = stmt.executeUpdate(updateSql);
		if (result > 0) {
			out.println("회원정보가 성공적으로 수정되었습니다.");
		} else {
			out.println("회원정보 수정에 실패하였습니다.");
		}
	} else {
		out.println("수정할 정보가 없습니다.");
	} */
	%>


</body>
</html>