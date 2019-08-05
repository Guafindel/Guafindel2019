<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<!-- 컨텐츠 시작 -->
	<div class="content">
		<div class="container">
			<h3 class="display-6">회원 가입 요청 처리 페이지</h3>
			<hr>

			<div class="row">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
					<div class="card" style="width: 100%">
						<img style="height: 450px" alt="Card image"
							"class="mx-auto d-block" alt="회원 사진"
							src="<c:url value="/uploadfile/${file}"/>">

						<div class="card-body">
							<p class="card-text">아이디 : ${mId}</p>
							<p class="card-text">비밀번호 : ${mPw}</p>
							<p class="card-text">사진 이름 : ${fileName} (${fileSize})</p>
						</div>
					</div>
				</div>
				<div class="col-sm-4"></div>
			</div>

		</div>
	</div>
	<!-- 컨텐츠 끝 -->

	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>