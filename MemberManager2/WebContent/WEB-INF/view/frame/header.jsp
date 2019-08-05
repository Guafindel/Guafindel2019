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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 제이쿼리 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>

<!-- 헤더 시작 -->
	<div class="header">
		<div class="container-fluid">
			<h1 class="display-4">Member Manager</h1>
			<nav class="navbar navbar-expand-sm bg-light navbar-light">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/'/>">홈</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/member/memberRegForm.do'/>">회원가입</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/member/loginForm.do'/>">로그인</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/member/mypage/mypage.do'/>">MyPage1</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/member/mypage/mypage.do'/>">MyPage2</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/member/memberList.do'/>">회원리스트</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/member/memberList.do'/>">회원리스트2</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
				</ul>
				
			</nav>
		</div>
	</div>
	<hr>
	<!-- 헤더 끝 -->
	

<!-- 부트스트랩 js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>