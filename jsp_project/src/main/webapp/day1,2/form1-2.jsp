<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    function check() {
        var form = document.forms["Login"];
        var id = form["id"].value;
        var pwd = form["pwd"].value;

        if (id == "" || pwd == ""){
            alert("아이디/패스워드 입력하세요");
            return false;
        }

        if (id == "test" && pwd == "1234"){
            alert("로그인 성공");
            return true;
        } else {
            alert("아이디/패스워드 입력하세요");
            return false;
        }
    }
</script>
</head>
<body>
    <form name="Login" action="formView1.jsp" method="post" onsubmit="return check()">
        <div>
            userId: <input type="text" name="id">
        </div>
        <div>
            password: <input type="password" name="pwd">
        </div>
       <div>
            <input type="submit" value="Login">
        </div>
    </form>
</body>
</html>
