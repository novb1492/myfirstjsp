<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 페이지</h1>

	<form action="loginprocess.jsp">
	아이디 <input  type="text" name="id" id="user_id" placeholder="아이디를 입력해주세요">
	<br>
	비밀번호 <input type="password" name="pwd" placeholder="영문과 특수 문자를 표현한 최소 8자">
	<br>
	<input type="submit">
	</form>
</body>
</html>