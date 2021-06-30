<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 요청 파라미터로 전달되는 수정할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	// 2. 번호에 해당하는 회원의 정보를 얻어온다. (MemberDto)
	MemberDao dao=MemberDao.getInstance();
	MemberDto dto=dao.getData(num);
	// 3. 수정할 양식 (form) 을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<%--
	포함시킬 jsp 위치를 상대 경로로 지정한다.
 --%>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="member" name="thisPage"/>
</jsp:include>
<div class="container">
	<nav aria-label="breadcrumb">
      	<ol class="breadcrumb">
        	<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/">Home</a></li>
            <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/member/list.jsp">회원목록</a></li>
            <li class="breadcrumb-item active">회원수정</li>
        </ol>
    </nav>
	<h1 class="title">회원정보 수정 폼</h1>
	<form action="update.jsp" method="post">
		<!-- 수정할 때 번호도 필요하기 때문에 input type="hidden" 으로 전송되도록 한다. -->
		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<div class="mb-3">
			<label class="form-label" for="num">번호</label>
			<%-- input 요소에 disabled 속성을 추가하면 수정도 불가하고 전송도 안된다. --%>
			<input class="form-control" type="text" name="num" id="num" value="<%=dto.getNum() %>" disabled />
		</div>
		<div class="mb-3">
			<label class="form-label" for="name">이름</label>
			<input class="form-control" type="text" name="name" id="name" value="<%=dto.getName() %>" />
		</div>
		<div class="mb-3">
			<label class="form-label" for="addr">주소</label>
			<input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr() %>" />
		</div>
		<button type="submit" class="btn btn-outline-primary">수정확인</button>
		<button type="reset" class="btn btn-outline-warning">취소</button>
	</form>
</div>
</body>
</html>