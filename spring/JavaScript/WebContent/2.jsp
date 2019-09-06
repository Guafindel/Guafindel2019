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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 제이쿼리 링크 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- 아이콘 사용 링크 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>

<div class="container">
	<h1 class="display-6" id="pull"></h1>
	<hr>
	<p id="short">here is</p>
	<button type="button" onclick="userFunction()">click</button>
	<hr>
	<h1 class="display-6">바깥에 있는 js파일을 이용해서 함수를 불러올 수 있다.</h1>
	<p id="plz">여기 있는게 바뀔거에요 외부 js파일에 있는 함수에 의해서</p>
	<button type="button" onclick="here()">click</button>
	<hr>
	<p id="demo">바깥 외부 사이트를 src로 주소로 불러오는 코드</p>
	<button type="button" onclick="myFunction()">시도해보세요</button>
</div>
<script>
	document.getElementById("pull").innerHTML = "script태크를 생성해서 바로 여기에 입력하는 방법";
	
	function userFunction() {
		document.getElementById("short").innerHTML = "함수를 생성해서 HTML을 변경하는 방법";
	}
</script>
<script src="js/script.js"></script>
<script src="https://www.w3schools.com/js/myScript1.js"></script>
	

<!-- 부트스트랩 js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>