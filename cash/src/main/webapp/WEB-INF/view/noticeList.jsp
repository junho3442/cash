<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<table border="1" class="table table-dark table-hover">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/admin/noticeOne?noticeId=${n.noticeId}">${n.noticeId}</a></td>
					<td>${n.noticeTitle}</td>
					<td>${n.noticeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
			<div>
				<c:if test="${currentPage<lastPage }">
				<a href="${pageContext.request.contextPath}/admin/noticeList?currentPage=${currentPage+1}">다음</a>
				</c:if>
				<c:if test="${currentPage>=lastPage }">
				<a href="${pageContext.request.contextPath}/admin/noticeList?currentPage=${currentPage-1}">이전</a>
				</c:if>
			</div>
			<div><a href="${pageContext.request.contextPath}/admin/addNotice">공지사항 추가하기</a></div>
			
</div>			
</body>
</html>