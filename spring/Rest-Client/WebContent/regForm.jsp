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
#idCheck {
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



	<!-- 콘텐츠 시작 -->
	<div class="content">
		<div class="container">
			<h1 class="display-6">registForm</h1>
			<hr>
			<form id="regForm" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="gId">아이디</label> <input type="text" id="gId"
						class="form-control" name="gId" placeholder="아이디를 입력하세요" required>
					<div>
						<span id="idCheckMsg"></span>
					</div>
				</div>

				<div class="form-group">
					<label for="gPw">비밀번호</label> <input type="text" id="gPw"
						class="form-control" name="gPw" placeholder="비밀번호를 입력하세요" required>
				</div>

				<div class="form-group">
					<label for="gName">이름</label> <input type="text" id="gName"
						class="form-control" name="gName" palceholder="이름을 입력하세요" required>
				</div>

				<div class="form-group">
					<label for="gPhoto">사진</label> 
					<input type="file" id="gPhoto" id="gPhoto" class="form-control" name="gPhoto">
				</div>

				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="회원가입">
				</div>
			</form>



		</div>
	</div>
	<!-- 콘텐츠 끝 -->


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {

			$('#regForm').submit(function() {

				/* alert($('#regForm').serialize()); */

				$.ajax({

					url : 'http://localhost:8080/gb/rest/members',
					type : 'POST',
					data : $('#regForm').serialize(),
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