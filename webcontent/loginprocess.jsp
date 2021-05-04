<%@page import="co.kr.member.model.Membervo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.kr.member.model.memberdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
   String id= request.getParameter("id");
   String pwd= request.getParameter("pwd");
   
    memberdao dao=memberdao.getinstance();
    
    String url=null;
    String messege=null;
  	int check =dao.login(id, pwd);
  
  
	if(check==1)
	{
		Membervo m=dao.getinfor(id);
		session.setAttribute("id",m.getId());
		session.setAttribute("pwd",m.getPwd());
		session.setAttribute("name",m.getName());
		session.setAttribute("email",m.getEmail());
		url="mypage.jsp";
		
	}
	else if(check==-1)
	{
%>
<script>
		alert("비밀번호가 틀렸습니다");
		history.back();
</script>
<%	
		url="login.jsp";
	}
	else
	{
%>
<script>
		alert("존재하지 않는 아이디 입니다");
		history.back();
</script>
<%
		url="login.jsp";
	}
	
	response.sendRedirect(url);
	

  %>