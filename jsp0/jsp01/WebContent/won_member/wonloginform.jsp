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
<link href="css/bootstrap.css" rel="stylesheet"
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
				<form action="wonlogininfo.jsp" method="post">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" required></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw" required></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" required></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" name="birthY" placeholder="년(4자)"></td>
							<select name="birthM">
								<option>월</option>
								<option>1</option>
								<option>2</option>
							</select>
							<td><input type="text" name="birthD" placeholder="일"></td>
						</tr>
						<tr>
							<select name="sex">
								<option>성별</option>
								<option>남</option>
								<option>여</option>
							</select>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email" palceholder="선택입력"></td>
						</tr>
						<tr>
							<td>휴대전화</td>
							<td><input type="text" name="pnum" palceholder="전화번호 입력"></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" value="로그인">
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


	<script>bootstrap.js</script>

</body>
<!-- 바디 끝 -->

</html>