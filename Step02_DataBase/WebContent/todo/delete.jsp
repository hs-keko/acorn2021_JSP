<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. ?num=   num 이라는 파라미터명으로 전달되는 문자열을 읽어와서 숫자로 바꾼다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 해당 정보를 삭제한다.
	TodoDao.getInstance().delete(num);
	//3. 클라이언트에게 특정 경로를 요청을 다시 하라고 응답한다 (리다일렉트 이동 응답)
	
	/*
		절대 경로를 이동할 때 필요한 context path 는 나중에 제거 되거나 변경될 예정이기 때문에
		HttpServletRequest 객체의 메소드를 이용해서 얻어와서 써야 한다.
	*/
	String cPath=request.getContextPath();
	
	//이동할 절대경로를 문자열로 전달하면 클라이언트 웹브라우저가 전달한 경로로 다시 요청을 한다.
	response.sendRedirect(cPath+"/todo/list.jsp");
%>
