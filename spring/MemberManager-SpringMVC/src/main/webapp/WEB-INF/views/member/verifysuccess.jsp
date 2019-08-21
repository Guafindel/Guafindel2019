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
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<!-- 헤더 끝 -->
	
	<!-- 컨텐츠 시작 -->
	<div class="content">
		<div class="container">
			<h1 class="display-6">인증되었습니다.<small>로그인 후 정상 서비스 이용 가능합니다.</small></h1>
			<h3 class="display-6"><a href="login">로그인 하기</a></h3>
			
		
		</div>
	</div>
	<!-- 컨텐츠 끝 -->
	
	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
	<!-- 푸터 끝 -->


	

	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>