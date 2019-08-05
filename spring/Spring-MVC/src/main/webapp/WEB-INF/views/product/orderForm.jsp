<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form method="post">
		<div class="container">

			<h1 class="dispay-6">orderForm</h1>

			<div class="row">

				<div class="col-sm-4">

					<div class="form-group">
						<label for="orderItems[0].itemId">상품1 - id</label> <input
							type="text" id="orderItems[0].itemId" name="orderItems[0].itemId">
					</div>

					<div class="form-group">
						<label for="orderItems[1].itemId">상품2 - id</label> <input
							type="text" id="orderItems[1].itemId" name="orderItems[1].itemId">
					</div>

					<div class="form-group">
						<label for="orderItems[2].itemId">상품3 - id</label> <input
							type="text" id="orderItems[2].itemId" name="orderItems[2].itemId">
					</div>


				</div>

				<br>
				<div class="col-sm-4">

					<div class="form-group">
						<label for="orderItems[0].number">상품1 - 개수</label> <input
							type="text" id="orderItems[0].number" name="orderItems[0].number">
					</div>

					<div class="form-group">
						<label for="orderItems[1].number">상품2 - 개수</label> <input
							type="text" id="orderItems[1].number" name="orderItems[1].number">
					</div>

					<div class="form-group">
						<label for="orderItems[2].number">상품3 - 개수</label> <input
							type="text" id="orderItems[2].number" name="orderItems[2].number">
					</div>


				</div>
				<br>
				<div class="col-sm-4">

					<div class="form-group">
						<label for="orderItems[0].remark">상품1 - 주의</label> <input
							type="text" id="orderItems[0].remark" name="orderItems[0].remark">
					</div>

					<div class="form-group">
						<label for="orderItems[1].remark">상품2 - 주의</label> <input
							type="text" id="orderItems[1].remark" name="orderItems[1].remark">
					</div>

					<div class="form-group">
						<label for="orderItems[2].remark">상품3 - 주의</label> <input
							type="text" id="orderItems[2].remark" name="orderItems[2].remark">
					</div>

					<br>
				</div>

			</div>

			<h1 class="display-6">배송지</h1>

			<div class="form-group">
				<label for="address.zipcode">우편번호</label> <input type="text"
					id="address.zipcode" name="address.zipcode">
			</div>

			<div class="form-group">
				<label for="address.address1">주소일번</label> <input type="text"
					id="address.address1" name="address.address1">
			</div>

			<div class="form-group">
				<label for="address.address2">주소이번</label> <input type="text"
					id="address.address2" name="address.address2">
			</div>

			<br> <input type="submit" value="주문">
		</div>
	</form>

	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>