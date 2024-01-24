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

	String sql = "SELECT * FROM TBL_MEMBER" + "WHERE USERID= '" + userId + "'AND PWD= '" + pwd + "'";

	ResultSet rs = stmt.executeQuery(sql);

	if (rs.next()) {
		out.println(userId + "님 로그인 성공");
	
	%>

	<form action="userInfo" action= "user_update.jsp">
		<div>
			<input name="userId" value= "<%= userId%>" hidden>
			<input name="submit" value= "회원정보 수정" formaction="user_update.jsp">
			<input name="submit" value= "회원정보 삭제" formaction="user_update.jsp">
		</div>
	</form>
	
	<%
	} else{
		out.println("로그인 실패");
	}
	%>
</body>
</html>
<script>
	/* javascript if needed */
</script>