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
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String subject = request.getParameter("subject");
	int grade = Integer.parseInt(request.getParameter("grade"));

	PreparedStatement pstmt = conn
			.prepareStatement("INSERT INTO TBL_STULIST (STU_ID, STU_NAME, STU_DEPT) VALUES (?, ?, ?)");
	pstmt.setString(1, stuId);
	pstmt.setString(2, name);
	pstmt.setString(3, dept);
	pstmt.executeUpdate();

	pstmt = conn.prepareStatement("INSERT INTO TBL_GRADE (STU_ID, SUBJECT, GRADE) VALUES (?, ?, ?)");
	pstmt.setString(1, stuId);
	pstmt.setString(2, subject);
	pstmt.setInt(3, grade);
	pstmt.executeUpdate();

	out.println("<p>성공적으로 추가되었습니다.</p>");
	%>

	<a href="student.jsp">메인페이지로 이동</a>

</body>
</html>