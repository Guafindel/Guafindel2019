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
		<h1 class="display-6">loginForm</h1>
		<hr>

		<form action="memberLogin" method="post">

			<div class="form-group">
				<label for="uId">제목</label> <input type="text" class="form-control"
					id="uId" name="uId" placeholder="아이디를 입력하세요.">
			</div>
			<div class="form-group">
				<label for="uPw">비밀번호</label> <input type="password"
					class="form-control" id="uPw" name="uPw" placeholder="비밀번호를 입력하세요.">
			</div>

			<input type="submit" class="btn btn-primary" value="로그인">
		</form>

	</div>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>