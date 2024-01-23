<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	out.println(id+ "," + pwd);
	
	String sql = "SELECT * FROM"
				+ " TBL_MEMBER WHERE USERID = '" + id
				+ "' AND PWD = '" + pwd + "'";
	/* 동일한 데이터 DB CONN에 없을 시 로그인 실패 */
	
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()){
		out.println("로그인 성공");
	} else {
		out.println("로그인 실패");
	}
	%>>	
</body>
</html>

 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login View</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	/* directly, not recommended; use instead preparedStatement */
	String sql = "SELECT * FROM TBL_MEMBER WHERE USERID = '" + id + "'";
	ResultSet rs = stmt.executeQuery(sql);

	if (rs.next()) {
		String storedPwd = rs.getString("PWD");
		if (storedPwd != null && storedPwd.equals(pwd)) {
			out.println(id + "님 환영합니다");
		} else {
			out.println("비밀번호 틀렸음");
		}
	} else {
		out.println("아이디가 없음");
	}
	%>
	<%
	if (Boolean.TRUE.equals(session.getAttribute("isLoggedIn"))) {
	%>
	<form action="update_user.jsp">
		<div>
			<input type="text" name="id" value="<%=id%>" hidden> 
			<input type="submit" value="회원정보 수정">
		</div>
	</form>
	<%
	}
	%>
</body>
</html>
