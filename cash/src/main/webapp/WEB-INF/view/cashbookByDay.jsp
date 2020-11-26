<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}">����</a>
	<h1>${currentYear}�� ${currentMonth}�� ${currentDay}�� </h1>
		<a href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}">����</a>
	</div>
		<a href="${pageContext.request.contextPath}/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">����� ���� �Է�</a>
	<table>
		<thead>
			<tr>
				<th>cashbookId</th>
				<th>cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th>
				<th>cashbookContent</th>
				<th>����</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${cashbookList }">
				<tr>	
					<td>${c.cashbookId }</td>
					<td>${c.cashbookKind }</td>
					<td>${c.categoryName }</td>
					<td>${c.cashbookPrice }</td>
					<td>${c.cashbookContent }</td>
					<td><a href="${pageContext.request.contextPath}/admin/updateCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">����</a></td>
					<td><a href="${pageContext.request.contextPath}/admin/deleteCashbook/${c.cashbookId }">����</a></td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>
</body>
</html>