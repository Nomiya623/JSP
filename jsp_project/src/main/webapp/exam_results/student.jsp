<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="dbconn.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>평균 점수 계산</title>
</head>
<body>
    <h1>학생 평균 점수</h1>
    <table border="1">
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>평균 점수</th>
        </tr>
        <%
           String sql = "SELECT s.STU_ID, s.STU_NAME, AVG(g.GRADE) AS AVG_GRADE " +
                        "FROM TBL_STULIST s " +
                        "JOIN TBL_GRADE g ON s.STU_ID = g.STU_ID " +
                        "GROUP BY s.STU_ID, s.STU_NAME " +
                        "ORDER BY AVG_GRADE DESC";
           ResultSet rs = stmt.executeQuery(sql);

           while (rs.next()) {
               String stuId = rs.getString("STU_ID");
               String stuName = rs.getString("STU_NAME");
               %>
               <tr>
                   <td><%= stuId %></td>
                   <td><a href="studentDetails.jsp?stuId=<%= stuId %>"><%= stuName %></a></td>
                   <td><%= rs.getDouble("AVG_GRADE") %></td>
               </tr>
               <%
           }
           
        %>
    </table>
    
    <form action="addStudent.jsp">
    	<input type= "submit" value ="학생추가">
    </form>
</body>
</html>
<script>
</script>