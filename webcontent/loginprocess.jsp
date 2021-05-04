<%@page import="co.kr.member.model.Membervo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.kr.member.model.memberdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <%
   String id= request.getParameter("id");
   String pwd= request.getParameter("pwd");
    memberdao dao=memberdao.getinstance();
  int check =dao.login(id, pwd);
if(check==1)
{
	Membervo m=dao.getinfor(id);
	session.setAttribute("id",m.getId());
response.sendRedirect("welcome.jsp");
	
}
else if(check==-1)
{
	out.print("비밀번호 틀렸습니다");
	
}
else
{
	out.print("아이디가 틀렸습니다");
}
  %>