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
<link href="/jsp01/won_member/won_css/won.css" rel="stylesheet" type="text/css">
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
		<%@ include file="won_frame/header.jsp" %>
		<!-- 헤더 끝 -->
		
		<div id="container">
			<div id="content">
				<img id="img" src='<c:url value="/images/535867.jpg"/>'>
			</div>
		</div>
		
		<!-- 푸터 시작 -->
		<%@ include file="won_frame/footer.jsp" %>
		<!-- 푸터 끝 -->
		
	</div>


</body>
<!-- 바디 끝 -->

</html>