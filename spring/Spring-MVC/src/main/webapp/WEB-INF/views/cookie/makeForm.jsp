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

	<form action="makeCookie">
		<div class="container">
		<h1 class="display-6">makeForm</h1>
		<hr>
			<div class="form-group">
				<label for="cName">쿠키이름</label> 
				<input type="text" class="form-control" id="cName" name="cName" placeholder="쿠키이름을 입력하세요.">
			</div>
			
			<div class="form-group">
				<label for="cValue">쿠키 저장 데이터</label> 
				<input type="text" class="form-control" id="cValue" name="cValue" placeholder="쿠키 저장 데이터를 입력하세요.">
			</div>
			
			<input type="submit" class="btn btn-primary" value="쿠키">
		</div>
	</form>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>