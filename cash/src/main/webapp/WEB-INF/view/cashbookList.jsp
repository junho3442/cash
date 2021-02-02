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
	<h1 style="margin-top:30px;">가계부 전체 내역</h1>
		<table class="table table-striped" style="margin-top:20px; width:100%; margin-left: auto; margin-right: auto;">
			<thead>
				<tr>
					<th>수입/지출</th>
					<th>사용 카테고리</th>
					<th>금액</th>
					<th>내용</th>
					<th>수입/지출 발생일</th>
					<th>가계부 작성일</th>
					<th>가계부 수정일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${cashbookList}">
					<tr>
						<td style="font-weight:bold;">${c.cashbookKind }</td>
						<td>${c.categoryName }</td>
						<td>${c.cashbookPrice }</td>
						<td>${c.cashbookContent }</td>
						<td>${c.cashbookDate }</td>
						<td>${c.createDate }</td>
						<td>${c.updateDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<div>
				<c:if test="${currentPage > 1}">
					<a href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}">이전</a>
				</c:if>
				<c:if test="${currentPage<lastPage}">
					<a href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}">다음</a>
				</c:if>
			</div>
		</div>	
</body>
</html>