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
		<h1 style="margin-top:30px;">�Ϻ� �����</h1>
	<div style="margin-top:50px;">
		<a type="button" class="btn btn-outline-dark btn-sm" href="${pageContext.request.contextPath}/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}">����</a>
	<h1 style="display:inline">${currentYear}�� ${currentMonth}�� ${currentDay}�� </h1>
		<a type="button" class="btn btn-outline-dark btn-sm" href="${pageContext.request.contextPath}/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}">����</a>
	</div>
		<a style="margin-right: 750px;" type="button" class="btn btn-outline-success" href="${pageContext.request.contextPath}/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">����� ���� �Է�</a>
	<table border="1" style="table-layout:fixed; width:80%; text-align:center; margin-left: auto; margin-right: auto; margin-top:10px;">
		<c:if test="${!empty cashbookList}">
		<thead>
			<tr>
				<th>����/����</th>
				<th>��� ī�װ�</th>
				<th>����</th>
				<th>����</th>
				<th>����</th>
				<th>����</th>
			</tr>
		</thead>
		</c:if>
		<tbody>
			<c:forEach var="c" items="${cashbookList}">
				<c:if test="${!empty cashbookList}">
					<tr>	
						<td>${c.cashbookKind }</td>
						<td>${c.categoryName }</td>
						<td>${c.cashbookPrice }��</td>
						<td>${c.cashbookContent }</td>
						<td><a type="button" class="btn btn-outline-success" href="${pageContext.request.contextPath}/admin/updateCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">����</a></td>
						<td><a type="button" class="btn btn-outline-danger" href="${pageContext.request.contextPath}/admin/deleteCashbook/${c.cashbookId }">����</a></td>
					</tr>	
				</c:if>
			</c:forEach>
			<c:if test="${empty cashbookList}">
				<tr>	
					<td><h3>���� ���Թ� ���⳻���� �ۼ����� �ʾҽ��ϴ�.</h3></td>
				</tr>	
			</c:if>
		</tbody>
	</table>
	</div>
</body>
</html>