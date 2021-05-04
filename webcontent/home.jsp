<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id=(String)session.getAttribute("id");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(id==null)
{
%>
<a href="singup.jsp">회원가입</a>
<a href="login.jsp">로그인</a>
<% 
}
else
{
%>
<a href="mypage.jsp">마이페이지</a>
<%
}
%>
</body>
</html>