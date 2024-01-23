<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>Form Submission</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<div>
		아이디:
		<%=request.getParameter("id")%></div>
	<div>
		비밀번호:
		<%=request.getParameter("pwd")%></div>
	<div>
		비밀번호 확인:
		<%=request.getParameter("pwd2")%></div>
	<div>
		이름:
		<%=request.getParameter("name")%></div>
	<div>
		연락처:
		<%=request.getParameter("phone1")%>
		-
		<%=request.getParameter("phone2")%>
		-
		<%=request.getParameter("phone3")%>
	</div>
	<div>
		성별:
		<%=request.getParameter("gender")%></div>
	<div>
		취미:
		<%
	String[] hobbies = request.getParameterValues("hobby");
	if (hobbies != null) {
		for (String hobby : hobbies) {
			out.print(hobby + " ");
		}
	}
	%>
		
	</div>
	<div>
		가입인사:
		<%=request.getParameter("comment")%></div>
</body>
</html>
