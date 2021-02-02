<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	
<div class="container text-center">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	
	<h1 style="margin-top:30px;">공지사항</h1>
	<div style="margin-top:30px;">
		<a type="button" style="margin-right: 600px;" class="btn btn-outline-success" href="${pageContext.request.contextPath}/admin/addNotice">공지사항 추가하기</a>
	</div>
	
	<table style="margin-top:10px; width:70%; margin-left: auto; margin-right: auto;" border="1" class="table table-dark table-hover">
		<thead>
			<tr>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td>${n.noticeWriter}</td>
					<td><a href="${pageContext.request.contextPath}/admin/noticeOne?noticeId=${n.noticeId}">${n.noticeTitle}</a></td>
					<td>${n.noticeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			<div>
				<c:if test="${currentPage<lastPage}">
				<a href="${pageContext.request.contextPath}/admin/noticeList?currentPage=${currentPage+1}">다음</a>
				</c:if>
				<c:if test="${currentPage>=lastPage && currentPage>1 }">
				<a href="${pageContext.request.contextPath}/admin/noticeList?currentPage=${currentPage-1}">이전</a>
				</c:if>
			</div>
</div>			
</body>
</html>