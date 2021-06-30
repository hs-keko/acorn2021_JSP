<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		FortuneServlet 이 오늘의 운세를 대신 응답해 달라고 하네 구찮게 시리
		그런데 오늘의 운세가 도대체 어디에 있지?
		내가 알아야 응답을 하지
		
		okay !
		request 영역에 "fortuneToday" 라는 키값으로 String type 을 담아 두었다고?
		알겠어! 잘 사용할게~
	*/
	String fortune = (String)request.getAttribute("fortuneToday");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/fortune.jsp</title>
</head>
<body>
	<p> 오늘의 운세 : <strong><%=fortune %></strong></p>
</body>
</html>