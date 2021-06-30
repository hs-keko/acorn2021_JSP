<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 여기는 Servlet 의 service() 메소드 안쪽이라고 생각하면 된다!
	
	request.setCharacterEncoding("utf-8");
	
	// GET 방식 전송된 파라미터 추출하기
	int itemNum=Integer.parseInt(request.getParameter("num"));
	String itemType=request.getParameter("type");

	// 추출된 내용을 콘솔창에 출력해보기
	System.out.println("전송된 상품번호:"+itemNum);
	System.out.println("전송된 타입:"+itemType);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title>
</head>
<body>
	<p>주문 완료</p>
	<p>구매한 상품번호 : <strong><%=itemNum %></strong></p>
	<p>구매한 상품타입 : </strong><%=itemType %></strong></p>
	
	<script>
		alert("<%=itemNum %> 번 상품 구매에 성공했습니다.");
	</script>
</body>
</html>