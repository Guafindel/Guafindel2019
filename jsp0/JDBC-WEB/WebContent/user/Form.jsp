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
				<a href="Form.jsp">홈 </a>
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
		<br>
		<h1 class="display-4">홈</h1>
		<br>
		<h1>두 개의 불균등한 반응 형 컬럼</h1>
		<p>제대로 확인하려면 브라우저 창 크기를 조정해보자.</p>
		<p>화면의 너비가 576px 미만일 경우 열이 자동으로 서로 쌓이게 된다.</p>
		<div class="row">
			<div class="col-sm-4" style="background-color: pink;">.col-sm-4</div>
			<div class="col-sm-8" style="background-color: blue;">.col-sm-8</div>
		</div>
		<h1>3개의 같은 너비를 지닌 컬럼</h1>
		<p>여기서 class="col"을 가지는 새 div를 추가하면 네 개의 같은 너비를 지닌 열이 만들어진다.</p>
		<p>반응형 컬럼이 아니기 때문에 브라우저 크기를 조정해도 형태가 바뀌지 않는다.</p>
		<div class="row">
			<div class="col" style="background-color: orange;">.col</div>
			<div class="col" style="background-color: lavender;">.col</div>
			<div class="col" style="background-color: orange;">.col</div>
			<div class="col" style="background-color: lavender;">.col</div>
		</div>
		<h1>네 개의 균등한 너비를 지닌 반응형 컬럼</h1>
		<p>반응형 컬럼이기때문에 브라우저 크기를 바꿔서 확인해보자.</p>
		<p>576px미만일 경우 열은 자동으로 서로 쌓이게 된다.</p>
		<div class="row">
			<div class="col-sm-3" style="background-color: orange;">.col-md3</div>
			<div class="col-sm-3" style="background-color: lavender;">.col-md3</div>
			<div class="col-sm-3" style="background-color: orange;">.col-md3</div>
			<div class="col-sm-3" style="background-color: lavender;">.col-md3</div>
		</div>
	</div>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>