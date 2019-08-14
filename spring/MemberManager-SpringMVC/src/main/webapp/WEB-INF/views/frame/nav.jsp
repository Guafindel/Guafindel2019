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
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/'/>">홈</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/member/regist'/>">회원가입</a></li>

			<li class="nav-item"><c:if test="${logininfo eq null}">
					<a class="nav-link" href="<c:url value='/member/login'/>">로그인</a>
				</c:if></li>

			<li class="nav-item"><c:if test="${logininfo ne null}">
					<a class="nav-link" href="<c:url value='/member/logout.do'/>">로그아웃</a>
				</c:if></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/member/mypage'/>">MyPage1</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/member/mypage'/>">MyPage2</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/member/memberlistJson1'/>">JsonList1</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/member/memberlistJson2'/>">JsonList2</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/member/memberlistJson3'/>">JsonList3</a></li>			
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/member/memberlist'/>">회원리스트</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/member/memberlist'/>">회원리스트2</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/rest-api/members'/>">/rest-api/members</a></li>
				
				

		</ul>

	</nav>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>