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

	<!-- 헤더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 헤더 끝 -->

	<!-- 네비 시작 -->
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<!-- 네비 끝 -->

	<!-- 콘텐츠 시작 -->
	<div class="content">
		<div class="container">
			<h1 class="display-6">registForm</h1>
			<hr>
			<form id="regForm" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="gId">아이디</label>
					<input type="checkbox" id="idCheck">
					<input type="text" id="gId" class="form-control" name="gId" placeholder="아이디를 입력하세요" required>
					<div><span id="idCheckMsg"></span></div>
				</div>
				
				<div class="form-group">
					<label for="gPw">비밀번호</label>
					<input type="text" id="gPw" class="form-control" name="gPw" palceholder="비밀번호를 입력하세요" required>
				</div>
				
				<div class="form-group">
					<label for="gName">이름</label>
					<input type="text" id="gName" class="form-control" name="gName" palceholder="이름을 입력하세요" required>
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

	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->
	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
	
		$(document).ready(function(){
			
			$('#gId').focusout(function(){
				
				//ajax 사용
				$.ajax({
					url : 'idCheck',
					type : 'get',
					data : {gId : $(this).val()},
					success : function(data) {
						alert(data);
						
						$('#idCheckMsg').html('');
						$('#idCheckMsg').removeClass('color_red');
						$('#idCheckMsg').removeClass('color_blue');
						
						if(data == 'Y') {
							$('#idCheck').prop('checked', true);
							$('#idCheckMsg').html('사용가능한 아이디 입니다.');
							$('#idCheckMsg').addClass('color_blue');
						} else {
							$('#idCheck').prop('checked', false);
							$('#idCheckMsg').html('사용이 불가능한 아이디 입니다.');
							$('#idCheckMsg').addClass('color_red');
						}
					}
				});
				
				$('#regForm').submit(function(){
					
					if(!$('#idCheck').prop('checked')) {
						alert('아이디 중복확인이 필요합니다.')
						return false;
					}
				});
				
			});
		});
	
	</script>
</body>
<!-- 바디 끝 -->

</html>