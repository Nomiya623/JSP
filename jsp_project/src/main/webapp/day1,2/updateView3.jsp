<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<title>회원가입</title>
<style>
body {
	background-color: #1e1e1e;
	color: #f1f1f1;
	font-family: Arial, sans-serif;
}

div {
	margin: 5px 0px;
}

.txt_input, .select_input {
	width: 80px;
	display: inline-block;
	color: #f1f1f1;
}

input[type=text], input[type=password], select, textarea {
	background-color: #333333;
	color: #f1f1f1;
	border: 1px solid #444444;
	padding: 5px;
}

input[type=button], input[type=submit], input[type=reset] {
	background-color: #4a76a8;
	color: #ffffff;
	border: none;
	padding: 10px 15px;
	margin: 5px 0;
	cursor: pointer;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover
	{
	background-color: #3a5a78;
}

label {
	color: #f1f1f1;
}

textarea {
	resize: vertical;
}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String gender = request.getParameter("gender");
		
		String[] hobby = {};
		if(request.getParameterValues("hobby") != null){
			hobby = request.getParameterValues("hobby");
		}		
		String comment = request.getParameter("comment");
		String phone = phone1 + phone2 + phone3;
		
		String pwdStr = "";
		if(pwd != "" && pwd != null){
			pwdStr = "PWD = '" + pwd + "',";
		} else {
			pwdStr = "";
		}
		stmt.executeUpdate(
			"UPDATE TBL_MEMBER SET "
			+ pwdStr
			+ "USERNAME = '" + name + "',"
			+ "PHONE = '" + phone + "',"
			+ "GENDER = '" + gender + "',"
			+ "HOBBY1 = '" + (hobby.length>0 ? hobby[0] : "") + "',"
			+ "HOBBY2 = '" + (hobby.length>1 ? hobby[1] : "") + "',"
			+ "HOBBY3 = '" + (hobby.length>2 ? hobby[2] : "") + "',"
			+ "CMT = '" + comment+ "' "
			+ "WHERE USERID = '" + id + "'"
		); 
		
	%>
	
	<form action="deleteRecord.jsp" method="post">
    <input type="text" name="idToDelete" placeholder="Enter ID to delete">
    <input type="submit" value="Delete Record">
</form>
	
	
<%
    // Database connection setup
    String idToDelete = request.getParameter("idToDelete");

    if (idToDelete != null && !idToDelete.isEmpty()) {
        stmt.executeUpdate("DELETE FROM TBL_MEMBER WHERE USERID = '" + idToDelete + "'");
        out.println("Record deleted successfully.");
    } else {
        out.println("No ID provided.");
    }

    // Close statement and other resources
%>
	



</body>
</html>
<script>
	
</script>
<!-- 
1. '수정하기' 버튼 만든 후 클릭하면 데이터 수정.
(input에 있는 값으로 수정.-update)

2. 패스워드 값을 입력 안할 시 -> 패스워드 값을 그대로 유지
패스워드 값 입력 시 -> 두개 같은지 확인 후 수정

3. input 박스에서 값을 입력받아서 버튼 클릭 시
해당 갑의 아이디를 가지는 레코드 삭제(tbl_member)
-->
