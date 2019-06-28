<%@page import="member.WonLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("login", new WonLogin("Arin", "최아린"));

	request.setAttribute("name01", "requestData");
	session.setAttribute("name02","sessionData");
	application.setAttribute("name03", "applicationData");
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
	<h3>
		request 영역의 name01 : ${requestScope.name01} <br>
							<%= request.getAttribute("name01") %> <br>
		session 역역의 name02 : ${sessionScope.name02} <br>
							
		application 영역의 name03 : ${applicationScope.name03} <br>
		
		login 객체 참조1 - uId : ${requestScope.login.uId} <br>
							 <!--  Map  /    key /uId는 변수가 아니다, getId를 의미한다.(메소드 호출) -->
		login 객체 참조2 - uName : ${requestScope.login.uName} <br>
		
		login 객체 참조3 - pNum : ${requestScope.login.pNum} <br>
		
		login 객체 참조3 - num : ${login.num} <br>
	</h3>




</body>
<!-- 바디 끝 -->

</html>