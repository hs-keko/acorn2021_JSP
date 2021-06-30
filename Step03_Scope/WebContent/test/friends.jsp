<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request 에 "names" 라는 키값으로 담긴 List<String> type 얻어내기
	List<String> names = (List<String>)request.getAttribute("names");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/friends.jsp</title>
</head>
<body>
<h1>친구 목록 입니다.</h1>
<ul>
	<%for(String tmp:names){%>
		<li>
			<%=tmp %>
		</li>
	<%} %>
</ul>
</body>
</html>