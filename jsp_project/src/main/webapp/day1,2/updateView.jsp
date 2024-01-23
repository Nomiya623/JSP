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
	
    /* id, pwd db conn 데이터와 동일하지 않을 경우 '회원정부 수정' 페이지로 전송*/
    if (!loginSuccess) {
    	%>
    	    <form action="update.jsp" method="get">
    	        <input type="submit" value="회원정보 수정">
    	    </form>
    <%
        }
      %>
  
</body>
</html>
