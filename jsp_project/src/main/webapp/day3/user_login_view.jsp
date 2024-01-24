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

	String sql = "SELECT * FROM TBL_MEMBER " 
				+ "WHERE USERID = '" 
				+ userId + "' AND PWD = '"
				+ pwd + "'";

	ResultSet rs = stmt.executeQuery(sql);

	if (rs.next()) {
		out.println(userId + "님 로그인 성공");
	%>
	<!-- 5. "로그인 성공" 메세지 아래에 "회원정보 수정" 버튼 생성.
	버튼 클릭 시 user_update.jsp로 이동
	-->
	
	<form name = "userInfo" action="user_update.jsp">
		<div>
			<input name="userId" value= "<%= userId %>" >
			<input type="submit" value="회원정보 수정" formaction="user_update.jsp" >
			<input type="submit" value="회원정보 삭제" formaction="user_delete.jsp">
		</div>
	</form>
	<%-- <form action="user_update.jsp">
		<div>
			<input name="userId" value= "<%= userId %>" hidden>
			<input type="submit" value="회원정보 수정">
		</div>
	</form> --%>
	<%
	} else {
		out.println("로그인 실패");
	}	
	
	%>
	
</body>
</html>
<script>
	/* function btn(txt){
		var userInfo = document.userInfo;
		if(txt == "u"){
			userInfo.action ="user_update.jsp";
		} else {
			userInfo.action ="user_delete.jsp";
		}
		userInfo.submit();
	} */
</script>

