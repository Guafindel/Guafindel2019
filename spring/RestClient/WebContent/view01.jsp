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
		<h1 class="display-6">example class</h1>

		<form id="insertForm" method="post" class="was-validated">

			<div class="form-group">
				<label for="e_id">ID</label> <input class="form-control" type="text"
					placeholder="ID" name="e_id" id="e_id" required>
				<div class="valid-feedback">Good</div>
				<div class="invalid-feedback">plz fill this field</div>
			</div>

			<div class="form-group">
				<label for="e_content">Content</label> <input class="form-control"
					type="text" placeholder="Content" name="e_content" id="e_content"
					required>
				<div class="valid-feedback">Good</div>
				<div class="invalid-feedback">plz fill this field</div>
			</div>

			<div class="form-group">
				<label for="e_info">Content</label> <input class="form-control"
					type="text" placeholder="Info" name="e_info" id="e_info" required>
				<div class="valid-feedback">Good</div>
				<div class="invalid-feedback">plz fill this field</div>
			</div>

			<input type="submit" class="btn btn-success" value="Submit">

		</form>
	</div>



	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {

			$('#insertForm').submit(function() {

				alert($('#insertForm').serialize());

				$.ajax({
					url : 'http://localhost:8080/event/events/board',
					type : 'POST',
					data : $('#insertForm').serialize(),
					success : function(data) {
						alert(data);
					}

				});

				return false;

			});

		});
	</script>


</body>
<!-- 바디 끝 -->

</html>