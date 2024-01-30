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
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "SELECT s.STU_NAME, s.STU_DEPT, g.SUBJECT, g.GRADE "
			+ "FROM TBL_STULIST s JOIN TBL_GRADE g ON s.STU_ID = g.STU_ID " + "WHERE s.STU_ID = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, stuId);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		String stuName = rs.getString("STU_NAME");
		String stuDept = rs.getString("STU_DEPT");
	%>
	<h2>
		Details for:
		<%=stuName%></h2>
	<p>
		Department:
		<%=stuDept%></p>
	<table border="1">
		<tr>
			<th>과목</th>
			<th>점수</th>
		</tr>
		<%
		do {
			String subject = rs.getString("SUBJECT");
			int grade = rs.getInt("GRADE");
		%>
		<tr>
			<td><%=subject%></td>
			<td><%=grade%></td>
		</tr>
		<%
		} while (rs.next());
		%>
	</table>
            <form action="deleteStudent.jsp" method="post">
                <input type="hidden" name="stuId" value="<%= stuId %>">
                <input type="submit" value="삭제">
            </form>

            <form action="updateStudent.jsp" method="post">
                <input type="hidden" name="stuId" value="<%= stuId %>">
                <input type="submit" value="수정">
            </form>
	<%
	} else {
	%><p>선택된 학생 정보가 없습니다.</p>
	<%
	}
	%>
</body>
</html>