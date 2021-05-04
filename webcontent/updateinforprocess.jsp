
<%@page import="co.kr.member.model.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

String id=(String)session.getAttribute("id");
String newid=request.getParameter("newid");
String newname=request.getParameter("newname");
String newemail=request.getParameter("newemail");

memberdao dao=memberdao.getinstance();
Membervo mem=new Membervo();

int rn=dao.updateinfor(id, mem);

out.print(rn);

%>