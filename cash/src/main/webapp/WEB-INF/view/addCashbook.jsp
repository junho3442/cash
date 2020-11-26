<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<form method="post" action="${pageContext.request.contextPath}/admin/addCashbook">
		<table border="1">
			<tr>
				<td>cashbook_date</td>		
				<td><input type ="text" name="cashbookDate" readonly="readonly" value="${currentYear}-${currentMonth}-${currentDay}"></td>
			</tr>
			
			<tr>
				<td>cashbook_kind</td>
				<td>
					<input type="radio" name="cashbookKind" value="����"> ����
					<input type="radio" name="cashbookKind" value="����"> ����
				</td>
			</tr>
			
			<tr>
				<td>category_name</td>
				<td>
					<select name="categoryName">
						<c:forEach var="c" items="${categoryList}">
							<option value="${c.categoryName}">${c.categoryName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>cashbook_price</td>		
				<td><input type ="text" name="cashbookPrice"></td>
			</tr>
			
			<tr>
				<td>cashbook_content</td>
				<td>
					<input type="text" name="cashbookContent">
				</td>
			</tr>
		</table>
		<button type="submit">����/���� �Է�</button>
	</form>
</body>
</html>