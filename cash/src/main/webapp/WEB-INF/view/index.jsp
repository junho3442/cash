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
	<div class="container text-center">
		<div style="text-align:center;">
			<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		</div>
		<h2 style="margin-top:30px; margin-right: 280px;">안녕하세요 ${loginId}님</h2>
			<h3 style="margin-top:50px;">[공지사항]</h3>
		
		<div>
			<table border="1" style="margin-top:10px; width:50%; margin-left: auto; margin-right: auto;" class="table table-dark table-hover">
				<thead>
					<tr>				
						<th style="width:20%;">작성일</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="n" items="${noticeList }">
						<tr>
							<td>${n.noticeDate }</td>
							<td>${n.noticeTitle }</td>
						</tr>
					</c:forEach>	
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="container text-center">	
		<h3 style="margin-top:50px;">[최근3개월 수입/지출내역]</h3>
		<table border="1" style="margin-top:10px; width:70%; margin-left: auto; margin-right: auto;" class="table table-dark table-hover">
			<thead>
				<tr>
					<th>날짜</th>
					<th>수입</th>
					<th>지출</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="io" items="${inOutList}">
					<tr>
						<td>${io["날짜"]}</td>
						<td>${io["수입"]}&nbsp;원</td>
						<td>${io["지출"]}&nbsp;원</td>
						<td>${io["합계"]}&nbsp;원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
</body>
</html>