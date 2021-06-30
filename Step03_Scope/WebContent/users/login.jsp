<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	// jsp 에서는 session 이 기본 객체이기 때문에 바로 사용 가능
	session.setAttribute("id",id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<p><strong><%=id %></strong> 님 로그인 됨.</p>
	<a href="../index.jsp">인덱스로 가기</a>
</body>
</html>