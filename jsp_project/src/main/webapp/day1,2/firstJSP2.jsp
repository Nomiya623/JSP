<%@page import="java.util.Calendar"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first JSP</title>
</head>
<body>
	<%!
		int z=0;
		int sum(int x, int y) {
		return x + y;
		};
	%>
	
	<%
		Calendar c = Calendar.getInstance(); 
		for(int i=1; i<=10; i++){
			out.println(i + "<br>");
		}
	%>
	
	<h1><%= sum(1,2) %></h1>
	<%= c.HOUR_OF_DAY %>
	<%= c.MINUTE %>
	
<form:form>
	<table>
		<tr>
			<td>First Name:</td>
			<td><form:input path="firstName"/></td>
		</tr>
		<tr>
			<td>Last Name:</td>
			<td><form:input path="lastName"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="Save Changes"/>
			</td>
		</tr>
	</table>
</form:form>

<form:form>
	<table>
		<tr>
			<td>Interests:</td>
			<td>
				<%-- Property is of an array or of type java.util.Collection --%>
				<form:checkboxes path="preferences.interests" items="${interestList}"/>
			</td>
		</tr>
	</table>
</form:form>

<tr>
	<td>Sex:</td>
	<td>
		Male: <form:radiobutton path="sex" value="M"/> <br/>
		Female: <form:radiobutton path="sex" value="F"/>
	</td>
</tr>

</body>
</html>