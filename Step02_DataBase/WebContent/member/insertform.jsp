<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
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
            <li class="breadcrumb-item active">회원 추가 폼</li>
        </ol>
     </nav>
    <div class="row">
    	<div class="col-md-6 offset-md-3">
			<form action="insert.jsp" method="post">
				<div class="mb-3">
					<label class="form-label" for="name">이름</label>
					<input class="form-control" type="text" name="name" id="name" />
				</div>
				<div class="mb-3">
					<label class="form-label" for="addr">주소</label>
					<input class="form-control" type="text" name="addr" id="addr" />
				</div>
				<button type="submit">추가</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>