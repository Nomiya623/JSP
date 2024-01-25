<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User List</title>
    <!-- Your existing styles -->
    <style>
        /* Your existing styles */
        .deleteButton {
            background-color: #f44336; /* Red */
            /* Other styles similar to .editButton */
        }
    </style>
</head>
<body>
    <%@ include file="dbconn.jsp"%>
    <%
        String sql = "SELECT * FROM TBL_MEMBER";
        ResultSet rs = stmt.executeQuery(sql);
    %>
    <table border="1">
        <!-- Table headers -->
        <tr>
            <!-- Your existing headers -->
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <!-- Table body -->
        <%
            while (rs.next()) {
        %>
        <tr>
            <!-- Your existing data cells -->
            <td>
                <input type="button" onclick="userUpdate('<%= rs.getString("USERID") %>')" class="editButton" value="수정">
            </td>
            <td>
                <input type="button" onclick="userDelete('<%= rs.getString("USERID") %>')" class="deleteButton" value="삭제">
            </td>
        </tr>
        <%
            }
        %>
    </table>

    <script>
        function userUpdate(userId) {
            location.href = "user_update.jsp?userId=" + userId;
        }
        function userDelete(userId) {
            location.href = "user_delete.jsp?userId=" + userId;
        }
    </script>
</body>
</html>
