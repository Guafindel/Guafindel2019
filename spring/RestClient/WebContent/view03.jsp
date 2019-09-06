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
	<div class="container">
		<h1 class="display-6">Detail</h1>
		<hr>
		<div align="right">
			<button class="btn btn-info" onclick="location.href='view02.jsp'">List</button>
		</div>
		
		<div id="content"></div>
		
	</div>

	<script>
		$(document).ready(function(){
			
			list()
			
			
		});
		
		function list() {
			
			var seq = <%=request.getParameter("seq")%>;
				
			$.ajax({
				
				url : 'http://openapi.culture.go.kr/openapi/service/ArtKnwldgFstvlService/getArtKnwldgFstvlDetail?seq='+ seq +'&ServiceKey=NJBL0Wjqigq1lJLWhIliLB%2B47JBzbwv7if0KA0QBxjvKhnTyHqMIF9EiZq2FAPamMwBVmlhQcAumZ0Qi6HQUaA%3D%3D',
				type : 'GET',
				datatype : 'xml',
				success : function(data){
					alert(data);
					var html = '';
					$.each($(data).find('item'), function(idx, val){
						//var seq = $(this).find('seq').text();
						console.log(val);
						
						/* html += '<h1 class="display-6">'+$(val).find('num').text()+'</h1>'; */
						html += '<h1 class="display-6">'+$(val).find('subject').text()+'</h1>';
						html += '<p>'+$(val).find('contents').text()+'</p>';
					
						
					});
					
					$('#content').html(html);
					
				}
						
			});
			
		}
		
		function getParameterByName(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		    
		}
		
		var getParameter = function(paramName) {
			//리턴값을 위한 변수 선언
			var returnValue;
			//현재 url 가져오기
			var url = location.href;
			//get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
			var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
			for (var i=0; i<parameters.length; i++) {
				var varName = parameters[i].split('=')[0];
				if (varName.toUpperCase() == paramName.toUpperCase()) {
					returnValue = parameters[i].split('=')[1];
					return decodeURLComponent(returnValue);
				}
			}
			console.log(getParameters('seq'));
		};
		
		
		
		


	</script>
	
	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
<!-- 바디 끝 -->

</html>