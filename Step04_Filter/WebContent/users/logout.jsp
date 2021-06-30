<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("id");
	// 리다일렉트 이동 응답
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/index.jsp");
%>