<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입</title>
<style>
body {
	background-color: #1e1e1e;
	color: #f1f1f1;
	font-family: Arial, sans-serif;
}

div {
	margin: 5px 0px;
}

.txt_input, .select_input {
	width: 80px;
	display: inline-block;
	color: #f1f1f1;
}

input[type=text], input[type=password], select, textarea {
	background-color: #333333;
	color: #f1f1f1;
	border: 1px solid #444444;
	padding: 5px;
}

input[type=button], input[type=submit], input[type=reset] {
	background-color: #4a76a8;
	color: #ffffff;
	border: none;
	padding: 10px 15px;
	margin: 5px 0;
	cursor: pointer;
}

input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover
	{
	background-color: #3a5a78;
}

label {
	color: #f1f1f1;
}

textarea {
	resize: vertical;
}
</style>
</head>
<body>
	<h3>회원가입</h3>
	<form action="updateView.jsp" name="join" method="post"
		onsubmit="return validateForm()">
		<div>
			<span class="txt_input">아이디 : </span><input type="text" name="id">
			<input type="button" value="중복검사">
		</div>
		<div>
			<span class="txt_input">비밀번호 : </span><input type="password"
				name="pwd">
		</div>
		<div>
			<span class="txt_input">비밀번호 확인 : </span><input type="password"
				name="pwd2">
		</div>
		<div>
			<span class="txt_input">이 름 : </span><input type="text" name="name">
		</div>

		<div>
			<span class="select_input">연락처 :</span> <select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - <input type="text" maxlength="4" size="4" name="phone2"> -
			<input type="text" maxlength="4" size="4" name="phone3">
		</div>
		<div>
			<span class="select_input">성 별 :</span> <label><input
				type="radio" name="gender" value="남성" checked>남성 </label> <label><input
				type="radio" name="gender" value="여성">여성 </label>
		</div>
		<div>
			<span class="select_input">취 미 :</span> <label><input
				type="checkbox" name="hobby" value="독서" checked>독서</label> <label><input
				type="checkbox" name="hobby" value="운동"> 운동</label> <label><input
				type="checkbox" name="hobby" value="영화"> 영화</label>
		</div>
		<div>
			<textarea name="comment" cols="30" placeholder="가입인사를 입력해주세요.">
            </textarea>
		</div>
		<div>
			<input type="submit" value="가입하기"> <input type="reset"
				value="다시쓰기">
		</div>
	</form>
	<!--  <form action="updateView.jsp" name="join" method="post">
        <div>
            <label>아이디: <input type="text" name="id"></label>
        </div>
        <div>
            <label>패스워드: <input type="password" name="pwd"></label>
        </div>
        <div>
            <input type="submit" value="회원정보 수정">
        </div>
    </form> -->
</body>
</html>

<!-- JAVASCRIPT 제어 추가
js 정규식 영어+숫자 구글링
1)아이디: 5글자 이상 +영어, 숫자 조합
2)패스워드: 6글자이상 +두개 '비밀번호', '비밀번호 확인' 같아야 함
3) 그외에 빈값이 있으면  가입 불가 -->



<script>
/* var join = document.join;
function check(){
	const regType = /^[a-zA-Z0-9]*$/;	
	let data = join.id.value;
	if (!regType.test(data)) {
		$("#idRequired").html("아이디가 조건에 맞지 않습니다"); //별도로 만든 유효성 HTML 구문
		alert("아이디가 조건에 맞지 않습니다");
		return;
	}else{
	...
	};
}
 */
 

	function validateForm(){
		var id = document.forms["join"]["id"].value;
		var pwd =  document.forms["join"]["pwd"].value;
		var pwd =  document.forms["join"]["pwd2"].value;
		var name =  document.forms["join"]["name"].value;
		var phone2 =  document.forms["join"]["phone2"].value;
		var phone3 =  document.forms["join"]["phone3"].value;
		var comment =  document.forms["join"]["comment"].value;
		
		if (id.length < 5 || !/^[A-Za-z0-9]+$/.test(id)) {
            alert("아이디는 5글자 이상의 영어, 숫자 조합이어야 합니다.");
            return false;
        }
		if(pwd.lenght < 6 ){
			alert("비밀번호 6글자 이상이어야 합니다.");
			return false;
			}
		if(pwd !== pwd2){
			alert("비밀번호 일치하지 않습니다.");
			return false;
		}
		if(name == "" || phone2 == "" || phone3 == "" || comment == ""){
			alert("모든 필드를 채워주세요.");
			return false;
		}
		return true;
	}
</script>
