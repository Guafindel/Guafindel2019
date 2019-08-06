<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");

	int resultCnt = 0;
	boolean chk = false;
	String msg = "";

	//서비스 객체 생성
	/* DeleteMessageService service = DeleteMessageService.getInstance(); */

	/* try {
		resultCnt = service.deleteMessage(messageId, password);
		chk = true;
		
	} catch ( SQLException e ) {
		msg = e.getMessage();
	} catch ( MessageNotFoundException e ) {
		msg = e.getMessage();
	} catch ( InvalidMessagePasswordException e ) {
		msg = e.getMessage();
	} */
%>
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
		<h3>
			<c:if test="${chk}">
				${resultCnt} 개 행이 삭제되었습니다.	
			</c:if>

			<c:if test="${!chk}">
				${msg}
			</c:if>
		</h3>

		<a href="<c:url value="/guest/list"/>">리스트</a>
	</div>



	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>