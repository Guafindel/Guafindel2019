<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<h1>
		<fmt:timeZone value="Asia/Seoul">
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<fmt:formatDate value="${now}" type="date" dateStyle="full" />
			/
			<fmt:formatDate value="${now}" type="date" dateStyle="short" />
			<br>

			<fmt:formatDate value="${now}" type="time" timeStyle="full" />
			/
			<fmt:formatDate value="${now}" type="time" timeStyle="short" />
			<br>

			<fmt:formatDate value="${now}" type="both" />
			<br>
			<fmt:formatDate value="${now}" type="both" dateStyle="short"
				timeStyle="short" /> /
			<fmt:formatDate value="${now}" type="both" dateStyle="full"
				timeStyle="full" />
			<br>

			<fmt:formatDate value="${now}" pattern="yyyy hh:mm:ss" />
			<br>
			<fmt:formatDate value="${now}" pattern="yyyy.MM.dd hh:mm:ss" />
			<br>
			<fmt:formatDate value="${now}" pattern="yyyy.MM.dd. hh:mm:ss" />
			<br>
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" />
			<br>
			<fmt:formatDate value="${now}" pattern="yyyy.MM.dd. a hh:mm:ss" />
			<br>
			<fmt:formatDate value="${now}" pattern="yyyy.MM.dd. z a hh:mm:ss" />
			<br>
		</fmt:timeZone>
	</h1>

	<hr>

	<h1>

		<c:set var="price" value="1000000" />
		<c:set var="pi" value="0.141592" />

		<fmt:formatNumber value="${price}" type="number" var="numberType"
			groupingUsed="true" />
		<!-- type의 디폴트 값이 number라 생략 가능. -->
		현재 숫자 : ${numberType} <br> 통화 :
		<fmt:formatNumber value="${price}" type="currency" currencySymbol="\\" />
		<br> % 표현:
		<fmt:formatNumber value="${price}" type="percent" groupingUsed="false" />
		/
		<fmt:formatNumber value="${pi}" type="percent" groupingUsed="flase" />
		<br> 패턴표현 :
		<fmt:formatNumber value="${price}" pattern="00,000,000.00" />
		/
		<fmt:formatNumber value="${pi}" pattern="00,000,000.00" />

		<br><br><br>

		<c:forEach var="id"
			items="<%=java.util.TimeZone.getAvailableIDs()%>">
			${id}<br />
		</c:forEach>




	</h1>





</body>
<!-- 바디 끝 -->

</html>