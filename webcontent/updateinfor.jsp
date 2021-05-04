<%@page import="co.kr.member.model.memberdao"%>
<%@page import="co.kr.member.model.Membervo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	String id=(String)session.getAttribute("id");
	if(id==null)
	{
		  response.sendRedirect("login.jsp");
	}
	memberdao dao=memberdao.getinstance();
	Membervo m=dao.getinfor((String)session.getAttribute("id"));


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보 변경 페이지</h1>
	<form action="updateinforprocess.jsp" method="post">
	아이디 <input  type="text" name="newid" id="user_id" value="<%=id%>">
	<br>
	이름 <input type="text" name="newname" value="<%=m.getName()%>">
	<br>
	이메일 <input type="email" name="newemail" value="<%=m.getEmail()%>">
	<br>
	<input type="submit" value="정보변경">
	</form>
	
	<a href="logout.jsp">로그아웃</a>
</body>
</html>