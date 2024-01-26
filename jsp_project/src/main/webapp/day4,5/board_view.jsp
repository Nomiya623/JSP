<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board Details</title>
    <style>
        table {
            border-collapse: collapse;
            width: 75%;
            margin: auto;
        }
        tr, td, th {
            border: 1px solid black;
            padding: 5px 10px;
            text-align: center;
        }
        th {
            background-color: #eee;
        }
        .deleteButton, .updateButton {
            background-color: #f44336; /* Red */
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .deleteButton:hover {
            background-color: #d32f2f; /* Darker Red */
        }
        .updateButton {
            background-color: #4CAF50; /* Green */
        }
    </style>
</head>
<body>
    <%@ include file="dbconn.jsp"%>
    <%
        String boardNo = request.getParameter("boardNo");
        String sessionId = (String) session.getAttribute("userId");
        String sessionStatus = (String) session.getAttribute("status");

     
        String updateSql = "UPDATE TBL_BOARD SET HIT = HIT + 1 WHERE BOARDNO = ?";
        PreparedStatement updateStmt = conn.prepareStatement(updateSql);
        updateStmt.setString(1, boardNo);
        updateStmt.executeUpdate();

      
        String selectSql = "SELECT BOARDNO, TITLE, CONTENTS, B.USERID, USERNAME, HIT, "
                + "TO_CHAR(CDATETIME, 'YY/MM/DD HH24:MI') AS CDATETIME, "
                + "TO_CHAR(UDATETIME, 'YY/MM/DD HH24:MI') AS UDATETIME "
                + "FROM TBL_BOARD B INNER JOIN TBL_MEMBER M ON B.USERID = M.USERID " 
                + "WHERE BOARDNO = ?";
        PreparedStatement selectStmt = conn.prepareStatement(selectSql);
        selectStmt.setString(1, boardNo);
        ResultSet rs = selectStmt.executeQuery();

        if (rs.next()) {
    %>
    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>작성날짜</th>
            <th>수정날짜</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <%
            while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("BOARDNO") %></td>
            <td><a href="board_view.jsp?boardNo=<%= rs.getString("BOARDNO") %>"><%= rs.getString("TITLE") %></a></td>
            <td><%= rs.getString("USERNAME") %></td>
            <td><%= rs.getString("HIT") %></td>
            <td><%= rs.getString("CDATETIME") %></td>
            <td><%= rs.getString("UDATETIME") %></td>
            <td>
                <button onclick="boardUpdate('<%=rs.getString("BOARDNO") %>')" class="updateButton">수정</button>
            </td>
            <td>
                <button onclick="boardDelete('<%=rs.getString("BOARDNO") %>')" class="deleteButton">삭제</button>
            </td>
            
        </tr>
        <%
            }
        %>
    </table>
    <%
        } else {
            out.println("게시글이 존재하지 않습니다.");
        }
    %>
</body>
</html>
<script>
    function boardDelete(boardNo) {
        if (confirm('삭제하시겠습니까?')) {
            location.href = "board_delete.jsp?boardNo=" + boardNo;
        }
    }
    function boardUpdate(boardNo) {
		if (confirm('수정하시겠습니까?')) {
        location.href = "board_update.jsp?boardNo=" + boardNo;
    }
</script>
