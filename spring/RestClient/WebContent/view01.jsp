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
		<h1 class="display-6">Insert</h1>
		<hr>
		<div align="right">
			<button class="btn btn-info" onclick="location.href='view02.jsp'">List</button>
		</div>

		<form id="insertForm" method="post" class="was-validated">

			<div class="form-group">
				<label for="e_id">ID</label> <input class="form-control" type="text"
					placeholder="ID" name="e_id" id="e_id" required>
				<div class="valid-feedback">Good</div>
				<div class="invalid-feedback">Fill this field</div>
			</div>

			<div class="form-group">
				<label for="e_content">Content</label>
				<textarea class="form-control" placeholder="Content"
					name="e_content" id="e_content" rows="5" width="100%" required></textarea>
				<div class="valid-feedback">Good</div>
				<div class="invalid-feedback">Fill this field</div>
			</div>

			<div class="form-group">
				<label for="e_info">Info</label> <input class="form-control"
					type="text" placeholder="Info" name="e_info" id="e_info" required readonly>
				<div class="valid-feedback">Good</div>
				<div class="invalid-feedback">Fill this field</div>
			</div>

			<input type="submit" onclick="location.href='view02.jsp'" class="btn btn-success" value="Submit">

		</form>
		
		<br>
		<div align="right">
			<button class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="api()">Category</button>
		</div>
		
		<div class="modal" id="myModal"">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Festival List</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">

						<table class="table" style="width: 100%">
							<thead class="thead-light">
								<tr>
									<th>제목</th>
									<th>장르</th>
									<th>장르 세분화</th>
									<td>seq</td>
									<td>입력</td>
								</tr>
							</thead>
							<tbody id="apiList">

							</tbody>
						</table>
						
						<ul class="pagination justify-content-center" style="margin:20px 0">
  							<li class="page-item"><a class="page-link" href="#" onclick="paging()">Next</a></li>
						</ul>
						
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
					
			$('#insertForm').submit(function() {

				alert($('#insertForm').serialize());

				$.ajax({
					url : 'http://localhost:8080/event/events/board',
					type : 'POST',
					data : $('#insertForm').serialize(),
					success : function(data) {
						alert(data);
						window.location.href = 'view02.jsp';
					}

				});

				return false;

			});
			
			

		});
		
		
		function inseq(seq, subject) {
			alert(seq);
			$('#e_info').val(seq);
			$('#e_id').val(subject);
		}
		
		function api() {
			
			
			$.ajax({
				
				url : 'http://openapi.culture.go.kr/openapi/service/ArtKnwldgFstvlService/getArtKnwldgFstvl?pageNo=1&numOfRows=25&ctgry2=&ctgry3=&subject=&ServiceKey=NJBL0Wjqigq1lJLWhIliLB%2B47JBzbwv7if0KA0QBxjvKhnTyHqMIF9EiZq2FAPamMwBVmlhQcAumZ0Qi6HQUaA%3D%3D',
				type : 'GET',
				datatype : 'xml',
				success : function(data){
					alert(data);
					var html = '';
					$.each($(data).find('item'), function(idx, val){
						//var seq = $(this).find('seq').text();
						console.log(val);
						
						html += '<tr>';
						html += '<td>'+$(val).find('subject').text()+'</td>';
						html += '<td>'+$(val).find('ctgry3Nm').text()+'</td>';
						html += '<td>'+$(val).find('ctgry2Nm').text()+'</td>';
						html += '<td>'+$(val).find('seq').text()+'</td>';
						html += '<td><button type="button" data-dismiss="modal" class="btn btn-primary" onclick="inseq('+$(val).find('seq').text()+')">input</button></td>';
						html += '</tr>';
						
					});
					console.log(html);
					
					$('#apiList').html(html);
					
				}
						
			});
			
			
		}
		
	
	</script>


</body>
<!-- 바디 끝 -->

</html>