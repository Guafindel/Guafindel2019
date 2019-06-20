<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery CDN 1.12.4 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="/mm/css/default.css" rel="stylesheet" type="text/css">

<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<body>
	<!-- 헤더 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- 헤더 끝 -->

	<!-- 네비게이션 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- 네이게이션 끝 -->

	<!-- 컨테이너 시작 -->
	<div id="container">
		<h3>로그인 페이지 입니다.</h3>
		<hr>
		<form action="loginProcess.jsp" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uId"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="uPw"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="로그인" name=""></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 컨테이너 끝 -->

	<!-- 푸터 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- 푸터 끝 -->



</body>
</html>