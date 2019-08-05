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
		<h1 class="display-6">order</h1>
		<h1>주문내역</h1>
		<hr>
		<c:forEach items="${orders.orderItems}" var="item">
			
			<div class="jumbotron">
				<p>상품 id : ${item.itemId}</p>
				<p>상품 개수 : ${item.number}</p>
				<p>주의 사항 : ${item.remark}</p>
			</div>

		</c:forEach>


		<h1>배송지</h1>
		
			<div class="jumbotron">
				<p>우편번호 : ${orders.address.zipcode}</p>
				<p>주소1 : ${orders.address.address1}</p>
				<p>주소2 : ${orders.address.address2}</p>
			</div>
	</div>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>