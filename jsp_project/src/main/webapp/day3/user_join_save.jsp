<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User join save page</title>
</head>
<body>
	<!-- 2. user_join_save.jsp
	-> 입력받은 3개의 데이터를 db에 저장
	(TBL_MEMBER, 3개의 컬럼만 저장 -->
	<%@ include file="dbconn.jsp"%>
	<%
	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");
	/* String pwd2 = request.getParameter("pwd2"); */
	String userName = request.getParameter("userName");
	String gender = request.getParameter("gender");
	/* String pwdStr = "";
	if(pwd != "" && pwd != null){
		pwdStr = "PWD = '" + pwd + "',";
	} else {
		pwdStr = "";
	} */

	String sql = "INSERT INTO TBL_MEMBER (USERID, PWD, USERNAME, GENDER) " + "VALUES('" + userId + "', '" + pwd + "','" 
			+ userName + "','"
			+ gender + "') ";

	stmt.executeUpdate(sql);
	

	/* String sql = "INSERT INTO TBL_MEMBER (USERID, USERNAME";
	if(pwd != null && !pwd.isEmpty()){
	    sql += ", PWD";
	}
	sql += ") VALUES ('" + userId + "', '" + userName + "'";
	if(pwd != null && !pwd.isEmpty()){
	    sql += ", '" + pwd + "'";
	}
	sql += ")"; */

	/* try {
		stmt.executeUpdate(sql);
		out.println("회원가입 성공.");
	} catch (SQLException e) {
		e.printStackTrace();
		out.println("회원가입 실패.");
	} */
	%>
		
	<!-- 4. user_login_view.jsp
	-> 전달 받은 아이디/패스워드와 동일한 데이터가 dbconn 데이터에 있으면
	"로그인 성공", 없으면 "로그인실패"출력 <!--  -->
	
	

	
	 
</body>
</html>
