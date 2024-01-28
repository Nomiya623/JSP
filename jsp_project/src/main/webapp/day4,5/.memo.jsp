<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board List</title>
    <style>
        /* Add styles for table, etc. */
    </style>
</head>
<body>
    <%@ include file="dbconn.jsp"%>
    <%
        String sql = "SELECT * FROM TBL_BOARD"; // Replace TBL_BOARD with your actual board table name
        ResultSet rs = stmt.executeQuery(sql);
    %>
    <table>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Date</th>
            <th>Details</th>
        </tr>
        <%
            while (rs.next()) {
                String postId = rs.getString("POSTID"); // Assuming POSTID is a column in your board table
        %>
        <tr>
            <td><%= rs.getString("TITLE") %></td>
            <td><%= rs.getString("AUTHOR") %></td>
            <td><%= rs.getString("DATE") %></td>
            <td><a href="board_details.jsp?postId=<%= postId %>">View Details</a></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
  