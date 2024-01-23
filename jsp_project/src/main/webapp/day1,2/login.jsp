<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<%
	session.setAttribute("isLoggedIn", false);
	%>
	<form action="updateView.jsp" name="join" method="post">
		<div>
			<label>아이디: <input type="text" name="id"></label>
		</div>
		<div>
			<label>패스워드: <input type="password" name="pwd"></label>
		</div>
		<div>
			<input type="submit" value="로그인">
		</div>
	</form>
</body>
</html>
<!-- 1. 아이디사 없을 경우-> '아이디가 없음' 문구 출력
2. 아이디는 있는데 비밀번호 없는 경우 -> '비밀번호 틀렸음' 문구 출력
3. 로그인 성공 시 -> ''id'님 환영합니다' 문구 출력
4.'로그인' 성공했을 때만 '회원정보 수정' 버튼 보이기, 로그인 실패시 '회원정보 수정' 버튼 안보이기
 -->