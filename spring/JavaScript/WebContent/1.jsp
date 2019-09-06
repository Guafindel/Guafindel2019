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
	<h1 class="display-6">자바스크립트는 특정 이벤트를 줘서 기존 메세지를 변경할 수 있다.</h1>
	<h1 class="display-6" id="demo">Change Message</h1>
	<button type="button" onclick="document.getElementById('demo').innerHTML ='Hello JavaScript'">Click</button>
	<button type="button" onclick="document.getElementById('demo').innerHTML ='Hello World'">Click</button>
	<hr>
	<p>자바 스크립트가 이미지를 어떻게 변경할 수 있는지 알아보자.</p>
	<button type="button" onclick="document.getElementById('img1').src='images/99BDF.gif'">ChangeImg</button>
	<img id="img1" src="images/5.gif" style="width:300px; height:300px;">
	<button type="button" onclick="document.getElementById('img1').src='images/5.gif'">ChangeAgain</button>
	<hr>
	<h1 class="display-6">자바스크립트로 CSS를 변경할 수 있다.</h1>
	<h1 class="display-6" id="css">CSS Change Here</h1>
	<button type="button" onclick="document.getElementById('css').style.fontSize='50px'">change1</button>
	<button type="button" onclick="document.getElementById('css').style.fontSize='16px'">change2</button>
	<hr>
	<h1 class="display-6">자바스크립트로 HTML 요소를 숨기거나 표시할 수 있다.</h1>
	<h1 class="display-6" id="hv">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</h1>
	
	<button type="button" onclick="document.getElementById('hv').style.display='none'">hide</button>
	<button type="button" onclick="document.getElementById('hv').style.display='block'">view</button>
</div>

<script>
	
</script>
	

<!-- 부트스트랩 js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>