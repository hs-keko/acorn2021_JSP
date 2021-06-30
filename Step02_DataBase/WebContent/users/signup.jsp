<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// 한글 깨지지 않도록
	request.setCharacterEncoding("utf-8");
	// input type="text" name="nick" 에 입력한 문자열 읽어오기
	String nick=request.getParameter("nick");
	/*
	<label>
		<input type="radio" name="email" value="yes" checked/> 네
	</label>
	<label>
	   <input type="radio" name="email" value="no" /> 아니요
	</label>
	*/
	String email=request.getParameter("email");
	/*
	<select name="concern">
		<option value="">선택</option>
		<option value="game">게임</option>
		<option value="movie">영화</option>
		<option value="etc">기타</option>
	</select>
	*/
	String concern=request.getParameter("concern");
	/*
    <label>
       <input type="checkbox" name="language" value="Java"/> 자바
    </label>
    <label>
       <input type="checkbox" name="language" value="Python"/> 파이선
    </label>
    <label>
       <input type="checkbox" name="language" value="C++"/> C++
    </label>
 	*/
 	String[] language=request.getParameterValues("language");
 
	 /*
	    <textarea name="comment" cols="30" rows="10"></textarea>
	 */
 	String comment=request.getParameter("comment");

	System.out.println("nick:"+nick);
	System.out.println("email:"+email);
	System.out.println("concern:"+concern);
	// DB 에서 불러온 데이터라고 가정하자
	String data="";
	if(language != null){
		System.out.println("language.length:"+language.length);
		for(String tmp: language){
		      System.out.println(tmp);
		      data = data+tmp+"/";
		}
	}
	System.out.println("comment:"+comment);
%>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>가입 되었습니다.</h1>
	<h2>[가입된 정보]</h2>
	
		<div class="mb-3">
		<label for="nick" class="form-label">닉네임</label>
		<input class="form-control" id="nick" type="text" name="nick" value="<%=nick %>" /><br/>
		</div>
		
		<div class="mb-3">
			이메일 수신 여부
			<%if(email.equals("yes")){ %>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="email" value="yes" id="email1" checked>
				<label class="form-check-label" for="email1">
					네
				</label>
			</div>
			<div class="form-check">
	  			<input class="form-check-input" type="radio" name="email" value="no" id="email2">
	  			<label class="form-check-label" for="email2">
	    			아니요
	  			</label>
			</div>
			<%}else{ %>
			<div class="form-check">
				<input class="form-check-input" type="radio" name="email" value="yes" id="email1">
				<label class="form-check-label" for="email1">
					네
				</label>
			</div>
			<div class="form-check">
	  			<input class="form-check-input" type="radio" name="email" value="no" id="email2" checked>
	  			<label class="form-check-label" for="email2">
	    			아니요
	  			</label>
			</div>
			<%} %>
		</div>
		
		<div class="mb-3">
			관심사 
			<select class="form-select" aria-label="Default select example" name="concern">
  				<option value="" selected>선택하세요</option>
				<option value="game" <%=concern.equals("game") ? "selected" : "" %>>게임</option>
				<option value="movie" <%=concern.equals("movie") ? "selected" : "" %>>영화</option>
				<option value="etc" <%=concern.equals("etc") ? "selected" : "" %>>기타</option>
			</select>
		</div>

		<div class="mb-3">
			배우고 싶은 언어 체크
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="language" value="Java" id="language1" <%=data.contains("Java")?"checked":"" %>>
				<label class="form-check-label" for="language1">
					자바
				</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="language" value="Python" id="language2" <%=data.contains("Python")?"checked":"" %>>
				<label class="form-check-label" for="language2">
					파이썬
				</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="language" value="C++" id="language3" <%=data.contains("C++")?"checked":"" %>>
				<label class="form-check-label" for="language3">
					C++
				</label>
			</div>
		</div>
		
		<div class="mb-3">
  			<label for="comment" class="form-label">남기고 싶은 말</label>
  			<textarea class="form-control" cols="30" id="comment" rows="10" name="comment"><%=comment %></textarea>
		</div>
</div>
</body>
</html>