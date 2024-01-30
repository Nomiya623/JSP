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

	 PreparedStatement pstmt = conn.prepareStatement("UPDATE TBL_STULIST SET STU_DEPT = '소프트웨어' WHERE STU_ID = ?");
     pstmt.setString(1, stuId);
     pstmt.executeUpdate();

     out.println("<p>수정되었습니다.</p>");
	%>

	<a href="student.jsp">메인 페이지로 이동</a>

</body>
</html>