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
		-> 5번이상 실패할 경우 그 이후에는
		-> '로그인 5번 이상 실패! 관리자에게 문의하세요' 문구 출력
		
		->4. 5번이상 실패할 경우 그 이후에는 '로그인 5번 이상 실패! 관리자에게 문의하세요' 문구 출력
		후 
		4-1) 타이틀: 비밀번호 \n이상 실패한 아이디의 레코드만 
		-> '초기화' 버튼 활성화
	 	4-2) :'초기화' 버튼 클릭 시 -> cnt 0으로
		: 5번이상 실패한 유저는 그 이후 정상 입력 하더라도 로그인 불가하다록
		: 로그인 5번 미만 실패 후 로그인 성공했을 경우
		
		5.
		5-1) 로그인 시 '게시판 버튼' 추가
		-> 클릭 시 board_list.jsp 페이지로 이동
		5-2) board_list.jsp
		-> 게시글 목록을 출력 (테이블 형태)
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
