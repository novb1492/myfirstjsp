<%@page import="co.kr.member.model.memberdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

request.setCharacterEncoding("utf-8");

String id=(String)session.getAttribute("id");
String spwd=(String)session.getAttribute("pwd");
String pwd=request.getParameter("pwd");

memberdao dao=memberdao.getinstance();
int rn=dao.login(id, pwd);

if(rn==1)
{
	rn=dao.delete(id);
	if(rn==1)
	{
		session.invalidate();
%>
	<script>
	alert("탈퇴 성공");
	location.href="home.jsp";
	</script>
<%		
	}
	else
	{
%>
	<script>
	alert("탈퇴 성공");
	location.href="home.jsp";
	</script>
<%
	}
}
%>