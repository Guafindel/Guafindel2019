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
a {
	cusor:pointer;
}
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<div class="container">

		<h1 class="display-6">방명록</h1>

		<div style="text-align: right; margin-bottom: 10px;">
			<a href="writeForm">글 작성하기</a>
		</div>

		<div id="list"></div>

		<ul id="paging" class="pagination justify-content-center"
			style="margin: 20px 0">
		
		</ul>

		<!-- <article id="paging"></article> -->

	</div>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			

			page(1);

		});

		function page(num) {
			
			//alert(num);

			$.ajax({
				url : 'guest/listJson',
				type : 'get',
				data : {page : num},
				success : function(data) {
					//alert(JSON.stringify(data));
					var output = '';
					var list = data.messageList;
					for (var i = 0; i < list.length; i++) {
						console.log(list[i]);
						var id = list[i].id;
						var guestName = list[i].guestName;
						var message = list[i].message;

						output += '<div class="jumbotron">\n';
						output += '메세지 번호 : ' + id + '<br>\n';
						output += '손님 이름 : ' + guestName + '<br>\n';
						output += '메세지 : ' + message + '\n';
						output += '</div>\n';
						console.log(output);
					}

					var paging = '';

					for (var j = 1; j < data.pageTotalCount + 1; j++) {

						paging += '<li class="page-item"><a class="page-link" onclick="page('+j+')">'+j+'</a></li> ';
					}
					
					//alert(data.pageTotalCount);
	
					$('#list').html(output);
					$('#paging').html(paging);

				}
			});

		}
	</script>

</body>
<!-- 바디 끝 -->

</html>