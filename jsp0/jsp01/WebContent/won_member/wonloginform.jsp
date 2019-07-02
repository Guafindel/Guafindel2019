<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" intial-scale="1">
<!-- 뷰포트 -->

<title>회원가입과 로그인 게시판</title>

<!-- 제이쿼리 스크립트 삽입 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
<!-- 제이쿼리 스크립트 삽입  -->

<!-- 스타일 링크 삽입 -->
<link href="css/bootstrap.min.css" rel="stylesheet"
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
		<div id="header">
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expaned="false">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
				</div>
				<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="main.jsp">메인</a></li>
						<li><a href="bbs.jsp">게시판</a></li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></</span></a>
						<ul class="dropdown-menu">
							<li class="active"><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
					</ul>
					</li>
					</ul>
				</div>
			</nav>
		</div>
		
		<div id="container"></div>
		
		<div id="footer"></div>
	
	</div>
	

<!-- 부트스트랩 js -->
<script src="js/bootstrap.js"></script>

</body>
<!-- 바디 끝 -->

</html>