<%@page import="co.kr.member.model.memberdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id=(String)session.getAttribute("id");
String pwd=request.getParameter("pwd");
String newpwd=request.getParameter("newpwd");

 memberdao dao= memberdao.getinstance();
 
 if(dao.login(id,pwd)==1)
 {
 	int check=dao.updatepwd(id,newpwd);
 	
 	if(check==1)
 	{
%>
 	<script>
	alert("변경 완료");
	history.back();
	</script>
 		
<%
 	}
 }
 else
 {
%>
<script>
	alert("기존 비밀번호가 틀렸습니다");
	history.back();
</script>
<% 
 }
%>


