<%@page import="java.util.*"%>
<%@page import="java.lang.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form>
	<table>
		<tr>
			<td>Subscribe to newsletter?:</td>
			<%-- Approach 1: Property is of type java.lang.Boolean --%>
			<td><form:checkbox path="preferences.receiveNewsletter"/></td>
		</tr>

		<tr>
			<td>Interests:</td>
			<%-- Approach 2: Property is of an array or of type java.util.Collection --%>
			<td>
				Quidditch: <form:checkbox path="preferences.interests" value="Quidditch"/>
				Herbology: <form:checkbox path="preferences.interests" value="Herbology"/>
				Defence Against the Dark Arts: <form:checkbox path="preferences.interests" value="Defence Against the Dark Arts"/>
			</td>
		</tr>

		<tr>
			<td>Favorite Word:</td>
			<%-- Approach 3: Property is of type java.lang.Object --%>
			<td>
				Magic: <form:checkbox path="preferences.favouriteWord" value="Magic"/>
			</td>
		</tr>
	</table>
</form:form>
</body>
</html>