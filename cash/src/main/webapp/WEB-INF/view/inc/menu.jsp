<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
	
	<div class="btn-group">
		<a href="${pageContext.request.contextPath}/" type="button" class="btn btn-primary">Home</a>
		<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/-1/-1" type="button" class="btn btn-primary">가계부</a>
		<a href="${pageContext.request.contextPath}/admin/cashbookList/1" type="button" class="btn btn-primary">가계부 전체 목록</a>
		<a href="${pageContext.request.contextPath}/admin/chart1.jsp" type="button" class="btn btn-primary">가계부 관련 차트</a>
			<a href="${pageContext.request.contextPath}/admin/noticeList" type="button" class="btn btn-primary">공지사항</a>
		<a href="${pageContext.request.contextPath}/admin/logout" type="button" class="btn btn-primary">로그아웃</a>
	</div>