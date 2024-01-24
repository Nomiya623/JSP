<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원정보 수정 페이지</h3>
	<%@ include file="dbconn.jsp"%>
	<%
	String userId = request.getParameter("userId");

	String sql = "SELECT * FROM TBL_MEMBER" + "WHERE USERID= '" + userId + "'";
	ResultSet rs = stmt.executeQuery(sql);
	String userName = "";

	if (rs.next()) {
		userName = rs.getString("USERNAME");
	}
	%>

	<form action="user_update_result.jsp" method="post">
		<div>
			<span class="txt_input">아이디 : </span> <input type="text"
				name="userId" value="<%=userId%>" hidden>
		</div>
		<div>
			<span class="txt_input">비밀번호 : </span> <input type="password"
				name="pwd">
		</div>
		<div>
			<span class="txt_input">이름 : </span> <input type="text"
				name="userName" value="<%=userName%>>">
		</div>
		<%
		if (rs.getString("gender").equals("남성")) {
		%>
		<label> <input type="radio" name="gender" value="남성">남성
		</label> <label> <input type="radio" name="gender" value="여성">여성
		</label>
		<%
		} else {
		%>
		<label> <input type="radio" name="gender" value="남성">남성
		</label> <label> <input type="radio" name="gender" value="여성">여성
		</label>
		<%
		}
		%>
		<div>
			<input type= "submit" value= "수정하기">
		</div>
	</form>
</body>
</html>