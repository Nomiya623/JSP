<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comments</title>
<style>
body {
	font-family: sans-serif;
}

.comment {
	margin-bottom: 10px;
	padding: 5px;
	border: 1px solid #ddd;
	background-color: #f9f9f9;
}

.comment strong {
	color: #007bff;
}

.comment-time {
	color: #666;
	font-size: 0.9em;
}

.edit-btn, .delete-btn {
	cursor: pointer;
	margin-left: 10px;
	color: #007bff;
}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	String boardNo = request.getParameter("boardNo");
	// Consider using prepared statements here for security
	String sql = "SELECT * FROM TBL_COMMENT WHERE BOARDNO = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, boardNo);
	ResultSet rs = pstmt.executeQuery();
	%>
	<h2>댓글</h2>
	<div>
		<%
		if (!rs.isBeforeFirst()) {
		%>
		<p>댓글 없습니다</p>
		<%
		} else {
		while (rs.next()) {
		%>
		<div class="comment">
			<strong><%=rs.getString("USERID")%>:</strong>
			<%=rs.getString("CMT")%>
			<br> <span class="comment-time">Posted on <%=rs.getString("CDATETIME")%></span>
			<span class="edit-btn"
				onclick="editComment('<%=rs.getInt("COMMENTNO")%>')">수정</span> <span
				class="delete-btn"
				onclick="deleteComment('<%=rs.getInt("COMMENTNO")%>')">삭제</span>
		</div>
		<%
		}
		}
		%>
		<form action="comment_add.jsp" method="post">
			<input type="hidden" name="boardNo" value="<%=boardNo%>">
			<textarea name="comment" rows="4" cols="50" placeholder="댓글을 입략해주세요"></textarea>
			<br> <input type="submit" value="댓글 저장">
		</form>
	</div>
</body>
</html>
<script>
	
function editComment(commentNo) {
    window.location.href = "comment_edit.jsp?commentNo=" + commentNo + "&boardNo=<%=boardNo%>";
}

	function deleteComment(commentNo){
		var confirmation = confirm("댓글을 삭제하시겠습니까? ");
		if(confirmation){
			window.location.href = "comment_delete.jsp?commentNo" + commentNo + "&boardNo=<%=boardNo%>";
		}
	}
</script>