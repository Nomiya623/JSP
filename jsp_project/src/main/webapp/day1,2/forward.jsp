<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div>See you in a page</div>
	<jsp:forward page="forwardView.jsp">
		<jsp:param name="name" value="Hong Gildong"></jsp:param>
			<jsp:param name="id" value="1234"></jsp:param>
			</jsp:forward>
</body>
</html>