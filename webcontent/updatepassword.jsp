<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
  String id=(String)session.getAttribute("id");
  String pwd=(String)session.getAttribute("pwd");
  String name=(String)session.getAttribute("name");
  String email=(String)session.getAttribute("email");
  if(id==null)
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
<h1>비밀번호 변경</h1>
<br>
<form action="mypageprocess.jsp">
현재 비밀번호 :<input type="password" name="pwd" value="">
<br>
새로운 비밀번호 :<input type="password" name="newpwd" value="">
<br>
<input type="submit" value="비밀번호 정보변경">
</form>
<br>
<form action="logout.jsp">
<input type="submit" value="로그아웃">
</form>
</body>
</html>