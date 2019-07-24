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
	<div id="editModal" class="modal edit-modal hide fade in"
		style="display: none;">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>

			<h4>Edit interlining</h4>
		</div>

		<div class="modal-body">
			<form class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="nameInput">Name</label>

					<div class="controls">
						<input id="nameInput" type="text" value="Interlining A">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="widthInput">Width</label>

					<div class="controls">
						<input id="widthInput" type="text" value="130">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="patternInput">Pattern
						Repeat</label>

					<div class="controls">
						<input id="patternInput" type="text" value="70">
					</div>
				</div>

				<div class="control-group">
					<label class="control-label">Price</label>

					<div class="controls">
						<div class="input-prepend">
							<span class="add-on">£</span> <input id="priceinput"
								name="priceinput" class="span2" placeholder="" type="text"
								required="" value="90.02">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal-footer">
		<a href="/admin/fabricsave/3" class="btn btn-primary">Save</a> <a
			href="#" class="btn" data-dismiss="modal">Cancel</a>
	</div>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>