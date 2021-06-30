<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. ?num=   num 이라는 파라미터명으로 전달되는 문자열을 읽어와서 숫자로 바꾼다.
	int num=Integer.parseInt(request.getParameter("num"));
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.delete(num);
	
	// 2. 응답한다.
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
<div class="container">
	<%if(isSuccess){ %>
		<p>
			<strong><%=num %></strong> 번 회원의 의 정보를 삭제 했습니다.
			<br />
			<a href="list.jsp">리스트로 돌아가기</a>
			<br />
			<a href="insertform.jsp">회원 추가하러 가기</a>
			
		</p>
	
	<%}else{ %>
		<p>
			회원정보 삭제 실패!
			<a href="list.jsp">리스트로 돌아가기</a>
		</p>
	<%} %>
</div>


</body>
</html>