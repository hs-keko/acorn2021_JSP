<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 폼 전송되는 할 일의 내용과 날짜를 읽어온다.
	request.setCharacterEncoding("utf-8");
	String content=request.getParameter("content");
	// 내용과 날짜를 TodoDto 객체에 담는다.
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	// 2. DB 에 저장하고
	TodoDao dao=TodoDao.getInstance();
	// 작업의 성공여부를 리턴 받는다.
	boolean isSuccess=dao.insert(dto);
	// 3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
<div class="container">
	<%if(isSuccess){ %>
		<p>
			<strong>할 일 정보를 추가했습니다.</strong>
			<a href="list.jsp">확인</a>
		</p>
	<%}else{ %>
		<p>
			할 일 추가 실패!
			<a href="insertform.jsp">다시 작성</a>
		</p>
	<%} %>
</div>
</body>
</html>