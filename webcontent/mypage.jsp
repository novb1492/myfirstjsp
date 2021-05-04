<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id=(String)session.getAttribute("id");
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
	<h1>마이페이지</h1>
	<a href="updateinfor.jsp">회원정보변경</a>
	<a href="updatepassword.jsp">비밀번호변경</a>
	<br>
	<a href="logout.jsp">로그아웃</a>
</body>
</html>