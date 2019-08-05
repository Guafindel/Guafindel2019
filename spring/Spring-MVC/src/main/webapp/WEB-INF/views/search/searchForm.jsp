<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">

<title>Insert title here</title>

<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 스타일 링크 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 제이쿼리 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<div class="container">
		<h1 class="display-1">Search</h1>

		<hr>

		<ul>
			<li><a href="/mvc/hello">/hello</a></li>
			<li><a href="/mvc/myPage">/myPage</a></li>
			<li><a href="member/loginForm">/loginForm</a></li>
			<li><a href="<c:url value="/member/memberLogin" />">/member/memberLogin</a></li>
			<li><a href="<c:url value="/order/order" />">/order/order</a></li>
			<li><a href="<c:url value="/cookie/makeForm" />">/cookie/makeForm</a></li>
			<li><a href="<c:url value="/cookie/viewCookie" />">/cookie/viewCookie</a></li>
			<li><a href="<c:url value="/header/getHeader" />">/header/getHeader</a></li>
			<li><a href="<c:url value="/search/search" />">/search/search</a></li>
			<li><a href="<c:url value="/fileupload/uploadForm" />">/fileupload/uploadForm</a></li>

		</ul>
		<h1 style="margin-bottom: 30px;" class="display-4">
			인기 검색어 :
			<c:forEach items="${popularList}" var="keyword">${keyword} </c:forEach>
		</h1>

		<select>
			<option>선택</option>
			<c:forEach items="${searchType}" var="option">
				<option value="${option.no}">${option.name}</option>
			</c:forEach>

		</select>
	</div>



	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>