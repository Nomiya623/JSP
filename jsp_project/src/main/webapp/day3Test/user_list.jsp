<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td {
		border : 1px solid black;
		padding : 5px 10px;
		border-collapse : collapse;
		text-align: center;
	}
	th{
		background-color: #eee;
		font-weight: normal;
	}
</style>

</head>

<body>
	<%@ include file="dbconn.jsp"%>
	<%
	String sql = "SELECT * FROM TBL_MEMBER";
	ResultSet rs = stmt.executeQuery(sql);
	
	/* if (rs.next()) {
		out.println();
	} */
	%>
	
	<table border ="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰번호</th>
			<th>성별</th>
			<th>취미1</th>
			<th>취미2</th>
			<th>취미3</th>
		</tr>
	<%
		while (rs.next()){
	%>
		<tr>
			<th><%= rs.getString("USERID") %></th>
			<th><%= rs.getString("USERNAME") %></th>
			<th><%= rs.getString("PHONE") %></th>
			<th><%= rs.getString("GENDER") %></th>
			<th><%= rs.getString("HOBBY1") %></th>
			<th><%= rs.getString("HOBBY2") %></th>
			<th><%= rs.getString("HOBBY3") %></th>

		</tr>
	<%
		}
	
	%>	
		
	</table>
</body>
</html>