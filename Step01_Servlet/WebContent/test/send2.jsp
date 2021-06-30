<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//문자열 추출하기 전에 한글 깨지지 않도록 인코딩 설정하기
	request.setCharacterEncoding("utf-8");

	String str=request.getParameter("msg");
	System.out.println("전송된 문자열:"+str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/send2.jsp</title>
</head>
<body>
	<p>전송한 문자열</p>
	<p><strong><%=str %></strong> 이 내용이 맞죠?</p>
</body>
</html>