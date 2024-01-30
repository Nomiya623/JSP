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
	<h2>학생 정보 추가</h2>
	<form action="saveStudent.jsp" method="post">
		아이디: <input type="text" name="stuId" maxlength="4" required><br>
		이름: <input type="text" name="name" required><br>
		학과: <input type="text" name="dept" required><br>
		과목: <input type="text" name="subject" required><br>
		점수: <input type="number" name="grade" min="0" max="100" required><br>
		<input type="submit" value="추가">
	</form>
</html>