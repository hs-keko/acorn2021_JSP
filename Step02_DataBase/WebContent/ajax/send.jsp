<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// msg 라는 파라미터명으로 전달되는 문자열 읽어오기
	String msg=request.getParameter("msg");
	System.out.println(msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/send.jsp</title>
</head>
<body>
	<p>클라이언트야 전달한 메세지 잘 받았어!</p>
</body>
</html>