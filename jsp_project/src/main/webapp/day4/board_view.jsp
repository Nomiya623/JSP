<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td, th {
	border: 1px solid black;
	padding: 5px 10px;
	border-collapse: collapse;
	text-align: center;
}

tr {
	width: 75% background-color: #eee;
}

td {
	width: 75% background-color: #eee;
}

th {
	width: 75% background-color: #eee;
}

.deleteButton {
	
}
</style>
</head>
<body>

	<%@ include file="dbconn.jsp"%>
	<%
	String boardNo = request.getParameter("boardNo");

	ResultSet rs = stmt.executeQuery(
			"SELECT TITLE, CONTENTS, USERNAME, TO_CHAR(UDATETIME, 'YY/MM/DD HH24:MI') AS UDATETIME " + "FROM TBL_BOARD B "
			+ "INNER JOIN TBL_MEMBER M ON B.USERID = M.USERID " + "WHERE BOARDNO = '" + boardNo + "'");
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
			<th>삭제</th>
			<td><input type="button"
				onclick="boardDelete('<%=rs.getString("BOARDNO")%>')"
				class="deleteButton" value="삭제"></td>
		</tr>
	</table>
	<%
	} else {
	out.println("없습니다");
	}
	%>
</body>
</html>
<script>
	function boardDelete(boardNo) {
		if (confirm('삭제하시습니까?')) {
			location.href = "board_delete.jsp?boardNo=" + boardNo;
		}
	}
</script>