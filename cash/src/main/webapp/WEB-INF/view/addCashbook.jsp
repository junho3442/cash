<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form method="post" action="${pageContext.request.contextPath}/admin/addCashbook">
		<h1 style="margin-top:30px;">수입및 지출내역 추가</h1>
		<table class="table table-borderless" style="margin-top:10px; width:60%; margin-left: auto; margin-right: auto;">
			<tr>
				<td style="text-align:left; font-weight:bold;">작성일:		
					<input type ="text" class="form-control" name="cashbookDate" readonly="readonly" value="${currentYear}-${currentMonth}-${currentDay}">
				</td>
				<td style="text-align:left; font-weight:bold;">수입/지출
					<br/>
					<input type="radio" name="cashbookKind" value="수입"> 수입
					<input type="radio" name="cashbookKind" value="지출"> 지출
				</td>
			</tr>
			
			<tr>
				<td style="text-align:left; font-weight:bold;">금액:&emsp;&nbsp;<input class="form-control" type ="text" name="cashbookPrice"></td>
				<td style="text-align:left; font-weight:bold;">수입/지출 카테고리
					<br/>
					<select name="categoryName">
						<c:forEach var="c" items="${categoryList}">
							<option value="${c.categoryName}">${c.categoryName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		
		<table class="table table-borderless" style="margin-top:10px; width:60%; margin-left: auto; margin-right: auto;">
			<tr>
				<td class="form-group">
					<h3><label for="content">내용</label></h3>
					<textarea class="form-control" rows="5" id="content" name="cashbookContent"></textarea>
				</td>
			</tr>
		</table>
		
		<button style="margin-left: 580px;" type="submit" class="btn btn-outline-success">추가</button>
		
	</form>
	</div>
</body>
</html>