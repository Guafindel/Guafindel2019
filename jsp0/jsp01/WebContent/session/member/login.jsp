<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=
	UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 1. id/pw 데이터를 받기
	2. id=pw 인증 확인
	3. 세션에 사용자 데이터 저장 : 속성을 이용해서 데이터 저장
	4. 응답처리 : 로그인 되었습니다. or 로그인 실패 (이전 페이지로 이동) */
	
	//1. id/pw 데이터 받기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//2. id==pw 인증
	boolean loginChk = false;
	
	//2. id 값과 pw값이 같으면 로그인 인증 확인
	if (id != null && pw != null && id.equals(pw)) {
		//id==pw라면 세션에 ID 저장, loginChk = true
		//session.setAttribute("ID", id); //사용자가 로그인 했는지 여부 확인용
		
		LoginInfo loginInfo = new LoginInfo(id);
		
		session.setAttribute("LoginInfo", loginInfo);
		
		loginChk = true;
	} 
%>
<%
	//사용자 요청에서 한글 처리
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
<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<h1>세션 로그인 화면</h1>
	<%
		if(loginChk) {
			
		
	%>
	<h1><%= id %>님 로그인 되었습니다.</h1>
	<a href="loginCheck.jsp">loginCheck</a>
	<% } else { %>
	<script>
		alert("아이디 또는 비밀번호가 틀렸습니다.");
		location.href='loginForm.jsp';
		//history.go(-1);
		//response.sendRedirect='loginForm.jsp';
	</script>
	<% } %>
	
	
	
	
</body>
<!-- 바디 끝 -->

</html>