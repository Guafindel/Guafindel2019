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
	<div class="container-fluid">
		<h1 class="display-4">SignUp</h1>
		<hr>
		<br>
		<div class="row">
			<div class="col-sm-2">
				<a href="Form.jsp">홈</a>
			</div>
			<div class="col-sm-2">
				<a href="signForm.jsp">회원가입</a>
			</div>
			<div class="col-sm-2">
				<a href="#">로그인</a>
			</div>
			<div class="col-sm-2">
				<a href="userInfo.jsp">회원 목록</a>
			</div>
			<div class="col-sm-2">
				<a href="#">회원 상세정보</a>
			</div>
		</div>
		<br> <br>
		<h1 class="display-4">회원 가입</h1>
		<br>
		<form action="signInsert.jsp" method="post">
			<table>
				<tr>
					<td><input type="number" name="idx" placeholder="회원번호"
						maxlength="4" required></td>
				</tr>

				<tr>
					<td><input type="text" name="mId" placeholder="아이디" required></td>
				</tr>

				<tr>
					<td><input type="text" name="mPx" placeholder="비밀번호" required></td>
				</tr>

				<tr>
					<td><input type="text" name="mName" placeholder="이름" required></td>
				</tr>

				<tr>
					<td><input type="file" name="mPhoto"></td>
				</tr>

				<tr>
					<td><input type="submit" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</div>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>