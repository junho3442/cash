<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">	
	
	<div class="btn-group">
		<a href="${pageContext.request.contextPath}/" type="button" class="btn btn-primary">index</a>
		<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/-1/-1" type="button" class="btn btn-primary">cashbook</a>
		<a href="${pageContext.request.contextPath}/admin/noticeList" type="button" class="btn btn-primary">noticeList</a>
		<a href="${pageContext.request.contextPath}/admin/logout" type="button" class="btn btn-primary">로그아웃</a>
		<a href="${pageContext.request.contextPath}/admin/chart1.jsp" type="button" class="btn btn-primary">chart</a>
		<a href="${pageContext.request.contextPath}/admin/cashbookList/1" type="button" class="btn btn-primary">cashbookList</a>
		<a href="${pageContext.request.contextPath}/admin/addMember" type="button" class="btn btn-primary">사용자 추가</a>
	</div>