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
	String boardNo = request.getParameter("boardNo");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");

	String sql = "UPDATE TBL_BOARD SET TITLE = ?, CONTENTS = ?, UDATETIME = SYSDATE WHERE BOARDNO = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString (1, title);
	pstmt.setString (2, contents);
	pstmt.setString (3, boardNo);
	
	int rowsUpdated = pstmt.executeUpdate();
	if(rowsUpdated>0){
		out.println("게시글이 성공적으로 업데이트되었습니다.");
		
	} else {
		out.println("업데이트를 실패했습니다.");
	}
	
	%>

</body>
</html>
<script>
	alert("수정되었습니다");
	location.href="board_list.jsp";
</script>