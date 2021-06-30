<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test07.jsp</title>
</head>
<body>
	<script>
		console.log("Promise 시작");
		new Promise(function(resolve, reject){
			console.log("1 단계 수행함");	
			let isGo=confirm("다음 단계로 넘어 갈까요?");
			if(isGo){
				resolve();
			}else{
				reject();
			}
		}).then(function(){
			console.log("2 단계 수행함");
			// 또 다른 작업을 Promise 로 시작하고 싶으면 Promise 객체를
			// 리턴해주면 된다.
			return new Promise(function(resolve,reject){
				let isGo=confirm("다음 단계로 넘어 갈까요?");
				if(isGo){
					resolve();
				}else{
					reject();
				}
			});
		}).then(function(){
			console.log("3 단계 수행함");
		}).catch(function(){
			console.log("작업이 종료 되었습니다.");
		});
		console.log("Promise 시작 후 다른 작업을 합니다.");
	</script>
</body>
</html>