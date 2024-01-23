<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lower Case method example</title>
</head>
<body>
	<%-- 선언부에 메소드를 생성
	(문자열을 매개변수로 받아서 다 소문자로 바꿔서 리턴) 
	표현식에서 해당 메소드 호출
	--%>
	<%-- Declaration of the method --%>
	<%!public String toLowerCase(String input) {
		if (input != null) {
			return input.toLowerCase();
		} else {
			return "";
		}
	}%>

	<%-- Example of calling the method --%>
	<p>Original : "Hello World"</p>
	<p>
		Lower Case:
		<%=toLowerCase("Hello World")%></p>
		
	
	<%!
		String lower(String str){
		return str.toLowerCase();
	}
	%>	
	<%= lower("Hello World") %>
</body>
</html>


