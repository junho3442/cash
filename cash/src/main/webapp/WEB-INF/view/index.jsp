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
		<h2 style="margin-top:30px; margin-right: 280px;">�ȳ��ϼ��� ${loginId}��</h2>
			<h3 style="margin-top:50px;">[��������]</h3>
		
		<div>
			<table border="1" style="margin-top:10px; width:50%; margin-left: auto; margin-right: auto;" class="table table-dark table-hover">
				<thead>
					<tr>				
						<th style="width:20%;">�ۼ���</th>
						<th>����</th>
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
		<h3 style="margin-top:50px;">[�ֱ�3���� ����/���⳻��]</h3>
		<table border="1" style="margin-top:10px; width:70%; margin-left: auto; margin-right: auto;" class="table table-dark table-hover">
			<thead>
				<tr>
					<th>��¥</th>
					<th>����</th>
					<th>����</th>
					<th>�հ�</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="io" items="${inOutList}">
					<tr>
						<td>${io["��¥"]}</td>
						<td>${io["����"]}&nbsp;��</td>
						<td>${io["����"]}&nbsp;��</td>
						<td>${io["�հ�"]}&nbsp;��</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
</body>
</html>