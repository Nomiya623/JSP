<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User join</title>
</head>
<body>
	<!-- 1.user_join.jsp
-> 아이디, 패스워드, 이름 입력 후 가입 버튼 클릭 시 user_join_save.jsp 로 이동 
preparedStatetement 아닌 Statement stmt 로 출력;

2. user_join_save.jsp
-> 입력받은 3개의 데이터를 db에 저장
(TBL_MEMBER, 3개의 컬럼만 저장
-->
	<h2>회원가입</h2>
	<form action="user_join_save.jsp" name="join" method="post">
		<div>
			<span class="txt_input">아이디 : </span><input type="text" name="userId">
			<input type="button" value="중복검사">
		</div>
		<div>
			<span class="txt_input">비밀번호 : </span><input type="password"
				name="pwd">
		</div>
		<div>
			<span class="txt_input">이 름 : </span><input type="text"
				name="userName">
		</div>
		<!-- <!-- 성별 추가 -->
		<div>
			<span class="txt_input">성별 :</span>
			<label> <input type = "radio" name = "gender" value= "남성" checked>남성</label>
			<label> <input type = "radio" name = "gender" value= "여성" >여성</label>
		</div>
		<div>
			<input type="submit" value="가입">
		</div>
	</form>
</body>
</html>

