<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 if((String)session.getAttribute("id")==null)
 {
	 response.sendRedirect("login.jsp");
 }
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원탈퇴 페이지</h1>
	<br>
	회원을 탈퇴하시겠습니까?
	<br>
	<form action="deleteprocess.jsp" method="post">
	비밀번호 <input type="password" name="pwd" placeholder="영문과 특수 문자를 표현한 최소 8자">
	<input type="submit" value="탈퇴">
	</form>
</body>
</html>