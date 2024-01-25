<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-color: #121212;
	color: #fff;
}

.center-text {
	text-align: center;
	font-weight: bold;
	font-size: 1.2em;
}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");

	HttpSession s = request.getSession();
	Integer loginAt = (Integer) s.getAttribute("loginAt");

	if (loginAt == null) {
		loginAt = 0;
	}

	String sql = "SELECT * FROM TBL_MEMBER " + "WHERE USERID = '" + userId + "' AND PWD = '" + pwd + "'";

	ResultSet rs = stmt.executeQuery(sql);

	if (rs.next()) {
		s.setAttribute("loginA", 0);
		out.println(userId + "님 로그인 성공");
	%>
	<!-- 5. "로그인 성공" 메세지 아래에 "회원정보 수정" 버튼 생성.
	버튼 클릭 시 user_update.jsp로 이동
	-->

	<form name="userInfo" action="user_update.jsp">
		<div>
			<input name="userId" value="<%=userId%>"> <input
				type="submit" value="회원정보 수정" formaction="user_update.jsp">
			<input type="submit" value="회원정보 삭제" formaction="user_delete.jsp">

		</div>
	</form>
	<%
	} else {
	loginAt++;
	s.setAttribute("loginAt", loginAt);

	if (loginAt >= 5) {
		out.println("<div class='center-text'>로그인 5번 이상 실패! 관리자에게 문의하세요</div>");

	} else {
		out.println("패스워드 입력 실패" + loginAt + "회");
	}
	%>
	<input type="button" value="뒤돌아가기" onclick="history.back()">
	<%
	}
	%>

</body>
</html>



</script>

