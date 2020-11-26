<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
	
<div class="container" >
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>

	<div class="row">
	<div class="col-sm-3"><h3>��������</h3></div>
	<div class="col-sm-9">
	<a href="${pageContext.request.contextPath}/admin/noticeList" type="button" class="btn btn-outline-dark">more</a>
	</div>
	</div>
	<div>
		<table border="1" class="table table-dark table-hover">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList }">
				
					<tr>
						<td>${n.noticeId }</td>
						<td>${n.noticeTitle }</td>
					</tr>
				</c:forEach>	
			</tbody>
		</table>
	</div>
	<div>
		<table border="1" class="table table-dark table-hover">
			<thead>
				<tr>
					<th>��¥</th>
					<th>����</th>
					<th>����</th>
					<th>�հ�</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="io" items="${inOutList }">
					<tr>
						<td>${io["��¥"]}</td>
						<td>${io["����"]}</td>
						<td>${io["����"]}</td>
						<td>${io["�հ�"]}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>	
</body>
</html>