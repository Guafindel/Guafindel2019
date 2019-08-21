<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">

<title>Insert title here</title>

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일 링크 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 제이쿼리 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	
	<!-- 헤더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 헤더 끝 -->

	<!-- 네비 시작 -->
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<!-- 네비 끝 -->
	
	<!-- 컨텐츠 시작 -->
	<div class="container">
		<h1 class="display-6">list</h1>
		<hr>
		<table class="table" style="width: 100%">
			<thead class="thead-light">
				<tr>
					<td>Index</td>
					<td>ID</td>
					<td>Password</td>
					<td>Name</td>
					<td>Picture</td>
					<td>Edit</td>
					<td>Delete</td>
				</tr>
			</thead>
			<tbody id="list">
			
			</tbody>
		</table>
		
		<hr>
		<h1 class="display-6">회원 수정</h1>
		<hr>
		<div id="editbox">
			<form id="editForm">

				<div class="form-group">
				<input type="text" class="form-control" name="idx" id="idx" placeholder="Index" readonly>
				</div>
				<div class="form-group">
					<input type="text" name="gId" id="gId" class="form-control" placeholder="아이디" readonly>
				</div>
				<div class="form-group">
					<input type="text" name="gPw" id="gPw" class="form-control" placeholder="비밀번호" required>
				</div>
				<div class="form-group">
					<input type="text" name="gName" id="gName" class="form-control" placeholder="이름" required>
				</div>
				<input type="submit" class="btn btn-primary" value="수정">
			</form>
		</div>
	</div>
	<!-- 컨텐츠 끝 -->
	
	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->

	<script>
	
	 $(document).ready(function() {
		 
		 list();
		 
	 $('#editForm').submit(function(){
		 $.ajax({
			 url:'http://localhost:8080/gb/rest/members'+$('#idx').val(),
			 type:'PUT',
			 data:JSON.stringify({gId:$('#gId').val(), gPw:$('#gPw').val(), gName:$('#gName').val()}),
			 contentType:'application/json; charset=utf-8',
			 success:function(data) {
				 alert(data);
				 if(data=='success') {
					 alert('수정했습니다.');
					 list();
				 }
			 }
		 });
		 return false;
	 });
		 
	 });
	 
	 function edit(idx) {
		 $.ajax({
			 url:'http://localhost:8080/gb/rest/members/'+idx,
			 type:'GET',
			 success : function(data) {
				 $('#idx').val(idx);
				 $('#gId').val(data.gId);
				 $('#gPw').val(data.gPw);
				 $('#gName').val(data.gName);
			 }
		 });
	 }
	 
	 function del(idx) {
		 
		 if (confirm('삭제하시겠습니까?')) {
			 $.ajax({
				 url:'http://localhost:8080/gb/rest/members/'+idx,
				 type:'DELETE',
				 success:function(data) {
					 if(data == 'success') {
						 alert('삭제했습니다.')
						 list();
					 }
				 }
			 });
		 }
	 }
	 
	 function list() {
		 $.ajax({
			 url:'http://localhost:8080/gb/rest/members',
			 type : 'GET',
			 success : function(data) {
				 alert(JSON.stringify(data));
				 
				 var html = '';
				 
				 for (var i = 0; i<data.length; i++) {
					 html += '<tr>';
					 html += '<td>'+data[i].idx+'</td>';
					 html += '<td>'+data[i].gId+'</td>';
					 html += '<td>'+data[i].gPw+'</td>';
					 html += '<td>'+data[i].gName+'</td>';
					 html += '<td>'+data[i].gPhoto+'</td>';
					 html += '<td><button class="btn btn-primary" onclick="edit('+data[i].idx+')">수정하기</button></td>';
					 html += '<td><button class="btn btn-primary" onclick="del('+data[i].idx+')">삭제하기</button></td>';
				 	 html += '</tr>';
				 }
				 $('#list').html(html);
			 }
			 
		 });
	 }
	
	</script>

	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>