<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div> 로그인 실패</div>
	<div><button onclick="back()">뒤돌아가기</button></div>
</body>
</html>
<script>
	function back(){
		/* windows.history.back(); */
		location.href("formView1.jsp");
	}
</script>