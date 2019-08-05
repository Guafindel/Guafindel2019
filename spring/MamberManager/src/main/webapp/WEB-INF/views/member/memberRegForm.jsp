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
#idcheck {
	display: none;
}

.color_red {
	color: red;
}

.color_blue {
	color: blue;
}
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
			<h1 class="display-6">회원 가입 페이지 입니다.</h1>
			<hr>

			<form id="regform" action="memberReg" method="post"
				enctype="multipart/form-data">

				<div class="form-group">
					<label for="mId">아이디</label> <input type="checkbox" id="idcheck">
					<input type="text" class="form-control" id="mId" name="mId"
						placeholder="아이디를 입력하세요" required>
					<div>
						<span id="idcheckmsg"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="mPw">비밀번호</label> <input type="password"
						class="form-control" id="mPw" name="mPw"
						placeholder="비밀번호를 입력하세요." required>
				</div>
				<div class="form-group">
					<label for="mName">이름</label> <input type="text"
						class="form-control" id="mName" name="mName"
						placeholder="이름을 입력하세요." required>
				</div>

				<div class="form-group">
					<label for="mPhoto">사진</label> <input type="file" id="mPhoto"
						name="mPhoto">
				</div>

				<input type="submit" class="btn btn-primary" value="회원가입">

			</form>

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