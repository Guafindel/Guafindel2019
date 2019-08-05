<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
	<%@ include file="/WEB-INF/view/frame/header.jsp"%>
	<!-- 헤더 끝 -->

	<!-- 컨텐츠 시작 -->
	<div class="content">
		<div class="container">
			<h1 class="display-6">회원 가입 페이지 입니다.</h1>
			<hr>

			<form id="regform" action="memberReg.do" method="post"
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

				<input type="submit" class="btn btn-primary"
					value="회원가입">

			</form>

		</div>
	</div>
	<!-- 컨텐츠 끝 -->

	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/view/frame/footer.jsp"%>
	<!-- 푸터 끝 -->


	<script>
		$(document).ready(function() {

			$('#mId').focusout(function() {

				//aJax 비동기 통신 id 전송, 사용 유무에 대한 결과 값을 반환

				$.ajax({

					url : 'idCheck.do',
					type : 'get',
					data : {
						id : $(this).val()
					},
					success : function(data) {
						alert(data);

						$('#idcheckmsg').html('');
						$('#idcheckmsg').removeClass('color_red');
						$('#idcheckmsg').removeClass('color_blue');

						if (data == 'Y') {
							$('#idcheck').prop('checked', true);
							$('#idcheckmsg').html('사용가능한 아이디 입니다.');
							$('#idcheckmsg').addClass('color_blue');

						} else {
							$('#idcheck').prop('checked', false);
							$('#idcheckmsg').html('사용중인 아이디 이거나 탈퇴한 아이디 입니다.');
							$('#idcheckmsg').addClass('color_red');
						}

					}

				});

				$('#regform').submit(function() {

					if (!$('#idcheck').prop('checked')) {

						alert('아이디 중복확인이 필요합니다.');

						return false;

					}
				});

			});

		});
	</script>

	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>