<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/bootstrap/modal.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>모달 테스트</h1>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#msgModal">
	  Launch demo modal
	</button>

	<!-- Modal -->
	<div class="modal fade" id="msgModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input id="inputMsg" type="text" class="form-control" placeholder="메세지 입력..." />
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" id="saveBtn" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<script>
	// 저장 버튼을 눌렀을 때 실행할 함수 등록
	document.querySelector("#saveBtn").addEventListener("click",function(){
		let msg=document.querySelector("#inputMsg").value;
		console.log(msg+" 를 저장했습니다.");
		// 띄운 모달의 참조값 얻어와서
		let m = bootstrap.Modal.getInstance(document.querySelector("#msgModal"));
		// 숨기기
		m.hide();
	});
</script>
</body>
</html>