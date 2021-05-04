<%@page import="co.kr.member.model.memberdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="co.kr.member.model.Membervo" scope="request"></jsp:useBean>
<jsp:setProperty  name="user" property="*"/>

<%
request.setCharacterEncoding("utf-8");

memberdao dao= memberdao.getinstance();

int  rn=dao.sinup(user);

if(rn==1)
{
%>
<script>
alert("회원가입 성공");
location.href="login.jsp";
</script>

<%
}
else 
{%>
	<script>
	alert("회원가입 실패");
	location.href="singup.jsp";
	</script>
<%}
%>