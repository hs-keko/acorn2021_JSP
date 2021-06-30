<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. form 전송되는 수정할 내용의 정보를 읽어온다.
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	// 할 일 정보를 TodoDto 객체에 담는다.
	TodoDto dto=new TodoDto();
	dto.setNum(num);
	dto.setContent(content);
	// 2. DB 에 수정 반영한다.
	boolean isSuccess=TodoDao.getInstance().update(dto);
	// 3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<%-- 클라이언트가 해석할 javascript 를 응답하고 싶으면 script 요소 안에 javascript 를 작성한다. --%>
		<script>
			alert("<%=num%> 번 할 일 정보를 수정 했습니다.");
			// javascript 로 페이지 이동을 시킬 수 있다.
			location.href="/Step02_DataBase/todo/list.jsp";
		</script>
	<%}else{ %>
		<p>
			할일 수정 실패 <a href="updateform.jsp?num=<%=num %>">다시 시도</a>
		</p>
	<%} %>
</body>
</html>