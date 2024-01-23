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
	<%!String checkBox(String[] hobby){
		String tag = "";
		String list[] = {"독서", "운동", "영화"};
		boolean flg = false;
		for(int i=0; i<list.length; i++){
			for(int j=0; j<hobby.length; j++){
				if(hobby[j] != null && hobby[j].equals(list[i])){
					flg = true;
				}
			}
			if(flg){
				tag += "<label><input type='checkbox' name='hobby' value='" + list[i] + "' checked>" + list[i] + "</label>";
			} else {
				tag += "<label><input type='checkbox' name='hobby' value='" + list[i] + "'>" + list[i] + "</label>";
			}
			flg = false;
		}
		return tag;
	}%>

	<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd").trim();
	String pwd2 = request.getParameter("pwd2").trim();
	String name = request.getParameter("name");

	String sql = "SELECT * FROM" + " TBL_MEMBER WHERE USERID = '" + id + "'";

	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String userId = rs.getString("USERID");
	String userName = rs.getString("USERNAME");
	String phone = rs.getString("PHONE");
	String phone1 = phone.substring(0, 3);
	String phone2 = phone.substring(3, 7);
	String phone3 = phone.substring(7, 11);
	String gender = rs.getString("GENDER");
	String hobby[] = {rs.getString("HOBBY1"), rs.getString("HOBBY2"), rs.getString("HOBBY3")};
	String comment = rs.getString("CMT");
	%>
	<%
	boolean isPasswordChange = (pwd != null && !pwd.isEmpty() && pwd.equals(pwd2));
	%>
	
	<%
	String sqlUpdate = "UPDATE TBL_MEMBER SET USERNAME = '" + name + "', ... "; // include other fields
    if (isPasswordChange) {
        sqlUpdate += ", PWD = '" + pwd + "' ";
    }
    sqlUpdate += " WHERE USERID = '" + id + "'";

    try {
        stmt.executeUpdate(sqlUpdate);
        // Redirect or notify the user of success
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle exceptions
    }
	%>

	<h3>정보수정</h3>
	<form action="loginView.jsp" name="join">
		<div>
			<span class="txt_input">아이디 : </span><input type="text" name="id"
				value="<%=userId%>" disabled>
		</div>
		<div>
			<span class="txt_input">비밀번호 : </span><input type="password"
				name="pwd">
		</div>
		<div>
			<span class="txt_input">비번확인 : </span><input type="password"
				name="pwd2">
		</div>
		<div>
			<span class="txt_input">이 름 : </span><input type="text" name="name"
				value="<%=userName%>">
		</div>

		<div>
			<span class="select_input">연락처 :</span> <select name="phone1">
				<%
				String arr[] = {"010", "011", "016", "017", "019"};
				for (int i = 0; i < arr.length; i++) {
					if (phone1.equals(arr[i])) {
						out.print("<option value='" + phone1 + "' selected>" + phone1 + "</option>");
					} else {
						out.print("<option value='" + arr[i] + "'>" + arr[i] + "</option>");
					}
				}
				%>
			</select> - <input type="text" maxlength="4" size="4" name="phone2"
				value=<%=phone2%>> - <input type="text" maxlength="4"
				size="4" name="phone3" value=<%=phone3%>>
		</div>
		<div>
			<span class="select_input">성 별 :</span>
			<%
			if (gender.equals("남성")) {
			%>
			<label><input type="radio" name="gender" value="남성" checked>남성
			</label> <label><input type="radio" name="gender" value="여성">여성
			</label>
			<%
			} else {
			%>
			<label><input type="radio" name="gender" value="남성">남성
			</label> <label><input type="radio" name="gender" value="여성" checked>여성
			</label>
			<%
			}
			%>

		</div>
		<div>
			<span class="select_input">취 미 :</span>

			<%
			out.println(checkBox(hobby));
			%>

		</div>
		<div>
			<textarea name="comment" cols="30"><%=comment%></textarea>
		</div>
		<div></div>

	</form>



</body>
</html>
<script>
	var join = 
</script>
<!-- 
1. '수정하기' 버튼 만든 후 클릭하면 데이터 수정.
(input에 있는 값으로 수정.-update)

2. 패스워드 값을 입력 안할 시 -> 패스워드 값을 그대로 유지
패스워드 값 입력 시 -> 두개 같은지 확인 후 수정-->
