<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 스크립트 삽입 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- 제이쿼리 스크립트 삽입  -->
<!-- 스타일 시작 -->
<style>
 	body {
 		padding: 0;
 		margin: 0;
 	}

 	table {
 		margin: 0 auto;
 	}
 	
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>

	<form action="login.jsp" method="post">
	<table>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>아이디</font></td>
			<td bgcolor="yellow"><input type="text" name="uId"></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>비밀번호</font></td>
			<td bgcolor="yellow"><input type="password" name="uPw"></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>이름</font></td>
			<td bgcolor="yellow"><input type="text" name="uName"></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>생년월일</font></td>
			<td bgcolor="yellow"><input type="text" name="uBirth"></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>성별</font></td>
			<td bgcolor="yellow">
			<input type="radio" name="uGender" value="1"><font size=2>남</font>
			<input type="radio" name="uGender" value="2"><font size=2>여</font>
			</td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>나이</font></td>
			<td bgcolor="yellow"><input type="text" name="uAge"></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>이메일</font></td>
			<td bgcolor="yellow"><input type="email" name="uEmail"></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>휴대전화</font></td>
			<td bgcolor="yellow"><input type="text" name="uPnum"></td>
		</tr>
		<tr>
			<td><input type="submit" value="회원 가입"></td>
			<td><input type="reset" value="다시 작성"></td>
		</tr>
	</table>
	</form>
</body>
<!-- 바디 끝 -->

</html>