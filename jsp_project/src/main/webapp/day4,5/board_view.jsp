<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse: collapse;
		text-align: center;
	}
	table {
		width : 800px;
	}
	td {
		width : 75%;
	}
	th {
		width : 25%;
		background-color: #eee;
	}
</style>
</head>
<body>
	<form name="boardView">
	<%@ include file="dbconn.jsp"%>
	<%
		String boardNo = request.getParameter("boardNo");
		stmt.executeUpdate(
			"UPDATE TBL_BOARD SET"
			+ " HIT = HIT+1"
			+ " WHERE BOARDNO = " + boardNo
		);
		ResultSet rs = stmt.executeQuery(
			"SELECT * FROM TBL_BOARD B " 
			+"INNER JOIN TBL_MEMBER M ON B.USERID = M.USERID "
			+"WHERE BOARDNO = '" + boardNo + "'"
		);
		rs.next();
	%>
	
	<table>
		<tr>
			<th>제목</th>
			<td><%= rs.getString("TITLE") %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= rs.getString("USERNAME") %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= rs.getString("HIT") %></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%= rs.getString("UDATETIME") %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%= rs.getString("CONTENTS") %></td>
		</tr>
	</table>
	<%
		String sessionId = "";
		String sessionStatus = "";
		String userId = rs.getString("USERID");
		if(request.isRequestedSessionIdValid()){
			sessionId = (String)session.getAttribute("userId");
			sessionStatus = (String)session.getAttribute("status");
		} 
	%>	
		<br>
		<div>
			<textarea name="comment" rows="4" cols="100"></textarea>
			<input type="button" onclick="fnComment(<%= boardNo %>, '<%= sessionId %>')" value="댓글달기"> 
		</div>
	<%
		if(userId.equals(sessionId) || "A".equals(sessionStatus)){
	%>
		<input type="button" onclick="boardDelete(<%= boardNo %>)" value="삭제">
		<input type="button" onclick="boardUpdate(<%= boardNo %>)" value="수정">		
	<%
		}
	%>
	 
	</form>
</body>
</html>
<script>
	function boardDelete(boardNo){
		if(confirm("정말 삭제할거냐?")){
			location.href="board_delete.jsp?boardNo=" + boardNo;
		}
	}
	
	function boardUpdate(boardNo){
		if(confirm("정말 수정할거냐?")){
			location.href="board_update.jsp?boardNo=" + boardNo;
		}
	}
	function fnComment(boardNo, userId){
		var cmt = document.boardView.comment.value;
		if(cmt == "" || cmt == undefined){
			alert("댓글을 입력해주세요!");
			return;
		}
		if(userId == "" || userId == undefined || userId == "null"){
			alert("로그인후 이용해 주세요!");
			location.href="user_login.jsp";
			return;
		}
		location.href
			="comment_add.jsp?boardNo="+boardNo+"&userId="+userId+"&comment="+cmt;
	}
	
</script>