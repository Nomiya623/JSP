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

th {
	background-color: #eee;
}

a {
	color: black;
	font-weight: bold;
	text-decoration: none;
}

a:visited {
	color: black;
}

a:hover {
	color: hotpink;
}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<!-- [이름 or 아이디] 검색 기능 추가-->
	<!-- [] 검색 기능 추가-->
	<%
	String searchKeyword = request.getParameter("searchKeyword");
	String sql = "SELECT BOARDNO, TITLE, B.USERID, USERNAME, HIT, "
			+ "TO_CHAR(CDATETIME, 'YY/MM/DD HH24:MI') AS CDATETIME, "
			+ "TO_CHAR(UDATETIME, 'YY/MM/DD HH24:MI') AS UDATETIME " + "FROM TBL_BOARD B "
			+ "INNER JOIN TBL_MEMBER M ON B.USERID = M.USERID";

	if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
		sql += " WHERE USERNAME LIKE '%" + searchKeyword + "%' OR B.USERID LIKE '%" + searchKeyword + "%' OR TITLE LIKE '%" + searchKeyword;
	}
	
	ResultSet rs = stmt.executeQuery(sql);
	%>
	
	<%-- <% 
    String searchKeyword = request.getParameter("search");
    String sql = "SELECT BOARDNO, TITLE, B.USERID, USERNAME, HIT, TO_CHAR(CDATETIME, 'YY/MM/DD HH24:MI') AS CDATETIME, TO_CHAR(UDATETIME, 'YY/MM/DD HH24:MI') AS UDATETIME FROM TBL_BOARD B INNER JOIN TBL_MEMBER M ON B.USERID = M.USERID";
    
    if(searchKeyword != null && !searchKeyword.trim().isEmpty()) {
        sql += " WHERE USERNAME LIKE '%" + searchKeyword + "%' OR B.USERID LIKE '%" + searchKeyword + "%'";
    }
    ResultSet rs = stmt.executeQuery(sql);
    %> --%>
    
	<form action="user_list.jsp" method="get">
		검색어: <input type="text" name="searchKeyword"
			value="<%=request.getParameter("searchKeyword") != null ? request.getParameter("searchKeyword") : ""%>">
		<input type="submit" value="검색">
	</form>

	<%-- 	<%
	String sql = "SELECT BOARDNO, TITLE, B.USERID, USERNAME, HIT," + "TO_CHAR(CDATETIME, 'YY/MM/DD HH24:MI') AS CDATETIME, "
			+ "TO_CHAR(UDATETIME, 'YY/MM/DD HH24:MI') AS UDATETIME " + "FROM TBL_BOARD B "
			+ "INNER JOIN TBL_MEMBER M ON B.USERID = M.USERID" + " ORDER BY CDATETIME DESC";
	ResultSet rs = stmt.executeQuery(sql);
	%> --%>


	<table>
		<tr>
			<th style="width: 10%;">번호</th>
			<th style="width: 40%;">제목</th>
			<th style="width: 10%;">작성자</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 15%;">작성날짜</th>
			<th style="width: 15%;">수정날짜</th>
		</tr>
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("BOARDNO")%></td>
			<td><a
				href="board_view.jsp?boardNo=<%=rs.getString("BOARDNO")%>"> <%=rs.getString("TITLE")%></a></td>
			<td><%=rs.getString("USERNAME")%></td>
			<td><%=rs.getString("HIT")%></td>
			<td><%=rs.getString("CDATETIME")%></td>
			<td><%=rs.getString("UDATETIME")%></td>
			<%-- <td>
				<button onclick="boardUpdate('<%=rs.getString("BOARDNO")%>')"
					class="updateButton">수정</button>
			</td>
			<td>
				<button onclick="boardDelete('<%=rs.getString("BOARDNO")%>')"
					class="deleteButton">삭제</button>
			</td> --%>
		</tr>
		<%
		}
		%>
	</table>
	<div style="text-align: left; margin-top: 20px;">
		<a href="board_add.jsp">
			<button type="button">글쓰기</button>
		</a>
	</div>
</body>
</html>
<script>
	var board = document.board_list;
	function search() {
		location.href = "board_list.jsp?searchKeyword=" + board.searchKeyword.value;

	}
</script>


