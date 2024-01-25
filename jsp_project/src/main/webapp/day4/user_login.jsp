<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
</head>
<body>
<!-- 3.user_login.jsp
		-> 아이디, 패스워드를입력 받아서
		버튼 클릭 시 user_login_view.jsp 로 이동
		
		3-1) 로그인 시
		-> 아이디는 정상입력 패스워드가 다를 경우
		-> '패스워드 입력 실패 n회' 문구 출력
		-> 5번이상 실패할 경유 그 이후에는
		-> '로그인 5번 이상 실패! 관리자에게 문의하세요' 문구 출력
		
		
		-->
		
	
    <h2>회원 로그인</h2>
  	<form action="user_login_view.jsp" method="post">
        <div>
            <span class="txt_input">아이디: </span>
            <input type="text" name="userId" required>
        </div>
        <div>
            <span class="txt_input">비밀번호: </span>
            <input type="password" name="pwd" required>
        </div>
       
        <div>
            <input type="submit" value="로그인">
        </div>
    </form>
</body>
</html>
