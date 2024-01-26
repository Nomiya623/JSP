<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>

</head>
<body>
	<form action="board_update_save.jsp" method="post">
		<input name= "boardNo" value = <%="boardNo" %> hidden>
		<div>
            <label for="userId">작성자:</label>
            <input type="text" id="userId" name="userId" required>
        </div>
		<div>
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" required>
        </div>
		<div>
            <label for="content">내용:</label>
            <textarea id="content" name="content" rows="20" cols="100" required></textarea>
        </div>
       
        <div>
            <input type="submit" value="작성">
            <input type="button" value="취소" onclick="window.history.back();">
        </div>
	</form>
</body>
</html>