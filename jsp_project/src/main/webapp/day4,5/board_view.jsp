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
	<input name="commentNo" hidden>
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
		<%
			if(userId.equals(sessionId) || "A".equals(sessionStatus)){
		%>
			<input type="button" onclick="boardDelete(<%= boardNo %>)" value="삭제">
			<input type="button" onclick="boardUpdate(<%= boardNo %>)" value="수정">		
		<%
			}
		%>
		<br>
		<hr>
		<%
			rs = stmt.executeQuery(
				"SELECT * FROM TBL_COMMENT "
				+ "WHERE BOARDNO = " + boardNo
			);
			while(rs.next()){
				out.print("<div style='margin-bottom:5px;'>");
				out.print("<span style='font-weight:bold;'>" + rs.getString("USERID") + " : </span>");
				out.print("<span style='display : inline-block; width : 450px;'>" + rs.getString("CMT") + "</span>");
				out.print("<span>" + rs.getString("UDATETIME") + "</span>");
				out.print("<a href='#' onclick='cmtDelete(" + rs.getString("COMMENTNO") + "," + boardNo +")'>✖</a>");
			%>
			<!-- 업데이트 버튼 -->
			<a href="#" onclick="cmtUpdate('<%= rs.getString("CMT") %>', <%= rs.getString("COMMENTNO") %>)">🗨</a>
			<%
				out.print("</div>");
			}
		%> 
		<div>
			<textarea name="comment" rows="4" cols="100"></textarea>
			<!-- 수정 버튼 추가 및 이름 부여 -->
			<input name="insertBtn" type="button" onclick="fnComment(<%= boardNo %>, '<%= sessionId %>', 'add')" value="댓글달기">
			<input name="updateBtn" style="display:none;" type="button" onclick="fnComment(<%= boardNo %>, '<%= sessionId %>', 'update')" value="수정하기"> 
		</div>
	
	
	</form>
</body>
</html>
<script>
	var commentNo = "";
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
	// kind = > add(등록), update(수정) 
	function fnComment(boardNo, userId, kind){
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
		var link = "comment_add.jsp?boardNo="+boardNo+"&userId="+userId+"&comment="+cmt+"&kind="+kind;
		if(kind == "update"){
			link += "&commentNo="+document.boardView.commentNo.value;
		}
		location.href = link;
	}
	
	function cmtDelete(commentNo, boardNo){
		if(!confirm("정말 삭제?")){
			return;
		}	
		location.href
			="comment_delete.jsp?commentNo=" + commentNo + "&boardNo=" + boardNo;
	}
	// 실행 부분
	function cmtUpdate(comment, commentNo){
		var form = document.boardView;
		form.comment.value = comment;
		form.insertBtn.style.display="none";
		form.updateBtn.style.display="inline-block";
		form.commentNo.value = commentNo;
	}
</script>