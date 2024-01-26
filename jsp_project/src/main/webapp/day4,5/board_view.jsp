<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
	width: 75%;
	margin: auto;
}

tr, td, th {
	border: 1px solid black;
	padding: 5px 10px;
	text-align: center;
}

th {
	background-color: #eee;
}

.deleteButton {
	background-color: #f44336; /* Red */
	color: white;
	padding: 5px 10px;
	border: none;
	cursor: pointer;
	text-decoration: none;
	font-size: 16px;
	transition: background-color 0.3s;
}

.deleteButton:hover {
	background-color: #d32f2f; /* Darker Red */
}
</style>
</head>
<body>

	<%@ include file="dbconn.jsp"%>
	<%
	String boardNo = request.getParameter("boardNo");
	String sessionId = (String) session.getAttribute("sessionId");
	String sessionStatus = (String) session.getAttribute("status");

	if (request.isRequestedSessionIdValid()) {
		sessionId = (String) session.getAttribute("sessionId");
		sessionStatus = (String) session.getAttribute("sessionStatus");
	} else {
		sessionId = "";
		sessionStatus = "";
	}

		String updateSql = "UPDATE TBL_BOARD SET HIT = HIT + 1 WHERE BOARDNO = ?";
		PreparedStatement updateStmt = conn.prepareStatement(updateSql);
		updateStmt.setString(1, boardNo);
		updateStmt.executeUpdate();

		// Select board details
		String selectSql = "SELECT BOARDNO, TITLE, CONTENTS, B.USERID, USERNAME, HIT, "
		+ "TO_CHAR(CDATETIME, 'YY/MM/DD HH24:MI') AS CDATETIME, "
		+ "TO_CHAR(UDATETIME, 'YY/MM/DD HH24:MI') AS UDATETIME "
		+ "FROM TBL_BOARD B INNER JOIN TBL_MEMBER M ON B.USERID = M.USERID " + "WHERE BOARDNO = ?";
		PreparedStatement selectStmt = conn.prepareStatement(selectSql);
		selectStmt.setString(1, boardNo);
		ResultSet rs = selectStmt.executeQuery();

		if (rs.next()) {
	%>
	<table>
		<tr>
			<th>제목</th>
			<td><%=rs.getString("TITLE")%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=rs.getString("CONTENTS")%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=rs.getString("USERNAME")%></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=rs.getString("UDATETIME")%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=rs.getString("HIT")%></td>
		</tr>
		<tr>
			<th>삭제</th>
			<td>
				<%
				if (sessionId != null && (sessionId.equals(rs.getString("USERID")) || "A".equals(sessionStatus))) {
				%> <input type="button" onclick="boardDelete('<%=boardNo%>')"
				value="삭제" class="deleteButton"> <%
 }
 %>
			</td>
		</tr>
		<%
		}
		%>
	</table>

<%-- 	<%
	} else {
	out.println("게시글이 존재하지 않습니다");
	}
	%> --%>

</body>
</html>
<script>
	function boardDelete(boardNo) {
		if (confirm('삭제하시습니까?')) {
			location.href = "board_delete.jsp?boardNo=" + boardNo;
		}
	}
</script>

