<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Join Page</title>
<!-- 1. user_join.jsp
 -> 아이디, 패스워드, 이름, 성별(라디오 버튼) 입력 후 
     가입 버튼 클릭 시 user_join_save.jsp 로 이동
2. user_join_save.jsp
 -> 입력받은 3개의 데이터를 db에 저장
     (TBL_MEMBER, 3개의 컬럼만 저장)
3. user_login.jsp
 -> 아이디 , 패스워드를 입력받아서 
      버튼 클릭 시 user_login_view.jsp 로 이동
4. user_login_view.jsp 
 -> 전달받은 아이디/패스워드와 동일한 데이터가 
     db에 있으면 "로그인 성공", 없으면 "로그인 실패"
     메시지 화면에 출력
5. "로그인 성공" 메시지 아래에 "회원정보 수정" 
    버튼 생성. 버튼 클릭 시 user_update.jsp 로 이동
6. user_update.jsp
 -> 전달받은 id를 통해서 회원정보 db 검색
     아이디 => 검색결과 id 넣은 후 disabled
     패스워드 => 빈 값
     이름 => 검색결과 값 input 에 넣기
  (화면 구성은 user_join.jsp 와 동일)
7. 수정하기 버튼 클릭 시 user_update_result.jsp 이동
 -> 패스워드나 이름 수정 시 수정된 데이터로 업데이트
 -> 패스워드 빈값일때는 패스워드 수정 x

8. 로그인 성공 시 "회원정보 수정" 버튼 옆에
    "회원 삭제" 버튼 생성 후 버튼 클릭 시 
   해당 아이디를 가진 레코드를 db에서 삭제 -->
</head>
<body>
	<h2>회원가입</h2>
	<form action="user_join_save.jsp" name="join" method="post">
		<div>
			<span class="txt_input">아이디 : </span> <input type="text"
				name= "userId">
		</div>
		<div>
			<span class="txt_input">비밀번호 : </span> <input type="password"
				name="pwd">
		</div>
		<div>
			<span class="txt_input">이름 : </span> <input type="text"
				name="userName">
		</div>
		<div>
			<span class="txt_input">성별 :</span> 
			<label> <input type="radio" name="gender" value="남성" checked>남성</label> 
			<label> <input type="radio" name="gender" value="여성">여성</label>
		</div>
		<div>
			<input type = "submit" value= "가입">
		</div>
	</form>
</body>
</html>