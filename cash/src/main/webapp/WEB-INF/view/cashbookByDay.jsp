<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<div class="container text-center">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<h1 style="margin-top:30px;">일별 가계부</h1>
	<div style="margin-top:50px;">
		<a type="button" class="btn btn-outline-dark btn-sm" href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}">이전</a>
	<h1 style="display:inline">${currentYear}년 ${currentMonth}월 ${currentDay}일 </h1>
		<a type="button" class="btn btn-outline-dark btn-sm" href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}">이후</a>
	</div>
		<a style="margin-right: 750px;" type="button" class="btn btn-outline-success" href="${pageContext.request.contextPath}/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">지출및 수입 입력</a>
	<table border="1" style="table-layout:fixed; width:80%; text-align:center; margin-left: auto; margin-right: auto; margin-top:10px;">
		<c:if test="${!empty cashbookList}">
		<thead>
			<tr>
				<th>수입/지출</th>
				<th>사용 카테고리</th>
				<th>가격</th>
				<th>내용</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		</c:if>
		<tbody>
			<c:forEach var="c" items="${cashbookList}">
				<c:if test="${!empty cashbookList}">
					<tr>	
						<td>${c.cashbookKind }</td>
						<td>${c.categoryName }</td>
						<td>${c.cashbookPrice }원</td>
						<td>${c.cashbookContent }</td>
						<td><a type="button" class="btn btn-outline-success" href="${pageContext.request.contextPath}/admin/updateCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">수정</a></td>
						<td><a type="button" class="btn btn-outline-danger" href="${pageContext.request.contextPath}/admin/deleteCashbook/${c.cashbookId }">삭제</a></td>
					</tr>	
				</c:if>
			</c:forEach>
			<c:if test="${empty cashbookList}">
				<tr>	
					<td><h3>아직 수입및 지출내역을 작성하지 않았습니다.</h3></td>
				</tr>	
			</c:if>
		</tbody>
	</table>
	</div>
</body>
</html>