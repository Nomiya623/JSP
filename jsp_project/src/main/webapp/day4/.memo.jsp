<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login View</title>
<style>
    body {
        background-color: #121212;
        color: #fff;
        font-family: Arial, sans-serif;
    }
    .center-text {
        text-align: center;
        font-weight: bold;
        font-size: 1.2em;
    }
</style>
</head>
<body>
    <%@ include file="dbconn.jsp"%>
    <%
    String userId = request.getParameter("userId");
    String pwd = request.getParameter("pwd");

    HttpSession session = request.getSession();
    Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
    if (loginAttempts == null) {
        loginAttempts = 0;
    }

    String sql = "SELECT * FROM TBL_MEMBER WHERE USERID = '" + userId + "' AND PWD = '" + pwd + "'";
    ResultSet rs = stmt.executeQuery(sql);

    if (rs.next()) {
        session.setAttribute("loginAttempts", 0); // Reset login attempts
        out.println(userId + "님 로그인 성공");

        // Display buttons for user info update and delete
        // ...
    } else {
        loginAttempts++;
        session.setAttribute("loginAttempts", loginAttempts);
        if (loginAttempts >= 5) {
            out.println("<div class='center-text'>로그인 5번 이상 실패! 관리자에게 문의하세요</div>");
        } else {
            out.println("패스워드 입력 실패 " + loginAttempts + "회");
        }
    %>
        <input type="button" value="뒤돌아가기" onclick="history.back()">
    <%
    }
    %>
</body>
</html>
