<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User update</title>
</head>
<body>
	<!-- 6.  user_update.jsp
	-> 전달받은 아이디를 통해서 회원정보 db 검색
	아이디 => 검색결과 아이디 넣은 후 disabled
	패스워드 => 빈 값
	이름 => 검색결과 값 input 에 넣기
	(화면은 user_joisn.jsp와 동일)
	-->
	<!-- 7.수정하기 버튼 클릭 시 user_update_result.jsp로 이동 
		-> 패스워드나 이름 수정 시 수정된 데이터로 업데이트
	-->
	<!-- 수정
	1.회원가입 시 성별을 입력받도록 수정
	2.패스워드 빈값일때는 수정안하기
	-->
	<h3>회원정보 수정</h3>
	<%@ include file="dbconn.jsp"%>
	<%
	String userId = request.getParameter("userId");

	String sql = "SELECT * FROM TBL_MEMBER WHERE USERID = '" + userId + "'";
	ResultSet rs = stmt.executeQuery(sql);
	String userName = "";
	if (rs.next()) {
		userName = rs.getString("USERNAME");

	}
	%>
	
	<form action="user_update_result.jsp" method="post">
		<div>
			<span class="txt_input">아이디 : </span> <input type="text"
				name="userId" value="<%=userId%>"> <input type="hidden"
				name="userId" value="<%=userId%>">
		</div>
		<div>
			<span class="txt_input">비밀번호 : </span> <input type="password"
				name="pwd">
		</div>
		
		<div>
			<span class="txt_input">이 름 : </span> <input type="text"
				name="userName" value="<%=userName%>">
		</div>
		<%
		if (rs.getString("gender").equals("남성")) {
		%>
		<label> <input type="radio" name="gender" value="남성" >남성
		</label> <label> <input type="radio" name="gender" value="여성">여성
		</label>
		<%
		} else {
		%>
		<label> <input type="radio" name="gender" value="남성" >남성
		</label> <label> <input type="radio" name="gender" value="여성">여성
		</label>
		<%
		}
		%>
		
		<div>
			<input type="submit" value="수정하기">
		</div>
	</form>

	
	
</body>
</html>