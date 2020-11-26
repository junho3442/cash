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
	
<div class="container" >
	<h1>공지</h1>
	<div>
		<table border="1" class="table table-bordered">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId }</td>
						<td>${n.noticeTitle }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<h1>로그인</h1>
	<form action="${pageContext.request.contextPath}/login" method="post">
		<div class="form-group">
			ID: <input type="text" name="id" class="form-control" value="goodee">
		</div>
		<div class="form-group">
			PW: <input type="password" name="pw" class="form-control" value="1234">
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
</div>
	
</body>
</html>