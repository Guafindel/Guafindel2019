<%@page import="guestbook.model.Message"%>
<%@page import="guestbook.model.MessageListView"%>
<%@page import="guestbook.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	String pageNumberstr = request.getParameter("page");
	
	int pageNumber = 1;
	
	if(pageNumberstr != null) {
		pageNumber = Integer.parseInt(pageNumberstr);
	}
	
	//핵심처리할 서비스 객체
	/* GetMessageListService service = GetMessageListService.getInstance() */;
	
	//응답 데이터의 결과 
	/* MessageListView viewData = service.getMessageListView(pageNumber); */
	
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


<!-- 스타일 시작 -->
<style>
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>

	<div class="container-fluid">
		<h1>방명록 글쓰기</h1>
		<hr>
		<div class="row">
			<div class="col-md-4">
				<form action="writeMessage.jsp" method="post">
					<table class="table">

						<tr>
							<td>이름</td>
							<td><input type="text" name="guestName"></td>
						</tr>

						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password"></td>
						</tr>

						<tr>
							<td>메시지</td>
							<td><textarea row="3" cols="30" name="message"></textarea></td>
						</tr>

						<tr>
							<td></td>
							<td><input type="submit" class="btn btn-info" values="등록"></td>
						</tr>

					</table>
				</form>
				<hr>
				<%-- <%
					if(viewData.isEmpty()) {
						%>
						<h1><small>등록된 메세지가 없습니다.</small></h1>
						<% 
					} else {
						
						for( Message message : viewData.getMessageList() ){
						
						%>
						<div class="jumbotron">
							메세지 번호 : <%= message.getId() %> <br>
							손님 이름 : <%= message.getGuestName() %><br>
							메세지 : <%= message.getMessage() %><br>
							<a href="confirmDeletion.jsp?messageId=<%=message.getId() %>">삭제하기</a>
							<!-- messageId는 넘어간 jsp 페이지에서 받을 id값을 의미한다. -->
						</div>
						<%
						}
						
					}
				
				//[1] [2] [3]
				for(int i=1; i <= viewData.getPageTotalCount(); i++) {
					
				%>
				<a href="list.jsp?page=<%= i%>">[<%= i %>]</a>
				
				<% 
				}
					
			
				%> --%>
			</div>
			
		</div>
	</div>



	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>