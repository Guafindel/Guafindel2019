<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>

<!-- jQuery CDN 1.12.4 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 스타일 시작 -->
<style>
	img {
		width: 800px;
		
	}
</style>
<!-- 스타일 끝 -->

</head>
<body>

<%
	Calendar c = Calendar.getInstance();
%>

<h1>회원 리스트
 	<%= c.get(Calendar.YEAR) %>년
 	<%= c.get(Calendar.MONTH)+1 %>월 
 	<%= c.get(Calendar.DATE) %>일
 </h1>
 
<a href="memberReg.jsp">회원가입</a>	<br>
<img alt="이미지" src="../images/99577F375BE129F539.jpg"> <br>
<a href="file.jsp">파일</a>


<script>
	$(document).ready(function(){
		alert('회원 가입페이지예요.');
		
	});

</script>
</body>
</html>