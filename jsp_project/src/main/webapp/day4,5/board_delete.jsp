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
	String boardNo= request.getParameter("boardNo");

	String sql = "DELETE FROM TBL_BOARD" 
				+ " WHERE BOARDNO = '" 
				+ boardNo + "'";

	stmt.executeQuery(sql);
	
	%>

</body>
</html>
<script>
	alert("삭제되었습니다);
	location.href = "board_list.jsp";
</script>