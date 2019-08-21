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
	<div class="container">
		<h1 class="display-6">회원 리스트</h1>
		<hr>
		<table class="table" style="width: 100%">
			<thead class="thead-light">
				<tr>
					<th>Index</th>
					<th>ID</th>
					<th>Password</th>
					<th>Name</th>
					<th>Picture</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody id="memberList">

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
					<input type="text" name="mId" id="mId" class="form-control" placeholder="아이디" readonly>
				</div>
				<div class="form-group">
					<input type="text" name="mPw" id="mPw" class="form-control" placeholder="비밀번호" required>
				</div>
				<div class="form-group">
					<input type="text" name="mName" id="mName" class="form-control" placeholder="이름" required>
				</div>
				<input type="submit" class="btn btn-primary" value="수정">
			</form>
		</div>
	</div>


	<script>
		$(document).ready(function() {
			list();
			
		$('#editForm').submit(function(){
			
			$.ajax({
				url : 'http://localhost:8080/mm/rest/members/'+ $('#idx').val(),
				type : 'PUT',
				data : JSON.stringify({mId : $('#mId').val(), mPw : $('#mPw').val(), mName : $('#mName').val()}),
				contentType : 'application/json; charset=utf-8',
				success : function(data) {
					alert(data);
					if(data =='success') {
						alert('수정하였습니다.');
						list();
					}
				}
			
			});
			return false;
		});

		});
		
		function edit(idx) {
			
			$.ajax({
				
				url : 'http://localhost:8080/mm/rest/members/'+idx,
				type : 'GET',
				success : function(data) {
					$('#idx').val(idx);
					$('#mId').val(data.mId);
					$('#mPw').val(data.mPw);
					$('#mName').val(data.mName);
				}
			});
		}
		
		

		function del(idx) {

			if (confirm('삭제하시겠습니까?')) {

				$.ajax({
					url : 'http://localhost:8080/mm/rest/members/' + idx,
					type : 'DELETE',
					success : function(data) {
						if (data == 'success') {
							alert('삭제되었습니다.')
							list();
						}

					}
				});
			}

		}

		function list() {

			$.ajax({

				url : 'http://localhost:8080/mm/rest/members',
				type : 'GET',
				success : function(data) {
					//alert(JSON.stringify(data));
					var html = '';

					for (var i = 0; i < data.length; i++) {
						html += '<tr>';
						html += '<td>' + data[i].idx + '</td>';
						html += '<td>' + data[i].mId + '</td>';
						html += '<td>' + data[i].mPw + '</td>';
						html += '<td>' + data[i].mName + '</td>';
						html += '<td>' + data[i].mPhoto + '</td>';
						html += '<td><button class="btn btn-primary" onclick="del(' + data[i].idx
								+ ')">삭제하기</button></td>';
						html += '<td><button class="btn btn-primary" onclick="edit(' + data[i].idx
								+ ')">수정하기</button></td>';
						html += '</tr>';
					}

					$('#memberList').html(html);
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