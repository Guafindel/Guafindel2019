<%@page import="java.util.Enumeration"%>
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


<!-- 스타일 시작 -->
<style>
#thumbnail {
	height: 50px;
	width: 50px;
}

#thumbnail:hover {
	height: 450px;
	width: 300px;
}
</style>
<!-- 스타일 끝 -->

</head>
<!-- 바디 시작 -->
<body>
	<!-- 헤더 시작 -->
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<!-- 헤더 끝 -->

	<!-- 컨텐츠 시작 -->
	<div class="content">
		<div class="container">
			<h3 class="display-6">회원 리스트</h3>
			<hr>
			<div class="form-group">
				<form>
					<span style="width: 15%; float: left;"> <select
						class="form-control" name="stype">
							<option value="both">아이디+이름</option>
							<option value="id">아이디</option>
							<option value="name">이름</option>
					</select>
					</span> <span style="width: 75%; float: left;"> <input type="text"
						class="form-control" name="keyword" placeholder="검색할 내용을 입력하세요">
					</span> <span style="width: 10%; float: left;"> <input
						type="submit" class="form-control" value="검색">
					</span>
				</form>
			</div>
			<br> <br>

			<table class="table" style="width: 100%">
				<thead class="thead-light">
					<tr>
						<th>Index</th>
						<th>ID</th>
						<th>Name</th>
						<th>Password</th>
						<th>Picture</th>
						<th>Date</th>
						<th>비고</th>
					</tr>
				</thead>
				<!-- 리스트 반복 시작 -->
				<tbody>
					<c:forEach items="${viewData.memberList}" var="memberinfo"
						varStatus="stat">

						<tr>
							<%-- ${memberinfo.idx} / ${stat.index} / ${stat.count} / ${viewData.totalCount} /  --%>
							<td>${viewData.no - stat.index}</td>
							<td>${memberinfo.mId}</td>
							<td>${memberinfo.mName}</td>
							<td>${memberinfo.mPw}</td>
							<td><img id="thumbnail" class="img-thumbnail" alt="회원 사진"
								src="<c:url value="/uploadfile/userphoto/${memberinfo.mPhoto}"/>"></td>
							<td><fmt:formatDate value="${memberinfo.regDate}"
									pattern="yyyy.MM.dd" /></td>

							<td><a href="memberEdit?memberId=${memberinfo.idx}">수정</a> |
								<a href="#" onclick="delMember(${memberinfo.idx})">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

			<!-- Center-aligned -->
			<c:if test="${viewData.totalCount>0}">
				<ul class="pagination justify-content-center" style="margin: 20px 0">
					<c:forEach begin="1" end="${viewData.pageTotalCount}" var="num">
						<li class="page-item"><a class="page-link"
							href="memberlist?p=${num}&stype=${param.stype}&keyword=${param.keyword}">${num}</a></li>
					</c:forEach>
				</ul>
			</c:if>

		</div>
	</div>
	<!-- 컨텐츠 끝 -->

	<!-- 푸터 시작 -->
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
	<!-- 푸터 끝 -->

	<script>
	
		function delMember(idx) {
			
			if(confirm("삭제하시겠습니까?")){
				/* location.href = 'memberDelete?memberId='+idx; */
				location.href = 'delete/'+ idx;
			}
			
		}
	
	</script>


	<!-- 부트스트랩 js -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
<!-- 바디 끝 -->

</html>