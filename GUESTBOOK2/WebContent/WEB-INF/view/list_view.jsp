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
		<h3>
			<%-- ${viewData.messageTotalCount} <br> ${viewData.currentPageNumber}
			<br> ${viewData.pageTotalCount} <br>
			${viewData.messageCountPerPage} <br> ${viewData.firstRow} <br>
			${viewData.endRow} <br> --%>
		</h3>
		
		<h1>방명록</h1>
		
		<div style="text-align: right; margin-bottom:10px;"><a href="guestWriteForm">글 작성하기</a></div>
		
		
		<c:if test="${viewData.messageTotalCount > 0}">

		<c:forEach items="${viewData.messageList}" var="message">
			<div class="jumbotron">
				메세지 번호 : ${message.id}<br> 손님 이름 : ${message.guestName}<br>
				메세지 : ${message.message}<br> <a
					href="guestDelForm?messageId=${message.id}">삭제하기</a>
				<!-- messageId는 넘어간 jsp 페이지에서 받을 id값을 의미한다. -->
			</div>
		</c:forEach>
		
		
		<c:forEach begin="1" end="${viewData.pageTotalCount}" step="1" var="num">
			<a href="guestList?page=${num}">[${num}]</a> 
		</c:forEach>
	
		</c:if>

	</div>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>