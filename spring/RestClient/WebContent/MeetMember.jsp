<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.setAttribute("loginKey", "17");
	String loginKey = (String)session.getAttribute("loginKey");
	
	session.setAttribute("loginKey2", "19");
	String loginKey2 = (String)session.getAttribute("loginKey2");
	
%>
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
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
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
		<h1 class="display-6">모임멤버 합류</h1>


		<form id="meetLeader" method="post">
			<div class="form-group">
				<input type="hidden" id="m_idx" name="m_idx">
			</div>
			<div class="form-group">
				<input type="hidden" id="nidx" name="nidx" value="<%=loginKey%>">
			</div>
			<div class="form-group">
				<input type="hidden" id="mm_level" name="mm_level" value="1">
			</div>
			<input type="submit" class="btn btn-info" value="개설">
		</form>

		<form id="meetCrew" method="post">
			<div class="form-group">
				<input type="hidden" id="m_idx" name="m_idx">
			</div>
			<div class="form-group">
				<input type="hidden" id="nidx" name="nidx" value="<%=loginKey2%>">
			</div>
			<div class="form-group">
				<input type="hidden" id="mm_level" name="mm_level" value="0">
			</div>
			<input type="submit" class="btn btn-info" value="참가">
		</form>

		<hr>
		<div class="form-group">
			<form>
				<span style="width: 15%; float: left;"> <select
					class="form-control" name="stype">
						<option value="both">id+nic</option>
						<option value="id">id</option>
						<option value="nnic">nic</option>
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
					<th>nemail</th>
					<th>nphoto</th>
					<th>nnic</th>
				</tr>
			</thead>
			<tbody id="meetMemberList">

			</tbody>
			
			
		</table>
		<div id="index" class="btn-group"></div>
		<button class="btn btn-info" data-toggle=modal
			" data-target="#myModal" onclick=view()>이동</button>

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
									<th>nemail</th>
									<th>nphoto</th>
									<th>nnic</th>
								</tr>
							</thead>
							<tbody id="mmList">

							</tbody>
						</table>

						

						<ul class="pagination justify-content-center"
							style="margin: 20px 0">
							<li class="page-item"><a class="page-link" href="#"
								onclick="paging()">Next</a></li>
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
	$(document).ready(function(){
		
		sessionStorage.setItem("m_idx", 4);
		
		$('#m_idx').val(sessionStorage.getItem("m_idx"));
		
		sessionStorage.getItem("m_idx");
	
		
		list();
		
		$('#meetLeader').submit(function() {
			alert($('#meetLeader').serialize());
			
			$.ajax({
				url: 'http://localhost:8080/nm/meetmember',
				type: 'POST',
				data: $('#meetLeader').serialize(),
				success: function(data) {
					alert(data);
					window.location.href='MeetMember.jsp';
				}
			});
			return false;
		});
	
		$('#meetCrew').submit(function() {
			alert($('#meetCrew').serialize());
			
			$.ajax({
				url: 'http://localhost:8080/nm/meetmember',
				type: 'POST',
				data: $('#meetCrew').serialize(),
				success: function(data) {
					alert(data);
					//window.location.href='MeetMember.jsp'
				}
			});
			return false;
		});
		
		$('#meetnew').submit(function() {
			alert($('#meetnew').serialize());
			
			$.ajax({
				url: 'http://localhost:8080/nm/meetmember',
				type: 'POST',
				data: $('#meetnew').serialize(),
				success: function(data) {
					alert(data);
					//window.location.href='MeetMember.jsp'
				}
			});
			return false;
		});
			
	});
	
	function list() {
		
		m_idx = 4;
		
		$.ajax({
			url: 'http://localhost:8080/nm/meetmember/'+m_idx,
			type: 'GET',
			data: {},
			success: function(data) {
				console.log(data);
				
				var html = '';
				var htmlIndex = '<div>';
				for(var i=0; i<data.mmList.length; i++) {
					
					html += '<tr>';
					html += '<td>'+data.mmList[i].nemail+'</td>';
					html += '<td>'+data.mmList[i].nphoto+'</td>';
					html += '<td>'+data.mmList[i].nnic+'</td>';
					html += '</tr>';
				}
				
				for(var i=0; i<data.totalCount / 10 + 0.9; i++) {
					htmlIndex += '<button class= "btn btn-primary" onclick="page('+ i +')">' + i + '</button>';
				}
				htmlIndex += '</div>';
				$('#meetMemberList').html(html);
				$('#index').html(htmlIndex);
			}
		});
	}
	
	function page(index) {
			
		m_idx = 4;
		
		$.ajax({
			url: 'http://localhost:8080/nm/meetmember/'+m_idx,
			type: 'GET',
			data: {p:index},
			success: function(data) {
				console.log(data);
				
				var html = '';
				var htmlIndex = '<div>';
				for(var i=0; i<data.mmList.length; i++) {
					
					html += '<tr>';
					html += '<td>'+data.mmList[i].nemail+'</td>';
					html += '<td>'+data.mmList[i].nphoto+'</td>';
					html += '<td>'+data.mmList[i].nnic+'</td>';
					html += '</tr>';
				}
				
				for(var i=0; i<data.totalCount / 10 + 0.9; i++) {
					htmlIndex += '<button class= "btn btn-primary" onclick="page('+ i +')">' + i + '</button>';
				}
				htmlIndex += '</div>';
				$('#meetMemberList').html(html);
				$('#index').html(htmlIndex);
			}
		});
	}
</script>

</body>
<!-- 바디 끝 -->

</html>
