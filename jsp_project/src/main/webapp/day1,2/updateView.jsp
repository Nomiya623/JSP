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
	 <%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    boolean loginSuccess = false;

    // Direct SQL query without using PreparedStatement (Not recommended)
    String sql = "SELECT * FROM TBL_MEMBER WHERE USERID = '" + id + "'";
    ResultSet rs = stmt.executeQuery(sql);

    if (rs.next()) {
        String storedPwd = rs.getString("PWD");
        if (storedPwd != null && storedPwd.equals(pwd)) {
            out.println(id + "님 환영합니다");
            loginSuccess = true;
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("userId", id);
        } else {
            out.println("비밀번호 틀렸음");
            session.setAttribute("isLoggedIn", false);
        }
    } else {
        out.println("아이디가 없음");
        session.setAttribute("isLoggedIn", false);
    }
	
    /* 'id, pwd, pwd2, name, phone2, phone3, gender, hobby' db conn 데이터와 동일하지 않을 경우
    동일하지 않는 데이터를 유지'회원정부 수정' 페이지로 전송*/
    if (!loginSuccess) {
    	%>
    	    <form action="update.jsp" method="get">
    	        <input type="submit" value="회원정보 수정">
    	    </form>
    <%
        }
      %>
  
  // Check if the password fields are filled and match
    boolean isPasswordChange = (pwd != null && !pwd.isEmpty() && pwd.equals(pwd2));

    // Construct the SQL query
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
    // Close statement and other resources

</body>
</html>
