<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.textbox {
	width: 70%;
	height: 51px;
	border: 1px solid #FF8C00;
	margin: 5px;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	font-size: 15px;
	border-radius: 40px;
}

.btn_login {
	width: 35%;
	height: 51px;
	background-color: #FF8C00; /* 배경색을 하얀색으로 변경 */
	color: white; /* 글씨색을 #FF8C00으로 변경 */
	font-size: 23px;
	margin-top: 40px;
	border-radius: 40px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<br>
	<form action="personalpwResult" method="post">
		<h4>이름을 입력하세요</h4>
		<input type="text" class="textbox" name="name" placeholder="이름">
		<h4>아이디를 입력하세요</h4>
		<input type="text" class="textbox" name="id" placeholder="아이디">
		<button class="btn_login" value="비밀번호 찾기 결과" type="submit">비밀번호
			찾기 결과</button>
	</form>
</body>
</html>