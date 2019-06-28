<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 제이쿼리 스크립트 삽입 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 제이쿼리 스크립트 삽입  -->

<!-- 스타일 링크 삽입 -->
<link href="/jsp01/won_member/won_css/won.css" rel="stylesheet"
	type="text/css">
<!-- 스타일 링크 삽입 완료-->

<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>

	<div id="wrap">

		<!-- 헤더 시작 -->
		<%@ include file="won_frame/header.jsp"%>
		<!-- 헤더 끝 -->

		<div id="container">
		<h2>로그인 페이지</h2>
		<br>
		<hr> 
		<br><br>
			<div id="content">
				<form action="wonsignupinfo.jsp" method="post">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" placeholder="아이디"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw" placeholder="비밀번호"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" placeholder="이름"></td>
						</tr>
						<tr>
							<td>휴대전화</td>
							<td><input type="text" name="pnum" placeholder="휴대전화"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" name="birth" placeholder="생년월일"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td>
								남자 <input type="radio" name="sex">
								여자 <input type="radio" name="sex">
							</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email" placeholder="이메일"></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="회원가입">
							</td>
							
						</tr>
					</table>
				</form>
			</div>
		</div>

		<!-- 푸터 시작 -->
		<%@ include file="won_frame/footer.jsp"%>
		<!-- 푸터 끝 -->

	</div>


</body>
<!-- 바디 끝 -->

</html>