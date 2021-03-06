<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/admin/updateCashbook">
		<table border="1">
			
				<tr>
					<td>cashbook_date</td>
					<td><input type="text" name="cashbookDate" readonly="readonly" value="${currentYear}-${currentMonth}-${currentDay}"></td>
				</tr>
				
				<tr>
					<td>cashbook_id</td>
					<td><input type="text" name="cashbookId" readonly="readonly" value="${cashbookId}"></td>
				</tr>
				
				<tr>
					<td>cashbook_kind</td>
					<td>
					<input type="radio" name="cashbookKind" value="수입">수입
					<input type="radio" name="cashbookKind" value="지출">지출
					</td>
				</tr>
				
				<tr>
					<td>category_name</td>
					<td>
						<select name="categoryName">
							<c:forEach var="c" items="${categoryList }">
								<option value="${c.categoryName }">${c.categoryName }</option>
							</c:forEach>
							
						</select>
					</td>
				</tr>
				
				<tr>
					<td>cashbook_price</td>
					<td><input type="text" name="cashbookPrice" value="${cashbook.cashbookPrice}"></td>
				</tr>
				
				<tr>
					<td>cashbook_content</td>
					<td><input type="text" name="cashbookContent" value="${cashbook.cashbookContent}"></td>
				</tr>
			
		</table>
			<button type="submit">수정 완료</button>
	</form>
</body>
</html>