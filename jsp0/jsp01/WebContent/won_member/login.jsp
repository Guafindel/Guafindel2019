<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="won" class="member.WonMember"/>
<jsp:setProperty property="*" name="won"/>
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

</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>

	<table>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>아이디</font></td>
			<td bgcolor="yellow"><%= won.getuId() %></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>비밀번호</font></td>
			<td bgcolor="yellow"><%= won.getuPw() %></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>이름</font></td>
			<td bgcolor="yellow"><%= won.getuName() %></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>생년월일</font></td>
			<td bgcolor="yellow"><%= won.getuBirth() %></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>성별</font></td>
			<td bgcolor="yellow"><%= won.getuGender() %></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>나이</font></td>
			<td bgcolor="yellow"><%= won.getuAge() %></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>이메일</font></td>
			<td bgcolor="yellow"><%= won.getuEmail() %></td>
		</tr>
		<tr>
			<td align=right bgcolor="yellow"><font size=2>휴대전화</font></td>
			<td bgcolor="yellow"><%= won.getuPnum() %></td>
		</tr>
		<tr>
			<td colspan="2"><a href="form2.jsp">회원 가입 페이지</a></td>
			
		</tr>
	</table>


</body>
<!-- 바디 끝 -->

</html>