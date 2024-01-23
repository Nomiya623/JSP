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
    String name = request.getParameter("name");
    String phone1 = request.getParameter("phone1");
    String phone2 = request.getParameter("phone2");
    String phone3 = request.getParameter("phone3");
    String gender = request.getParameter("gender");
    String[] hobbies = request.getParameterValues("hobby");
    String comment = request.getParameter("comment");
	/* 삼항연산자 */
    String phone = phone1 + "-" + phone2 + "-" + phone3;
    String hobby1 = hobbies.length > 0 ? hobbies[0] : "";
    String hobby2 = hobbies.length > 1 ? hobbies[1] : "";
    String hobby3 = hobbies.length > 2 ? hobbies[2] : "";
%>
<%
    
    String sql = "INSERT INTO TBL_MEMBER (userId, pwd, userName, phone, gender, hobby1, hobby2, hobby3, cmt) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, id);
    pstmt.setString(2, pwd);
    pstmt.setString(3, name);
    pstmt.setString(4, phone);
    pstmt.setString(5, gender);
    pstmt.setString(6, hobby1);
    pstmt.setString(7, hobby2);
    pstmt.setString(8, hobby3);
    pstmt.setString(9, comment);

    pstmt.executeUpdate();
%>

</body>
</html>
