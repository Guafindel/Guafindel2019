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
div#memberList {
	overflow: hidden;
}
div.card {
	width: 33%;
	border: 1px solid #ddd;
	float: left;
}

</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<div class="container">
		<h1 class="display-6">회원 리스트</h1>
		<hr>
		<div id="memberList"></div>
	</div>


	<script>
	
		$(document).ready(function(){
				list();
			
		});
		
			function del(idx) {
				
				if(confirm('삭제하시겠습니까?')) {
					
					$.ajax({
						url : 'http://localhost:8080/mm/rest-api/members/'+idx,
						type : 'DELETE',
						success : function(data) {
							if(data=='success') {
								alert('삭제되었습니다.')
								list();
							}
							
						}
					});
				}
				
				
			}
			
			function list() {
				
				$.ajax({
					
					url : 'http://localhost:8080/mm/rest-api/members',
					type : 'GET',
					success : function(data){
						//alert(JSON.stringify(data));
						var html = '';
						
						for(var i=0; i < data.length; i++) {
							html += '<div class="card">\n';
							html += 'idx : ' + data[i].idx + ' <br>\n';
							html += 'mId : ' + data[i].mId + ' <br>\n';
							html += 'mName : ' + data[i].mName + ' <br>\n';
							html += 'mPhoto : ' + data[i].mPhoto + ' <br>\n';
							html += '<button onclick="del('+data[i].idx+')">삭제하기</button><br>\n';
							html += '</div>\n';
						}
						
						$('#memberList').html(html);
					}
					
				});
			}
			
			
	
	</script>

	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>