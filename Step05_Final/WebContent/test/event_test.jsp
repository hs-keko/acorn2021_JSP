<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/event_test.jsp</title>
</head>
<body>
<button id="activeBtn">이벤트 활성화 하기</button>
<button id="myBtn">눌러보셈</button>
<script>
	document.querySelector("#activeBtn")
		.addEventListener("click", function(){
			
			//id 가 myBtn 에 한번만 동작하는 이벤트 리스너 등록하기
			document.querySelector("#myBtn")
				.addEventListener("click", function(){
					alert("버튼을 눌렀네요?");
				}, {once:true});
			
		});
</script>
</body>
</html>





