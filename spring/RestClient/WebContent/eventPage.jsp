<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!-- 아이콘 사용 링크 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<!-- 헤더 시작 -->
	<%@ include file="/frame/header.jsp" %>
	<!-- 헤더 끝 -->
	<br><br><br><br><br>
	<!-- 콘텐츠 시작 -->
	<div class="container">
		
		<h1 style="text-align:center;" class="display-3">EventPage</h1>
		<br><br><br>
		<!-- Insert 시작 -->
		<h1 class="display-6">Insert</h1>
		<hr>
		<div align="right">
			<button class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="api()">Category</button>
		</div>
		<hr>

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

			<input type="submit" class="btn btn-success" value="Submit">

		</form>
		
		<br>
		
		<div class="modal" id="myModal">
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
		
		<hr> <!-- List 시작 -->
	
		<h1 class="display-6">List</h1>
		
		<hr>
		<div class="form-group">
			<form>
				<span style="width: 15%; float: left;"> <select
					class="form-control" name="stype">
						<option value="both">Id+Content</option>
						<option value="id">Id</option>
						<option value="content">Content</option>
				</select>
				</span> <span style="width: 75%; float: left;"> <input type="text"
					class="form-control" name="keyword"
					placeholder="Enter the search word">
				</span> <span style="width: 10%; float: left;"> <input type="submit"
					class="form-control" value="검색">
				</span>
			</form>
		</div>

		<table class="table" style="width: 100%">
			<thead class="thead-light">
				<tr>
					<th>Num</th>
					<th>Id</th>
					<th>Content</th>
					<th>Info</th>
					<!-- <th>Date</th> -->
					<th>remarks</th>
					<th>view</th>
				</tr>
			</thead>
			<tbody id="eventList">

			</tbody>
		</table>
		
		<div class="modal" id="myModal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">EditEvent</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<div id="editbox">
							<form id="editForm" class="was-validated">

								<div class="form-group">
									<label for="e_num">Index</label> <input type="text"
										class="form-control" name="e_num" id="e_num1" readonly>
								</div>

								<div class="form-group">
									<label for="e_id">Id</label> <input type="text"
										class="form-control" name="e_id" id="e_id1" readonly>
								</div>

								<div class="form-group">
									<label for="e_content">Content</label>
									<textarea class="form-control" name="e_content" id="e_content1"
										placeholder="Content"></textarea>
									<div class="valid-feedback">Good</div>
									<div class="invalid-feedback">Fill this field</div>
								</div>

								<div class="form-group">
									<label for="e_info">Info</label> <input type="text"
										class="form-control" name="e_info" id="e_info1" readonly>
								</div>

								<input type="submit" class="btn btn-success" value="Edit">

							</form>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="modal" id="myModal2">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">API Detail</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<div id="content"></div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
	
	
	<%-- <!-- 푸터 시작 -->
	<%@ include file="/frame/footer.jsp" %>
	<!-- 푸터 끝 --> --%>

	<script>
		$(document).ready(function(){
			
			list();
			
			$('#insertForm').submit(function() {

				alert($('#insertForm').serialize());

				$.ajax({
					//url : 'http://localhost:8080/event/events/board',
					url : 'http://ec2-13-209-47-124.ap-northeast-2.compute.amazonaws.com:8080/EventBook/events/board',
					type : 'POST',
					data : $('#insertForm').serialize(),
					success : function(data) {
						alert(data);
						window.location.href = 'eventPage.jsp';
						
					}

				});

				return false;

			});
			
			$('#editForm').submit(function(){
				
				$.ajax({
					
					//url : 'http://localhost:8080/event/events/board/' + $('#e_num1').val(),
					url : 'http://ec2-13-209-47-124.ap-northeast-2.compute.amazonaws.com:8080/EventBook/events/board/' + $('#e_num1').val(),
					type : 'PUT',
					data : JSON.stringify({e_num:$('#e_num1').val(), e_id:$('#e_id1').val(), e_content:$('#e_content1').val(), e_info:$('#e_info1').val()}),
					contentType : 'application/json; charset=utf-8',
					success : function(data) {
						alert(data);
						if(data =='success') {
							alert('Edited');
							list();
						}
					}
				});
				return false;
			});	
			
		});
		
		function list() {
			
			$.ajax({
				//url : 'http://localhost:8080/event/events/board',
				url : 'http://ec2-13-209-47-124.ap-northeast-2.compute.amazonaws.com:8080/EventBook/events/board',
				type : 'GET',
				data: {},
				success : function(data){
					console.log(data);
					
					var html = '';
					
					for(var i=0; i<data.eventList.length; i++) {
						
						html += '<tr>';
						html += '<td>'+data.eventList[i].e_num+'</td>';
						html += '<td>'+data.eventList[i].e_id+'</td>';
						html += '<td>'+data.eventList[i].e_content+'</td>';
						html += '<td>'+data.eventList[i].e_info+'</td>';
						html += '<td><button style="margin-right: 3px;" class="btn btn-primary" data-toggle="modal" data-target="#myModal1" onclick="edit(' + data.eventList[i].e_num + ')">Edit</button><button class="btn btn-primary" onclick="del(' +data.eventList[i].e_num+ ')">Delete</button></td>';
						html += '<td><button class="btn btn-info" data-toggle="modal" data-target="#myModal2" onclick="view('+data.eventList[i].e_info+')">View</button></td>';
						html += '</tr>';	
					}
					
					$('#eventList').html(html);
				}
				
			});
		}
		
		function edit(e_num) {
			 
			$.ajax({  
				//url : 'http://localhost:8080/event/events/board/' + e_num,
				url : 'http://ec2-13-209-47-124.ap-northeast-2.compute.amazonaws.com:8080/EventBook/events/board/' + e_num,
				type : 'GET',
				success : function(data) {
					alert(data);
					$('#e_num1').val(e_num);
					$('#e_id1').val(data.e_id);
					$('#e_content1').val(data.e_content);
					$('#e_info1').val(data.e_info);
					
				}
			});
		}
		
		function del(e_num) {
			
			if (confirm('Are you sure you want to delete it?')) {
				
				$.ajax({
					//url : 'http://localhost:8080/event/events/board/' + e_num,
					url : 'http://ec2-13-209-47-124.ap-northeast-2.compute.amazonaws.com:8080/EventBook/events/board/' + e_num,
					type : 'DELETE',
					success : function(data) {
						alert(data);
						if(data == 'success') {
							alert('deleted');
							list();
						}
					}
				});
				
			}
			
		}
		
		function view(num) {
			
			var seq = num;
			
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
		
		function inseq(seq) {
			alert(seq);
			$('#e_info').val(seq);
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

	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>



</body>
<!-- 바디 끝 -->

</html>