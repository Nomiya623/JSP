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
	String stuId = request.getParameter("stuId");

	PreparedStatement pstmt = conn.prepareStatement("DELETE FROM TBL_GRADE WHERE STU_ID = ?");
	pstmt.setString(1, stuId);
	pstmt.executeUpdate();
	
	pstmt = conn.prepareStatement("DELETE FROM TBL_STULIST WHERE STU_ID = ?");
	pstmt.setString(1, stuId);
	pstmt.executeUpdate();

	out.println("<p>삭제되었습니다.</p>");
	%>

	<a href="student.jsp">메인 페이지로 이동</a>

</body>
</html>