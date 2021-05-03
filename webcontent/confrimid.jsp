<%@page import="co.kr.member.model.memberdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String uid=request.getParameter("id");

	memberdao dao= memberdao.getinstance();
	
	boolean check= dao.confirmid(uid);
	if(check)
	{
%>
	<script>
		alert('아이디가 중복됨');
		history.back();
	</script>		
<%
	}
	else
	{
%>
	<script>
		alert('아이디 사용가능');
		history.back();
	</script>	
<%		
	}
%>