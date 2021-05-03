<%@page import="co.kr.member.model.memberdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="co.kr.member.model.Membervo" scope="request"></jsp:useBean>
<jsp:setProperty  name="user" property="*"/>

<%
memberdao dao= memberdao.getinstance();
int  rn=dao.insert(user);
if(rn==1)
{
	out.print("s");
}
else 
{
	out.print("n");
}
%>