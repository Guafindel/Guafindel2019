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
div#memberList {
	overflow: hidden;
}

div.card {
	width: 33%;
	border: 1px solid #ddd;
	float: left;
}
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<div class="container">
		<h1 class="display-6">회원 가입</h1>
		<hr>
		<form id="form">
			아이디 <input type="text" name="mId" id="mId"> <br> 
			비밀번호 <input type="text" name="mPw" id="mPw"> <br> 
			이름 <input type="text" name="mName" id="mName"> <br> 
			<input type="submit" value="회원가입">
		</form>
	</div>


	<script>
		$(document).ready(function() {

		
			$('#form').submit(function() {

				$.ajax({

					url : 'http://localhost:8080/mm/rest-api/members',
					type : 'POST',
					data : JSON.stringify({
						mId : $('#mId').val(),
						mPw : $('#mPw').val(),
						mName : $('#mName').val(),
					}),
					contentType : 'application/json; charset=utf8',
					dataType : 'json',
					success : function(data) {
						alert(data);

					}

				});

				return false;
			});
		});
	</script>

	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>