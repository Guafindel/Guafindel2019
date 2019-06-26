<%@page import="member.WonLogin"%>
<%@page import="member.WonMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String ID = request.getParameter("uId");
	String PW = request.getParameter("uPw");

	WonMember member = (WonMember) session.getAttribute(ID);

	WonLogin login = (WonLogin) session.getAttribute(ID);

	if (member != null && member.getuPw().equals(PW)) {

		session.setAttribute("logCheck", login);

		response.sendRedirect("form2.jsp");
	} else {
%>
	<script>
		alert('아이디 혹은 비밀번호가 틀립니다.');
		location.href="form2.jsp"
	
	</script>
<%
	}
%>
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

</body>
<!-- 바디 끝 -->

</html>