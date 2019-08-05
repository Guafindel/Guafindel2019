<%@page import="membermanager.model.RequestMemberInfo"%>
<%@page import="membermanager.model.MemberInfo"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${logininfo eq null}">
	<script>
		alert('로그인 하셔야 이용 가능합니다.')
		location.href = '../loginForm.do';
		/* location.href = '<c:url value="/WEB-INF/view/login/loginForm.jsp"/>'; */
	</script>
</c:if>
<c:if test="${!(logininfo eq null)}">

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
	<!-- 헤더 시작 -->
	<%@ include file="/WEB-INF/view/frame/header.jsp"%>
	<!-- 헤더 끝 -->

	<!-- 컨텐츠 시작 -->
	<div class="content">
		<div class="container">
			<h3 class="display-6">회원 리스트</h3>
			<hr>
			<table class="table-bordered" style="width: 100%">
				<tr>
					<td>Index</td>
					<td>ID</td>
					<td>Name</td>
					<td>Password</td>
					<td>Picture</td>
					<td>Date</td>
					<td>비고</td>
				</tr>
				<!-- 리스트 반복 시작 -->
				<c:forEach var="logininfo" items="${logininfo.mId}" varStatus="status" begin="1">

				<tr>
					<td>${logininfo.idx}</td>
					<td>${logininfo.mId}</td>
					<td>${logininfo.mName}</td>
					<td>${logininfo.mPw}</td>
					<td><img class="sumnail" alt="회원 사진"
						src="<c:url value="/uploadfile/${logininfo.mPhoto}"/>"></td>
					<td>${logininfo.regDate}</td>
					<td><a href="#">수정</a> | <a href="#">삭제</a></td>
				</tr>
				</c:forEach>

			</table>
			
		</div>
	</div>
	<!-- 컨텐츠 끝 -->

	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/view/frame/footer.jsp"%>
	<!-- 푸터 끝 -->


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>
</c:if>