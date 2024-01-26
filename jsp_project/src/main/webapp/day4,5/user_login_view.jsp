<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 4. 5번이상 실패할 경우 그 이후에는 '로그인 5번 이상 실패! 관리자에게 문의하세요' 문구 출력
		후 
		4-1) 타이틀: 비밀번호 \n이상 실패한 아이디의 레코드만 
		-> '초기화' 버튼 활성화
	 	4-2) :'초기화' 버튼 클릭 시 -> cnt 0으로
		: 5번이상 실패한 유저는 그 이후 정상 입력 하더라도 로그인 불가하다록
		: 로그인 5번 미만 실패 후 로그인 성공했을 경우 
		
		8. 로그인 시
	-> 권한이 일반 유저 이면 -> user_login_view.jsp 로 이동
	-> 권한이 관리자이면 -> user_list.jsp로 이동
		-->
		
	
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		
		String sql 
			= "SELECT * FROM TBL_MEMBER "
			+ "WHERE USERID = '" 
			+ userId + "' AND PWD = '"
			+ pwd + "'";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			if(rs.getInt("CNT") >= 4){
				out.println("비밀번호 5번 이상 실패! 관리자 문의 하셈");
			} else {
				session.setAttribute("userId", rs.getString("USERID"));
				session.setAttribute("userName", rs.getString("USERNAME"));
				session.setAttribute("status", rs.getString("STATUS"));
				
				if(rs.getString("STATUS").equals("A")){
					response.sendRedirect("user_list.jsp");
				}
				out.println("로그인 성공!");
				sql = "UPDATE TBL_MEMBER SET "
						+ "CNT = 0 "
						+ "WHERE USERID = '" + userId + "'";
				stmt.executeUpdate(sql);
		%>
			<form name="userInfo" action="user_update.jsp">
				<div>
					<input name="userId" value="<%= userId %>" hidden>
					<input type="submit" value="게시판" formaction="board_list.jsp">
					<input type="submit" value="회원정보 수정" formaction="user_update.jsp">
					<input type="submit" value="회원 삭제" formaction="user_delete.jsp">
				</div>
			</form>
		<%
			}
		} else {		
			String idSql 
				= "SELECT * FROM TBL_MEMBER "
				+ "WHERE USERID = '" + userId + "'";
			ResultSet rsId = stmt.executeQuery(idSql);
			if(rsId.next()){
				// 1. 아이디는 있는데 패스워드가 다를 경우
				int cnt = rsId.getInt("CNT");
				if((cnt+1) >= 5){
					out.println("5번 이상 실패! 관리자 문의 하셈");
				} else {
					out.println((cnt+1) + "번 실패!");
					stmt.executeUpdate(
						"UPDATE TBL_MEMBER SET "
						+ "CNT = CNT+1 "
						+ "WHERE USERID = '" + userId + "'"
					);
				}
			} else {
				// 2. 아이디가 없는 경우
				out.println("아이디를 확인해주세요!");
			}
			
	%>
		<input type="button" value="되돌아가기" onclick="history.back()">
	<%
		}
	%>
</body>
</html>
<script>
	function btn(txt){
		var userInfo = document.userInfo;
		if(txt == "u"){
			userInfo.action = "user_update.jsp";
		} else {
			userInfo.action = "user_delete.jsp";
		}
		userInfo.submit();
	}
</script>