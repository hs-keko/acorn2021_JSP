<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/bootstrap/helper.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>helper 클래스 테스트</h1>
	
	<h2>clearfix</h2>
	<div class="bg-info clearfix">
			<button id="one" class="btn btn-secondary float-start">왼쪽 버튼</button>
			<button id="two" class="btn btn-secondary float-end">오른쪽 버튼</button>
	</div>
	<p class="bg-warning">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorem quia a ipsa deleniti fugit consequatur inventore aut nobis cum voluptate vel quos sapiente assumenda repudiandae in at distinctio illum suscipit.</p>
	
	<h2>color link</h2>
	<a href="#" class="link-primary">Primary link</a>
	<a href="#" class="link-secondary">Secondary link</a>
	<a href="#" class="link-success">Success link</a>
	<a href="#" class="link-danger">Danger link</a>
	<a href="#" class="link-warning">Warning link</a>
	<a href="#" class="link-info">Info link</a>
	<a href="#" class="link-light">Light link</a>
	<a href="#" class="link-dark">Dark link</a>
	
   	<h2>ratio</h2>
  	<div class="row">
		<div class="col">
			<div class="ratio ratio-16x9">
				<iframe src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" title="YouTube video" allowfullscreen></iframe>
         	</div>
      	</div>
      	<div class="col">
        	<div class="ratio ratio-16x9">
              	<iframe src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" title="YouTube video" allowfullscreen></iframe>
         	</div>
      	</div>
	</div>
	
	<div class="fixed-top bg-dark p-3 text-white">fixed-top</div>
	<div class="fixed-bottom bg-dark p-3 text-white">fixed-top</div>
	<img class="sticky-top" src="../images/1.jpg"/>
	
	<button class="btn btn-primary">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
			<path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"/>
		</svg>
		<span class="visually-hidden">추가</span>
	</button>
	
	<div class="bg-secondary" style="height: 1000px;"></div>

</div>
</body>
</html>